package kr.co.nftf.common;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.co.nftf.user.User;

@RestController
public class CommonController {
	public static final ModelAndView REDIRECT_MAIN = new ModelAndView(new RedirectView("/index"));
	public static final ModelAndView REDIRECT_LOGIN = new ModelAndView(new RedirectView("/login"));
	public static final ModelAndView REDIRECT_LOGOUT = new ModelAndView(new RedirectView("/logout"));
	
	@Autowired
	private CommonService commonServiceImpl;
	
	//메인메뉴 폼
	@GetMapping("/index")
	public ModelAndView index(String code) {
		return new ModelAndView("/common/index").addObject("code", code);
	}
	
	//로그인 폼
	@GetMapping("/login")
	public ModelAndView loginForm() {
		return new ModelAndView("/common/login");
	}
	
	//로그인
	@PostMapping("/login")
	public ModelAndView login(User user) {
		try {
			
			if (commonServiceImpl.login(user)) {
				return REDIRECT_MAIN;
			}
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		return REDIRECT_LOGIN;
	}
	
	//로그아웃
	@GetMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		try {
			if (commonServiceImpl.logout(request, response)) {
				return REDIRECT_MAIN;
			}
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		return REDIRECT_LOGIN;
	}
}
