package kr.co.nftf.common;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.co.nftf.board.Board;
import kr.co.nftf.payment.PaymentService;
import kr.co.nftf.user.User;
import kr.co.nftf.user.UserService;

@RestController
public class CommonController {
	public static final ModelAndView REDIRECT_MAIN = new ModelAndView(new RedirectView("/index"));
	public static final ModelAndView REDIRECT_LOGIN = new ModelAndView(new RedirectView("/login"));
	public static final ModelAndView REDIRECT_LOGOUT = new ModelAndView(new RedirectView("/logout"));
	
	@Autowired
	private CommonServiceImpl commonService;
	
	@Autowired
	private PaymentService paymentServiceImpl;
	
	@Autowired
	private UserService userServiceImpl;
	
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
			
			if (commonService.login(user)) {
				return REDIRECT_MAIN;
			}
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		return REDIRECT_LOGIN;
	}
	
	//로그아웃
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
