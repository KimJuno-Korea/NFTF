package kr.co.nftf.tradingbox;

import java.util.List;

import kr.co.nftf.branch.Branch;

public interface TradingBoxService {
	public void registerTradingBox (TradingBox tradingBox) throws Exception;
	
	public List<TradingBox> selectTradingBoxList (Branch branch) throws Exception;
	
	public TradingBox selectTradingBox (TradingBox tradingBox) throws Exception;
	
	public void editTradingBox (TradingBox tradingBox) throws Exception;
	
	public void deleteTradingBox (TradingBox tradingBox) throws Exception;

	public void editTradingBoxForRegist(TradingBox tradingBox) throws Exception;
}