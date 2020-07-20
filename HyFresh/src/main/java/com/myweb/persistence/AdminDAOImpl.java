package com.myweb.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.ProductVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	private static Logger log = LoggerFactory.getLogger(AdminDAOImpl.class);
	private static String ns = "AdminMapper.";
	
	@Inject
	SqlSession sql;

	@Override
	public int insertProduct(ProductVO pvo) {
		return sql.insert(ns+"register", pvo);
	}
	
	@Override
	public int updateProduct(ProductVO pvo) {
		return sql.insert(ns+"modifyProduct", pvo);
	}

	@Override
	public int deleteProduct(int pno) {
		return sql.delete(ns+"removeProduct", pno);
	}

}
