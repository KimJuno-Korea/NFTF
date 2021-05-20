package kr.co.nftf.security;

import java.io.IOException;

import com.google.zxing.WriterException;

import kr.co.nftf.tradingbox.TradingBox;
import kr.co.nftf.user.User;

public interface SecurityService {
	public boolean contrastKey (String key);
	
	public byte[] createKeyQR (String key) throws WriterException, IOException;
	
	public byte[] createAccountQR (String loginInfo) throws WriterException, IOException;
}
