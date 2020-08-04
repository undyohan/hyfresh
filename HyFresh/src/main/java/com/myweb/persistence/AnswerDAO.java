package com.myweb.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.AnswerVO;

public interface AnswerDAO {
	public int insertAnswer(AnswerVO avo);
	public List<AnswerVO> selectList(int qno);
	public int deleteAnswer(int ano);
}
