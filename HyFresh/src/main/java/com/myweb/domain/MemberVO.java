package com.myweb.domain;

import java.util.Date;

public class MemberVO {
	private int mno;
	private String email;
	private String pwd;
	private String name;
	private int addrno;
	private String tel;
	private Date birth;
	private int grade;
	private Date regd8;
	private int point;
	
	public MemberVO() {}
	
	// 회원가입
	public MemberVO(String email, String pwd, String name) {
		this.email = email;
		this.pwd = pwd;
		this.name = name;
	}
	
	// 로그인
	public MemberVO(String email, String pwd) {
		this.email = email;
		this.pwd = pwd;
	}
	
	// 수정
	public MemberVO(String pwd, String name, int addrno, String tel, Date birth) {
		this.pwd = pwd;
		this.name = name;
		this.addrno = addrno;
		this.tel = tel;
		this.birth = birth;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAddrno() {
		return addrno;
	}
	public void setAddrno(int addrno) {
		this.addrno = addrno;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Date getRegd8() {
		return regd8;
	}
	public void setRegd8(Date regd8) {
		this.regd8 = regd8;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
}
