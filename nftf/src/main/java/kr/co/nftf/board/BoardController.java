package kr.co.nftf.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
/* @RequestMapping("/board") */
public class BoardController {
	@Autowired
	private BoardServiceImpl boardServiceImpl;
	
	@GetMapping("/board")
	public ModelAndView getBoardList() {
		ModelAndView modelAndView = new ModelAndView("/board/list");
		List<Board> listBoard = boardServiceImpl.boardList();
		System.out.println("board");
		modelAndView.addObject(listBoard);
		
		return modelAndView;
	}
	
	@GetMapping("/board/{no}")
	public ModelAndView getBoard(@PathVariable String no) {
		ModelAndView modelAndView = new ModelAndView("/detail");
		
		return modelAndView;
	}
	
	@PostMapping(value = "/boardsearch", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public ModelAndView searchBoard() {
		ModelAndView modelAndView = new ModelAndView();
		
		return modelAndView;
	}
	
	@GetMapping("/board/{no}/form")
	public ModelAndView editBoardForm(@PathVariable String boardNo) {
		ModelAndView modelAndView = new ModelAndView("/edit");
		
		return modelAndView;
	}
	
	@PutMapping("/board/{no}")
	public ModelAndView editBoard(Board board) {
		ModelAndView modelAndView = new ModelAndView("redirect:/board");
		
		return modelAndView;
	}
	
	@GetMapping("/board/form")
	public ModelAndView registBoardForm() {
		ModelAndView modelAndView = new ModelAndView("/form");
		
		return modelAndView;
	}
	
	@PostMapping("/board")
	public ModelAndView registBoard(Board board) {
		ModelAndView modelAndView = new ModelAndView("redirect:/board"); //게시글 목록으로
		
		return modelAndView;
	}
	
	@DeleteMapping("/board/{no}")
	public ModelAndView deleteBoard(String boardNo) {
		ModelAndView modelAndView = new ModelAndView("redirect:/board");
		
		return modelAndView;
	}
}
