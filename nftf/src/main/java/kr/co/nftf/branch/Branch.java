package kr.co.nftf.branch;

import java.io.Serializable;

public class Branch implements Serializable {
	private String code;
	private String name;
	private String latitude;
	private String longtitude;
	private String status;
	private int tradingBoxCount;

	public Branch() {	
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongtitude() {
		return longtitude;
	}

	public void setLongtitude(String longtitude) {
		this.longtitude = longtitude;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getTradingBoxCount() {
		return tradingBoxCount;
	}

	public void setTradingBoxCount(int tradingBoxCount) {
		this.tradingBoxCount = tradingBoxCount;
	}
}
