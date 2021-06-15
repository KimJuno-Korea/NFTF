package kr.co.nftf.box.agent;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@Service
public class AgentServiceImpl implements AgentService {
	@Autowired
	HttpSession httpSession;

	private static final MediaType JSON = MediaType.parse("application/json; charset=UTF-8");

	@Value("${nftfServerUrl}")
	private String serverUrl;
	@Value("${agentServerUrl}")
	private String agentUrl;
	@Value("${branchCode}")
	private String branchCode;

	// 회원 검증
	@Override
	public boolean login(Account account) throws IOException {
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(account);

		RequestBody body = RequestBody.create(json, JSON);
		Request request = new Request.Builder().post(body).url(serverUrl + "/authentication").build();

		OkHttpClient client = new OkHttpClient();
		Response response = client.newCall(request).execute();

		Map<String, Boolean> responseResult = new HashMap<String, Boolean>();
		responseResult = gson.fromJson(response.body().string(), responseResult.getClass());

		if (responseResult.get("result")) {
			httpSession.setAttribute("isAuthorized", true);
			httpSession.setAttribute("id", account.getId());
			return true;
		}
		return false;
	}

	@Override
	public void logout() {
		httpSession.invalidate();
	}

	// 물품 등록
	@Override
	public void registGoods(TradingBox tradingBox) throws JsonSyntaxException, IOException, InterruptedException {
		Map<String, Boolean> responseResult = new HashMap<String, Boolean>();
		// 장치 에이전트에게 잠금 해제 요청을 전송한다.
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(tradingBox);

		RequestBody body = RequestBody.create(json, JSON);
		Request request = new Request.Builder().get().url(agentUrl + "/registlock").build();

		OkHttpClient client = new OkHttpClient.Builder().readTimeout(25, TimeUnit.SECONDS).build();

		Response response;
		/*
		 * response = client.newCall(request).execute(); responseResult =
		 * gson.fromJson(response.body().string(), responseResult.getClass());
		 * 
		 * 
		 * while(true) { if (responseResult.get("result")) { request = new
		 * Request.Builder() .get() .url(agentUrl + "/matrix/" + tradingBox.getPrice())
		 * .build(); client = new OkHttpClient(); response =
		 * client.newCall(request).execute();
		 * 
		 * break; } }
		 */
		 

		// 잠금 해제 결과가 true이면 물품 정보 등록 요청을 보낸다.
		// 물품 정보 등록
		tradingBox.setBranchCode(branchCode);
		json = gson.toJson(tradingBox);

		body = RequestBody.create(json, JSON);
		request = new Request.Builder().post(body)
				// NFTF 웹 서버에 물품 등록 요청을 한다.
				.url(serverUrl + "/registgoods").build();

		client = new OkHttpClient();
		response = client.newCall(request).execute();
	}

	@Override
	public void receiveGoods(TradingBox tradingBox) throws IOException {
		Map<String, Boolean> responseResult = new HashMap<String, Boolean>();
		// 장치 에이전트에게 잠금 해제 요청을 전송한다.
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(tradingBox);

		RequestBody body = RequestBody.create(json, JSON);
		Request request = new Request.Builder().get().url(agentUrl + "/receivelock").build();

		OkHttpClient client = new OkHttpClient.Builder().readTimeout(25, TimeUnit.SECONDS).build();

		Response response;
		/*
		 * response = client.newCall(request).execute(); responseResult =
		 * gson.fromJson(response.body().string(), responseResult.getClass());
		 * 
		 * while (true) { if (responseResult.get("result")) { request = new
		 * Request.Builder().get().url(agentUrl + "/matrix/" + " ").build(); client =
		 * new OkHttpClient(); response = client.newCall(request).execute();
		 * 
		 * break; } }
		 */

		// 잠금 해제 결과가 true이면 물품 정보 등록 요청을 보낸다.
		// 물품 정보 등록
		tradingBox.setBranchCode(branchCode);
		json = gson.toJson(tradingBox);

		body = RequestBody.create(json, JSON);
		request = new Request.Builder().post(body)
				// NFTF 웹 서버에 물품 수령 요청을 한다.
				.url(serverUrl + "/receivegoods").build();

		client = new OkHttpClient();
		response = client.newCall(request).execute();
	}

	@Override
	public List<TradingBox> selectTradingBoxList(TradingBox tradingBox) throws JsonSyntaxException, IOException {
		List<TradingBox> tradingBoxList = new ArrayList<TradingBox>();

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(branchCode);

		StringBuilder url = new StringBuilder("").append(serverUrl + "/").append(branchCode).append("/tradingbox");

		Request request = new Request.Builder().get().url(url.toString()).build();

		OkHttpClient client = new OkHttpClient();
		Response response = client.newCall(request).execute();

		ObjectMapper mapper = new ObjectMapper();

		if (response != null) {
			tradingBoxList = (List<TradingBox>) mapper.readValue(response.body().string(), tradingBoxList.getClass());
		}
		System.out.println(tradingBoxList);

		return tradingBoxList;
	}

	@Override
	public List<Board> selectBoardList() throws JsonSyntaxException, IOException {
		List<Board> boardList = new ArrayList<Board>();

		String userId = (String) httpSession.getAttribute("id");

		Gson gson = new GsonBuilder().create();

		StringBuilder url = new StringBuilder("").append(serverUrl + "/").append(userId).append("/board");

		Request request = new Request.Builder().get().url(url.toString()).build();

		OkHttpClient client = new OkHttpClient();
		Response response = client.newCall(request).execute();

		ObjectMapper mapper = new ObjectMapper();
		boardList = (List<Board>) mapper.readValue(response.body().string(), boardList.getClass());

		return boardList;
	}

	@Override
	public boolean contrastKey(TradingBox tradingBox) throws IOException {
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(tradingBox);

		RequestBody body = RequestBody.create(json, JSON);
		Request request = new Request.Builder().post(body).url(serverUrl + "/contrastkey").build();

		OkHttpClient client = new OkHttpClient();
		Response response = client.newCall(request).execute();

		Map<String, Boolean> responseResult = new HashMap<String, Boolean>();
		responseResult = gson.fromJson(response.body().string(), responseResult.getClass());
		if (responseResult.get("result")) {
			httpSession.setAttribute("isAuthorized", true);
			httpSession.setAttribute("tradingBoxNo", tradingBox.getNo());

			return true;
		}
		return false;
	}
}