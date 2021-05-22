package kr.co.nftf.tradingbox;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nftf.branch.Branch;

@RestController
public class TradingBoxController {
	@Autowired
	TradingBoxService tradingBoxServiceImpl;

	@GetMapping("/tradingbox/{name}")
	public ModelAndView getTradingBoxList(Branch branch) throws Exception {
		ModelAndView mav;
		
		mav = new ModelAndView("/tradingbox/list");
		mav.addObject("tradingBoxList", tradingBoxServiceImpl.selectTradingBoxList(branch));
		 
		return mav;
	}
	
	@GetMapping(value = "/{code}/tradingbox")
	public List<TradingBox> getTradingBoxListToJson(Branch branch) throws Exception {
		
		return tradingBoxServiceImpl.selectTradingBoxList(branch);
	}
}
