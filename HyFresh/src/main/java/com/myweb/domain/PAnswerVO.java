package com.myweb.domain;

import java.sql.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PAnswerVO {
	private static Logger logger = LoggerFactory.getLogger(PAnswerVO.class);
	private int pano;
	private int pqno;
  private String writer;
	private String content;
	private Date regd8;
	
	public PAnswerVO() {}

	//write
	public PAnswerVO(int pqno, String writer, String content) {
		this.pqno = pqno;
		this.writer = writer;
		this.content = content;
	}


//list
	public PAnswerVO(int pano, int pqno, String writer, String content) {
		this.pano = pano;
		this.pqno = pqno;
		this.writer = writer;
		this.content = content;
	}

	public static Logger getLogger() {
		return logger;
	}

	public static void setLogger(Logger logger) {
		PAnswerVO.logger = logger;
	}

	public int getPano() {
		return pano;
	}

	public void setPano(int pano) {
		this.pano = pano;
	}

	public int getPqno() {
		return pqno;
	}

	public void setPqno(int pqno) {
		this.pqno = pqno;
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
