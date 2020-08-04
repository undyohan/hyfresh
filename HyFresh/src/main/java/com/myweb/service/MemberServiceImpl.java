package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.domain.ReviewVO;
import com.myweb.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	private static Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Inject
	MemberDAO mdao;
	
	@Override
	public int register(MemberVO mvo) {
		return mdao.insertMember(mvo);
	}

	@Override
	public int checkDuple(String email) {
		return mdao.selectEmail(email);
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		return mdao.selectMember(mvo);
	}

	@Override
	public List<MemberVO> getList(Criterion cri) {
		return mdao.selectList(cri);
	}

	@Override
	public MemberVO getInfo(int mno) {
		return mdao.selectInfo(mno);
	}

	@Override
	public int modify(MemberVO mvo) {
		return mdao.updateMember(mvo);
	}

	@Override
	public int updateResign(int mno) {
		return mdao.deleteMember(mno);
	}

	@Override
	public int getTotalCount(Criterion cri) {
		return mdao.selectTotalCount(cri);
	}

	@Override
	public int chooseaddr(MemberVO mvo) {
		return mdao.updateAddrno(mvo);
	}
	
	@Override
	public int checkPwd(MemberVO mvo) {
		return mdao.checkPwd(mvo);
	}

	@Override
	public int modifyPwd(MemberVO newMvo) {
		return mdao.updatePwd(newMvo);
	}
	
	/********************************************************************
	1. Title: MemberServiceImpl

	2. Author: 이준우

	3. Revision history
	 2020-07-29 16:11  이준우 리뷰 작성 추가
	 2020-07-29 19:26 이준우 리뷰 상태 갱신

	*****************************************************************/
	// 리뷰 작성
	@Override
	public void insertReview(ReviewVO rvo, int odno) {
		mdao.insertReview(rvo);
		mdao.checkReview(odno);
	}
	
	@Override
	public int getStatusCount(int mno, int status) {
		return mdao.getStatusCount("where mno = '" + mno + "' and status = '" + status + "'");
	}

	@Override
	public int getStatusCount(int status) {
		return mdao.getStatusCount(status);
	}
}
