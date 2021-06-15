package kr.co.nftf.user;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;

@Service
public class UserServiceImpl implements UserService {
//	private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	@Value("${coolsms.apikey}")
	private String apiKey;
	
	@Value("${coolsms.secretKey}")
	private String secretKey;
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public boolean registUser(User user) throws Exception {
		if (user != null) {

			if (user.getId() != null) {
				userMapper.insert(user);
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

			user = userMapper.select(user);
			return user;
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
	

	
	//문자전송 api는 뭘로해야할지 최대싼게 알리고꺼 회의해보자 카카오 알림으로할지
	@Override
	public String sendKey(String phone) throws Exception {
		String apiKey = "NCSJ2KWFKDLXRVBL";
		String secretKey = "V2XUMMNZDSTOHTWPHOTOGJPEK9YJZDM3";
		StringBuilder key = new StringBuilder();
		for (int i = 0 ; i < 6 ; i++) {
			key.append(((int)(Math.random()*10))+"");
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("from", "01086948303"); // 발신번호
	    map.put("to", phone); // 수신번호
	    map.put("type", "sms"); // 문자타입
	    map.put("text", "trading365"
	    		+ "\t인증번호 : " + key);
		
		Message coolsms = new Message(apiKey, secretKey);
		
		JSONObject result = coolsms.send(map); // 보내기&전송결과받기
		
		System.out.println(result.toString());
		
		return key.toString();
	}
}
