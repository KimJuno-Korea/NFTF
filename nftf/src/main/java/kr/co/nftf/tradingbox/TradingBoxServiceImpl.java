package kr.co.nftf.tradingbox;

import java.util.ArrayList;
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
		
		List<TradingBox> tradingBoxList = new ArrayList<TradingBox>();
		
		if (branch.getCode() == null && branch.getName() != null) {
			tradingBox.setBranchCode(branchMapper.select(branch).getCode());
			tradingBoxList = tradingBoxMapper.selectAll(tradingBox);
		} else if (branch.getCode() != null) {
			tradingBox.setBranchCode(branch.getCode());
			tradingBoxList = tradingBoxMapper.selectAll(tradingBox);
		}
		return tradingBoxList;
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
