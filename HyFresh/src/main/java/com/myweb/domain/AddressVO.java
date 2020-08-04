package com.myweb.domain;

public class AddressVO {
	private int addrno;
	private int mno;
	private String addrname;
	private String receiver;
	private String zipcode;
	private String addr;
	private String tel;
	
	public AddressVO() {}

	// list
	public AddressVO(int mno) {
		this.mno = mno;
	}

	// mno, addrno
	public AddressVO(int addrno, int mno) {
		this.addrno = addrno;
		this.mno = mno;
	}

	// update
	public AddressVO(int addrno, int mno, String addrname, String receiver, String zipcode, String addr, String tel) {
		this.addrno = addrno;
		this.mno = mno;
		this.addrname = addrname;
		this.receiver = receiver;
		this.zipcode = zipcode;
		this.addr = addr;
		this.tel = tel;
	}

	public int getAddrno() {
		return addrno;
	}

	public void setAddrno(int addrno) {
		this.addrno = addrno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getAddrname() {
		return addrname;
	}

	public void setAddrname(String addrname) {
		this.addrname = addrname;
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
}