package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.CategoryVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.domain.OrderDetailVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.ReviewVO;
import com.myweb.domain.TagVO;

public interface AdminDAO {
	public List<MemberVO> selectMList(Criterion cri);
	public List<MemberVO> selectManagerList(Criterion cri);
	public List<MemberVO> selectResignMList(Criterion cri);
	public int updateMember(MemberVO mvo);
	public int resignMember(int mno);
	public int deleteMember(int mno);
	public int selectTotalMCount(Criterion cri);
	public int selectTotalManagerCount(Criterion cri);
	public int selectTotalResignCount(Criterion cri);
	public int selectTotalPCount(Criterion cri);
	public List<TagVO> selectTagList(Criterion cri);
	public int insertCategory(CategoryVO catevo);
	public List<CategoryVO> selectCateList(Criterion cri);
	public CategoryVO selectCateDetail(int cateno);
	public int updateCategory(CategoryVO catevo);
	public int deleteCategory(int cateno);
	public int selectOrderCount();
	public int selectOrderSale();
	public int updateAddr(String addr, int addrno);
	
	/********************************************************************
	1. Title: AdminDAO

	2. Author: 이준우

	3. Revision history
	 2020-07-29 14:26  이준우 최초 정리

	*****************************************************************/
	// 제품 등록
	public int insertProduct(ProductVO pvo);
	// 제품 수정
	public int updateProduct(ProductVO pvo);
	// 제품 제거
	public int deleteProduct(int pno);
	// 제품 목록
	public List<ProductVO> selectPList(Criterion cri);
	// 제품 상세정보
	public ProductVO selectProduct(int pno);
	// 태그 추가
	public void insertTag(String tname);
	// 특정 태그 검색
	public int selectTag(String tname);
	// TNO 검색
	public int getTno(String tname);
	// 태그 삭제 - X
	public void deleteTag();
	// 리뷰 리스트 출력
	public List<ReviewVO> getrList(Criterion cri, String where);
	// 상태별 주문리스트
	public List<OrderDetailVO> getOrderListStatus(Criterion cri, int status);
}
