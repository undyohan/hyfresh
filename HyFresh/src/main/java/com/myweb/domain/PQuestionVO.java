package com.myweb.domain;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PQuestionVO {
		private int pqno;
		private int pno;
		private String writer;
		private int isLock;
		private String title;
		private String content;
		private Date regd8;
		
		public PQuestionVO() {}

		//insert
		public PQuestionVO(int pno, String writer, int isLock, String title, String content) {
			this.pno = pno;
			this.writer = writer;
			this.isLock = isLock;
			this.title = title;
			this.content = content;
		}
		
		//list
		public PQuestionVO(int pqno, String writer, int isLock, String title) {
			this.pqno = pqno;
			this.writer = writer;
			this.isLock = isLock;
			this.title = title;
		}
		
		//detail
		public PQuestionVO(int pqno, int pno, String writer, int isLock, String title, String content) {
			this.pqno = pqno;
			this.pno = pno;
			this.writer = writer;
			this.isLock = isLock;
			this.title = title;
			this.content = content;
		}

		public int getPqno() {
			return pqno;
		}

		public void setPqno(int pqno) {
			this.pqno = pqno;
		}

		public int getPno() {
			return pno;
		}

		public void setPno(int pno) {
			this.pno = pno;
		}

		public String getWriter() {
			return writer;
		}

		public void setWriter(String writer) {
			this.writer = writer;
		}

		public int getIsLock() {
			return isLock;
		}

		public void setIsLock(int isLock) {
			this.isLock = isLock;
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

		public Date getRegd8() {
			return regd8;
		}

		public void setRegd8(Date regd8) {
			this.regd8 = regd8;
		}
		
		
	}

