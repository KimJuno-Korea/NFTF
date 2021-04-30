package kr.co.nftf.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {
	public int count(Board board) throws Exception;
	
	public void insert(Board board) throws Exception;
	
	public List<Board> list (Board board) throws Exception;
	
	public List<Board> searchResult (Board board) throws Exception;
	
	public Board select (Board board) throws Exception;
	
	public void update (Board board) throws Exception;
	
	public void delete (Board board) throws Exception;
}