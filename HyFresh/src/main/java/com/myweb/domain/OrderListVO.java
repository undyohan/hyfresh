package com.myweb.domain;

import java.util.Date;

public class OrderListVO {
	private String ocode;
	private int mno;
	private Date orderd8;
	private int oprice;
	private String memo;
	private int discount;
	private int point;
	private String receiver;
	private String zipcode;
	private String addr;
	private String tel;
	
	
	private int odno;
	private int pno;
	private int rno;
	private int qt;
	private int status;
	private String deliverd8;
	private String sendd8;
	

	private String pname;
	private int price;
	private String img;
	
	
	
	public OrderListVO() {}

	
	public String getOcode() {
		return ocode;
	}


	public void setOcode(String ocode) {
		this.ocode = ocode;
	}


	public int getMno() {
		return mno;
	}


	public void setMno(int mno) {
		this.mno = mno;
	}


	public Date getOrderd8() {
		return orderd8;
	}


	public void setOrderd8(Date orderd8) {
		this.orderd8 = orderd8;
	}


	public int getOprice() {
		return oprice;
	}


	public void setOprice(int oprice) {
		this.oprice = oprice;
	}


	public String getMemo() {
		return memo;
	}


	public void setMemo(String memo) {
		this.memo = memo;
	}


	public int getDiscount() {
		return discount;
	}


	public void setDiscount(int discount) {
		this.discount = discount;
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}


	public String getReceiver() {
		return receiver;
	}


	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public int getOdno() {
		return odno;
	}


	public void setOdno(int odno) {
		this.odno = odno;
	}


	public int getPno() {
		return pno;
	}


	public void setPno(int pno) {
		this.pno = pno;
	}


	public int getRno() {
		return rno;
	}


	public void setRno(int rno) {
		this.rno = rno;
	}


	public int getQt() {
		return qt;
	}


	public void setQt(int qt) {
		this.qt = qt;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public String getDeliverd8() {
		return deliverd8;
	}


	public void setDeliverd8(String deliverd8) {
		this.deliverd8 = deliverd8;
	}


	public String getSendd8() {
		return sendd8;
	}


	public void setSendd8(String sendd8) {
		this.sendd8 = sendd8;
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


	@Override
	public String toString() {
		return "OrderListVO [ocode=" + ocode + ", mno=" + mno + ", orderd8=" + orderd8 + ", oprice=" + oprice
				+ ", memo=" + memo + ", discount=" + discount + ", point=" + point + ", receiver=" + receiver
				+ ", zipcode=" + zipcode + ", addr=" + addr + ", tel=" + tel + ", odno=" + odno + ", pno=" + pno
				+ ", rno=" + rno + ", qt=" + qt + ", status=" + status + ", deliverd8=" + deliverd8 + ", sendd8="
				+ sendd8 + ", pname=" + pname + ", price=" + price + ", img=" + img + "]";
	}




}