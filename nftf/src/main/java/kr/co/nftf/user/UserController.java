package kr.co.nftf.user;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
public class UserController {
	@GetMapping("/user/form")
	public ModelAndView signupForm() {
		return new ModelAndView("/user/signup");
	}
	
	@PostMapping("/user")
	public ModelAndView signup(User user) {
		//todo
		return new ModelAndView(new RedirectView("/common/login"));
	}
	
	@GetMapping("/id/form")
	public ModelAndView findIdForm() {
		return new ModelAndView("/user/id/find");
	}
	
	@PostMapping(value="/id", consumes=MediaType.APPLICATION_JSON_VALUE)
	public User findId(User user) {
		//
		return user;
	}
	
	@GetMapping("/password/form")
	public ModelAndView findPasswordForm() {
		return new ModelAndView("/user/password/find");
	}
	
	@PostMapping("/password")
	public ModelAndView findPassword(User user) {
		return new ModelAndView("/user/password/edit");
	}
}
