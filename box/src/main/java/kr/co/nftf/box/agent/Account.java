package kr.co.nftf.box.agent;

import java.io.Serializable;

public class Account implements Serializable {
	private String id;
	
	private String pw;
	
	public Account() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
}
