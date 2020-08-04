package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.PAnswerVO;
import com.myweb.persistence.PAnswerDAO;

@Service
public class PAnswerServiceImpl implements PAnswerService{
	private static Logger logger = LoggerFactory.getLogger(PAnswerServiceImpl.class);
	
	@Inject
	PAnswerDAO padao;

	@Override
	public int regist(PAnswerVO pavo) {
		return padao.insertPAnswer(pavo);
	}

	@Override
	public List<PAnswerVO> getlist(int pqno) {
		return padao.selectList(pqno);
	}

	@Override
	public int remove(int pano) {
		return padao.deletePAnswer(pano);
	}
}
