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
				tradingMapper.insertTrading(trading);
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
				return tradingMapper.selectTradingList(trading);
			} else {
				return null;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean selectTrading(Trading trading) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean editTrading(Trading trading) {
		// TODO Auto-generated method stub
		return false;
	}

}
