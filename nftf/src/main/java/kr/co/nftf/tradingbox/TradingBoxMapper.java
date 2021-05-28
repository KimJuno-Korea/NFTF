package kr.co.nftf.tradingbox;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TradingBoxMapper {
	public void insert (TradingBox trading) throws Exception;
	
	public List<TradingBox> selectAll (TradingBox trading) throws Exception;
	
	public TradingBox select (TradingBox trading) throws Exception;
	
	public void update (TradingBox trading) throws Exception;
	
	public void delete (TradingBox trading) throws Exception;
}
