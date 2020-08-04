package com.myweb.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.Criterion;
import com.myweb.domain.QuestionVO;

@Repository
public class QuestionDAOImpl implements QuestionDAO{
	private static Logger logger = LoggerFactory.getLogger(QuestionDAOImpl.class);
	private static String ns="QuestionMapper.";
	
	@Inject
	SqlSession sql;

	@Override
	public int insertQuestion(QuestionVO qvo) {
		return sql.insert(ns+"write", qvo);
	}

	@Override
	public List<QuestionVO> selectList(Criterion cri) {
		return sql.selectList(ns+"list", cri);
	}

	@Override
	public QuestionVO selectQuestion(int qno) {
		return sql.selectOne(ns+"detail", qno);
	}

	@Override
	public int deleteQuestion(int qno) {
		return sql.delete(ns+"remove", qno);
	}

	@Override
	public int selectTotalCount() {
		return sql.selectOne(ns+"totalCount");
	}

	@Override
	public List<QuestionVO> selectsList() {
		return sql.selectList(ns+"slist");
	}
	
	
}
