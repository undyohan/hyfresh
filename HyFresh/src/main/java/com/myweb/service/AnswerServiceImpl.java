package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.AnswerVO;
import com.myweb.persistence.AnswerDAO;

@Service
public class AnswerServiceImpl implements AnswerService {
	private static Logger logger = LoggerFactory.getLogger(AnswerServiceImpl.class);

	@Inject
	AnswerDAO adao;

	@Override
	public int regist(AnswerVO avo) {
		return adao.insertAnswer(avo);
	}

	@Override
	public List<AnswerVO> getlist(int qno) {
		return adao.selectList(qno);
	}

	@Override
	public int remove(int ano) {
		return adao.deleteAnswer(ano);
	}

}
