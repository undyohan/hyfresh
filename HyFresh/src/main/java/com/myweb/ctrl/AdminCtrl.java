package com.myweb.ctrl;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.service.MemberService;
import com.myweb.service.ProductService;

@Controller
@RequestMapping("/admin/*")
public class AdminCtrl {
	private static Logger log = LoggerFactory.getLogger(AdminCtrl.class);
	
	@Inject
	MemberService msv;
	
	@Inject
	ProductService psv;
	
	@GetMapping("/main")
	public void main() {
	}
}
