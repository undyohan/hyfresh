package com.myweb.ctrl;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myweb.domain.CategoryVO;
import com.myweb.domain.Criterion;
import com.myweb.service.AdminService;
import com.myweb.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	AdminService asv;
	
	@Inject
	ProductService psv;
	
	/********************************************************************
	1. Title: HomeController

	2. Author: 이준우

	3. Revision history
	 2020-07-29 14:26 이준우 최초 정리

	*****************************************************************/
	
	// 메인 화면의 제품 리스트 출력
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Criterion cri, HttpSession ses) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		List<CategoryVO> clist = asv.getCateList(cri);
		model.addAttribute("navCate", clist);
		ses.setAttribute("navCate", clist);
		
		cri.setAmount(8);
		model.addAttribute("pList", psv.getList(cri, "order by bestcount desc"));
		cri.setAmount(3);
		model.addAttribute("pList2", psv.getNewList(cri, "order by regd8 desc"));
		
		return "index";
	}
	
}
