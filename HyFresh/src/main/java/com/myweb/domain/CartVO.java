package com.myweb.domain;

import java.util.Date;

public class CartVO {
	private int cno;
	private int pno;
	private int mno;
	private int qt;
	private Date getd8;
	private String pname;
	private int price;
	private String img;
	
	
	public CartVO(int pno, int mno, int qt, String pname, int price, String img) {
		this.pno = pno;
		this.mno = mno;
		this.qt = qt;
		this.pname = pname;
		this.price = price;
		this.img = img;
	}
	
	
	
	
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getQt() {
		return qt;
	}
	public void setQt(int qt) {
		this.qt = qt;
	}
	
	public Date getGetd8() {
		return getd8;
	}
	public void setGetd8(Date getd8) {
		this.getd8 = getd8;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}
