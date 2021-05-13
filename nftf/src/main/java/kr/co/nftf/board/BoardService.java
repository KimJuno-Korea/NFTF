package kr.co.nftf.board;

import java.util.List;

public interface BoardService {
	public void boardRegist (Board board) throws Exception;
	
	public List<Board> boardList () throws Exception;
	
	public List<Board> boardSearch (String message) throws Exception;
	
	public Board boardSelect (Board board) throws Exception;
	
	public void boardEdit (Board board) throws Exception;
	
	public void boardDelete (Board board) throws Exception;
}
