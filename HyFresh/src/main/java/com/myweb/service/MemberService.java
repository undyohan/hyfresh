package com.myweb.service;

import java.util.List;

import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.domain.ReviewVO;

public interface MemberService {
	public int register(MemberVO mvo);
	public int checkDuple(String email);
	public MemberVO login(MemberVO mvo);
	public List<MemberVO> getList(Criterion cri);
	public MemberVO getInfo(int mno);
	public int modify(MemberVO mvo);
	public int updateResign(int mno);
	public int getTotalCount(Criterion cri);
	public int chooseaddr(MemberVO mvo);
	public int checkPwd(MemberVO mvo);
	public int modifyPwd(MemberVO newMvo);
	
	/********************************************************************
	1. Title: MemberService

	2. Author: 이준우

	3. Revision history
	 2020-07-29 16:11  이준우 리뷰 작성 추가

	*****************************************************************/
	// 리뷰 작성
	public void insertReview(ReviewVO rvo, int odno);
	// 상태별 상품종류 수(개인)
	public int getStatusCount(int mno, int status);
	// 상태별 상품종류 수(관리자)
	public int getStatusCount(int status);
}
