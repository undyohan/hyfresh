package com.myweb.domain;

public class CategoryVO {
	private int cateno;
	private String catename;
	private int catecode;
	private String iconfile;
	private int old_cateno;
	
	public CategoryVO() {
	}

	public CategoryVO(int cateno, String catename, int catecode, String iconfile) {
		this.cateno = cateno;
		this.catename = catename;
		this.catecode = catecode;
		this.iconfile = iconfile;
	}
	
	public CategoryVO(int cateno, String catename, int catecode, String iconfile, int old_cateno) {
		this.cateno = cateno;
		this.catename = catename;
		this.catecode = catecode;
		this.iconfile = iconfile;
		this.old_cateno = old_cateno;
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
	public int getOld_cateno() {
		return old_cateno;
	}

	public void setOld_cateno(int old_cateno) {
		this.old_cateno = old_cateno;
	}
	
}
