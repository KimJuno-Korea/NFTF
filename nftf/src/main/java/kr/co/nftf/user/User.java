package kr.co.nftf.user;

import java.io.Serializable;

public class User implements Serializable {
	private String id;
	private String pw;
	private String email;
	private String phone;
	private char division;
	
	public User() {
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public char getDivision() {
		return division;
	}
	public void setDivision(char division) {
		this.division = division;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", pw=" + pw + ", email=" + email + ", phone=" + phone + ", division=" + division
				+ "]";
	}
}
