package com.myweb.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.PAnswerVO;

public interface PAnswerService {
	//상품문의댓글 등록(관리자만)
	public int regist(PAnswerVO pavo);
	//상품문의댓글 리스트
	public List<PAnswerVO> getlist(int pqno);
	//상품문의댓글 삭제(관리자만)
	public int remove(int pano);
}
