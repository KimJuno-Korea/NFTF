package kr.co.nftf.tradingbox;

import java.util.List;

import kr.co.nftf.branch.Branch;

public interface TradingBoxService {
	public void registerTradingBox (TradingBox tradingBox);
	
	public List<TradingBox> selectTradingBoxList (Branch branch) throws Exception;
	
	public TradingBox selectTradingBox (TradingBox tradingBox);
	
	public void editTradingBox (TradingBox tradingBox);
	
	public void deleteTradingBox (TradingBox tradingBox);
}