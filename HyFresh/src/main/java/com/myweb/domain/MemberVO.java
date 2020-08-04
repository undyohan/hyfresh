package com.myweb.domain;

import java.util.Date;

public class MemberVO {
	private int mno;
	private String email;
	private String pwd;
	private String name;
	private String zipcode;
	private String home;
	// 기본 배송지 주소 번호
	private int addrno;
	private String tel;
	private String birth;
	private int grade;
	private Date regd8;
	private int point;
	// 기본 배송지 주소(tbl_address에서 가져온 addr값)
	private String addr;
	
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
	
	// 회원 정보 수정
	public MemberVO(int mno, int addrno, String zipcode, String home, String tel, String birth, int grade, int point) {
		this.mno = mno;
		this.addrno = addrno;
		this.zipcode = zipcode;
		this.home = home;
		this.tel = tel;
		this.birth = birth;
		this.grade = grade;
		this.point = point;
	}
	
	// 비밀번호 변경
	public MemberVO(int mno, String pwd) {
		this.mno = mno;
		this.pwd = pwd;
	}
	
	// 본인 정보 수정
	public MemberVO(String pwd, String name, String zipcode, String home, int addrno, String tel, String birth) {
		this.pwd = pwd;
		this.name = name;
		this.zipcode = zipcode;
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
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
}
