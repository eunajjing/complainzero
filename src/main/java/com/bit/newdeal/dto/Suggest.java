package com.bit.newdeal.dto;

public class Suggest {
	private int sno;
	private String mid;
	private int bno;
	private String statusCode;
	private String link;
	private String tel;
	private String etc;
	private boolean sDelete;

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public boolean issDelete() {
		return sDelete;
	}

	public void setsDelete(boolean sDelete) {
		this.sDelete = sDelete;
	}
	
	@Override
	public String toString() {
		return "Suggest [sno=" + sno + ", mid=" + mid + ", bno=" + bno + ", statusCode=" + statusCode + ", link=" + link
				+ ", tel=" + tel + ", etc=" + etc + ", sDelete=" + sDelete + "]";
	}
	
}
