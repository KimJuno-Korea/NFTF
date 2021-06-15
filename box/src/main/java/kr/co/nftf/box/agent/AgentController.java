package kr.co.nftf.box.agent;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonSyntaxException;

@RestController
@RequestMapping("/box")
public class AgentController {
	@Autowired
	private AgentService agentServiceImpl;
	
	// 메인 폼
	@GetMapping("/index")
	public ModelAndView index() {
		ModelAndView mav;
		mav = new ModelAndView("/index");
		
		agentServiceImpl.logout();
		
		return mav;
	}

	// 등록 인증 폼
	@GetMapping("/registauth/form")
	public ModelAndView registAuthForm() {
		ModelAndView mav;
		mav = new ModelAndView("/registauth");
		return mav;
	}
	
	// 등록 인증
	@PostMapping(value = "/registauth", consumes=MediaType.APPLICATION_JSON_VALUE)
	public boolean registAuth(@RequestBody Account account) throws IOException {
		
		return  agentServiceImpl.login(account);
	}
	
	// 등록 인증 실패
	@GetMapping("/failregist")
	public ModelAndView failRegistForm(TradingBox tradingBox) {
		ModelAndView mav;
		mav = new ModelAndView("/failregistform");
		return mav;
	}
	
	// 거래함 선택 폼
	@GetMapping("/tradingbox")
	public ModelAndView selectTradingBoxForm(TradingBox tradingBox) throws JsonSyntaxException, IOException {
		ModelAndView mav;
		mav = new ModelAndView("/selectboxform");
		mav.addObject("tradingBoxList", agentServiceImpl.selectTradingBoxList(tradingBox));
		
		return mav;
	}
	
	// 거래함 선택
	@GetMapping("/tradingbox/{no}")
	public ModelAndView selectTradingBox(TradingBox tradingBox) throws JsonSyntaxException, IOException {
		List<Board> boardList = agentServiceImpl.selectBoardList(); 
		
		ModelAndView mav;
		mav = new ModelAndView("/setgoodsform");
		mav.addObject("tradingBox", tradingBox); mav.addObject("boardList",boardList);
		
		return mav;
	}
	
	// 물품 정보 설정
	@PostMapping("/goods")
	public ModelAndView setGoods(TradingBox tradingBox) {
		ModelAndView mav;
		mav = new ModelAndView("/confirmgoodsform");
		mav.addObject("tradingBox",tradingBox);
		
		return mav;
	}
	
	// 물품 정보 확인
	@PostMapping("/confirmgoods")
	public ModelAndView confirmGoods(TradingBox tradingBox) throws JsonSyntaxException, IOException {
		ModelAndView mav;
		mav = new ModelAndView("/registgoodsform");
		mav.addObject("tradingBox", tradingBox);
				
		return mav;
	}
	
	// 물품 등록
	@PostMapping(value="/registgoods", consumes=MediaType.APPLICATION_JSON_VALUE)
	public boolean registGoods(@RequestBody TradingBox tradingBox) throws JsonSyntaxException, IOException, InterruptedException {
		agentServiceImpl.registGoods(tradingBox);
		
		return true;
	}
	
	// 등록 성공 화면
	@GetMapping("/successregist")
	public ModelAndView successregist(TradingBox tradingBox) {
		ModelAndView mav;
		mav = new ModelAndView("/successregist");
		
		return mav;
	}
	
	// 수령인증 폼
	@GetMapping("/receiveauth/form")
	public ModelAndView receiveAuthForm() {
		ModelAndView mav;
		mav = new ModelAndView("/receiveauth");
		
		return mav;
	}
	
	// 수령 인증
	@PostMapping(value = "/receiveauth", consumes = MediaType.APPLICATION_JSON_VALUE)
	public boolean receiveAuth(@RequestBody TradingBox tradingBox) throws IOException {
		
		return agentServiceImpl.contrastKey(tradingBox);
	}
	
	// 인증키 인증 실패
	@GetMapping("/failreceive")
	public ModelAndView failReceiveForm(TradingBox tradingBox) {
		ModelAndView mav;
		mav = new ModelAndView("/failreceiveauthform");
		
		return mav;
	}
	
	// 물품 수령 화면
	@GetMapping("/receivegoods")
	public ModelAndView receivegoodsForm(TradingBox tradingBox) {
		ModelAndView mav;
		mav = new ModelAndView("/receiveinfoform");
		
		return mav;
	}

	//물품 수령
	@PostMapping(value="/receivegoods", consumes=MediaType.APPLICATION_JSON_VALUE)
	public boolean receiveGoods(@RequestBody TradingBox tradingBox) throws JsonSyntaxException, IOException, InterruptedException {
		agentServiceImpl.receiveGoods(tradingBox);
		
		return true;
	}
	
	// 등록 성공 화면
	@GetMapping("/successreceive")
	public ModelAndView successreceive(TradingBox tradingBox) {
		ModelAndView mav;
		mav = new ModelAndView("/successreceive");
		
		return mav;
	}
	
	/*
	 * //물품 등록 화면
	 * 
	 * @GetMapping("/registgoods") public ModelAndView registgoods() { ModelAndView
	 * mav; mav = new ModelAndView("/registinfoform");
	 * 
	 * return mav; }
	 */
}
