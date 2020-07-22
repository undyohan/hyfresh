package com.myweb.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.AddrVO;
import com.myweb.domain.MemberVO;

@Repository
public class AddrDAOImpl implements AddrDAO{
	private static Logger log = LoggerFactory.getLogger(AddrDAOImpl.class);
	private static String ns = "AddrMapper.";
	
	@Inject
	SqlSession sql;

	@Override
	public int insertAddr(AddrVO avo) {
		return sql.insert(ns+"add", avo);
	}

	@Override
	public int insertFirstAddr(MemberVO mvo) {
		return sql.insert(ns+"firstadd", mvo);
	}
	
	@Override
	public List<AddrVO> selectList(int mno) {
		return sql.selectList(ns+"alist", mno);
	}

	@Override
	public int updateAddr(AddrVO avo) {
		return sql.update(ns+"modify", avo);
	}

	@Override
	public int deleteAddr(AddrVO avo) {
		return sql.delete(ns+"remove", avo);
	}

	@Override
	public int selectOne(AddrVO avo) {
		return sql.selectOne(ns+"selectOne", avo);
	}

}
