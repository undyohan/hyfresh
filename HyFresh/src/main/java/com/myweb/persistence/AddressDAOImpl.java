package com.myweb.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.AddressVO;
import com.myweb.domain.MemberVO;

@Repository
public class AddressDAOImpl implements AddressDAO{
	private static Logger log = LoggerFactory.getLogger(AddressDAOImpl.class);
	private static String ns = "AddressMapper.";
	
	@Inject
	SqlSession sql;

	@Override
	public int insertAddr(AddressVO avo) {
		return sql.insert(ns+"add", avo);
	}

	@Override
	public int insertFirstAddr(MemberVO mvo) {
		return sql.insert(ns+"firstadd", mvo);
	}
	
	@Override
	public List<AddressVO> selectList(int mno) {
		return sql.selectList(ns+"alist", mno);
	}

	@Override
	public int updateAddr(AddressVO avo) {
		return sql.update(ns+"modify", avo);
	}

	@Override
	public int deleteAddr(AddressVO avo) {
		return sql.delete(ns+"remove", avo);
	}

	@Override
	public int selectOne(AddressVO avo) {
		return sql.selectOne(ns+"selectOne", avo);
	}

}
