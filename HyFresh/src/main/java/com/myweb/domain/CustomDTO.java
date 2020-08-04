package com.myweb.domain;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CustomDTO {
	private int customCnt;	// 리뷰 총 갯수
	private List<ProductVO> clist;	// 데이터베이스에서 가져온 리뷰 리스트
	
	public CustomDTO() {}
	public CustomDTO(int customCnt, List<ProductVO> clist) {
		this.customCnt = customCnt;
		this.clist = clist;
	}
	
	public int getcustomCnt() {
		return customCnt;
	}
	public void setcustomCnt(int customCnt) {
		this.customCnt = customCnt;
	}
	public List<ProductVO> getClist() {
		return clist;
	}
	public void setClist(List<ProductVO> clist) {
		this.clist = clist;
	}
}
