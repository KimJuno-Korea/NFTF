package kr.co.nftf.trading;

public interface TradingService {
	public boolean registTrading (Trading trading);
	
	public boolean selectTradingList (Trading trading);
	
	public boolean selectTrading (Trading trading);
	
	public boolean editTrading (Trading trading);
}