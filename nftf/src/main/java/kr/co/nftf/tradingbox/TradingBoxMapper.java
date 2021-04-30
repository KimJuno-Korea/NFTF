package kr.co.nftf.tradingbox;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TradingBoxMapper {
	public void insert (TradingBox trading);
	
	public List<TradingBox> selectAll (TradingBox trading);
	
	public void select (TradingBox trading);
	
	public void update (TradingBox trading);
	
	public void delete (TradingBox trading);
}
