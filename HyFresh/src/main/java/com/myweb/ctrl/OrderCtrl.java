package com.myweb.ctrl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.myweb.domain.AddressVO;
import com.myweb.domain.CartVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.domain.OrderDetailVO;
import com.myweb.domain.OrderListVO;
import com.myweb.domain.OrderVO;
import com.myweb.domain.PagingVO;
import com.myweb.service.AddressService;
import com.myweb.service.OrderCartService;

@Controller
@RequestMapping("/order/*")

public class OrderCtrl {
   private static Logger log = LoggerFactory.getLogger(OrderCtrl.class);

   @Inject
   OrderCartService ocsv;
   
   @Inject
   AddressService asv;

   //카트에서 주문하기
    @ResponseBody
   @PostMapping(value = "/cartorder")
   public String orderPage(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cvo,Model model) {
      MemberVO mvo = (MemberVO) session.getAttribute("mInfo");
      log.info(">>>>>>>>>>>>>>>>>>>>>>>cvo:"+cvo);
      int cno = 0;
      String result="";
      List<CartVO> clist = new ArrayList<>();
      List<AddressVO> aList = asv.getList(mvo.getMno());
      if (mvo != null) {
         cvo.setEmail(mvo.getEmail());
         for (String i : chArr) {
               cno = Integer.parseInt(i);
               cvo.setCno(cno);
               clist.add(ocsv.cartOrder(cvo));
            }
            result="1";
            session.setAttribute("cartList", clist);
            session.setAttribute("dfee", cvo.getDfee());
            //기본 주소가져오기
            session.setAttribute("adr", ocsv.getAddress(mvo.getAddrno()));
            //배송지 목록 가져오기
            session.setAttribute("aList", aList);
            session.setMaxInactiveInterval(60*5);            
         }
         log.info(">>>>>>>>>>>>>>clist:"+clist);
         
         return result;
   }
    
    
    //바로 주문하기
    @PostMapping(value = "/orderpage")
    public void directBuy(CartVO cvo,Model model,HttpSession session) {
       log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>"+cvo);
      MemberVO mvo = (MemberVO) session.getAttribute("mInfo");

       model.addAttribute("product", cvo);
       List<CartVO> clist= new ArrayList<>();
      List<AddressVO> aList = asv.getList(mvo.getMno());

      
       clist.add(cvo);
       session.setAttribute("cartList", clist);
       session.setAttribute("dfee", cvo.getDfee());
       //주소가져오기
      session.setAttribute("adr", ocsv.getAddress(mvo.getAddrno()));
      //배송지 목록 가져오기
      session.setAttribute("aList", aList);   
      session.setMaxInactiveInterval(60*5);
    }
    
    //주소 가져오기
    @PostMapping(value = "/getAddr")
    public void getAddress(HttpSession session) {
      MemberVO mvo = (MemberVO) session.getAttribute("mInfo");
      
      ocsv.getAddress(mvo.getAddrno());
       log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>"+ocsv.getAddress(mvo.getAddrno()));
    }
    
  
    
    
   //배송지추가
   /*
    * @ResponseBody
    * 
    * @GetMapping(value="/addr/{addrno}", produces =
    * {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE}) //보낼
    * 타입의 데이터 형식을맞춤 public ResponseEntity<AddressVO> avo(@PathVariable("addrno")int
    * addrno){ log.info(">>>>>>>>>>>>>>"+addrno); //ArrayList<CommentVO> cList=
    * (ArrayList<CommentVO>) csv.getList(pno); return new
    * ResponseEntity<AddressVO>(asv.openmod(addrno),HttpStatus.OK); //뽑아온 리스트를
    * json데이터타입으로 반환함 }
    */
   
   
      
      

   @GetMapping(value="orderpage")
   public void orderpage() {}
   
