package kr.co.nftf.trading;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TradingServiceImpl implements TradingService {
	@Autowired
	TradingMapper tradingMapper;

	@Override
	public boolean registTrading(Trading trading) {
		
		try {
			if (trading != null) {
				tradingMapper.insert(trading);
				return true;
			} else {
				return false;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Trading> selectTradingList(Trading trading) {
		
		try {
			if (trading != null) {
				return tradingMapper.selectList(trading);
			} else {
				return null;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	@Override
	public Trading selectTrading(Trading trading) throws Exception{
		if (trading != null) {
			return tradingMapper.select(trading);
		}
		return null;
	}

	@Override
	public boolean editTrading(Trading trading) {
		// TODO Auto-generated method stub
		return false;
	}

}
