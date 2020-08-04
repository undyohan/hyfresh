package com.myweb.domain;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class VisitCountVO {
	private static Logger log = LoggerFactory.getLogger(VisitCountVO.class);
	private int vno;
    private String ip;
    private Date visit_time;
    private String visit_refer;
    private String visit_agent;
    
    public VisitCountVO() {}

	public VisitCountVO(int vno, String ip, Date visit_time, String visit_refer, String visit_agent) {
		this.vno = vno;
		this.ip = ip;
		this.visit_time = visit_time;
		this.visit_refer = visit_refer;
		this.visit_agent = visit_agent;
	}

	public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		VisitCountVO.log = log;
	}

	public int getVno() {
		return vno;
	}

	public void setVno(int vno) {
		this.vno = vno;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getVisit_time() {
		return visit_time;
	}

	public void setVisit_time(Date visit_time) {
		this.visit_time = visit_time;
	}

	public String getVisit_refer() {
		return visit_refer;
	}

	public void setVisit_refer(String visit_refer) {
		this.visit_refer = visit_refer;
	}

	public String getVisit_agent() {
		return visit_agent;
	}

	public void setVisit_agent(String visit_agent) {
		this.visit_agent = visit_agent;
	}
}
