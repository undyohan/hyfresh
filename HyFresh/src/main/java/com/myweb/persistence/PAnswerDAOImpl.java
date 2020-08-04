package com.myweb.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.PAnswerVO;

@Repository
public class PAnswerDAOImpl implements PAnswerDAO{
	private static Logger logger = LoggerFactory.getLogger(PAnswerDAOImpl.class);
	private static String ns="PAnswerMapper.";
	
	@Inject
	SqlSession sql;

	@Override
	public int insertPAnswer(PAnswerVO pavo) {
		return sql.insert(ns+"write", pavo);
	}

	@Override
	public List<PAnswerVO> selectList(int pqno) {
		return sql.selectList(ns+"list", pqno);
	}

	@Override
	public int deletePAnswer(int pano) {
		return sql.delete(ns+"remove", pano);
	}
	
	
}
