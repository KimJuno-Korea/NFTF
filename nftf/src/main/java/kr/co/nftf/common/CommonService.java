package kr.co.nftf.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.nftf.user.User;

public interface CommonService {
	public boolean login (User user) throws Exception;
	
	public boolean logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public boolean accountVerification (User user) throws Exception;
}
