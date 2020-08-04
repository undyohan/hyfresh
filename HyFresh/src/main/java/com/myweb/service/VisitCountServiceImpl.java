package com.myweb.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.domain.VisitCountVO;
import com.myweb.persistence.VisitCountDAO;

@Service
public class VisitCountServiceImpl implements VisitCountService{
	private static Logger log = LoggerFactory.getLogger(VisitCountServiceImpl.class);

	@Inject
	VisitCountDAO vdao;
	
	@Override
	public int insert(VisitCountVO vvo) {
		return vdao.insertVisitor(vvo);
	}

}
