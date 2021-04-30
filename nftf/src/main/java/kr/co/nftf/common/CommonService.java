package kr.co.nftf.common;

import kr.co.nftf.user.User;

public interface CommonService {
	public boolean login (User user);
	
	public boolean logout ();
	
	public boolean accountVerification (User user);
}
