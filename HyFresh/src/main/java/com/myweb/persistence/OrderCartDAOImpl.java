package com.myweb.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.AddressVO;
import com.myweb.domain.CartVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.OrderDetailVO;
import com.myweb.domain.OrderListVO;
import com.myweb.domain.OrderVO;
import com.myweb.domain.ProductVO;

@Repository
public class OrderCartDAOImpl implements OrderCartDAO{
	private static Logger log = LoggerFactory.getLogger(OrderCartDAOImpl.class);
	private static String namespace = "OrderCartMapper.";


	@Inject
	SqlSession sql;

	
	/* 카트 */
	
	@Override
	public int getCartQt(String email,String guestID) {
		Map<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("guest", guestID);
		return sql.selectOne(namespace+"getCartQt", map);
	}
	
	@Override
	public List<CartVO> listCart(Criterion cri, String email,String GuestID) {
		Map<String, Object> map = new HashMap<>();
		map.put("cri",cri);
		map.put("email", email);
		map.put("guest", GuestID);
		return sql.selectList(namespace+"listCart", map);
	}

	@Override
	public int addCart(CartVO cvo) {
		return sql.insert(namespace+"addCart", cvo);
	}

	@Override
	public int chkCart(CartVO cvo) {
		return sql.selectOne(namespace+"chkCart", cvo);
	}
	
	
	@Override
	public int addCartQt(CartVO cvo) {
		return sql.update(namespace+"addCartQt", cvo);
	}
	
	
	@Override
	public int modCartQt(CartVO cvo) {
		return sql.update(namespace+"modQt", cvo);
	}
	@Override
	public int stockChk(int pno) {
		return sql.selectOne(namespace+"stockChk", pno);
	}
	
	@Override
	public int modDate(CartVO cvo) {
		return sql.update(namespace+"modDate", cvo);
	}
	
	
	@Override
	public int deleteCart(CartVO cvo) {
		return sql.delete(namespace+"rmCart", cvo);
	}

	
	/* 주문  */
	
	@Override
	public CartVO basketOrder(CartVO cvo) {
		return sql.selectOne(namespace+"basketOrder", cvo);
	}
	
	
	@Override
	public OrderVO orderInfo(String ocode) {
		return sql.selectOne(namespace+"orderInfo", ocode);
	}
	
	
	@Override
	public List<OrderListVO> listOrder(int mno,Criterion cri,String month,int status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("mno", mno);
		map.put("cri", cri);
		map.put("month", month);
		return sql.selectList(namespace+"listOrder", map);
	}

	@Override
	public int totalCount(int mno,Criterion cri,String month,int status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("mno", mno);
		map.put("cri", cri);
		map.put("month", month);
		return sql.selectOne(namespace+"totalCount", map);
	}
	
	
	@Override
	public int insertOrder(OrderVO ovo) {
		return sql.insert(namespace+"addOrder", ovo);
	}

	@Override
	public int sellCount(int qt, int pno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qt", qt);
		map.put("pno", pno);
		return sql.update(namespace+"sellCount", map);
	}
	
	@Override
	public int point(int point,int oprice, int mno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("point", point);
		map.put("oprice", oprice);
		map.put("mno", mno);
		return sql.update(namespace+"point", map);
	}
	
	@Override
	public int showPoint(int mno) {
		return sql.selectOne(namespace+"showPoint", mno);
	}
	
	@Override
	public AddressVO getAddress(int addrno) {
		return sql.selectOne(namespace+"getAddress", addrno);
	}
	
	@Override
	public int modPlace(OrderListVO ovo) {
		return sql.update(namespace+"modPlace", ovo);
	}
	
	
	/* 주문  상세  */
	
	@Override
	public int insertOrder_Detail(OrderDetailVO odvo) {
		return sql.insert(namespace+"addDetail", odvo);
	}

	@Override
	public List<OrderListVO> OrderDetail(OrderListVO ovo) {
		return sql.selectList(namespace+"listDetail", ovo);
	}

	@Override
	public int modStatus(OrderDetailVO odvo) {
		return sql.update(namespace+"modStatus", odvo);
	}
	
	

	
	
	/* 관리자 */
	
	@Override
	public List<OrderListVO> All_listOrder(Criterion cri, String month) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("month", month);
		
		return sql.selectList(namespace+"All_listOrder", map);
	}

	@Override
	public List<OrderListVO> status_listOrder(int status, Criterion cri, String month) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("cri", cri);
		map.put("month", month);
		return sql.selectList(namespace+"status_listOrder", map);
	}

	

	



}
