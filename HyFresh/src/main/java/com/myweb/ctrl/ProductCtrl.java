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
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

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
   
   /********************************************************************
   1. Title: ProductCtrl

   2. Author: 이준우

   3. Revision history
    2020-07-29 14:26  이준우 최초 정리
    2020-07-30 14:03 이준우 알뜰쇼핑
    2020-07-30 14:54 이준우 제품 검색

   *****************************************************************/
   // 신제품 리스트
   @GetMapping("/list") 
   public void list(Model model, Criterion cri) {
      cri.setAmount(12);
      model.addAttribute("pList", psv.getNewList(cri, ""));
      int totalCount = psv.getTotalCount("pno", "tbl_product", "");
      model.addAttribute("pgvo", new PagingVO(totalCount, cri));
   } 
   
   // 제품 상세정보
   @GetMapping("/detail")
   public void detail(@RequestParam("pno")int pno, Model model, @ModelAttribute("cri")Criterion cri) {
      ProductVO pvo = psv.getProduct(pno);
      
      // Calendar(cList) - Start
      Map<String, Object> cList = new HashMap<>();
      for(int i = 0; cList.size() < 25; i++) {
         SimpleDateFormat format1 = new SimpleDateFormat ("MM/dd");
         Calendar cal = new GregorianCalendar();
         cal.add(Calendar.DATE, i+1);
         Date time = cal.getTime();
         String time1 = format1.format(time);
         int year = cal.get(Calendar.YEAR);
         int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
         String korDayOfWeek = "";
         if(dayOfWeek == 1) {
            cList.put("year"+i, "");
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
            cList.put("year"+i, year);
            cList.put("day"+i, time1);
            cList.put("dow"+i, korDayOfWeek);
         }
         if(cal.get(Calendar.DATE) == cal.getActualMaximum(Calendar.DAY_OF_MONTH)) {
            cal.add (cal.MONTH, 1); // 다음달
            cal.set(Calendar.DAY_OF_MONTH, 1); //해당 월의 1일로 변경
         }
      }
      // HashTag(tList) - Start
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
      
      Criterion dCri = new Criterion(5, 1);
      
      String where = "tname like ";
      for(int i = 0; i < tList.size(); i++) {
         where += "'%"+tList.get(i)+"%'";
         
         if(i != tList.size() - 1) {
            where += " or tname like ";
         }
      }
      List<ProductVO> pList = psv.getSameList(dCri, where, pno);
      // StarAverage - Start
      ReviewVO star = psv.getStar(pno);
      
      // addAttribute - Start
      model.addAttribute("pvo", pvo);
      model.addAttribute("cList", cList);
      model.addAttribute("star", star);
      model.addAttribute("pList", pList);
      model.addAttribute("tList", tList);
   }
   
   // 맞춤 쇼핑 페이지 로드
   @GetMapping("/custom")
   public void custom() {
   }
   
   // 알뜰쇼핑 리스트
   @GetMapping("/dlist") 
   public void dlist(Model model, Criterion cri) {
      cri.setAmount(12);
      model.addAttribute("pList", psv.getNewList(cri, " and discount > '0'"));
      int totalCount = psv.getTotalCount("pno", "tbl_product", " where discount > '0'");
      model.addAttribute("pgvo", new PagingVO(totalCount, cri));
   }
   
   // 각 카테고리 리스트
   @GetMapping("/catelist") 
   public void catelist(Model model, Criterion cri, @RequestParam("cateno") int cateno) {
      String where = "";
      String where2 = "";
      if(cateno % 1000 == 0) {
         where = " and catecode = '" + cateno + "'";
         where2 = " where catecode = '" + cateno + "'";
      }else {
         where = " and cateno = '" + cateno + "'";
         where2 = " where cateno = '" + cateno + "'";
      }
      cri.setAmount(12);
      model.addAttribute("pList", psv.getNewList(cri, where));
      int totalCount = psv.getTotalCount("pno", "tbl_product", where2);
      model.addAttribute("pgvo", new PagingVO(totalCount, cri));
   }
   
	// 검색 리스트
	@GetMapping("/slist") 
	public void slist(Model model, Criterion cri) {
		cri.setAmount(12);
		if(cri.getKeyword() != "") {
			model.addAttribute("pList", psv.getSList(cri,  "and (tp.pname like '%" + cri.getKeyword() + "%' or tt.tname like '%" + cri.getKeyword() + "%')"));
			int totalCount = psv.getTotalCount("pno", "tbl_product", "tp join tbl_tag tt on tp.tno = tt.tno where pname like '%" + cri.getKeyword() + "%' or tname like '%" + cri.getKeyword() + "%' ");
			model.addAttribute("pgvo", new PagingVO(totalCount, cri));
		}else {
			model.addAttribute("pList", psv.getNewList(cri, ""));
			int totalCount = psv.getTotalCount("pno", "tbl_product", "");
			model.addAttribute("pgvo", new PagingVO(totalCount, cri));
		}
		
	}
}