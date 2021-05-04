package kr.co.nftf.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.co.nftf.user.User;
import kr.co.nftf.user.UserServiceImpl;

@RestController
public class CommonController {
	@Autowired
	private UserServiceImpl userService;
	
	@GetMapping("/common/index")
	public ModelAndView index() {
		return new ModelAndView("/index");
	}
	
	@GetMapping("/common/login")
	public ModelAndView loginForm() {
		return new ModelAndView("/login");
	}
	
	@PostMapping("/common/login")
	public ModelAndView login(User user) {
		ModelAndView modelAndView = new ModelAndView(new RedirectView("/index"));
		//todo
		return modelAndView;
	}
	
	@GetMapping("/common/logout")
	public ModelAndView logout() {
		ModelAndView modelAndView = new ModelAndView(new RedirectView("/index"));
		//todo
		return modelAndView;
	}
}
