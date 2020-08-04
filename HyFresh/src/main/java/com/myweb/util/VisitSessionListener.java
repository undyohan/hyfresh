package com.myweb.util;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.myweb.domain.VisitCountVO;
import com.myweb.persistence.VisitCountDAO;

public class VisitSessionListener implements HttpSessionListener{
	private static Logger log = LoggerFactory.getLogger(VisitSessionListener.class);

	@Inject
	VisitCountVO vvo;
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
        //등록되어있는 빈을 사용할수 있도록 설정해준다
        HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        //request를 파라미터에 넣지 않고도 사용할수 있도록 설정
        VisitCountDAO visitCountDAO = (VisitCountDAO)wac.getBean("visitCounterDAO");
        VisitCountVO vvo = new VisitCountVO();
        vvo.setIp(req.getRemoteAddr());
        vvo.setVisit_agent(req.getHeader("User-Agent"));//브라우저 정보
        vvo.setVisit_refer(req.getHeader("referer"));//접속 전 사이트 정보
        visitCountDAO.insertVisitor(vvo);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {	
		
	}
}
