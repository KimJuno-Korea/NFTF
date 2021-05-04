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
	public boolean login(User user) {
		try {
			
			if (user != null) {
				User dbUser = userMapper.select(user);
				if (user.getId().equals(dbUser.getId()) && user.getPw().equals(dbUser.getPw())) {
					httpSession.setAttribute("id", user.getId());
					return true;
				}
			}
			return false;
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean logout() {
		try {
			//세션 자체가 있는지를 확인해야할까 아니면 세션에 id라는 값이 있는걸 확인하는게 맞을까?
			if (httpSession.getAttribute("id") != null) {
				httpSession.invalidate();
				return true;
			}
			return false;
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		return false;
	}

	//이해 필요
	@Override
	public boolean accountVerification(User user) {
		return false;
	}
}
