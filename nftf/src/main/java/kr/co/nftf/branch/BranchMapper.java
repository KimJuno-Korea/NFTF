package kr.co.nftf.branch;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BranchMapper {
	public void insert(Branch branch) throws Exception;
	
	public List<Branch> selectAll(Branch branch) throws Exception;
	
	public Branch select(Branch branch) throws Exception;
	
	public void update(Branch branch) throws Exception;
	
	public void delete(Branch branch) throws Exception;
}