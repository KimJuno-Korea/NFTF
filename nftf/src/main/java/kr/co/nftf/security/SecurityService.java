package kr.co.nftf.security;

import kr.co.nftf.tradingbox.TradingBox;
import kr.co.nftf.user.User;

public interface SecurityService {
	public boolean contrastKey (TradingBox tradingBox);
	
	public String createKeyQR (TradingBox tradingBox);
	
	public String createAccountQR (User user);
}
