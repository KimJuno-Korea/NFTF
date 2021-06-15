package kr.co.nftf.agent;


import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.nftf.board.Board;
import kr.co.nftf.board.BoardService;
import kr.co.nftf.branch.Branch;
import kr.co.nftf.payment.PaymentService;
import kr.co.nftf.security.SecurityService;
import kr.co.nftf.trading.Trading;
import kr.co.nftf.trading.TradingService;
import kr.co.nftf.tradingbox.TradingBox;
import kr.co.nftf.tradingbox.TradingBoxService;
import kr.co.nftf.user.User;
import kr.co.nftf.user.UserService;

@RestController
public class AgentController {
	@Autowired
	private UserService userServiceImpl;
	
	@Autowired
	private TradingBoxService tradingBoxServiceImpl;
	
	@Autowired
	private BoardService boardServiceImpl;
	
	@Autowired
	private TradingService tradingServiceImpl;
	
	@Autowired
	private SecurityService securityServiceImpl;
	
	@Autowired
	private PaymentService paymentServiceImpl;
	
	// 회원 검증
	@PostMapping(value="/agent/authentication", consumes=MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Boolean> userAuthentication (@RequestBody User user) throws Exception {
		Map<String, Boolean> authResult = new HashMap<String, Boolean>();
		
		if (user.getId() != null && user.getPw() != null) {
			if (userServiceImpl.selectUser(user) != null) {
				authResult.put("result", true);
			
				return authResult;
			}
		}
		
		authResult.put("result", false);
		return authResult;
	}
	
	// 인증키 대조
	@PostMapping(value="/agent/contrastkey", consumes=MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Boolean> contrastKey (@RequestBody TradingBox tradingBox) throws Exception {
		Map<String, Boolean> authResult = new HashMap<String, Boolean>();
		
		if (tradingBox != null) {
				authResult.put("result", securityServiceImpl.contrastKey(tradingBox.getAuthKey()));
			
				return authResult;
			}
		authResult.put("result", false);
		
		return authResult;
	}
	
	// 거래함 목록 조회
	@GetMapping(value = "/agent/{code}/tradingbox")
	public List<TradingBox> getTradingBoxListToJson(Branch branch) throws Exception {
		
		return tradingBoxServiceImpl.selectTradingBoxList(branch);
	}
	
	// 게시글 목록 조회
	@GetMapping(value="/agent/{userId}/board")
	public List<Board> getBoardList (Board board) throws Exception {
		// 판매중인
		board.setDivision('S');
		// 거래방식이 거래함인
		board.setTradeWay('T');
		// 거래 중인
		board.setStatus('M');
		
		// 게시글 목록을 조회하여 반환한다.
		return boardServiceImpl.boardList(board);
	}
	
	// 물품 등록
	@PostMapping(value="/agent/registgoods", consumes = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Boolean> registGoods (@RequestBody TradingBox tradingBox) {
		Map<String, Boolean> result = new HashMap<String, Boolean>();	
		Board board = new Board();
		Trading trading = new Trading();
		try {	
				// 거래함 사용중으로 변경
				tradingBox.setStatus('T');
				tradingBoxServiceImpl.editTradingBoxForRegist(tradingBox);
				
				// 특정 개시글 거래상태 결제 대기로 변경
				/*
				 * board.setNo(tradingBox.getBoardNo()); board.setStatus('M');
				 * boardServiceImpl.boardEdit(board);
				 */
				
				// 거래 정보 등록
				board = boardServiceImpl.boardSelect(board);
				trading.setBoardNo(board.getNo());
				// 거래 상태 거래중(M)으로 변경
				trading.setStatus('M');
				trading.setSellerId(board.getUserId());
				trading.setTradeDate(LocalDate.now());
				tradingServiceImpl.registTrading(trading);
				
				//tradingBoxServiceImpl
				result.put("result", true);
		} catch (Exception e) {
				result.put("result", false);
		}
		
		return result;
	}
	
	// 물품 수령
	@PostMapping(value="/agent/receivegoods", consumes = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Boolean> receiveGoods (@RequestBody TradingBox tradingBox) {
		Map<String, Boolean> result = new HashMap<String, Boolean>();
		Board board = new Board();
		Trading trading = new Trading();
		try {
			tradingBox.setStatus('F');
			board.setNo(tradingBox.getBoardNo());
			board.setStatus('S');
			trading.setStatus('S');
			trading.setBoardNo(tradingBox.getBoardNo());
			
			tradingBoxServiceImpl.editTradingBox(tradingBox);
			boardServiceImpl.boardEdit(board);
			tradingServiceImpl.editTrading(trading);
			
			result.put("result", true);
		} catch (Exception e) {
				result.put("result", false);
		}
		
		return result;
	}
}
