package kr.co.nftf.branch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nftf.tradingbox.TradingBox;
import kr.co.nftf.tradingbox.TradingBoxMapper;

@Service
public class BranchServiceImpl implements BranchService {
	@Autowired
	private BranchMapper branchMapper;
	
	@Autowired
	private TradingBoxMapper tradingBoxMapper;
	
	
	@Override
	public void registBranch(Branch branch) throws Exception {
		branchMapper.insert(branch);
		
		for (int i = 0; i < branch.getTradingBoxCount(); i++) {
			TradingBox tradingBox = new TradingBox();
			tradingBox.setBranchCode(branch.getCode());
			tradingBox.setNo(i + 1);
			tradingBox.setStatus('Y');
			
			tradingBoxMapper.insert(tradingBox);
		}
	}

	@Override
	public List<Branch> selectBranchList(Branch branch) throws Exception {
		return branchMapper.selectAll(branch);
	}

	@Override
	public Branch selectBranch(Branch branch) throws Exception {
		return branchMapper.select(branch);
	}

	@Override
	public void editBranch(Branch branch) throws Exception {
		branchMapper.update(branch);
	}

	@Override
	public void deleteBranch(Branch branch) throws Exception {
		branchMapper.delete(branch);
	}
}
