package kr.co.nftf.tradingbox;

import java.util.List;

import kr.co.nftf.branch.Branch;

public interface TradingBoxService {
	public void registerTradingBox (TradingBox tradingBox);
	
	public List<Branch> selectTradingBoxList (Branch branch);
	
	public Branch selectTradingBox (TradingBox tradingBox);
	
	public void editTradingBox (TradingBox tradingBox);
	
	public void deleteTradingBox (TradingBox tradingBox);
}