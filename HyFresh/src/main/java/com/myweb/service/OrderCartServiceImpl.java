package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.AddressVO;
import com.myweb.domain.CartVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.OrderDetailVO;
import com.myweb.domain.OrderListVO;
import com.myweb.domain.OrderVO;
import com.myweb.domain.ProductVO;
import com.myweb.persistence.OrderCartDAO;
@Service
public class OrderCartServiceImpl implements OrderCartService{
	private static Logger log = LoggerFactory.getLogger(OrderCartServiceImpl.class);

	@Inject
	OrderCartDAO ocdao;
	
	/* 장바구니 */
	
	// 장바구니 상품 수
	@Override
	public int getCartQt(String email,String guestID) {
		return ocdao.getCartQt(email,guestID);
	}
	
	@Override
	public List<CartVO> listCart(Criterion cri, String email,String GuestID) {
		return ocdao.listCart(cri, email,GuestID);
	}
	
	//중복되는 상품있는지 체크 후 장바구니넣기
	@Override
	public int addCart(CartVO cvo) {
		int chk=ocdao.chkCart(cvo);
		if (chk>0) {
			return ocdao.addCartQt(cvo);
		}else {
			return ocdao.addCart(cvo);
		}
	}
	
	//재고보다 수량 많이못하게 체크
	@Override
	public int modCartQt(CartVO cvo) {
		int stock=ocdao.stockChk(cvo.getPno());
		if(cvo.getQt()>stock) {
		return 0;	
		}else {
		return ocdao.modCartQt(cvo);
		}
	}
	
	
	@Override
	public int modDate(CartVO cvo) {
		return ocdao.modDate(cvo);
	}

	@Override
	public int deleteCart(CartVO cvo) {
		return ocdao.deleteCart(cvo);
	}

	
	/* 주문하기 */
	
	@Override
	public CartVO cartOrder(CartVO cvo) {
		return ocdao.basketOrder(cvo);
	}
	
	@Override
	public OrderVO orderInfo(String ocode) {
		return ocdao.orderInfo(ocode);
	}
	
	
	@Override
	public List<OrderListVO> listOrder(int mno,Criterion cri,String month,int status) {
		return ocdao.listOrder(mno,cri,month,status);
	}
	
	@Override
	public int totalCount(int mno,Criterion cri,String month,int status) {
		return ocdao.totalCount(mno,cri,month,status);
	}
	
	
	@Override
	public int insertOrder(OrderVO ovo) {
		return ocdao.insertOrder(ovo);
	}
	
	
	@Override
	public int sellCount(int qt, int pno) {
		return ocdao.sellCount(qt, pno);
	}
	
	@Override
	public int point(int point ,int oprice, int mno) {
		return ocdao.point(point,oprice, mno);
	}
	
	@Override
	public int showPoint(int mno) {
		return ocdao.showPoint(mno);
	}

	@Override
	public AddressVO getAddress(int addrno) {
		return ocdao.getAddress(addrno);
	}

	
	@Override
	public int modPlace(OrderListVO ovo) {
		return ocdao.modPlace(ovo);
	}

	
	
	@Override
	public int modifyOrder(OrderVO ovo, int status) {
		return 0;
	}

	/* 주문 상세 */
	
	@Override
	public int insertOrder_Detail(OrderDetailVO odvo) {
		return ocdao.insertOrder_Detail(odvo);
	}


	@Override
	public List<OrderListVO> orderDetail(OrderListVO ovo) {
		return ocdao.OrderDetail(ovo);
	}

	@Override
	public int modStatus(OrderDetailVO odvo) {
		return ocdao.modStatus(odvo);
	}
	

	

	/* 관리자 */
	
	@Override
	public List<OrderListVO> All_listOrder(Criterion cri, String month) {
		return ocdao.All_listOrder(cri, month);
	}

	@Override
	public List<OrderListVO> status_listOrder(int status, Criterion cri, String month) {
		return ocdao.status_listOrder(status, cri, month);
	}


	


	


	

	

	

	
	
	
}
