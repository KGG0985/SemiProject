package com.dog.dto.volunteer;

import java.util.Date;

public class vo {
	
	private String volTitle;
	private Date volDate;
	private String volType;
	private String volContnt;
	
	private String volNo; // 봉사지원자넘버

	public String getVolTitle() {
		return volTitle;
	}

	public void setVolTitle(String volTitle) {
		this.volTitle = volTitle;
	}

	public Date getVolDate() {
		return volDate;
	}

	public void setVolDate(Date volDate) {
		this.volDate = volDate;
	}

	public String getVolType() {
		return volType;
	}

	public void setVolType(String volType) {
		this.volType = volType;
	}

	public String getVolContnt() {
		return volContnt;
	}

	public void setVolContnt(String volContnt) {
		this.volContnt = volContnt;
	}

	public String getVolNo() {
		return volNo;
	}

	public void setVolNo(String volNo) {
		this.volNo = volNo;
	}
	 
	

}
