package kr.co.nftf.security;

import java.io.IOException;

import com.google.zxing.WriterException;

import kr.co.nftf.tradingbox.TradingBox;

public interface SecurityService {
	public boolean contrastKey (String key);
	
	public byte[] createKeyQR (TradingBox tradingBox) throws WriterException, IOException;
	
	public byte[] createAccountQR (String loginInfo) throws WriterException, IOException;
}
