package kr.co.nftf.common;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.co.nftf.user.User;

@RestController
public class CommonController {
	private static final ModelAndView REDIRECT_MAIN = new ModelAndView(new RedirectView("/index"));
	private static final ModelAndView REDIRECT_LOGIN = new ModelAndView(new RedirectView("/login"));
	private static final ModelAndView REDIRECT_LOGOUT = new ModelAndView(new RedirectView("/logout"));
	
	@Autowired
	private CommonServiceImpl commonService;
	
	@GetMapping("/index")
	public ModelAndView index() {
		return new ModelAndView("/common/index");
	}
	
	@GetMapping("/login")
	public ModelAndView loginForm() {
		return new ModelAndView("/common/login");
	}
	
	@PostMapping("/login")
	public ModelAndView login(User user) {
		try {
			if (commonService.login(user)) {
				return REDIRECT_MAIN;
			}
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		return REDIRECT_LOGIN;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout() {
		try {
			if (commonService.logout()) {
				return REDIRECT_MAIN;
			}
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		return REDIRECT_LOGIN;
	}
}
