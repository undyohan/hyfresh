package com.myweb.domain;

public class CategoryVO {
	private int cateno;
	private String catename;
	private int catecode;
	private String iconfile;
	
	public CategoryVO() {
	}
	// 수정
	public CategoryVO(String catename, int catecode, String iconfile) {
		this.catename = catename;
		this.catecode = catecode;
		this.iconfile = iconfile;
	}
	// 등록
	public CategoryVO(int cateno, String catename, int catecode, String iconfile) {
		this.cateno = cateno;
		this.catename = catename;
		this.catecode = catecode;
		this.iconfile = iconfile;
	}

	public int getCateno() {
		return cateno;
	}
	public void setCateno(int cateno) {
		this.cateno = cateno;
	}
	public String getCatename() {
		return catename;
	}
	public void setCatename(String catename) {
		this.catename = catename;
	}
	public int getCatecode() {
		return catecode;
	}
	public void setCatecode(int catecode) {
		this.catecode = catecode;
	}
	public String getIconfile() {
		return iconfile;
	}
	public void setIconfile(String iconfile) {
		this.iconfile = iconfile;
	}
	
}
