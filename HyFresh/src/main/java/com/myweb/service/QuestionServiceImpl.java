package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.Criterion;
import com.myweb.domain.QuestionVO;
import com.myweb.persistence.QuestionDAO;

@Service
public class QuestionServiceImpl implements QuestionService{
	private static Logger logger = LoggerFactory.getLogger(QuestionServiceImpl.class);

	@Inject
	QuestionDAO qdao;

	@Override
	public int regist(QuestionVO qvo) {
		return qdao.insertQuestion(qvo);
	}

	@Override
	public List<QuestionVO> getList(Criterion cri) {
		return qdao.selectList(cri);
	}

	@Override
	public QuestionVO getQuestion(int qno) {
		return qdao.selectQuestion(qno);
	}

	@Override
	public int remove(int qno) {
		return qdao.deleteQuestion(qno);
	}

	@Override
	public int getTotalCount() {
		return qdao.selectTotalCount();
	}

	@Override
	public List<QuestionVO> getsList() {
		return qdao.selectsList();
	}


}
