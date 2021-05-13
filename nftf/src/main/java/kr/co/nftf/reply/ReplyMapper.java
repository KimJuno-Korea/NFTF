package kr.co.nftf.reply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyMapper {
	public int count(Reply reply) throws Exception;
	
	public int insert(Reply reply) throws Exception;
	
	public List<Reply> selectList (Reply reply) throws Exception;
	
	public Reply select (Reply reply) throws Exception;
	
	public int update (Reply reply) throws Exception;
	
	public int delete (Reply reply) throws Exception;
}
