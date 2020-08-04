package com.myweb.domain;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class QuestionVO {
	private static Logger logger = LoggerFactory.getLogger(QuestionVO.class);
	private int qno;
	private String writer;
	private String title;
	private String content;
	private String img;
	private Date regd8;

	public QuestionVO() {}

	// insert
	public QuestionVO(String title, String writer, String content, String img) {
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.img = img;
	}

	// list
	public QuestionVO(int qno, String title, String writer) {
		this.qno = qno;
		this.title = title;
		this.writer = writer;
	}

	// update
	public QuestionVO(int qno, String title, String writer, String content, String img) {
		this.qno = qno;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.img = img;
	}

	public static Logger getLogger() {
		return logger;
	}

	public static void setLogger(Logger logger) {
		QuestionVO.logger = logger;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
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

}
