package kr.co.nftf.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BoardMapper {
	public int count() throws Exception;
	
	public void insert(Board board) throws Exception;
	
	public List<Board> list (Board board) throws Exception;
	
	public List<Board> searchResult (String keyword) throws Exception;
	
	public Board select (Board board) throws Exception;
	
	public void update (Board board) throws Exception;
	
	public void delete (Board board) throws Exception;
	
	public List<Board> listPage (@Param("displayPost") int displayPost, @Param("postNum") int postNum) throws Exception;
}