package com.myweb.domain;

public class AddrVO {
	private int addrno;
	private int mno;
	private String addrname;
	private String receiver;
	private String addr;
	private String tel;
	
	public AddrVO() {}

	// list
	public AddrVO(int mno) {
		this.mno = mno;
	}

	// mno, addrno
	public AddrVO(int addrno, int mno) {
		this.addrno = addrno;
		this.mno = mno;
	}

	// update
	public AddrVO(int addrno, int mno, String addrname, String receiver, String addr, String tel) {
		this.addrno = addrno;
		this.mno = mno;
		this.addrname = addrname;
		this.receiver = receiver;
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