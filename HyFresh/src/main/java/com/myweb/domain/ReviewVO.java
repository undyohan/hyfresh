package com.myweb.domain;

import java.util.Date;

public class ReviewVO {
	private int rno;
	private int pno;
	private double rate;
	private String writer;
	private String title;
	private String content;
	private String img;
	private Date regd8;
	private Date modd8;
	
	private int count;
	private double avg;
	
	public ReviewVO() { }
	public ReviewVO(int count, double avg) {
		this.count = count;
		this.avg = avg;
	}
	public ReviewVO(int rno, int pno, double rate, String writer, String title, String content, String img,
			Date regd8, Date modd8) {
		this.rno = rno;
		this.pno = pno;
		this.rate = rate;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.img = img;
		this.regd8 = regd8;
		this.modd8 = modd8;
	}

	public ReviewVO(int pno, int rate, String writer, String title, String content, String img) {
		this.pno = pno;
		this.rate = rate;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.img = img;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
}
