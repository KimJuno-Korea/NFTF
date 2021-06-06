package kr.co.nftf.agent;


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
	public Map<String, Boolean> contrastKey (@RequestBody String authKey) throws Exception {
		Map<String, Boolean> authResult = new HashMap<String, Boolean>();
		
		if (authKey != null) {
				authResult.put("result", securityServiceImpl.contrastKey(authKey));
			
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
		
		return boardServiceImpl.boardList(board);
	}
	
	// 물품 등록
	@PostMapping(value="/agent/registgoods", consumes = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Boolean> registGoods (@RequestBody TradingBox tradingBox) {
		Map<String, Boolean> result = new HashMap<String, Boolean>();	
		Board board = new Board();
		Trading trading = new Trading();
		try {	
				tradingBox.setStatus('T');
				board.setNo(tradingBox.getBoardNo());
				board.setTradeWay('W');
				board.setStatus('W');
				trading.setBoardNo(tradingBox.getBoardNo());
				trading.setStatus('T');
				
				tradingBoxServiceImpl.editTradingBox(tradingBox);
				boardServiceImpl.boardEdit(board);
				tradingServiceImpl.editTrading(trading);
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
