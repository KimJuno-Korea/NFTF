package kr.co.nftf.payment;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kr.co.nftf.board.Board;
import kr.co.nftf.user.User;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@Service
public class PaymentServiceImpl implements PaymentService {
	private static final MediaType JSON = MediaType.parse("application/json; charset=UTF-8");
	
	@Value("${payment.iscd}")
	private String iscd;
	
	@Value("${payment.accesstoken}")
	private String accesstoken;
	
	@Override
	public boolean pay(User user, Board board) throws IOException {
		if (user != null && board != null) {
			//물품 수령후 수령된 곳 정보를 기반으로 판매자의 핀어카운트와 물품가격 가져와서 돈을 입금한다.
			// /ReceivedTransferAccountNumber.nh 이용 (농협 입금 이체) (농협만 됨 왜냐하면 핀어카운트 발급이 다른덴 안됨)
			int random = (int) (Math.random()*10000000);
			Gson gson = new GsonBuilder().create();
			LocalDate now = LocalDate.now();
			
			String year = now.getYear()+"";
			String month = now.getMonthValue() < 10 ? "0"+now.getMonthValue() : now.getMonthValue()+"";
			String day = now.getDayOfMonth() < 10 ? "0"+now.getDayOfMonth() : now.getDayOfMonth()+"";
			
			String json ="{"
					+ "\"Header\": {"
					+ " 	\"ApiNm\": \"ReceivedTransferAccountNumber\","
					+ "		\"Tsymd\": \""+year+month+day+"\","
					+ "		\"Trtm\" : \"000000\","
					+ "		\"Iscd\": \""+iscd+"\","
					+ "		\"FintechApsno\": \"001\","
					+ "		\"ApiSvcCd\": \"DrawingTransferA\","
					+ "		\"IsTuno\": \""+random+"\","
					+ "		\"AccessToken\": \""+accesstoken+"\""
					+ "},"
					+ "\"Bncd\": \""+user.getBankNo()+"\","
					+ "\"Acno\": \""+user.getAccountNo()+"\","
					+ "\"Tram\": \""+board.getPrice()+"\""
					+ "}";
			
			System.out.println(json);
			
			RequestBody body = RequestBody.create(json, JSON);
			Request request = new Request.Builder()
					.post(body)
					.url("https://developers.nonghyup.com/ReceivedTransferAccountNumber.nh")
					.build();
		
			OkHttpClient client = new OkHttpClient();
			Response response;
				response = client.newCall(request).execute();
				
			Map<String, String> responseResult = new HashMap<String, String>();
			responseResult = gson.fromJson(response.body().string(), responseResult.getClass());
			return true;
		}
		return false;
	}
}
