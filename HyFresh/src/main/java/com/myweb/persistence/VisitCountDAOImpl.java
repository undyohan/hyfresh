package com.myweb.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.VisitCountVO;

@Repository
public class VisitCountDAOImpl implements VisitCountDAO{
	private static Logger log = LoggerFactory.getLogger(VisitCountDAOImpl.class);
	private static String ns = "VisitCountMapper.";

	@Inject
	SqlSession sql;
	
	@Override
	public int insertVisitor(VisitCountVO vvo) {
		return sql.insert(ns + "insert",vvo);
	}
}
