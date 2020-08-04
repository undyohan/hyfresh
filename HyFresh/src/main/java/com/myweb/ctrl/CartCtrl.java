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
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.CartVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.service.OrderCartService;

@Controller
@RequestMapping("/cart/*")

public class CartCtrl {
	private static Logger log = LoggerFactory.getLogger(CartCtrl.class);

	@Inject
	OrderCartService ocsv;
	
	
	@ResponseBody
	@PostMapping(value = "/add")
	public String addCart(HttpSession session,CartVO cvo){
	MemberVO mvo =(MemberVO)session.getAttribute("mInfo");
	log.info(">>>>>>>>>>>>세션:"+session.getId());
	log.info(">>>>>>>>>>>>cvo:"+cvo);
	
	if(mvo != null) {
		cvo.setEmail(mvo.getEmail());
	}else {
		cvo.setEmail(session.getId());
	}
	String result="";
	int isOk=ocsv.addCart(cvo);	
	if(isOk>0) {
		result="장바구니 추가에 성공했습니다 장바구니로 이동하시겠습니까?";
		// 카트 상품종류 수
		String email="";
		String guestID="";
		if(mvo != null) {
			email=mvo.getEmail();
			guestID=session.getId();
		}else {
			email = session.getId();
		}
		log.info(">>> email : " + email);
		int cartQt = ocsv.getCartQt(email,guestID);
		log.info(">>> cartQt : " + cartQt);
		session.setAttribute("cartQt", cartQt);
	}else {
	   result="추가실패";
	}
		return result;
	}
	
	
	@GetMapping(value="/list")
	public void getCartList(HttpSession session,Model model,Criterion cri) {
	
		//카트 리스트
		MemberVO mvo =(MemberVO)session.getAttribute("mInfo");
		List<CartVO> clist= new ArrayList<>();
		String guestID="";
		if(mvo != null) {
			guestID=session.getId();
			clist= ocsv.listCart(cri, mvo.getEmail(),guestID);
			}else {
			clist= ocsv.listCart(cri, session.getId(),guestID);
			}
	
		// Calendar(cList) - Start
		Map<String, Object> cList = new HashMap<>();
		for(int i = 0; cList.size() < 20; i++) {
			SimpleDateFormat format1 = new SimpleDateFormat ("YYYY-MM-dd");
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
		
		model.addAttribute("cartList",clist);
		log.info(">>>>>>>>>>>>clist:"+clist);
		model.addAttribute("cList", cList);
	}
	
	//수량수정
	@PostMapping(value="/modqt",consumes="application/json", 
	produces="application/text; charset=UTF-8")
	public ResponseEntity<String> modify(HttpSession session,@RequestBody CartVO cvo) {
		MemberVO mvo =(MemberVO)session.getAttribute("mInfo");
		int isUp=ocsv.modCartQt(cvo);
		return isUp>0 ? new ResponseEntity<>("수량이 변경되었습니다.",HttpStatus.OK): new ResponseEntity<>("재고가 부족합니다",HttpStatus.OK);
	}
	
	//배송일 변경
	@ResponseBody
	@PostMapping(value = "/modDate")
	public String modDate(CartVO cvo) {
		String result="";
		int isUp=ocsv.modDate(cvo);
		if(isUp>0) {
			result="1";
		}else {
			result="0";
		}
		return result;
	}	
	
	@ResponseBody
	@PostMapping(value = "/remove")
	public String deleteCart(HttpSession session,
	     @RequestParam(value = "chbox[]") List<String> chArr, CartVO cvo){
	
		MemberVO mvo =(MemberVO)session.getAttribute("mInfo");
	 
	 String result="";
	 int cartNum = 0;
	 
	  for(String i : chArr) {   
	   cartNum = Integer.parseInt(i);
	   cvo.setCno(cartNum);
	   ocsv.deleteCart(cvo);
	   // 카트 상품종류 수
	   String email ="";
	   String guestID=session.getId();
		if(mvo != null) {
			email=mvo.getEmail();
		}else {
			email=session.getId();
		}
	   log.info(">>> email : " + email);
	   int cartQt = ocsv.getCartQt(email,guestID);
	   log.info(">>> cartQt : " + cartQt);
	   session.setAttribute("cartQt", cartQt);
	  }   
	  result = "1";
	 
	 return result;  
	}

}
