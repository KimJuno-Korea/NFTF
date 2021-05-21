package kr.co.nftf.payment;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nftf.board.Board;
import kr.co.nftf.board.BoardService;
import kr.co.nftf.security.SecurityService;
import kr.co.nftf.trading.Trading;
import kr.co.nftf.trading.TradingService;
import kr.co.nftf.tradingbox.TradingBox;
import kr.co.nftf.tradingbox.TradingBoxService;

@RestController
public class PaymentController {
	
	@Autowired
	private BoardService boardServiceImpl;
	
	@Autowired
	private TradingService tradingServiceImpl;
	
	@Autowired
	private TradingBoxService tradingBoxServiceImpl;
	
	@Autowired
	private SecurityService securityServiceImpl;
	
	@Autowired
	private HttpSession session;
	
	
	@PutMapping(value = "/payment", consumes = MediaType.APPLICATION_JSON_VALUE)
	public boolean buy(@RequestBody Board board) throws Exception {
		
		if (board != null) {
			board = boardServiceImpl.boardSelect(board);
			
			if (board.getStatus() != 'W') {
				board.setStatus('W');
				System.out.println(board.getStatus());
				boardServiceImpl.boardEdit(board);
				
				Trading trading = new Trading();
				trading.setBoardNo(board.getNo());
				//어차피 로그인 관련은 인터셉터에서 처리함
				System.out.println(session.getAttribute("id").toString());
				trading.setBuyerId(session.getAttribute("id").toString());
				tradingServiceImpl.editTrading(trading);
				return true;
			}
		}
		System.out.println("실패");
		return false;
	}
	
	@GetMapping("/payment/qr")
	public void createKeyQR(@RequestParam int no, HttpServletResponse response) throws Exception{
		
		System.out.println(no);
		Board board = new Board();
		board.setNo(no);
		board = boardServiceImpl.boardSelect(board);
		
		TradingBox tradingBox = new TradingBox();
		tradingBox.setBoardNo(no);
		tradingBox = tradingBoxServiceImpl.selectTradingBox(tradingBox);
		
		Trading trading = new Trading();
		trading.setBoardNo(board.getNo());
		trading = tradingServiceImpl.selectTrading(trading);
		System.out.println(trading.toString());
		
		if (session.getAttribute("id") != null) {
			
			byte[] file = this.securityServiceImpl.createKeyQR(tradingBox);
			System.out.println("성공??");
			if (file != null) {
				response.setContentType("image/png");
				response.getOutputStream().write(file);
			}
		}
	}
}
