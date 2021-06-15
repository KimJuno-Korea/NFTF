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
	public void registerTradingBox(TradingBox tradingBox) throws Exception {
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
	public TradingBox selectTradingBox(TradingBox tradingBox) throws Exception {
		return tradingBoxMapper.select(tradingBox);
	}

	@Override
	public void editTradingBox(TradingBox tradingBox) throws Exception {
		tradingBoxMapper.update(tradingBox);
	}
	
	@Override
	public void editTradingBoxForRegist(TradingBox tradingBox) throws Exception {
		tradingBoxMapper.registUpdate(tradingBox);
	}
	

	@Override
	public void deleteTradingBox(TradingBox tradingBox) throws Exception {
		tradingBoxMapper.delete(tradingBox);
	}
}
