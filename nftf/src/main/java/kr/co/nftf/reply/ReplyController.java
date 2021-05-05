package kr.co.nftf.reply;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
/* @RequestMapping("/reply") */
public class ReplyController {
	@PostMapping("/reply/{no}")
	public ModelAndView registReply(Reply reply) {
		ModelAndView modelAndView = new ModelAndView("redirect:/board/{boardNo}"); //redirect할 때 게시글번호 담아야함
		
		return modelAndView;
	}
	
	@PutMapping("/reply/{no}")
	public ModelAndView editReply(Reply reply) {
		ModelAndView modelAndView = new ModelAndView("redirect:/board/{boardNo}"); //redirect할 때 게시글번호 담아야함
		
		return modelAndView;
	}
	
	@DeleteMapping("/reply/{no}")
	public ModelAndView deleteReply(Reply reply) {
		ModelAndView modelAndView = new ModelAndView("redirect:/board/{boardNo}"); //redirect할 때 게시글번호 담아야함
		
		return modelAndView;
	}
}
