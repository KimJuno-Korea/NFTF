package kr.co.nftf.user;

import java.util.ArrayList;
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

import kr.co.nftf.board.Board;
import kr.co.nftf.board.BoardService;
import kr.co.nftf.common.CommonController;
import kr.co.nftf.common.CommonService;
import kr.co.nftf.security.SecurityService;
import kr.co.nftf.trading.Trading;
import kr.co.nftf.trading.TradingService;

@RestController
public class UserController {
	@Autowired
	private UserService userServiceImpl;

	@Autowired
	private TradingService tradingServiceImpl;

	@Autowired
	private SecurityService securityServiceImpl;

	@Autowired
	private BoardService boardServiceImpl;

	@Autowired
	private HttpSession httpSession;

//	// 회원가입 폼 **
//	@GetMapping("/user/form")
//	public ModelAndView signupForm() {
//
//		return new ModelAndView("/user/signup");
//	}

	// 회원가입 **
	@PostMapping(value="/user", consumes=MediaType.APPLICATION_JSON_VALUE)
	public boolean signup(@RequestBody User user) {
		try {
			
			if (user != null) {
				return userServiceImpl.registUser(user) ? true
						: false;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return false;
	}

	// 아이디 찾기 폼
	@GetMapping("/id/form")
	public ModelAndView findIdForm() {

		if (httpSession.getAttribute("id") != null) {
			return CommonController.REDIRECT_MAIN;
		}
		return new ModelAndView("/user/id/find");
	}

	// 아이디 찾기
	@PostMapping(value = "/id", consumes = MediaType.APPLICATION_JSON_VALUE)
	public User findId(@RequestBody User user) {
		try {

			if (user != null) {
				User dbUser = userServiceImpl.selectUser(user);
				return user.getPhone() != null ? dbUser : null;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

	// 비밀번호 찾기 폼
	@GetMapping("/password/form")
	public ModelAndView findPasswordForm() {

		if (httpSession.getAttribute("id") != null) {
			return CommonController.REDIRECT_MAIN;
		}
		return new ModelAndView("/user/password/find");
	}

	// 비밀번호 찾기
	@PostMapping("/password")
	public ModelAndView findPassword(User user) {
		try {
			ModelAndView modelAndView = new ModelAndView("/user/password/edit");
			User dbUser = userServiceImpl.selectUser(user);

			if (user != null) {

				if (user.getId() != null && user.getPhone() != null) {
					return dbUser.getId().equals(user.getId().toString())
							? modelAndView.addObject("id", dbUser.getId()).addObject("pw", dbUser.getPw())
							: CommonController.REDIRECT_MAIN;
				}
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_MAIN;
	}

	// 비밀번호 수정 **
	@PostMapping("/password/{id}")
	public ModelAndView editPassword(User user) {
		try {

			if (user != null) {
				return userServiceImpl.editUser(user) == true ? CommonController.REDIRECT_LOGOUT
						: CommonController.REDIRECT_MAIN;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_MAIN;
	}

	// 마이페이지 비번 다시치는 화면 가는거 **
	@GetMapping("/user/form/{id}")
	public ModelAndView myPageCheckPwForm(User user,
			@CookieValue(value = "mypage", required = false) Cookie mypageCookie) {
		try {
			
			if (user != null) {

				if (mypageCookie != null) {

					if (mypageCookie.getValue().toString().equals("true")) {
						return new ModelAndView("/user/mypage/index");
					}
				}
				// 현재 로그인한 유저의 아이디와 마이페이지 조회하는 유저의 아이디가 같을경우 폼이동, 아닌경우 메인으로
				return httpSession.getAttribute("id").toString().equals(user.getId())
						? new ModelAndView("/user/mypage/form").addObject("id", user.getId())
						: CommonController.REDIRECT_MAIN;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_MAIN;
	}

	// 이게 마이 페이지 메인 화면 가는 메소드 **
	@PostMapping("/user/form/{id}")
	public ModelAndView myPageMain(User user, HttpServletResponse response,
			@CookieValue(value = "mypage", required = false) Cookie mypageCookie) {
		try {
			
			if (user != null) {

				// 현재 로그인한 유저의 아이디와 마이페이지 조회하는 유저의 아이디가 같을경우 폼이동, 아닌경우 메인으로
				// 이것도 그냥 인터셉터로 해도됨

				ModelAndView modelAndView = httpSession.getAttribute("id").toString().equals(user.getId())
						? new ModelAndView("/user/mypage/index")
						: CommonController.REDIRECT_MAIN;

				if (user.getPw().equals(userServiceImpl.selectUser(user).getPw())) {

					if (mypageCookie == null || mypageCookie.getValue().equals("false")) {
						System.out.println("쿠키 없음");
						Cookie cookie = new Cookie("mypage", "true");
						cookie.setMaxAge(5 * 60);
						response.addCookie(cookie);
					}

					return modelAndView;
				} else {
					return CommonController.REDIRECT_MAIN;
				}
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_MAIN;
	}

	// 회원정보 수정 폼 **
	@GetMapping("/user/{id}/form")
	public ModelAndView editUserForm(User user) {
		try {
			User dbUser = userServiceImpl.selectUser(user);
			return httpSession.getAttribute("id").toString().equals(user.getId())
					? new ModelAndView("/user/mypage/edit").addObject("user", dbUser)
					: CommonController.REDIRECT_MAIN;
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_MAIN;
	}

	// 회원정보 수정 **
	@PutMapping("/user/{id}")
	public ModelAndView editUser(User user) {
		try {

			if (user != null) {
				return userServiceImpl.editUser(user) ? CommonController.REDIRECT_MAIN
						: CommonController.REDIRECT_MAIN;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_MAIN;
	}

	// 모달로 대체함
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

	// 로그인 QR 생성 **
	@GetMapping("/user/qr/{id}")
	public void createLoginQR(User user, HttpServletResponse response) {
		try {
			
			if (user != null) {
				user = userServiceImpl.selectUser(user);
				byte[] file = this.securityServiceImpl.createAccountQR("" + user.getId()+ "/" + user.getPw());
				if (file != null) {
					response.setContentType("image/png");
					response.getOutputStream().write(file);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 거래 정보 목록 조회 **
	@GetMapping("/user/trading/{id}")
	public ModelAndView getTradingList(User user) {
		try {

			if (user != null) {
				ModelAndView modelAndView = new ModelAndView("/user/mypage/trading");

				Trading trading = new Trading();
				trading.setBuyerId(user.getId());
				List<Trading> tradingListBuyer = tradingServiceImpl.selectTradingList(trading);

				modelAndView = tradingListBuyer != null ? modelAndView.addObject("buyerList", tradingListBuyer)
						: modelAndView.addObject("buyerList", null);

				List<Board> buyerBoardList = new ArrayList<>();

				Board board = new Board();
				for (Trading trade : tradingListBuyer) {
					board.setNo(trade.getBoardNo());
					buyerBoardList.add(boardServiceImpl.boardSelect(board));
				}

				modelAndView.addObject("buyerBoardList", buyerBoardList);

				trading.setBuyerId(null);
				trading.setSellerId(user.getId());
				List<Trading> tradingListSeller = tradingServiceImpl.selectTradingList(trading);

				modelAndView = tradingListSeller != null ? modelAndView.addObject("sellerList", tradingListSeller)
						: modelAndView.addObject("sellerList", null);

				List<Board> sellerBoardList = new ArrayList<>();

				for (Trading trade : tradingListSeller) {
					board.setNo(trade.getBoardNo());
					sellerBoardList.add(boardServiceImpl.boardSelect(board));
				}

				modelAndView.addObject("sellerBoardList", sellerBoardList);

				return modelAndView;
			}
		} catch (Exception exception) {
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
	
	// 회원 탈퇴
	@DeleteMapping("/user/{id}")
	public ModelAndView withdrawal(User user) {
		try {

			if (user != null) {

				User dbUser = userServiceImpl.selectUser(user);
				if (dbUser != null) {
					dbUser.setDivision('D');
					userServiceImpl.editUser(dbUser);
					return CommonController.REDIRECT_LOGOUT;
				} else {
					return new ModelAndView(new RedirectView("/user/form/" + user.getId())).addObject("result",
							"false");
				}
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return CommonController.REDIRECT_MAIN;
	}

	// 아이디 중복 확인
	@PostMapping(value = "/user/check", consumes = MediaType.APPLICATION_JSON_VALUE)
	public boolean checkId(@RequestBody User user) {
		try {

			if (user != null) {
				return userServiceImpl.selectUser(user) == null ? true : false;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return false;
	}

	private void responseKey(User user) {
		httpSession.setAttribute("key", "");
		try {
			String key = userServiceImpl.sendKey(user.getPhone());
			
			System.out.println("인증키 " + key);
			
			httpSession.setAttribute("key", key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 인증번호 전송
	@ResponseBody
	@PostMapping(value = "/user/key/{type}", consumes = MediaType.APPLICATION_JSON_VALUE)
	public int responseKey(@RequestBody User user, @PathVariable String type) {// RequestBody를 적어야 Jackson이 json을 변환함
		try {

			if (user != null && type != null) {
				// 회원가입시 아이디랑 폰번호 없으니 이걸로 실행되야함
				if (type.equals("signup")) {
					User checkUser = new User();
					checkUser.setPhone(user.getPhone());
					checkUser = userServiceImpl.selectUser(checkUser);

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
					dbUser = userServiceImpl.selectUser(dbUser);

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

					idUser = userServiceImpl.selectUser(idUser);
					phoneUser = userServiceImpl.selectUser(phoneUser);

					if (idUser != null && phoneUser != null) {
						if (idUser.getId().equals(phoneUser.getId())) {
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

	// 인증번호 확인
	@PostMapping(value = "/user/key/check", consumes = MediaType.APPLICATION_JSON_VALUE)
	public boolean checkKey(@RequestBody String key) {
		try {

			if (key != null) {
				key = key.replaceAll("\"", "");
				System.out.println(key + "//" + httpSession.getAttribute("key"));
				return key.equals(httpSession.getAttribute("key")) ? true : false;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return false;
	}
}
