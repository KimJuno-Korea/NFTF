package kr.co.nftf.board;

import java.io.Serializable;
import java.time.LocalDate;

public class Board implements Serializable{
	private int no;
	private String userId;
	private String title;
	private String content;
	private int price;
	private char division;
	private char tradeWay;
	private char status;
	private LocalDate registrateDate;
	
	public Board() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public char getDivision() {
		return division;
	}

	public void setDivision(char division) {
		this.division = division;
	}

	public char getTradeWay() {
		return tradeWay;
	}

	public void setTradeWay(char tradeWay) {
		this.tradeWay = tradeWay;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public LocalDate getRegistrateDate() {
		return registrateDate;
	}

	public void setRegistrateDate(LocalDate registrateDate) {
		this.registrateDate = registrateDate;
	}
}
