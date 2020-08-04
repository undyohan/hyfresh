package com.myweb.domain;

import java.util.Date;

public class CartVO {
	private int cno;
	private int pno;
	private String email;
	private int mno;
	private int qt;
	private String getd8;
	private String pname;
	private int price;
	private int discount;
	private int dfee;
	private String img;
	
	public CartVO() {}

	//장바구니 추가용
	public CartVO(int pno, String email, int qt) {
		this.pno = pno;
		this.email = email;
		this.qt = qt;
	}
	

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
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
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getQt() {
		return qt;
	}
	public void setQt(int qt) {
		this.qt = qt;
	}
	
	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getGetd8() {
		return getd8;
	}

	public void setGetd8(String getd8) {
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

	public int getDfee() {
		return dfee;
	}

	public void setDfee(int dfee) {
		this.dfee = dfee;
	}

	@Override
	public String toString() {
		return "CartVO [cno=" + cno + ", pno=" + pno + ", email=" + email + ", mno=" + mno + ", qt=" + qt + ", getd8="
				+ getd8 + ", pname=" + pname + ", price=" + price + ", discount=" + discount + ", dfee=" + dfee
				+ ", img=" + img + "]";
	}
}
