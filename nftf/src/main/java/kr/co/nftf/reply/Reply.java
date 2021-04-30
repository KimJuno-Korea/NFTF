package kr.co.nftf.reply;

import java.io.Serializable;
import java.time.LocalDate;

public class Reply implements Serializable {
	private int boardNo;
	private int no;
	private String userId;
	private String content;
	private LocalDate registRate;
	private char editStatus;
	
	public Reply() {
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDate getRegistRate() {
		return registRate;
	}

	public void setRegistRate(LocalDate registRate) {
		this.registRate = registRate;
	}

	public char getEditStatus() {
		return editStatus;
	}

	public void setEditStatus(char editStatus) {
		this.editStatus = editStatus;
	}
}
