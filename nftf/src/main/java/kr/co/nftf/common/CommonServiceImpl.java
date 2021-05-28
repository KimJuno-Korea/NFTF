package kr.co.nftf.common;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nftf.user.User;
import kr.co.nftf.user.UserMapper;

@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	HttpSession httpSession;

	@Autowired
	UserMapper userMapper;

	@Override
	public boolean login(User user) throws Exception {
		
		if (user != null) {
			User dbUser = userMapper.select(user);
			
			if (user.getId().equals(dbUser.getId()) 
					&& user.getPw().equals(dbUser.getPw())
					&& user.getDivision() != 'D') {
				System.out.println("로그인 성공");
				
				httpSession.setAttribute("id", user.getId());
				httpSession.setMaxInactiveInterval(1800);
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean logout() throws Exception {
		
		if (httpSession.getAttribute("id") != null) {
			httpSession.invalidate();
			return true;
		}
		return false;
	}

	// 이해 필요
	@Override
	public boolean accountVerification(User user) throws Exception {
		return false;
	}
}
