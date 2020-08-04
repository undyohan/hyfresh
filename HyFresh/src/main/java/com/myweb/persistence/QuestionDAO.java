package com.myweb.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.Criterion;
import com.myweb.domain.QuestionVO;

public interface QuestionDAO {
	public int insertQuestion(QuestionVO qvo);
	public List<QuestionVO> selectList(Criterion cri);
	public List<QuestionVO> selectsList();
	public QuestionVO selectQuestion(int qno);
	public int deleteQuestion(int qno);
	public int selectTotalCount();
}
