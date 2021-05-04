package kr.co.nftf.common;

import org.springframework.stereotype.Service;

import kr.co.nftf.user.User;

@Service
public class CommonServiceImpl implements CommonService {

	@Override
	public boolean login(User user) {
		return false;
	}

	@Override
	public boolean logout() {
		return false;
	}

	@Override
	public boolean accountVerification(User user) {
		return false;
	}
}
