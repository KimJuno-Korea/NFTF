package kr.co.nftf.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
public class UserController {
	@Autowired
	UserServiceImpl userService;
	
	@GetMapping("/user/form")
	public ModelAndView signupForm() {
		return new ModelAndView("/user/signup");
	}
	
	@PostMapping("/user")
	public ModelAndView signup(User user) {
		 try {
			 ModelAndView modelAndView = new ModelAndView(new RedirectView("/nftf/login"));
				
				if (userService.registUser(user)) {
					return modelAndView;
				}
				return new ModelAndView(new RedirectView("/nftf/user/form"));
		 } catch (Exception exception) {
			 exception.printStackTrace();
		 }
		return null;
	}
	
	@GetMapping("/id/form")
	public ModelAndView findIdForm() {
		return new ModelAndView("/user/id/find");
	}
	
	//아이디 찾기 결과 화면 필요 
	@PostMapping(value="/id", consumes=MediaType.APPLICATION_JSON_VALUE)
	public User findId(User user) {
		try {
			if (user != null) {
				
				if (user.getPhone() != null) {
					return userService.selectUser(user);
				}
			}
			return null;
		} catch (Exception exception) {
			 exception.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/password/form")
	public ModelAndView findPasswordForm() {
		return new ModelAndView("/user/password/find");
	}
	
	////여기부터 진행하면됨
	@PostMapping("/password")
	public ModelAndView findPassword(User user) {
		ModelAndView modelAndView = new ModelAndView("/user/password/edit");
		//todo
		return modelAndView;
	}
	
	@PostMapping("/password/{id}")
	public ModelAndView editPassword(User user) {
		ModelAndView modelAndView = new ModelAndView(new RedirectView("/nftf/login"));
		//todo
		return modelAndView;
	}
	
	@GetMapping("/user/form/{id}")
	public ModelAndView myPageForm(User user) {
		ModelAndView modelAndView = new ModelAndView("/user/mypage/form");
		//todo
		return modelAndView;
	}
	
	@PostMapping("/user/form/{id}")
	public ModelAndView myPageLogin(User user) {
		ModelAndView modelAndView = new ModelAndView("/user/mypage/index");
		//todo
		return modelAndView;
	}
	
	@GetMapping("/user/{id}/form")
	public ModelAndView editUserForm(User user) {
		ModelAndView modelAndView = new ModelAndView("/user/mypage/edit");
		//todo
		return modelAndView;
	}
	
	@PutMapping("/user/{id}")
	public ModelAndView editUser(User user) {
		ModelAndView modelAndView = new ModelAndView(new RedirectView("/logout"));
		//todo
		return modelAndView;
	}
	
	@GetMapping("/{id}")
	public ModelAndView createLoginQR(User user) {
		ModelAndView modelAndView = new ModelAndView("/user/mypage/qr");
		//todo
		return modelAndView;
	}
	
	@GetMapping("/user/trading/{id}")
	public ModelAndView getTradingList (User user){
		ModelAndView modelAndView = new ModelAndView("/user/mypage/trading");
		//todo
		return modelAndView;
	}
	
	@GetMapping("/user/withdrawal/{id}")
	public ModelAndView withdrawalForm(User user) {
		//todo
		ModelAndView modelAndView = new ModelAndView("/user/mypage/withdrawal");
		return modelAndView;
	}
	
	@DeleteMapping("/user/{id}")
	public ModelAndView withdrawal(User user) {
		ModelAndView modelAndView = new ModelAndView(new RedirectView("/nftf/logout"));
		return modelAndView;
	}
}
