package com.myweb.ctrl;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.domain.Criterion;
import com.myweb.domain.PagingVO;
import com.myweb.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductCtrl {
	private static Logger log = LoggerFactory.getLogger(ProductCtrl.class);
	
	@Inject
	ProductService psv;
	
	@GetMapping("/list") 
	public void list(Model model, Criterion cri) {
		model.addAttribute("pList", psv.getList(cri, "tbl_product"));
		int totalCount = psv.getTotalCount("pno", "tbl_product");
		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
	}
}
