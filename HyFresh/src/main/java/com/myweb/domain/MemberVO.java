package com.myweb.domain;

import java.util.Date;

public class MemberVO {
	private int mno;
	private String email;
	private String pwd;
	private String name;
	private String home;
	private int addrno;
	private String tel;
	private String birth;
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
	public MemberVO(String pwd, String name, String home, int addrno, String tel, String birth) {
		this.pwd = pwd;
		this.name = name;
		this.home = home;
		this.addrno = addrno;
		this.tel = tel;
		this.birth = birth;
	}
	
	// 기본배송지 설정
	public MemberVO(int mno, int addrno) {
		this.mno = mno;
		this.addrno = addrno;
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
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
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
