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
	public void boardRegist(Board board) throws Exception{
		board.setUserId((String)httpSession.getAttribute("userId"));
		board.setStatus('M');
		board.setRegistrateDate(LocalDate.now());
		boardMapper.insert(board);

	}

	@Override
	public List<Board> boardList() throws Exception{
		List<Board> listBoard = new ArrayList<>();
		Board board = new Board();

		//현재 로그인 기능과 연동하지 않아 게시글 목록 조회 시 세션 저장
		if(httpSession.getAttribute("userId") == null) {
			httpSession.setAttribute("userId", "test1");
			System.out.println(httpSession.getAttribute("userId"));
		}
		//추후 삭제 예정
		
		listBoard = boardMapper.list(board);

		return listBoard;
	}

	@Override
	public List<Board> boardSearch(String keyword) throws Exception{
		List<Board> result = new ArrayList<>();
		result = boardMapper.searchResult(keyword);
		
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
}
