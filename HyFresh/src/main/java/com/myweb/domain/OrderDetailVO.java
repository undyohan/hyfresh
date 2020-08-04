package com.myweb.domain;

import java.util.Date;


public class OrderDetailVO {
	private int odno;
	private String ocode;
	private int pno;
	private int rno;
	private String pname;
	private int price;
	private int mno;	
	private int qt;
	private int status;
	private String deliverd8;
	private String sendd8;
	private int dfee;
	
	public OrderDetailVO() {}

	public int getOdno() {
		return odno;
	}
	public int getDfee() {
		return dfee;
	}
	public void setDfee(int dfee) {
		this.dfee = dfee;
	}
	public void setOdno(int odno) {
		this.odno = odno;
	}
	public String getOcode() {
		return ocode;
	}
	public void setOcode(String ocode) {
		this.ocode = ocode;
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

	@Override
	public String toString() {
		return "OrderDetailVO [odno=" + odno + ", ocode=" + ocode + ", pno=" + pno + ", pname=" + pname + ", price="
				+ price + ", mno=" + mno + ", qt=" + qt + ", status=" + status + ", deliverd8=" + deliverd8
				+ ", sendd8=" + sendd8 + ", dfee=" + dfee + "]";
	}
}
