package com.myweb.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.Criterion;
import com.myweb.domain.PQuestionDTO;
import com.myweb.domain.PQuestionVO;
import com.myweb.domain.QuestionVO;

public interface PQuestionService {
	public int regist(PQuestionVO pqvo);
	public PQuestionVO getPQuestion(int pqno);
	public PQuestionDTO getlist(Criterion cri, int pno);
	public List<PQuestionVO> getsList();
	public int remove(int pqno);
}
