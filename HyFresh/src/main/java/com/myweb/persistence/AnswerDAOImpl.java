package com.myweb.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.AnswerVO;

@Repository
public class AnswerDAOImpl implements AnswerDAO{
	private static Logger logger = LoggerFactory.getLogger(AnswerDAOImpl.class);
	private static String ns="AnswerMapper.";
	
	@Inject
	SqlSession sql;

	@Override
	public int insertAnswer(AnswerVO avo) {
		return sql.insert(ns+"write", avo);
	}

	@Override
	public List<AnswerVO> selectList(int qno) {
		return sql.selectList(ns+"list", qno);
	}

	@Override
	public int deleteAnswer(int ano) {
		return sql.delete(ns+"remove", ano);
	}
}
