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
import com.myweb.domain.PQuestionVO;
import com.myweb.domain.QuestionVO;

@Repository
public class PQuestionDAOImpl implements PQuestionDAO{
	private static Logger logger = LoggerFactory.getLogger(PQuestionDAOImpl.class);
	private static String ns="PQuestionMapper.";
	
	@Inject
	SqlSession sql;

	@Override
	public int insertPQuestion(PQuestionVO pqvo) {
		return sql.insert(ns+"write", pqvo);
	}

	@Override
	public List<PQuestionVO> selectList(Criterion cri, int pno) {
		Map<String, Object> map= new HashMap<>();
		map.put("cri", cri);
		map.put("pno", pno);
		return sql.selectList(ns+"list", map);
	}
	
	@Override
	public PQuestionVO selectPQuestion(int pqno) {
		return sql.selectOne(ns+"detail", pqno);
	}

	@Override
	public int deletePQuestion(int pqno) {
		return sql.delete(ns+"remove", pqno);
	}

	@Override
	public int selectTotal(int pno) {
		return sql.selectOne(ns+"total", pno);
	}

	@Override
	public List<PQuestionVO> selectsList() {
		return sql.selectList(ns+"slist");
	}
	
}
