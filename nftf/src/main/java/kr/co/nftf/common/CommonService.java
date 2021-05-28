package kr.co.nftf.common;

import kr.co.nftf.user.User;

public interface CommonService {
	public boolean login (User user) throws Exception;
	
	public boolean logout () throws Exception;
	
	public boolean accountVerification (User user) throws Exception;
}
