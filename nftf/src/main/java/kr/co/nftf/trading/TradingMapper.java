package kr.co.nftf.trading;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TradingMapper {
	public int insertTrading (Trading trading) throws Exception;
	
	public Trading selectTrading (Trading trading) throws Exception;
	
	public List<Trading> selectTradingList (Trading trading) throws Exception;
	
	public int updateTrading (Trading trading) throws Exception;
}
