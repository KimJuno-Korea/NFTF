package kr.co.nftf.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.co.nftf.trading.Trading;
import kr.co.nftf.trading.TradingServiceImpl;

@RestController
public class UserController {
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private TradingServiceImpl tradingService;
	
	@Autowired
	private HttpSession httpSession;

	// 컨트롤러에서 가져와도 되는지? 그리고 컨트롤러에서 로직처리말고 서비스에서 해야되는거 아닌가?
	// 애초에 세션체크는 다른걸로한다 필터?? 였나 인터셉터로 한다
	
	private static final ModelAndView REDIRECT_MAIN = new ModelAndView(new RedirectView("/nftf/index"));
	private static final ModelAndView REDIRECT_LOGIN = new ModelAndView(new RedirectView("/nftf/login"));

	@GetMapping("/user/form")
	public ModelAndView signupForm() {
		return new ModelAndView("/user/signup");
	}

	@PostMapping("/user")
	public ModelAndView signup(User user) {
		try {
			return userService.registUser(user) ? REDIRECT_LOGIN
					: new ModelAndView(new RedirectView("/nftf/user/form"));
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	@GetMapping("/id/form")
	public ModelAndView findIdForm() {
		return new ModelAndView("/user/id/find");
	}

	// 아이디 찾기 결과 화면 필요
	@PostMapping(value = "/id", consumes = MediaType.APPLICATION_JSON_VALUE)
	public User findId(User user) {
		try {

			if (user != null) {
				return user.getPhone() != null ? userService.selectUser(user) : null;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	@GetMapping("/password/form")
	public ModelAndView findPasswordForm() {
		return new ModelAndView("/user/password/find");
	}

	@PostMapping("/password")
	public ModelAndView findPassword(User user) {
		try {
			ModelAndView modelAndView = new ModelAndView("/user/password/edit");

			if (user != null) {

				if (user.getId() != null && user.getPhone() != null) {
					User dbUser = userService.selectUser(user);

					// toString 메소드를 재정의 했기 때문에 모든 값이 같아야 성립된다.
					return dbUser.toString().equals(user.toString()) ? modelAndView : REDIRECT_MAIN;
				}
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return REDIRECT_MAIN;
	}

	@PostMapping("/password/{id}")
	public ModelAndView editPassword(User user) {
		try {
			ModelAndView modelAndView = new ModelAndView(new RedirectView("/nftf/login"));

			if (user != null) {
				return userService.editUser(user) == true ? modelAndView : REDIRECT_MAIN;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return REDIRECT_MAIN;
	}

	//세션체크는 인터셉터로
	//TODO:이거Get 말고 post로 하는게 보안상 맞는듯?
	//마이페이지 비번 다시치는 화면 가는거
	@GetMapping("/user/form/{id}")
	public ModelAndView myPageCheckPwForm(User user) {
		try {
			
			if (user != null) {
				//현재 로그인한 유저의 아이디와 마이페이지 조회하는 유저의 아이디가 같을경우 폼이동, 아닌경우 메인으로
				return httpSession.getAttribute("id").toString().equals(user.getId())
						? new ModelAndView("/user/mypage/form") : REDIRECT_MAIN;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return REDIRECT_LOGIN;
	}

	//비번 입력 화면에서 확인 들어가는거 눌렀을때
	//이게 마이 페이지 메인 화면 가는 메소드
	@PostMapping("/user/form/{id}")				//user 는 입력한 pw를 받아와야됨 이게 pathVal이랑 같이 받아지나?
	public ModelAndView myPageMain(User user) {
		try {
			
			if (user != null) {
				//현재 로그인한 유저의 아이디와 마이페이지 조회하는 유저의 아이디가 같을경우 폼이동, 아닌경우 메인으로
				ModelAndView modelAndView =  httpSession.getAttribute("id").toString().equals(user.getId())
						? new ModelAndView("/user/mypage/form") : REDIRECT_MAIN;
				
				return user.getPw().equals(userService.selectUser(user).getPw())
						? modelAndView : REDIRECT_MAIN;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return REDIRECT_LOGIN;
	}

	@GetMapping("/user/{id}/form")
	public ModelAndView editUserForm(User user) {
		try {
			return httpSession.getAttribute("id").toString().equals(user.getId())
					? new ModelAndView("/user/mypage/edit") : REDIRECT_MAIN;
		} catch (Exception exception){
			exception.printStackTrace();
		}
		return REDIRECT_MAIN;
	}

	@PutMapping("/user/{id}")
	public ModelAndView editUser(User user) {
		try {
			
			if (user != null) {
				return userService.editUser(user)
						? REDIRECT_LOGIN : REDIRECT_MAIN;
			}
		} catch (Exception exception){
			exception.printStackTrace();
		}
		return REDIRECT_MAIN;
	}

	@GetMapping("/{id}")
	public ModelAndView createLoginQR(User user) {
		ModelAndView modelAndView = new ModelAndView("/user/mypage/qr");
		// todo
		return modelAndView;
	}

	@GetMapping("/user/trading/{id}")
	public ModelAndView getTradingList(User user) {
		try {
			if (user != null) {
				ModelAndView modelAndView = new ModelAndView("/user/mypage/trading");
				
				Trading trading = new Trading();
				trading.setBuyerId(user.getId());
				List<Trading> tradingListBuyer = 
						tradingService.selectTradingList(trading);
				
				modelAndView = tradingListBuyer != null 
						? modelAndView.addObject("buyerList", tradingListBuyer) : modelAndView.addObject(null);
				
				trading.setBuyerId(null);
				trading.setSellerId(user.getId());
				List<Trading> tradingListSeller = 
						tradingService.selectTradingList(trading);
				
				modelAndView = tradingListSeller != null 
						? modelAndView.addObject("sellerList", tradingListSeller) : modelAndView.addObject(null);
				
				return modelAndView;
			}
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		return REDIRECT_MAIN;
	}

	@GetMapping("/user/withdrawal/{id}")
	public ModelAndView withdrawalForm(User user) {
		// todo
		ModelAndView modelAndView = new ModelAndView("/user/mypage/withdrawal");
		return modelAndView;
	}

	@DeleteMapping("/user/{id}")
	public ModelAndView withdrawal(User user) {
		ModelAndView modelAndView = new ModelAndView(new RedirectView("/nftf/logout"));
		return modelAndView;
	}
}
