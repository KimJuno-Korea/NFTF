package kr.co.nftf.user;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.co.nftf.board.BoardServiceImpl;
import kr.co.nftf.common.CommonController;
import kr.co.nftf.common.CommonService;
import kr.co.nftf.security.SecurityServiceImpl;
import kr.co.nftf.trading.Trading;
import kr.co.nftf.trading.TradingServiceImpl;
import kr.co.nftf.tradingbox.TradingBoxService;

@RestController
public class UserController {
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private TradingServiceImpl tradingService;
	
	@Autowired
	private SecurityServiceImpl securityService;
	
	@Autowired
	private CommonService commonServiceImpl;
	
	@Autowired
	private TradingBoxService tradingBoxServiceImpl;
	
	//관련 게시글 제목 가져와야됨
	@Autowired
	private BoardServiceImpl boardService;
	
	@Autowired
	private HttpSession httpSession;

	// 컨트롤러에서 가져와도 되는지? 그리고 컨트롤러에서 로직처리말고 서비스에서 해야되는거 아닌가?
	// 애초에 세션체크는 다른걸로한다 필터?? 였나 인터셉터로 한다


	//회원가입 폼 **
	@GetMapping("/user/form")
	public ModelAndView signupForm() {
		
		return new ModelAndView("/user/signup");
	}

