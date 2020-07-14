package com.myweb.domain;

import java.util.Date;

public class ProductVO {
	private int pno;
	private int cateno;
	private int mno;
	private int tno;
	private String pname;
	private int price;
	private String content;
	private String img;
	private Date regd8;
	private Date modd8;
	private int stock;
	private int dfee;
	private int readcount;
	private int sellcount;
	private int discount;
	private String custom;
	private String test2;
	
	public ProductVO() { }
	public ProductVO(String pname, int price, String content, String img, int stock, int dfee, int discount,
			String custom) {
		this.pname = pname;
		this.price = price;
		this.content = content;
		this.img = img;
		this.stock = stock;
		this.dfee = dfee;
		this.discount = discount;
		this.custom = custom;
	}
	public ProductVO(int pno, int cateno, int mno, int tno, String pname, int price, String content, String img,
			Date regd8, Date modd8, int stock, int dfee, int readcount, int sellcount, int discount, String custom) {
		this.pno = pno;
		this.cateno = cateno;
		this.mno = mno;
		this.tno = tno;
		this.pname = pname;
		this.price = price;
		this.content = content;
		this.img = img;
		this.regd8 = regd8;
		this.modd8 = modd8;
		this.stock = stock;
		this.dfee = dfee;
		this.readcount = readcount;
		this.sellcount = sellcount;
		this.discount = discount;
		this.custom = custom;
	}
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getCateno() {
		return cateno;
	}
	public void setCateno(int cateno) {
		this.cateno = cateno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getRegd8() {
		return regd8;
	}
	public void setRegd8(Date regd8) {
		this.regd8 = regd8;
	}
	public Date getModd8() {
		return modd8;
	}
	public void setModd8(Date modd8) {
		this.modd8 = modd8;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getDfee() {
		return dfee;
	}
	public void setDfee(int dfee) {
		this.dfee = dfee;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getSellcount() {
		return sellcount;
	}
	public void setSellcount(int sellcount) {
		this.sellcount = sellcount;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getCustom() {
		return custom;
	}
	public void setCustom(String custom) {
		this.custom = custom;
	}
	
	@Override
	public String toString() {
		return "ProductVO [pno=" + pno + ", cateno=" + cateno + ", mno=" + mno + ", tno=" + tno + ", pname=" + pname
				+ ", price=" + price + ", content=" + content + ", img=" + img + ", regd8=" + regd8 + ", modd8=" + modd8
				+ ", stock=" + stock + ", dfee=" + dfee + ", readcount=" + readcount + ", sellcount=" + sellcount
				+ ", discount=" + discount + ", custom=" + custom + "]";
	}
}
