package kr.co.nftf.board;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;

	@Override
	public void boardRegist(Board board) throws Exception{
		board.setStatus('M');
		board.setRegistrateDate(LocalDate.now());
		boardMapper.insert(board);

	}

	@Override
	public List<Board> boardList() throws Exception{
		List<Board> listBoard = new ArrayList<>();
		Board board = new Board();

		listBoard = boardMapper.list(board);

		return listBoard;
	}

	@Override
	public List<Board> boardSearch(Board board) throws Exception{
		List<Board> result = new ArrayList<>();
		result = boardMapper.searchResult(board);
		
		return result;
	}

	@Override
	public Board boardSelect(Board board) throws Exception{
		board = boardMapper.select(board);
		return board;
	}

	@Override
	public void boardEdit(Board board) throws Exception{
		boardMapper.update(board);
	}

	@Override
	public void boardDelete(Board board) throws Exception{
		boardMapper.delete(board);
	}
	
	@Override
	public int boardCount() throws Exception {
		return boardMapper.count();
	}

	@Override
	public List<Board> listPage(int displayPost, int postNum) throws Exception {
		return boardMapper.listPage(displayPost, postNum);
	}
	
	@Override
	public List<Board> boardList(Board board) throws Exception{
		List<Board> listBoard = new ArrayList<>();

		listBoard = boardMapper.list(board);

		return listBoard;
	}
}
