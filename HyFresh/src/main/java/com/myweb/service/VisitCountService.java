package com.myweb.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.VisitCountVO;

public interface VisitCountService {
	public int insert(VisitCountVO vvo);
}
