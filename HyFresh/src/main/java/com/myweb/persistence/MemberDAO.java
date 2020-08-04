package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.domain.ReviewVO;

public interface MemberDAO {
	public int insertMember(MemberVO mvo);//join
	public int selectEmail(String email);//checkEmail
	public MemberVO selectMember(MemberVO mvo);//login
	public List<MemberVO> selectList(Criterion cri);
	public MemberVO selectInfo(int mno);
	public int updateMember(MemberVO mvo);
	public int deleteMember(int mno);
	public int selectTotalCount(Criterion cri);
	public int updateAddrno(MemberVO mvo);
	public int checkPwd(MemberVO mvo);
	public int updatePwd(MemberVO newMvo);

	/********************************************************************
	1. Title: MemberDAO

	2. Author: 이준우

	3. Revision history
	 2020-07-29 16:11  이준우 리뷰 작성 추가
	 2020-07-29 19:26 이준우 리뷰 상태 갱신

	*****************************************************************/
	// 리뷰 작성
	public void insertReview(ReviewVO rvo);
	// 리뷰 작성 후 orderDetail 갱신 
	public void checkReview(int odno);
	public int getStatusCount(String where);
	public int getStatusCount(int status);
}
