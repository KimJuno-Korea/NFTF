package kr.co.nftf.common;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.co.nftf.user.User;

@RestController
public class CommonController {
	@Autowired
	private CommonServiceImpl commonService;
	
	@Autowired
	private HttpSession httpSession;
	
	@GetMapping("/index")
	public ModelAndView index() {
		return new ModelAndView("/common/index");
	}
	
	@GetMapping("/login")
	public ModelAndView loginForm() {
		
		if (httpSession != null) {
			
			if (httpSession.getAttribute("id") != null) {
				return new ModelAndView(new RedirectView("/nftf/index"));
			}
			
		}
		return new ModelAndView("/common/login");
	}
	
	@PostMapping("/login")
	public ModelAndView login(User user) {
		try {
			if (httpSession.getAttribute("id") == null) {
				
				if (commonService.login(user)) {
					return new ModelAndView(new RedirectView("/nftf/index"));
				}
				return new ModelAndView(new RedirectView("/nftf/login"));
			} 
			return new ModelAndView(new RedirectView("/nftf/index"));
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout() {
		try {
			if (httpSession != null) {
				
				if (httpSession.getAttribute("id") != null) {
					if (commonService.logout()) {
						return new ModelAndView(new RedirectView("/nftf/index"));
					}
				}
			}
			return new ModelAndView(new RedirectView("/nftf/login"));
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
}