	//회원가입 **
	@PostMapping("/user")
	public ModelAndView signup(User user) {
		try {
			return userService.registUser(user) ? CommonController.REDIRECT_LOGIN
					: new ModelAndView(new RedirectView("/user/form"));
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_LOGIN;
	}

	//아이디 찾기 폼 **
	@GetMapping("/id/form")
	public ModelAndView findIdForm() {
		
		if (httpSession.getAttribute("id") != null) {
			return CommonController.REDIRECT_MAIN;
		}
		return new ModelAndView("/user/id/find");
	}
 
	// 아이디 찾기 **
	@PostMapping(value = "/id", consumes = MediaType.APPLICATION_JSON_VALUE)
	public User findId(@RequestBody User user) {
		try {

			if (user != null) {
				User dbUser = userService.selectUser(user);
				return user.getPhone() != null ? dbUser : null;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	//비밀번호 찾기 폼 **
	@GetMapping("/password/form")
	public ModelAndView findPasswordForm() {
		
		if (httpSession.getAttribute("id") != null) {
			return CommonController.REDIRECT_MAIN;
		}
		return new ModelAndView("/user/password/find");
	}

	//비밀번호 찾기 **
	@PostMapping("/password")
	public ModelAndView findPassword(User user) {
		try {
			ModelAndView modelAndView = new ModelAndView("/user/password/edit");
			User dbUser = userService.selectUser(user);
			
			if (user != null) {
				
				if (user.getId() != null && user.getPhone() != null) {
					return dbUser.getId().equals(user.getId().toString()) ?
							modelAndView.addObject("id", dbUser.getId()).addObject("pw", dbUser.getPw()) : CommonController.REDIRECT_MAIN;
				}
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_MAIN;
	}

	//비밀번호 수정 **
	@PostMapping("/password/{id}")
	public ModelAndView editPassword(User user) {
		try {

			if (user != null) {
				commonServiceImpl.logout();
				return userService.editUser(user) == true ? CommonController.REDIRECT_LOGIN : CommonController.REDIRECT_MAIN;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_MAIN;
	}

	//마이페이지 비번 다시치는 화면 가는거 **
	@GetMapping("/user/form/{id}")
	public ModelAndView myPageCheckPwForm(User user,
			@CookieValue(value="mypage", required=false) Cookie mypageCookie) {
		try {
			if (user != null) {
				
				if (mypageCookie != null) {
					
					if (mypageCookie.getValue().toString().equals("true")) {
						System.out.println("쿠키로 마이페이지감");
						return new ModelAndView("/user/mypage/index");
					}
				}
				//현재 로그인한 유저의 아이디와 마이페이지 조회하는 유저의 아이디가 같을경우 폼이동, 아닌경우 메인으로
				return httpSession.getAttribute("id").toString().equals(user.getId())
						? new ModelAndView("/user/mypage/form").addObject("id", user.getId()) : CommonController.REDIRECT_MAIN;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_LOGIN;
	}
	
	//이게 마이 페이지 메인 화면 가는 메소드 **
	@PostMapping("/user/form/{id}")				
	public ModelAndView myPageMain(User user,  HttpServletResponse response,
			@CookieValue(value="mypage", required=false) Cookie mypageCookie) {
		try {
			if (user != null) {
				
				if (mypageCookie == null 
						|| mypageCookie.getValue().equals("false")) {
					System.out.println("쿠키 없음");
					Cookie cookie = new Cookie("mypage", "true");
					cookie.setMaxAge(5*60);
					response.addCookie(cookie);
				}
				//현재 로그인한 유저의 아이디와 마이페이지 조회하는 유저의 아이디가 같을경우 폼이동, 아닌경우 메인으로
				//이것도 그냥 인터셉터로 해도됨
				
				ModelAndView modelAndView =  httpSession.getAttribute("id").toString().equals(user.getId())
						? new ModelAndView("/user/mypage/index") : CommonController.REDIRECT_MAIN;
				
				return user.getPw().equals(userService.selectUser(user).getPw())
						? modelAndView : CommonController.REDIRECT_MAIN;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_MAIN;
	}
	
	//회원정보 수정 폼 **
	@GetMapping("/user/{id}/form")
	public ModelAndView editUserForm(User user) {
		try {
			User dbUser = userService.selectUser(user);
			return httpSession.getAttribute("id").toString().equals(user.getId())
					? new ModelAndView("/user/mypage/edit").addObject("user", dbUser) : CommonController.REDIRECT_MAIN;
		} catch (Exception exception){
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_MAIN;
	}

	//회원정보 수정 **
	@PutMapping("/user/{id}")
	public ModelAndView editUser(User user) {
		try {
			
			if (user != null) {
				return userService.editUser(user)
						? CommonController.REDIRECT_LOGIN : CommonController.REDIRECT_MAIN;
			}
		} catch (Exception exception){
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_MAIN;
	}

	//모달로 대체함
//	//로그인 QR 생성 폼 *~
//	@GetMapping("/user/{id}/qr")
//	public ModelAndView createLoginQRForm(User user) {
//		try {
//			if (user != null) {
//				ModelAndView modelAndView = new ModelAndView("/user/mypage/qr");
//				return modelAndView;
//			}
//		} catch (Exception exception) {
//			exception.printStackTrace();
//		}
//		return CommonController.REDIRECT_MAIN;
//	}
	
	//로그인qr생성 누르면 컨트롤러에서 이 매핑 실행하고 여기서 서비스 실행하면 서비스에서 qr생성해서 여기로 리턴함 그러면
	//여기서 생성된 qr을 쏴줌 **
	@GetMapping("/user/qr/{id}")
	public void createLoginQR(User user, HttpServletResponse response) {
		try { 
			user = userService.selectUser(user);
			byte[] file = this.securityService.createAccountQR(""+user.getId()+user.getPw());
			if (file != null) {
				response.setContentType("image/png");
				response.getOutputStream().write(file);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	//거래 정보 목록 조회 **
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
						? modelAndView.addObject("buyerList", tradingListBuyer) : modelAndView.addObject("buyerList", null);
						
				
				trading.setBuyerId(null);
				trading.setSellerId(user.getId());
				List<Trading> tradingListSeller = 
						tradingService.selectTradingList(trading);
				
				modelAndView = tradingListSeller != null 
						? modelAndView.addObject("sellerList", tradingListSeller) : modelAndView.addObject("sellerList", null);
				
				return modelAndView;
			}
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_MAIN;
	}

	/*
	 * @GetMapping("/user/withdrawal/{id}") public ModelAndView withdrawalForm(User
	 * user) { try {
	 * 
	 * if (user != null) { ModelAndView modelAndView = new
	 * ModelAndView("/user/mypage/withdrawal"); return modelAndView; } } catch
	 * (Exception exception) { exception.printStackTrace(); } return
	 * CommonController.REDIRECT_MAIN; }
	 */

	@DeleteMapping("/user/{id}")
	public ModelAndView withdrawal(User user) {
		try {
			
			if (user != null) {
				
				User dbUser = userService.selectUser(user);
				if (dbUser != null) {
					dbUser.setDivision('D');
					userService.editUser(dbUser);
					commonServiceImpl.logout();
					return CommonController.REDIRECT_LOGIN;
				} else {
					return new ModelAndView(new RedirectView("/user/form/"+user.getId())).addObject("result", "false");
				}
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_MAIN;
	}
	
	//아이디 중복 확인
	@PostMapping(value="/user/check", consumes=MediaType.APPLICATION_JSON_VALUE)
	public boolean checkId(@RequestBody User user) {
		try {
			
			if (user != null) {
				return userService.selectUser(user) == null ? true : false;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return false;
	}
	
	private void responseKey(User user) {
		httpSession.setAttribute("key", "");
		System.out.println(user.getPhone());
		StringBuilder key = new StringBuilder();
		//api 써야됨??? 뭐였지 서비스ㅔ있다.
		for (int i = 0 ; i < 6 ; i++) {
			key.append(((int)(Math.random()*10))+"");
		}
		System.out.println("인증키"+key);
		httpSession.setAttribute("key", key.toString());
	}
	
	//인증번호 전송
	@ResponseBody
	@PostMapping(value="/user/key/{type}", consumes=MediaType.APPLICATION_JSON_VALUE)
	public int responseKey(@RequestBody User user, @PathVariable String type) {// RequestBody를 적어야 Jackson이 json을 변환함
		try {
			
			if (user != null && type != null) {
				//회원가입시 아이디랑 폰번호 없으니 이걸로 실행되야함
				if (type.equals("signup")) {
					User checkUser = new User();
					System.out.println("//////////////////"+user.getPhone());
					checkUser.setPhone(user.getPhone());
					checkUser = userService.selectUser(checkUser);
					
					if (checkUser != null) {
						
						if (user.getPhone().equals(checkUser.getPhone())) {
							return -2;
						}
					}
					responseKey(user);
					return 1;
					
				} else if (type.equals("findId")) {
					User dbUser = new User();
					dbUser.setPhone(user.getPhone());
					dbUser = userService.selectUser(dbUser);
					
					if (dbUser != null) {
						responseKey(user);
						return 1;
					}
					return 0;
					
				} else if (type.equals("findPw")) {
					User idUser = new User();
					idUser.setId(user.getId());
					
					User phoneUser = new User();
					phoneUser.setPhone(user.getPhone());
					
					idUser = userService.selectUser(idUser);
					phoneUser = userService.selectUser(phoneUser);
					
					if (idUser != null && phoneUser != null) {
						if (idUser.getId()
								.equals(phoneUser.getId())) {
							responseKey(user);
							return 1;
						} else {
							return 0;
						}
					}
					return 0;
				}
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return -1;
	}
	
	//인증번호 확인 
	@PostMapping(value="/user/key/check", consumes=MediaType.APPLICATION_JSON_VALUE)
	public boolean checkKey(@RequestBody String key) {
		try {
			
			if (key != null) {
				key = key.replaceAll("\"", "");
				System.out.println(key);
				return key.equals(httpSession.getAttribute("key")) ? true : false;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return false;
	}
}
