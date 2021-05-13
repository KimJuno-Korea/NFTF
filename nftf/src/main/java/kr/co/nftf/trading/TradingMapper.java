package kr.co.nftf.trading;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TradingMapper {
	public int insert (Trading trading) throws Exception;
	
	public Trading select (Trading trading) throws Exception;
	
	public List<Trading> selectList (Trading trading) throws Exception;
	
	public int update (Trading trading) throws Exception;
}
