package kr.co.nftf.tradingbox;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nftf.branch.Branch;
import kr.co.nftf.branch.BranchMapper;

@Service
public class TradingBoxServiceImpl implements TradingBoxService {
	@Autowired
	TradingBoxMapper tradingBoxMapper;
	
	@Autowired
	BranchMapper branchMapper;
	
	@Override
	public void registerTradingBox(TradingBox tradingBox) {
		tradingBoxMapper.insert(tradingBox);
	}

	@Override
	public List<TradingBox> selectTradingBoxList(Branch branch) throws Exception {
		TradingBox tradingBox;
		
		tradingBox= new TradingBox();
		tradingBox.setBranchCode(branchMapper.select(branch).getCode());
		
		return tradingBoxMapper.selectAll(tradingBox);
	}

	@Override
	public TradingBox selectTradingBox(TradingBox tradingBox) {
		return tradingBoxMapper.select(tradingBox);
	}

	@Override
	public void editTradingBox(TradingBox tradingBox) {
		tradingBoxMapper.update(tradingBox);
	}

	@Override
	public void deleteTradingBox(TradingBox tradingBox) {
		tradingBoxMapper.delete(tradingBox);
	}
}
