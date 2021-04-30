package kr.co.nftf.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
	public User select(User user) throws Exception;
	
	public int insert(User user) throws Exception;
	
	public int update(User user) throws Exception;
}