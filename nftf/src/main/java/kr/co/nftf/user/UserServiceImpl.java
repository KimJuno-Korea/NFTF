package kr.co.nftf.user;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;

import javax.imageio.ImageIO;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import net.nurigo.java_sdk.api.Message;

@Service
public class UserServiceImpl implements UserService {
//	private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private UserMapper userMapper;

	@Override
	public boolean registUser(User user) throws Exception {
		if (user != null) {

			if (user.getId() != null) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	@Override
	public User selectUser(User user) throws Exception {
		if (user != null) {

			if (user.getId() != null) {
				user = userMapper.select(user);
				return user;
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

	@Override
	public boolean editUser(User user) throws Exception {
		if (user != null) {

			if (user.getId() != null) {
				userMapper.update(user);
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
	
	
	//QR몇초간 유지할건지?
	//qr찍었을때 나올 url
	
	@Override
	public byte[] createLoginQR(String loginInfo)
			throws WriterException, IOException {
		BitMatrix bitMatrix = new QRCodeWriter().encode(loginInfo, BarcodeFormat.QR_CODE, 350, 350); // 텍스트, 바코드 포맷,가로,세로
		BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(bitMatrix, new MatrixToImageConfig(0x00000000, 0xFFFFFFFF));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(qrImage, "png", baos);
		
		byte[] file = baos.toByteArray();
		return file;
	}
	
	//문자전송 api는 뭘로해야할지 최대싼게 알리고꺼 회의해보자 카카오 알림으로할지
	@Override
	public String sendKey(String phone) throws Exception {
		String apiKey = "NCSFUMYWVVTJRAC4";
		String secretKey = "WDPETWBH38WOVCUCQEEVFV33ORTX1VL4";
		String key = (100000 + (int)(Math.random()*1000000))+"";
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("from", "01086517204"); // 발신번호
	    map.put("to", phone); // 수신번호
	    map.put("type", "sms"); // 문자타입
	    map.put("text", "인증번호 : " + key);
		
		Message coolsms = new Message(apiKey, secretKey);
		
		JSONObject result = coolsms.send(map); // 보내기&전송결과받기
		
		System.out.println(result.toString());
		
		return key;
	}
}
