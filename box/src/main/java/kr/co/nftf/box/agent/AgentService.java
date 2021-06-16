package kr.co.nftf.box.agent;

import java.io.IOException;
import java.util.List;

import com.google.gson.JsonSyntaxException;

public interface AgentService {
	
	 public boolean login (Account account) throws IOException;
	 
	 public void logout ();
	 
	 public void registGoods (TradingBox tradingBox) throws JsonSyntaxException, IOException, InterruptedException;
	 
	 public void receiveGoods (TradingBox tradingBox) throws IOException;
	 
	 public List<TradingBox> selectTradingBoxList(TradingBox tradingBox) throws JsonSyntaxException, IOException;
	 
	 public List<Board> selectBoardList() throws JsonSyntaxException, IOException;

	boolean contrastKey(TradingBox tradingBox) throws IOException;

	byte[] createBoardQR(String boardNo) throws Exception;
}
