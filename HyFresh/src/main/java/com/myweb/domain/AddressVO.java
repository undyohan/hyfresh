package com.myweb.domain;

public class AddressVO {
	private int addrno;
	private int mno;
	private String addrname;
	private String receiver;
	private String addr;
	private String tel;
	
	public AddressVO() {
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
