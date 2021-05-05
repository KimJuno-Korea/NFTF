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
	public void boardRegist(Board board) {
		board.setUserId("test");
		board.setStatus('M');
		board.setRegistrateDate(LocalDate.now());
		try {
			boardMapper.insert(board);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Board> boardList() {
		List<Board> listBoard = new ArrayList<>();
		Board board = new Board();
		
		try {
			listBoard = boardMapper.list(board);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return listBoard;
	}

	@Override
	public List<Board> boardSearch(String message) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board boardSelect(Board board) {
		try {
			board = boardMapper.select(board);	
		} catch(Exception e) {
			e.printStackTrace();
		}
		return board;
	}

	@Override
	public void boardEdit(Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void boardDelete(Board board) {
		// TODO Auto-generated method stub
		
	}
}
