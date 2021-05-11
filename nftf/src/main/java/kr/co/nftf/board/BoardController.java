package kr.co.nftf.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nftf.reply.Reply;
import kr.co.nftf.reply.ReplyServiceImpl;

@RestController
@RequestMapping("/nftf")
public class BoardController {
	@Autowired
	private BoardServiceImpl boardServiceImpl;
	
	@Autowired
	private ReplyServiceImpl replyServiceImpl;

	@GetMapping("/board")
	public ModelAndView getBoardList() {
		ModelAndView modelAndView = new ModelAndView("/board/list");
		List<Board> listBoard = new ArrayList<>();
		try {
			listBoard = boardServiceImpl.boardList();
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("board");
		modelAndView.addObject(listBoard);

		return modelAndView;
	}

	@GetMapping("/board/{no}")
	public ModelAndView getBoard(@PathVariable String no) {
		ModelAndView modelAndView = new ModelAndView("/board/detail");
		Board board = new Board();
		Reply reply = new Reply();
		List<Reply> replyList = new ArrayList<>();
		
		board.setNo(Integer.valueOf(no));
		reply.setBoardNo(Integer.valueOf(no));
		
		try {
			board = boardServiceImpl.boardSelect(board);
			replyList = replyServiceImpl.replyList(reply);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		modelAndView.addObject("board", board);
		modelAndView.addObject("replyList", replyList);

		return modelAndView;
	}

	@PostMapping(value = "/boardsearch", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public List<Board> searchBoard(String keyword) {
		List<Board> listBoard = new ArrayList<>();
		
		try {
			listBoard = boardServiceImpl.boardSearch(keyword);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return listBoard;
	}

	@GetMapping("/board/{no}/form")
	public ModelAndView editBoardForm(@PathVariable String no) {
		ModelAndView modelAndView = new ModelAndView("/board/edit");
		Board board = new Board();
		board.setNo(Integer.valueOf(no));
		try {
			board = boardServiceImpl.boardSelect(board);
		} catch(Exception e) {
			e.printStackTrace();
		}

		modelAndView.addObject("board", board);

		return modelAndView;
	}

	@PutMapping("/board/{no}")
	public ModelAndView editBoard(Board board) {
		ModelAndView modelAndView = new ModelAndView("redirect:/nftf/board");
		try {
			boardServiceImpl.boardEdit(board);
		} catch(Exception e) {
			e.printStackTrace();
		}

		return modelAndView;
	}

	@GetMapping("/board/form")
	public ModelAndView registBoardForm() {
		ModelAndView modelAndView = new ModelAndView("/board/form");

		return modelAndView;
	}

	@PostMapping("/board")
	public ModelAndView registBoard(Board board) {
		ModelAndView modelAndView = new ModelAndView("redirect:/nftf/board"); //게시글 목록으로
		try {
			boardServiceImpl.boardRegist(board);

		} catch(Exception e) {
			e.printStackTrace();
		}

		return modelAndView;
	}

	@DeleteMapping("/board/{no}")
	public ModelAndView deleteBoard(Board board) {
		ModelAndView modelAndView = new ModelAndView("redirect:/nftf/board");
		System.out.println(board);
		try {
			boardServiceImpl.boardDelete(board);
		} catch(Exception e) {
			e.printStackTrace();
		}

		return modelAndView;
	}
}
