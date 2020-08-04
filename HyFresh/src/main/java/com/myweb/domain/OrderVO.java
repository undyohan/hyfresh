package com.myweb.domain;

import java.util.Date;

public class OrderVO {
	private String ocode;
	private int mno;
	private Date orderd8;
	private int oprice;
	private String memo;
	private double discount;
	private int point;
	private int dfee;
	private String receiver;
	private String zipcode;
	private String addr;
	private String tel;
	
	public OrderVO() {}
	

	
	
	
	
   

	public int getDfee() {
		return dfee;
	}

	public void setDfee(int dfee) {
		this.dfee = dfee;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

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








	@Override
	public String toString() {
		return "OrderVO [ocode=" + ocode + ", mno=" + mno + ", orderd8=" + orderd8 + ", oprice=" + oprice + ", memo="
				+ memo + ", discount=" + discount + ", point=" + point + ", dfee=" + dfee + ", receiver=" + receiver
				+ ", zipcode=" + zipcode + ", addr=" + addr + ", tel=" + tel + "]";
	}

	
	
	
	
}
