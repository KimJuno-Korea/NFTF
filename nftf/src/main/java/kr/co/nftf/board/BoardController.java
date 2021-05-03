package kr.co.nftf.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class BoardController {
	@GetMapping("/test")
	public ModelAndView boardTest() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("board\n\n");
		
		return modelAndView;
	}
}
