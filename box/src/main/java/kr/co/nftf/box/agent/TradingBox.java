package kr.co.nftf.box.agent;

import java.io.Serializable;
import java.time.LocalDate;

public class TradingBox implements Serializable {

	private String branchCode;
	private int no;
	private int boardNo;
	private char status;
	private String adWord;
	private String authKey;
	private LocalDate authKeyDate;
	private String boardTitle;
	private int price;

	public TradingBox() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TradingBox(String branchCode, int no, int boardNo, char status, String adWord, String authKey,
			LocalDate authKeyDate, String boardTitle, int price) {
		super();
		this.branchCode = branchCode;
		this.no = no;
		this.boardNo = boardNo;
		this.status = status;
		this.adWord = adWord;
		this.authKey = authKey;
		this.authKeyDate = authKeyDate;
		this.boardTitle = boardTitle;
		this.price = price;
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

	public String getAdWord() {
		return adWord;
	}

	public void setAdWord(String adWord) {
		this.adWord = adWord;
	}

	public String getAuthKey() {
		return authKey;
	}

	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}

	public LocalDate getAuthKeyDate() {
		return authKeyDate;
	}

	public void setAuthKeyDate(LocalDate authKeyDate) {
		this.authKeyDate = authKeyDate;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "TradingBox [branchCode=" + branchCode + ", no=" + no + ", boardNo=" + boardNo + ", status=" + status
				+ ", adWord=" + adWord + ", authKey=" + authKey + ", authKeyDate=" + authKeyDate + ", boardTitle="
				+ boardTitle + ", price=" + price + "]";
	}

}