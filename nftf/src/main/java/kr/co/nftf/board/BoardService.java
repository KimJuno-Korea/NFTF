package kr.co.nftf.board;

import java.util.List;

public interface BoardService {
	public void boardRegist (Board board);
	
	public List<Board> boardList ();
	
	public List<Board> boardSearch (String message);
	
	public Board boardSelect (Board board);
	
	public void boardEdit (Board board);
	
	public void boardDelete (Board board);
}
