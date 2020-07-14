package com.myweb.ctrl;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductCtrl {
	private static Logger log = LoggerFactory.getLogger(ProductCtrl.class);
	
	@Inject
	ProductService psv;
}
