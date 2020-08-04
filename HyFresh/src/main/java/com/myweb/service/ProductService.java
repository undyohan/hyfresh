package com.myweb.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.CartVO;
import com.myweb.domain.CategoryVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.CustomDTO;
import com.myweb.domain.OrderVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.ReviewDTO;
import com.myweb.domain.ReviewVO;

public interface ProductService {
   // 상품 목록 - 베스트상품, 상품목록, 맞춤상품, 알뜰쇼핑 예) 알뜰상품일 경우, String where = "discount > 0";
   public List<ProductVO> getList(Criterion cri, String where); // where는 조건문
   // 리뷰 목록
   public ReviewDTO listReview(Criterion cri, int pno);
   // 상품 목록 - 신제품
   public Object getNewList(Criterion cri, String where);
   // 리뷰 추가
   public int addReview(ReviewVO rvo);
   // 리뷰 수정
   public int modifyReview(ReviewVO rvo);
   // 리뷰 삭제
   public int deleteReview(int rno);
   // 상품 상세정보
   public ProductVO getProduct(int pno);
   // 상품 리뷰 평균
   public ReviewVO getStar(int pno);
   // 카테고리 리스트 불러오기
   public List<CategoryVO> getCateList();
   // 비슷한 상품 리스트 불러오기
   public List<ProductVO> getSameList(Criterion cri, String where, int pno);
   // Custom 상품 리스트 불러오기
   public CustomDTO getCustomList(Criterion cri, String where1, String where2, int pno);

   // 페이지 수량 체크 - 해당하는 db 이름을 넣어주어서 보냄 예) 리뷰 목록에 사용시 String db = "tbl_review";
   public int getTotalCount(String count, String db, String where);

   // 장바구니 목록
   public List<ProductVO> listCart(Criterion cri, int mno);
   // 장바구니 추가
   public int addCart(CartVO cvo);
   // 장바구니 수정
   public int modifyCart(CartVO cvo);
   // 장바구니 삭제
   public int deleteCart(CartVO cvo);
   // 주문 리스트
   public List<OrderVO> listOrder(int mno);
   // 주문하기
   public int insertOrder(OrderVO ovo);
   // 주문 수정 - 예) 취소시 status = -1; 배송 시작 status = 1; 
   public int modifyOrder(OrderVO ovo, int status);
   // 검색 리스트
   public List<ProductVO> getSList(Criterion cri, String where);
}