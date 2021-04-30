package kr.co.nftf.reply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nftf.board.Board;

@Mapper
public interface ReplyMapper {
	public int count(Reply reply) throws Exception;
	
	public void insert(Reply reply) throws Exception;
	
	public List<Board> list (Reply reply) throws Exception;
	
	public void select (Reply reply) throws Exception;
	
	public void update (Reply reply) throws Exception;
	
	public void delete (Reply reply) throws Exception;
}
