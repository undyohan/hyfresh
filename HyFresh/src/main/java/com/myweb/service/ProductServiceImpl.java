package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.CartVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.OrderVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.ReviewVO;
import com.myweb.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	private static Logger log = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Inject
	ProductDAO pdao;

	@Override
	public List<ProductVO> getList(Criterion cri, String where) {
		return pdao.getList(cri, where);
	}

	@Override
	public List<ReviewVO> listReview(int pno) {
		return pdao.listReview(pno);
	}

	@Override
	public int addReview(ReviewVO rvo) {
		return pdao.addReview(rvo);
	}

	@Override
	public int modifyReview(ReviewVO rvo) {
		return pdao.modifyReview(rvo);
	}

	@Override
	public int deleteReview(ReviewVO rvo) {
		return pdao.deleteReview(rvo);
	}

	@Override
	public ProductVO getProduct(int pno) {
		return pdao.getProduct(pno);
	}

	@Override
	public int getTotalCount(Criterion cri, String db) {
		return pdao.getTotalCount(cri, db);
	}

	@Override
	public List<ProductVO> listCart(Criterion cri, int mno) {
		return pdao.listCart(cri, mno);
	}

	@Override
	public int addCart(CartVO cvo) {
		return pdao.addCart(cvo);
	}

	@Override
	public int modifyCart(CartVO cvo) {
		return pdao.modifyCart(cvo);
	}

	@Override
	public int deleteCart(CartVO cvo) {
		return pdao.deleteCart(cvo);
	}

	@Override
	public List<OrderVO> listOrder(int mno) {
		return pdao.listOrder(mno);
	}

	@Override
	public int insertOrder(OrderVO ovo) {
		return pdao.insertOrder(ovo);
	}

	@Override
	public int modifyOrder(OrderVO ovo, int status) {
		return pdao.modifyOrder(ovo, status);
	}
}
