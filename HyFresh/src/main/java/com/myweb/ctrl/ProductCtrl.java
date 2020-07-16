package com.myweb.ctrl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		List<ProductVO> pList = psv.getList(cri, "and custom = '"+custom+"'");
		List<ReviewVO> rList = psv.listReview(pno);
		
		
		Map<String, Object> cList = new HashMap<>();
		for(int i = 0; cList.size() < 20; i++) {
			SimpleDateFormat format1 = new SimpleDateFormat ("MM/dd");
			Calendar cal = new GregorianCalendar();
			cal.add(Calendar.DATE, i+1);
			Date time = cal.getTime();
			String time1 = format1.format(time);
			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
			String korDayOfWeek = "";
			if(dayOfWeek == 1) {
				cList.put("day"+i, "");
				cList.put("dow"+i, "");
			}else {
				switch (dayOfWeek) {
			    case 1:
			        korDayOfWeek = "일";
			        break;
			    case 2:
			        korDayOfWeek = "월";
			        break;
			    case 3:
			        korDayOfWeek = "화";
			        break;
			    case 4:
			        korDayOfWeek = "수";
			        break;
			    case 5:
			        korDayOfWeek = "목";
			        break;
			    case 6:
			        korDayOfWeek = "금";
			        break;
			    case 7:
			        korDayOfWeek = "토";
			        break;
			}
				cList.put("day"+i, time1);
				cList.put("dow"+i, korDayOfWeek);
			}
		}
		
		String tag = pvo.getTname();
		List<String> tList = new ArrayList<>();
		
		for(int i = 0; i < i + 1; i++) {
			if(tag.indexOf(" #") > 0) {
				String tempTag = tag.substring(0, tag.indexOf(" #"));  
				tList.add(tempTag);
				tag = tag.substring(tag.indexOf(" #") + 1);
			}else if(tag.indexOf(" #") == -1) {
				tList.add(tag);
				break;
			}
		}
		model.addAttribute("pvo", pvo);
		model.addAttribute("cList", cList);
		model.addAttribute("rList", rList);
		model.addAttribute("pList", pList);
		model.addAttribute("tList", tList);
	}
}