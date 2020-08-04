package com.myweb.domain;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AnswerVO {
	private static Logger logger = LoggerFactory.getLogger(AnswerVO.class);
	private int ano;
	private int qno;
	private String writer;
	private String content;
	private Date regd8;
	
	public AnswerVO() {}
	
	//write
	public AnswerVO(int qno, String writer, String content) {
		this.qno = qno;
		this.writer = writer;
		this.content = content;
	}

	public static Logger getLogger() {
		return logger;
	}

	public static void setLogger(Logger logger) {
		AnswerVO.logger = logger;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegd8() {
		return regd8;
	}
	public void setRegd8(Date regd8) {
		this.regd8 = regd8;
	}
	
}
