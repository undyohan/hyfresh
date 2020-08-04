package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.AddressVO;
import com.myweb.domain.CartVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.OrderDetailVO;
import com.myweb.domain.OrderListVO;
import com.myweb.domain.OrderVO;

public interface OrderCartDAO {
	
	/* 장바구니 */
		
		// 장바구니 상품 수
		public int getCartQt(String email,String guestID);
		// 장바구니 목록
		public List<CartVO> listCart(Criterion cri, String email,String GuestID);
		// 장바구니 추가
		public int addCart(CartVO cvo);
		//장바구니 품목 중복확인
		public int chkCart(CartVO cvo);
		//중복상품일시 수량증가
		public int addCartQt(CartVO cvo);
		// 장바구니 수량 수정
		public int modCartQt(CartVO cvo);
		//장바구니 배송일변경
		public int modDate(CartVO cvo);
		//수량 수정시 재고 파악
		public int stockChk (int pno);
		// 장바구니 삭제
		public int deleteCart(CartVO cvo);
		
	/* 주문하기 */
		
		//장바구니 => 주문하기
		public CartVO basketOrder(CartVO cvo);
		//주문 정보
		public OrderVO orderInfo(String ocode);
		// 주문 리스트
		public List<OrderListVO> listOrder(int mno,Criterion cri,String month,int status);
		//주문갯수 
		public int totalCount (int mno,Criterion cri,String month,int status);
		// 주문하기
		public int insertOrder(OrderVO ovo);
		//주문내역 삭제
		
		//주문하면 상품판매갯수증가/ 재고감소
		public int sellCount (int qt,int pno);
		
		//적립금
		public int point (int point,int oprice,int mno);
		public int showPoint (int mno);
		
		//주소가져오기
		public AddressVO getAddress(int addrno);
		
		//배송지 변경
		public int modPlace(OrderListVO ovo);
		
		
	/* 주문상세 */
		
		//주문상세 추가
		public int insertOrder_Detail(OrderDetailVO odvo);
		//주문상세보기 (+관리자)
		public List<OrderListVO> OrderDetail(OrderListVO ovo);
		
		//주문 상태변경 (+관리자)
		public int modStatus (OrderDetailVO odvo);

		
	/* 관리자 메뉴 */	
		
		//모든 주문 보기
		public List<OrderListVO> All_listOrder (Criterion cri,String month);
		//상태별 주문보기
		public List<OrderListVO> status_listOrder (int status,Criterion cri,String month);
		
		
		
		
		
}
