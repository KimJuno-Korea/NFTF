package kr.co.nftf.board;

import java.util.List;

public interface BoardService {
	public void boardRegist (Board board) throws Exception;
	
	public List<Board> boardList () throws Exception;
	
	public List<Board> boardSearch (Board board) throws Exception;
	
	public Board boardSelect (Board board) throws Exception;
	
	public void boardEdit (Board board) throws Exception;
	
	public void boardDelete (Board board) throws Exception;
	
	public int boardCount() throws Exception;
	
	public List<Board> listPage (int displayPost, int postNum) throws Exception;

	public List<Board> boardList(Board board) throws Exception;
}
