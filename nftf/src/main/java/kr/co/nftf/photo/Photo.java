package kr.co.nftf.photo;

import java.io.Serializable;

public class Photo implements Serializable {
	private int boardNo;
	private int no;
	private String path;
	private String thumbnail;
	private String logicalName;
	private String PhysicalName;
	
	public Photo() {
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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	public String getLogicalName() {
		return logicalName;
	}

	public void setLogicalName(String logicalName) {
		this.logicalName = logicalName;
	}

	public String getPhysicalName() {
		return PhysicalName;
	}

	public void setPhysicalName(String physicalName) {
		PhysicalName = physicalName;
	}
}
