package kr.co.nftf.security;

import org.springframework.stereotype.Service;

import kr.co.nftf.tradingbox.TradingBox;
import kr.co.nftf.user.User;

@Service
public class SecurityServiceImpl implements SecurityService{

	@Override
	public boolean contrastKey(TradingBox tradingBox) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String createKeyQR(TradingBox tradingBox) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String createAccountQR(User user) {
		// TODO Auto-generated method stub
		return null;
	}
}
