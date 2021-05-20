package kr.co.nftf.user;

import java.io.Serializable;

public class User implements Serializable {
	private String id;
	private String pw;
	private String email;
	private String phone;
	private char division;
	private String accountNo;
	private String bankNo;
	private String pinAccount;

	public User() {
		super();
	}

	public User(String id, String pw, String email, String phone, char division, String accountNo, String bankNo,
			String pinAccount) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.phone = phone;
		this.division = division;
		this.accountNo = accountNo;
		this.bankNo = bankNo;
		this.pinAccount = pinAccount;
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

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getBankNo() {
		return bankNo;
	}

	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}

	public String getPinAccount() {
		return pinAccount;
	}

	public void setPinAccount(String pinAccount) {
		this.pinAccount = pinAccount;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", pw=" + pw + ", email=" + email + ", phone=" + phone + ", division=" + division
				+ ", accountNo=" + accountNo + ", bankNo=" + bankNo + ", pinAccount=" + pinAccount + "]";
	}

}
