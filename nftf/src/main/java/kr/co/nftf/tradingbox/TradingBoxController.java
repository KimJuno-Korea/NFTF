package kr.co.nftf.tradingbox;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nftf.board.Board;
import kr.co.nftf.board.BoardService;
import kr.co.nftf.branch.Branch;

@RestController
public class TradingBoxController {
	@Autowired
	TradingBoxService tradingBoxServiceImpl;
	
	@Autowired
	BoardService boardServiceImpl;

	@GetMapping("/tradingbox/{name}")
	public ModelAndView getTradingBoxList(Branch branch) throws Exception {
		ModelAndView mav;
		
		List<TradingBox> tradingBoxList = new ArrayList<>();
		
		tradingBoxList = tradingBoxServiceImpl.selectTradingBoxList(branch);
		
		mav = new ModelAndView("/tradingbox/list");
		mav.addObject("tradingBoxList", tradingBoxList);
		
		Board board = new Board();
		List<Board> boardList = new ArrayList<>();
		
		for (TradingBox tradingBox : tradingBoxList) {
			board.setNo(tradingBox.getBoardNo());
			boardList.add(boardServiceImpl.boardSelect(board));
		}
		
		mav.addObject("boardList", boardList);
		 
		return mav;
	}
}
