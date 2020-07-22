package com.myweb.service;

import java.util.List;

import com.myweb.domain.CategoryVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.domain.OrderVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.TagVO;

public interface AdminService {
	// 회원리스트
	public List<MemberVO> getListMember(Criterion cri);
	// 탈퇴 회원리스트
	public List<MemberVO> getListResignM(Criterion cri);
	// 회원수정
	public int modifyMember(MemberVO mvo); 
	// 회원탈퇴
	public int resignMember(int mno);
	// 회원 영구 삭제
	public int deleteMember(int mno);
	// 상품등록
	public int registProduct(ProductVO pvo);
	// 상품수정
	public int modifyProduct(ProductVO pvo); 
	// 상품삭제
	public int removeProduct(int pno); 
	// 상품리스트
	public List<ProductVO> getListProduct(Criterion cri);
	// 상품상세정보
	public ProductVO getProduct(int pno); 
	// 총 회원 수
	public int getTotalMCount(Criterion cri);
	// 총 탈퇴 회원 수
	public int getTotalResignCount(Criterion cri);
	// 총 상품 수
	public int getTotalPCount(Criterion cri);
	// 상품태그 관리
	public List<TagVO> getTagList(Criterion cri);
	// 카테고리 등록
	public int addCategory(CategoryVO catevo);
	// 카테고리 리스트
	public List<CategoryVO> getCateList();
	// 카테고리 디테일
	public CategoryVO getCateDetail(int cateno);
	// 카테고리 수정
	public int modifyCate(CategoryVO catevo);
	// 카테고리 삭제
	public int removeCate(int cateno);
	// 판매통계(총 주문 수, 판매총액)
	public int getOrderCount();
	// 판매통계(판매총액)
	public int getOrderSale();
	
	
}
