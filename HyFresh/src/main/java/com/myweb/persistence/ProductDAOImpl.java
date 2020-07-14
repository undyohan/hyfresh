package com.myweb.persistence;

import java.util.List;

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
	SqlSession

	@Override
	public List<ProductVO> getList(Criterion cri, String where) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReviewVO> listReview(int pno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ProductVO getProduct(int pno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount(Criterion cri, String db) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProductVO> listCart(Criterion cri, int mno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addCart(CartVO cvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyCart(CartVO cvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCart(CartVO cvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<OrderVO> listOrder(int mno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertOrder(OrderVO ovo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyOrder(OrderVO ovo, int status) {
		// TODO Auto-generated method stub
		return 0;
	}
}
