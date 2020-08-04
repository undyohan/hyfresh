package com.myweb.domain;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ReviewDTO {
	private int rvwCnt;	// 리뷰 총 갯수
	private List<ReviewVO> rlist;	// 데이터베이스에서 가져온 리뷰 리스트
	
	public ReviewDTO() {}
	public ReviewDTO(int rvwCnt, List<ReviewVO> rlist) {
		this.rvwCnt = rvwCnt;
		this.rlist = rlist;
	}
	
	public int getRvwCnt() {
		return rvwCnt;
	}
	public void setRvwCnt(int rvwCnt) {
		this.rvwCnt = rvwCnt;
	}
	public List<ReviewVO> getRlist() {
		return rlist;
	}
	public void setRlist(List<ReviewVO> rlist) {
		this.rlist = rlist;
	}
}
