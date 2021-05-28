package kr.co.nftf.trading;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

public class Trading implements Serializable {
	private int boardNo;
	private int price;
	private String buyerId;
	private String sellerId;
	private char status;
	private LocalDate tradeDate;
	
    private List<Trading> tradingList;

	public Trading() {
		super();
	}

	public Trading(int boardNo, int price, String buyerId, String sellerId, char status, LocalDate tradeDate,
			List<Trading> tradingList) {
		super();
		this.boardNo = boardNo;
		this.price = price;
		this.buyerId = buyerId;
		this.sellerId = sellerId;
		this.status = status;
		this.tradeDate = tradeDate;
		this.tradingList = tradingList;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public LocalDate getTradeDate() {
		return tradeDate;
	}

	public void setTradeDate(LocalDate tradeDate) {
		this.tradeDate = tradeDate;
	}

	public List<Trading> getTradingList() {
		return tradingList;
	}

	public void setTradingList(List<Trading> tradingList) {
		this.tradingList = tradingList;
	}

	@Override
	public String toString() {
		return "Trading [boardNo=" + boardNo + ", price=" + price + ", buyerId=" + buyerId + ", sellerId=" + sellerId
				+ ", status=" + status + ", tradeDate=" + tradeDate + ", tradingList=" + tradingList + "]";
	}
}
