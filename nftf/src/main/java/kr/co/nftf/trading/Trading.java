package kr.co.nftf.trading;

import java.io.Serializable;
import java.time.LocalDate;

public class Trading implements Serializable {
	private int boardNo;
	private int price;
	private String buyerId;
	private String sellerId;
	private char status;
	private LocalDate tradeDate;
	
	public Trading() {
		
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

	public LocalDate getDate() {
		return tradeDate;
	}

	public void setDate(LocalDate date) {
		this.tradeDate = date;
	}
}
