package com.myweb.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.Criterion;
import com.myweb.domain.QuestionVO;

public interface QuestionService {
	public int regist(QuestionVO qvo);// 일반문의 등록
	public List<QuestionVO> getList(Criterion cri);// 일반문의 리스트
	public List<QuestionVO> getsList();
	public QuestionVO getQuestion(int qno);// 일반문의 상세보기
	public int remove(int qno);// 일반문의 삭제
	public int getTotalCount();
}
