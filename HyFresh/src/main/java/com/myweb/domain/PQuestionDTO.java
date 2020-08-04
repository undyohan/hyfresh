package com.myweb.domain;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PQuestionDTO {
	private int pqCnt;//상품문의 총 갯수
	private List<PQuestionVO> pqlist;//데이터베이스에서 가져온 상품문의 리스트
	
	public PQuestionDTO() {}
	
	public PQuestionDTO(int pqCnt, List<PQuestionVO> pqlist) {
		this.pqCnt=pqCnt;
		this.pqlist=pqlist;
	}

	public int getPqCnt() {
		return pqCnt;
	}

	public void setPqCnt(int pqCnt) {
		this.pqCnt = pqCnt;
	}

	public List<PQuestionVO> getPqlist() {
		return pqlist;
	}

	public void setPqlist(List<PQuestionVO> pqlist) {
		this.pqlist = pqlist;
	}

	
}
