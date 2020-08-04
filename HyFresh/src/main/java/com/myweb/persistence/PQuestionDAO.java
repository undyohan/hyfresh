package com.myweb.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.Criterion;
import com.myweb.domain.PQuestionVO;
import com.myweb.domain.QuestionVO;

public interface PQuestionDAO {
	public int insertPQuestion(PQuestionVO pqvo);
	public List<PQuestionVO> selectList(Criterion cri, int pno);
	public List<PQuestionVO> selectsList();
	public PQuestionVO selectPQuestion(int pqno);
	public int deletePQuestion(int pqno);
	public int selectTotal(int pno);
}
