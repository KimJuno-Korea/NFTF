package kr.co.nftf.branch;

import java.util.List;

public interface BranchService {
	public void registBranch (Branch branch);
	
	public List<Branch> selectBranchList (Branch branch);
	
	public Branch selectBranch (Branch branch);
	
	public void editBranch (Branch branch);
	
	public void deleteBranch (Branch branch);
}
