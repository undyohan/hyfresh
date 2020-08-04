package com.myweb.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.PAnswerVO;

public interface PAnswerDAO {
	public int insertPAnswer(PAnswerVO pavo);
	public List<PAnswerVO> selectList(int pqno);
	public int deletePAnswer(int pano);
}
