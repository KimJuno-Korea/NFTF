package kr.co.nftf.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;

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
					&& dbUser.getDivision() != 'D') {
				
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
			
			ServletWebRequest servletContainer = (ServletWebRequest)RequestContextHolder.getRequestAttributes();

			HttpServletRequest request = servletContainer.getRequest();

			HttpServletResponse response = servletContainer.getResponse();
			
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for(Cookie cookie : cookies) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
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
