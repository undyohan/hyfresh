package com.myweb.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.CartVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.OrderVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.ReviewVO;
import com.myweb.service.ProductService;

@Repository
public class ProductDAOImpl implements ProductDAO {
	private static Logger log = LoggerFactory.getLogger(ProductDAOImpl.class);
	private static String namespace = "ProductMapper.";
	
	@Inject
	SqlSession sql;

	@Override
	public List<ProductVO> getList(Criterion cri, String where) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("where", where);
		return sql.selectList(namespace+"getList", map);
	}

	@Override
	public List<ReviewVO> listReview(int pno) {
		return sql.selectList(namespace+"listReview", pno);
	}

	@Override
	public int addReview(ReviewVO rvo) {
		return sql.insert(namespace+"addReview", rvo);
	}

	@Override
	public int modifyReview(ReviewVO rvo) {
		return sql.update(namespace+"modifyReview", rvo);
	}

	@Override
	public int deleteReview(ReviewVO rvo) {
		return sql.delete(namespace+"deleteReview", rvo);
	}

	@Override
	public ProductVO getProduct(int pno) {
		return sql.selectOne(namespace+"getProduct", pno);
	}

	
	@Override
	public int getTotalCount(Criterion cri, String db) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("db", db);
		return sql.selectOne(namespace+"getTotalCount", map);
	}

	
	@Override
	public List<ProductVO> listCart(Criterion cri, int mno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("mno", mno);
		return sql.selectList(namespace+"listCart", map);
	}

	@Override
	public int addCart(CartVO cvo) {
		return sql.insert(namespace+"addCart", cvo);
	}

	@Override
	public int modifyCart(CartVO cvo) {
		return sql.update(namespace+"modifyCart", cvo);
	}

	@Override
	public int deleteCart(CartVO cvo) {
		return sql.delete(namespace+"deleteCart", cvo);
	}

	@Override
	public List<OrderVO> listOrder(int mno) {
		return sql.selectList(namespace+"listOrder", mno);
	}

	@Override
	public int insertOrder(OrderVO ovo) {
		return sql.insert(namespace+"insertOrder", ovo);
	}

	@Override
	public int modifyOrder(OrderVO ovo, int status) {
		Map<String, Object> map = new HashMap<>();
		map.put("ovo", ovo);
		map.put("status", status);
		return sql.update(namespace+"modifyOrder", map);
	}
}
