package kr.co.nftf.board;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	//추후 삭제 예정
	@Autowired
	HttpSession httpSession;
	
	
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
		
		//현재 로그인 기능과 연동하지 않아 게시글 목록 조회 시 세션 저장
		if(httpSession.getAttribute("userId") == null) {
			httpSession.setAttribute("userId", "test");
			System.out.println(httpSession.getAttribute("userId"));
		}
		//추후 삭제 예정
		
		try {
			listBoard = boardMapper.list(board);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return listBoard;
	}

	@Override
	public List<Board> boardSearch(String keyword) {
		List<Board> result = new ArrayList<>();
		try {
			result = boardMapper.searchResult(keyword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
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
		try {
			boardMapper.update(board);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void boardDelete(Board board) {
		// TODO Auto-generated method stub
		
	}
}
