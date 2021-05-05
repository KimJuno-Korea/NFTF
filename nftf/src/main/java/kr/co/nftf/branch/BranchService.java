package kr.co.nftf.branch;

import java.util.List;

public interface BranchService {
	public void registBranch (Branch branch) throws Exception;
	
	public List<Branch> selectBranchList (Branch branch) throws Exception;
	
	public Branch selectBranch (Branch branch) throws Exception;
	
	public void editBranch (Branch branch) throws Exception;
	
	public void deleteBranch (Branch branch) throws Exception;
}
