package kr.co.nftf.payment;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
				boardServiceImpl.boardEdit(board);
				
				Trading trading = new Trading();
				trading.setBoardNo(board.getNo());
				trading.setBuyerId(session.getAttribute("id").toString());
				tradingServiceImpl.editTrading(trading);
				return true;
			}
		}
		return false;
	}
	
	@PostMapping("/payment/qr")
	public String createKeyQR(Board board, HttpServletResponse response) throws Exception{
	
		board = boardServiceImpl.boardSelect(board);
		
		TradingBox tradingBox = new TradingBox();
		tradingBox.setBoardNo(board.getNo());
		tradingBox = tradingBoxServiceImpl.selectTradingBox(tradingBox);
		
		Trading trading = new Trading();
		trading.setBoardNo(board.getNo());
		trading = tradingServiceImpl.selectTrading(trading);
		System.out.println(trading.toString());
		
		if (session.getAttribute("id") != null) {
			
			byte[] file = this.securityServiceImpl.createKeyQR(tradingBox);
			if (file != null) {
				System.out.println(board.toString());
				response.setContentType("image/png");
				byte[] encodeBase64 = Base64.encodeBase64(file);
				String stringImg = new String(encodeBase64, "utf-8");
				return stringImg;
			}
		}
		return null;
	}
	
	
}
