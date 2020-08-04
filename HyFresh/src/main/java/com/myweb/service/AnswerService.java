package com.myweb.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.AnswerVO;

public interface AnswerService {
		public int regist(AnswerVO avo);
		public List<AnswerVO> getlist(int qno);
		public int remove(int ano);
}
