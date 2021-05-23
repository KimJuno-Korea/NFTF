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
}
