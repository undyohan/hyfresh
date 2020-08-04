package com.myweb.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.domain.ReviewVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	private static Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);
	private static String ns = "MemberMapper.";
	
	@Inject
	SqlSession sql;

	@Override
	public int insertMember(MemberVO mvo) {
		return sql.insert(ns+"join", mvo);
	}

	@Override
	public int selectEmail(String email) {
		return sql.selectOne(ns+"check", email);
	}

	@Override
	public MemberVO selectMember(MemberVO mvo) {
		return sql.selectOne(ns+"login", mvo);
	}

	@Override
	public List<MemberVO> selectList(Criterion cri) {
		return sql.selectList(ns+"mlist", cri);
	}
	
	@Override
	public MemberVO selectInfo(int mno) {
		return sql.selectOne(ns+"mInfo", mno);
	}

	@Override
	public int updateMember(MemberVO mvo) {
		return sql.update(ns+"modify", mvo);
	}

	@Override
	public int deleteMember(int mno) {
		return sql.delete(ns+"resign", mno);
	}

	@Override
	public int selectTotalCount(Criterion cri) {
		return sql.selectOne(ns+"totalCount", cri);
	}

	@Override
	public int updateAddrno(MemberVO mvo) {
		return sql.update(ns+"updateAddrno", mvo);
	}

	@Override
	public int checkPwd(MemberVO mvo) {
		return sql.selectOne(ns+"checkPwd", mvo);
	}

	@Override
	public int updatePwd(MemberVO newMvo) {
		return sql.update(ns+"modifyPwd", newMvo);
	}
	
	/********************************************************************
	1. Title: MemberDAO

	2. Author: 이준우

	3. Revision history
	 2020-07-29 16:11  이준우 리뷰 작성 추가

	*****************************************************************/
	// 리뷰 작성
	@Override
	public void insertReview(ReviewVO rvo) {
		sql.insert(ns+"insertReview", rvo);
	}

	@Override
	public void checkReview(int odno) {
		sql.update(ns+"checkReview", odno);
	}
	
	@Override
	public int getStatusCount(String where) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("where", where);
		return sql.selectOne(ns+"getStatusCount", map);
	}

	@Override
	public int getStatusCount(int status) {
		return sql.selectOne(ns + "getStatusCountAll", status);
	}
}
