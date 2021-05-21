package kr.co.nftf.trading;

import java.util.List;

public interface TradingService {
	public boolean registTrading (Trading trading);
	
	public List<Trading> selectTradingList (Trading trading);
	
	public Trading selectTrading (Trading trading) throws Exception;
	
	public boolean editTrading (Trading trading);
}