package com.myweb.persistence;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.VisitCountVO;

public interface VisitCountDAO {
	public int insertVisitor(VisitCountVO vvo);
}
