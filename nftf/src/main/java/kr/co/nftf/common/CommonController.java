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
		return new ModelAndView("/common/index");
	}
	
	@GetMapping("/common/login")
	public ModelAndView loginForm() {
		return new ModelAndView("/common/login");
	}
	
	@PostMapping("/common/login")
	public ModelAndView login(User user) {
		
		return new ModelAndView(new RedirectView("/nftf/common/index"));
	}
	
	@GetMapping("/common/logout")
	public ModelAndView logout() {
		
		return new ModelAndView(new RedirectView("/nftf/common/index"));
	}
}
