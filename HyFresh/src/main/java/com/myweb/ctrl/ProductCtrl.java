package com.myweb.ctrl;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myweb.domain.Criterion;
import com.myweb.domain.PagingVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.ReviewVO;
import com.myweb.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductCtrl {
	private static Logger log = LoggerFactory.getLogger(ProductCtrl.class);
	
	@Inject
	ProductService psv;
	
	@GetMapping("/list") 
	public void list(Model model, Criterion cri) {
		model.addAttribute("pList", psv.getList(cri, ""));
		int totalCount = psv.getTotalCount("pno", "tbl_product");
		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
	} 
	
	@GetMapping("/detail")
	public void detail(@RequestParam("pno")int pno, Model model, @ModelAttribute("cri")Criterion cri) {
		ProductVO pvo = psv.getProduct(pno);
		String custom = pvo.getCustom();
		List<ProductVO> pList = psv.getList(cri, "and custom = "+ custom);
		List<ReviewVO> rList = psv.listReview(pno);
		model.addAttribute("pvo", pvo);
		model.addAttribute("rList", rList);
	}
}
