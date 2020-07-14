package com.myweb.domain;

public class Criterion {
	private int amount;
	private int pageNum;
	private String type;
	private String keyword;
	
	public Criterion() {
		this(10,1);
	}
	public Criterion(int amount, int pageNum) {
		this.amount = amount;
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
