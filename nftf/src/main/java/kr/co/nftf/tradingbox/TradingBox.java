package kr.co.nftf.tradingbox;

import java.io.Serializable;
import java.time.LocalDateTime;

public class TradingBox implements Serializable {
	private String branchCode;
	private int no;
	private int boardNo;
	private char status;
	private int price;
	private String authKey;
	private LocalDateTime authKeyDate;
	
	public TradingBox() {
	
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getAuthKey() {
		return authKey;
	}

	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}

	public LocalDateTime getAuthKeyDate() {
		return authKeyDate;
	}

	public void setAuthKeyDate(LocalDateTime authKeyDate) {
		this.authKeyDate = authKeyDate;
	}
}
