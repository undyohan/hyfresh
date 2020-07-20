package com.myweb.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.ProductVO;
import com.myweb.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	private static Logger log = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	AdminDAO adao;
	
	@Override
	public int pregister(ProductVO pvo) {
		return adao.insertProduct(pvo);
	}

	@Override
	public int pmodify(ProductVO pvo) {
		return adao.updateProduct(pvo);
	}

	@Override
	public int premove(int pno) {
		return adao.deleteProduct(pno);
	}

}