    //주문 생성
   @PostMapping(value = "/insert")
   public String insertorder(HttpSession session, OrderVO ovo,Model model) {
      MemberVO mvo = (MemberVO) session.getAttribute("mInfo");
      List<CartVO> clist =(List<CartVO>)session.getAttribute("cartList");
      List<OrderDetailVO> olist= new ArrayList<>();
      
       //주문번호 생성을 위한 로직
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
        String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
        String subNum = "";
        
        for(int i = 1; i <= 6; i ++) {
         subNum += (int)(Math.random() * 10);
        }
        String ocode = ymd + "_" + subNum;
        ovo.setMno(mvo.getMno());
        ovo.setOcode(ocode);
        ocsv.insertOrder(ovo);
        
        //적립금 계산
         ocsv.point(ovo.getPoint(),ovo.getOprice(), mvo.getMno());
         mvo.setPoint(ocsv.showPoint(mvo.getMno()));
         session.setAttribute("mInfo", mvo);
         session.setMaxInactiveInterval(60*30); // 30 mins.
        
         
        for (int i = 0; i < clist.size(); i++) {
        //주문상세(상품) 추가
        OrderDetailVO odvo=new OrderDetailVO();
        odvo.setPno(clist.get(i).getPno());
        odvo.setOcode(ocode);
        odvo.setPname(clist.get(i).getPname());
        odvo.setPrice(clist.get(i).getPrice());
        odvo.setMno(mvo.getMno());
        odvo.setQt(clist.get(i).getQt());
        odvo.setDeliverd8(clist.get(i).getGetd8());
         log.info(">>>>>GET:"+clist.get(i).getGetd8());

        ocsv.insertOrder_Detail(odvo);
        olist.add(odvo);
        //주문하면 상품  판매갯수증가/ 재고감소
        ocsv.sellCount(clist.get(i).getQt(), clist.get(i).getPno());
      
        //주문 완료후 장바구니 삭제
           int cno=clist.get(i).getCno();
         CartVO cvo = new CartVO();
         cvo.setCno(cno);
         cvo.setEmail(mvo.getEmail());
         log.info(">>>>>cvo:"+cvo);
         ocsv.deleteCart(cvo);
        }
       
        session.removeAttribute("cartList");
   
        model.addAttribute("order", ovo);
        model.addAttribute("detail", olist);
        
        return "forward:/order/complete";
      }
      
    @PostMapping(value="complete")
      public void orderfinish() {
    }
    
    //주문리스트
    @GetMapping(value="list")
    public void odrderlist(HttpSession session,Model model,Criterion cri,
          @RequestParam(value = "month", required = false, defaultValue = "sysdate,-1")String month,
          @RequestParam(value = "status", required = false, defaultValue = "99")int status) {
       MemberVO mvo = (MemberVO) session.getAttribute("mInfo");
       log.info(">>>>>>>>>>>status:"+status);
       List<OrderListVO> olist=ocsv.listOrder(mvo.getMno(),cri,month,status);
       model.addAttribute("orderInfo", olist);
       log.info(">>>>>>>>>>>olist:"+olist);
       int totalCount=ocsv.totalCount(mvo.getMno(),cri,month,status);
       model.addAttribute("pgvo",new PagingVO(totalCount, cri));
       model.addAttribute("month",month);
       model.addAttribute("status",status);
    }
    
    //주문 상세보기
    @GetMapping(value="detail")
    public void odrderDetail(HttpSession session,Model model,OrderListVO ovo,String ocode) {
       MemberVO mvo = (MemberVO) session.getAttribute("mInfo");
       ovo.setMno(mvo.getMno());
       model.addAttribute("detailList", ocsv.orderDetail(ovo));
       model.addAttribute("detail",ocsv.orderInfo(ocode));
       
    }
    
    //주문 상태수정
    @ResponseBody
    @PostMapping(value="modify")
    public String modStatus(OrderDetailVO odvo) {
       String result="0";
       int isUp=ocsv.modStatus(odvo);
       if(isUp >0) {
          result="1";
       }
       
       return result;
    }
    
    //주문 배송지변경
    

    
    @GetMapping(value="modPlace")
    public void modPlace(HttpSession session,String ocode,Model model) {
       MemberVO mvo = (MemberVO) session.getAttribute("mInfo");
       //int isUp=ocsv.modPlace(ovo);
       OrderListVO ovo= new OrderListVO();
       ovo.setOcode(ocode);
       model.addAttribute("aList", asv.getList(mvo.getMno()));
       model.addAttribute("order",ocsv.orderInfo(ocode));
       model.addAttribute("olist",ocsv.orderDetail(ovo));
       log.info(">>>>>>>>order!"+ocsv.orderInfo(ocode));
       log.info(">>>>>>>>olist"+ocsv.orderDetail(ovo));
       log.info(">>>>>>>>Alist"+asv.getList(mvo.getMno()));
       }
    
    @PostMapping(value="placeChange")
    public String modPlace(OrderListVO ovo) {
       log.info(">>>>>>>>>>>>>>>>>>>떠라"+ovo);
       int isUp=ocsv.modPlace(ovo);
       
       
       return "redirect:/order/detail?ocode="+ovo.getOcode();
       }
    
    
   /*
    * //상태별 주문보기
    * 
    * @GetMapping(value="status") public String status_Order(HttpSession
    * session,Model model,Criterion cri,
    * 
    * @RequestParam(value = "month", required = false, defaultValue =
    * "sysdate,-1")String month, int status) { MemberVO mvo = (MemberVO)
    * session.getAttribute("mInfo"); List<OrderListVO>
    * olist=ocsv.status_Order(mvo.getMno(), status, cri, month);
    * model.addAttribute("orderInfo", olist); log.info(">>>>>>>>>>>olist:"+olist);
    * int totalCount=ocsv.totalCount(mvo.getMno(),cri,month);
    * model.addAttribute("pgvo",new PagingVO(totalCount, cri));
    * model.addAttribute("month",month);
    * 
    * return "forward:/order/list"; }
    */
    
    
}