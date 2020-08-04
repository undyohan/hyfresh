package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.Criterion;
import com.myweb.domain.PQuestionDTO;
import com.myweb.domain.PQuestionVO;
import com.myweb.persistence.PQuestionDAO;

@Service
public class PQuestionServiceImpl implements PQuestionService{
	private static Logger logger = LoggerFactory.getLogger(PQuestionServiceImpl.class);

	@Inject
	PQuestionDAO pqdao;

	@Override
	public int regist(PQuestionVO pqvo) {
		return pqdao.insertPQuestion(pqvo);
	}

	@Override
	public PQuestionVO getPQuestion(int pqno) {
		return pqdao.selectPQuestion(pqno);
	}

	@Override
	public PQuestionDTO getlist(Criterion cri, int pno) {
		List<PQuestionVO>list=pqdao.selectList(cri, pno);
		int pqCnt=pqdao.selectTotal(pno);
		PQuestionDTO pqdto=new PQuestionDTO(pqCnt, list);
		return pqdto;
	}

	@Override
	public int remove(int pqno) {
		return pqdao.deletePQuestion(pqno);
	}

	@Override
	public List<PQuestionVO> getsList() {
		return pqdao.selectsList();
	}


	
}
