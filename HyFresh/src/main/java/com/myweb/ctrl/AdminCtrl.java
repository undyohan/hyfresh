package com.myweb.ctrl;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.AnswerVO;
import com.myweb.domain.CategoryVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.domain.NoticeVO;
import com.myweb.domain.OrderDetailVO;
import com.myweb.domain.PAnswerVO;
import com.myweb.domain.PQuestionDTO;
import com.myweb.domain.PQuestionVO;
import com.myweb.domain.PagingVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.QuestionVO;
import com.myweb.service.AdminService;
import com.myweb.service.AnswerService;
import com.myweb.service.MemberService;
import com.myweb.service.NoticeService;
import com.myweb.service.PAnswerService;
import com.myweb.service.PQuestionService;
import com.myweb.service.ProductService;
import com.myweb.service.QuestionService;
import com.myweb.util.FileProcessor;

@Controller
@RequestMapping("/admin/*")
public class AdminCtrl {
	private static Logger log = LoggerFactory.getLogger(AdminCtrl.class);
	
	@Inject
	FileProcessor fp;
	
	@Inject
	AdminService asv;
	
	@Inject
	ProductService psv;
	
	@Inject
	MemberService msv;
	
	@Inject
	QuestionService qsv;
	
	@Inject
	NoticeService nsv;

	@Inject
	AnswerService ansv;

	@Inject
	PQuestionService pqsv;
	
	@Inject
	PAnswerService pasv;
	
	@GetMapping("/main")
	public void main(Model model) {
		int orderCount = msv.getStatusCount(9);
		model.addAttribute("orderCount", orderCount);
	}
	
	@GetMapping("/mlist")
	public void mList(Model model, Criterion cri) {
		List<MemberVO> list = asv.getListMember(cri);
		model.addAttribute("mList", list);
		int mTotalCount = asv.getTotalMCount(cri);
		model.addAttribute("pgvo", new PagingVO(mTotalCount, cri));
	}
	
	@GetMapping("/managerlist")
	public void managerList(Model model, Criterion cri) {
		List<MemberVO> list = asv.getListManager(cri);
		model.addAttribute("managerList", list);
		int managerTotalCount = asv.getTotalManagerCount(cri);
		model.addAttribute("pgvo", new PagingVO(managerTotalCount, cri));
	}

	@GetMapping("/delete")
	public String delete(Criterion cri, @RequestParam("mno") int mno, RedirectAttributes reAttr) {
		int isDel = asv.deleteMember(mno);
		if(isDel > 0) {
			reAttr.addFlashAttribute("msg", "회원 영구 삭제 완료");
		}
		String encodedKeyword = null;
		try {
			encodedKeyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/admin/resignlist?pageNum="+cri.getPageNum()
				+"&amount="+cri.getAmount()
				+"&type="+cri.getType()
				+"&keyword="+encodedKeyword;
	}

	@GetMapping("/resignlist")
	public void resignlist(Model model, Criterion cri) {
		List<MemberVO> rlist = asv.getListResignM(cri);
		model.addAttribute("resignList", rlist);
		int resignTotalCount = asv.getTotalResignCount(cri);
		model.addAttribute("pgvo", new PagingVO(resignTotalCount, cri));
	}
	
	@ResponseBody
	@PostMapping(value="/mmodify", consumes="application/json",
			produces = "application/text; charset=utf-8")
	public String mmodify(@RequestBody MemberVO mvo) {
		int isMod = asv.modifyMember(mvo);
		return isMod == 1 ? "1" : "0";
	}
	
	@GetMapping("/resign")
	public String resign(Criterion cri, @RequestParam("mno") int mno, RedirectAttributes reAttr) {
		int isRm = asv.resignMember(mno);
		if(isRm > 0) {
			reAttr.addFlashAttribute("msg", "회원 탈퇴 완료");
		}
		String encodedKeyword = null;
		try {
			encodedKeyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/admin/mlist?pageNum="+cri.getPageNum()
				+"&amount="+cri.getAmount()
				+"&type="+cri.getType()
				+"&keyword="+encodedKeyword;
	}
	
	@GetMapping("/addcategory")
	public void addcate() {
		
	}
	
	@PostMapping("/addcategory")
	public String addcate(MultipartHttpServletRequest multiReq) {
		asv.addCategory(fp.CategorySave(multiReq));
		return "redirect:/admin/catelist";
	}
	
	@GetMapping("/catelist")
	public void catelist(Model model, Criterion cri) {
		List<CategoryVO> clist = asv.getCateList(cri);
		model.addAttribute("cList", clist);
	}
	
	@GetMapping({"/catemodify"})
	public void catemodify(@RequestParam("cateno") int cateno, Model model) {
		model.addAttribute("catevo", asv.getCateDetail(cateno));
	}
	
	@PostMapping("/catemodify")
	public String catemodify(MultipartHttpServletRequest multiReq, RedirectAttributes reAttr) {
		int isMod = asv.modifyCate(fp.CategoryModify(multiReq));
		if(isMod > 0) {
			reAttr.addFlashAttribute("msg", "카테고리 수정 완료");
		}
		return "redirect:/admin/catelist";
	}
	
	@PostMapping("/cateremove")
	public String remove(@RequestParam("cateno") int cateno,
			@RequestParam("iconfile") String iconfile, RedirectAttributes reAttr) {
		int isRm = fp.CategoryRemove(iconfile);
		isRm = asv.removeCate(cateno);
		if(isRm > 0) {
			reAttr.addFlashAttribute("msg", "카테고리 삭제 완료");
		}
		return "redirect:/admin/catelist";
	}
	
	@GetMapping("/statusSales")
	public void statusSales() {}
	
	@GetMapping("/statusVisitor")
	public void statusVisitor() {}
	
	@GetMapping("/salary")
	public void salary() {}
	
	// 주문취소 리스트
	@GetMapping("/plistCancel")
	public void plistCancel(Model model, Criterion cri, @RequestParam("status") int status) {
		cri.setPageNum(1);
		cri.setAmount(50);
		int totalCount = msv.getStatusCount(status);
		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
		log.info(">>> totalCount : "  + totalCount);
		List<OrderDetailVO> list = asv.getOrderListStatus(cri, status);
		model.addAttribute("listTotal", list);
	}
	
	// 반품 리스트
	@GetMapping("/plistReturn")
	public void plistReturn(Model model, Criterion cri, @RequestParam("status") int status) {
		cri.setPageNum(1);
		cri.setAmount(50);
		int totalCount = msv.getStatusCount(status);
		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
		log.info(">>> totalCount : "  + totalCount);
		List<OrderDetailVO> list = asv.getOrderListStatus(cri, status);
		model.addAttribute("listTotal", list);
	}
	
	// 교환 리스트
	@GetMapping("/plistExchange")
	public void plistExchange(Model model, Criterion cri, @RequestParam("status") int status) {
		cri.setPageNum(1);
		cri.setAmount(50);
		int totalCount = msv.getStatusCount(status);
		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
		log.info(">>> totalCount : "  + totalCount);
		List<OrderDetailVO> list = asv.getOrderListStatus(cri, status);
		model.addAttribute("listTotal", list);
	}
	
	// 주문통합 리스트
	@GetMapping("/orderListTotal")
	public void orderListTotal(Model model, Criterion cri, @RequestParam("status") int status) {
		cri.setPageNum(1);
		cri.setAmount(50);
		int totalCount = msv.getStatusCount(status);
		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
		log.info(">>> totalCount : "  + totalCount);
		List<OrderDetailVO> list = asv.getOrderListStatus(cri, status);
		model.addAttribute("listTotal", list);
	}
	
	// 결제완료 리스트
	@GetMapping("/orderListPaid")
	public void orderListPaid(Model model, Criterion cri, @RequestParam("status") int status) {
		cri.setPageNum(1);
		cri.setAmount(50);
		int totalCount = msv.getStatusCount(status);
		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
		log.info(">>> totalCount : "  + totalCount);
		List<OrderDetailVO> list = asv.getOrderListStatus(cri, status);
		model.addAttribute("listTotal", list);
	}
	
	// 배송준비중 리스트
	@GetMapping("/orderListReadyShipping")
	public void orderListReadyShipping(Model model, Criterion cri, @RequestParam("status") int status) {
		cri.setPageNum(1);
		cri.setAmount(50);
		int totalCount = msv.getStatusCount(status);
		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
		log.info(">>> totalCount : "  + totalCount);
		List<OrderDetailVO> list = asv.getOrderListStatus(cri, status);
		model.addAttribute("listTotal", list);
	}
	
	// 배송중 리스트
	@GetMapping("/orderListShipping")
	public void orderListShipping(Model model, Criterion cri, @RequestParam("status") int status) {
		cri.setPageNum(1);
		cri.setAmount(50);
		int totalCount = msv.getStatusCount(status);
		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
		log.info(">>> totalCount : "  + totalCount);
		List<OrderDetailVO> list = asv.getOrderListStatus(cri, status);
		model.addAttribute("listTotal", list);
	}
	
	// 배송완료 리스트
	@GetMapping("/orderListShipped")
	public void orderListShipped(Model model, Criterion cri, @RequestParam("status") int status) {
		cri.setPageNum(1);
		cri.setAmount(50);
		int totalCount = msv.getStatusCount(status);
		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
		log.info(">>> totalCount : "  + totalCount);
		List<OrderDetailVO> list = asv.getOrderListStatus(cri, status);
		model.addAttribute("listTotal", list);
	}
	
	// 구매확정 리스트
	@GetMapping("/orderListPurchased")
	public void orderListPurchased(Model model, Criterion cri, @RequestParam("status") int status) {
		cri.setPageNum(1);
		cri.setAmount(50);
		int totalCount = msv.getStatusCount(status);
		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
		log.info(">>> totalCount : "  + totalCount);
		List<OrderDetailVO> list = asv.getOrderListStatus(cri, status);
		model.addAttribute("listTotal", list);
	}
	
	@GetMapping("/noticelist")
	public void noticelist(Model model, Criterion cri) {
		// model.addAttribute("pList", psv.getList());
		List<NoticeVO> list = nsv.getList(cri);
		model.addAttribute("nList", list);
		int totalCount = nsv.getTotalCount(cri);
		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
	}

	@GetMapping("/noticewrite")
	public void noticewrite() {
	}

	@PostMapping("/noticewrite")
	public String noticewrite(MultipartHttpServletRequest multiReq, RedirectAttributes reAttr) {
		/*
		 * if (nvo.getImg() == null) { nvo.setImg("NONE"); } nsv.register(nvo);
		 */
		int isIn = nsv.regist(fp.NoticeSave(multiReq));
		return "redirect:/admin/noticelist";
	}

	@GetMapping({ "/noticedetail", "/noticemodify" })
	public void noticedetail(@RequestParam("nno") int nno, Model model, @RequestParam("pSign") int pSign,
			RedirectAttributes reAttr, @ModelAttribute("cri") Criterion cri) {
		NoticeVO nvo = nsv.getNotice(nno);
		model.addAttribute("nvo", nvo);
		if (pSign > 0) {
			reAttr.addFlashAttribute("pSign", "상품 수정이 완료되었심 ㅎㅎ");
		}
	}

	@PostMapping("/noticemodify")
	public String noticemodify(MultipartHttpServletRequest multiReq, Model model, Criterion cri,
			RedirectAttributes reAttr) {
		log.info("이미지>>>>>" + multiReq.getFile("img"));
		int isUp = nsv.modify(fp.NoticeModify(multiReq));
		reAttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/admin/noticedetail?pSign=" + isUp + "&nno=" + multiReq.getParameter("nno") + "&pageNum="
				+ cri.getPageNum() + "&amount=" + cri.getAmount() + "&type=" + cri.getType();
	}

	@PostMapping("/noticeremove")
	public String noticeremove(@RequestParam("img") String img, @RequestParam("nno") int nno, RedirectAttributes reAttr,
			Criterion cri) {
		int isRm = fp.Noticeremove(img);
		isRm = nsv.remove(nno);
		if (isRm > 0) {
			reAttr.addFlashAttribute("pSign", "삭제가 완료되었습니다");
		}
		String encodedKeyword = null;
		try {
			encodedKeyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/admin/noticelist?pageNum=" + cri.getPageNum() + "&amount=" + cri.getAmount() + "&type="
				+ cri.getType() + "&keyword=" + encodedKeyword;
	}

	@GetMapping("/questionlist")
	public void questionlist(Model model, Criterion cri) {
		List<QuestionVO> list = qsv.getList(cri);
		model.addAttribute("qList", list);
		List<QuestionVO> slist = qsv.getsList();
		model.addAttribute("sList", slist);
		int totalCount = qsv.getTotalCount();

		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
	}

	@GetMapping("/questiondetail")
	public void questiondetail(@RequestParam("qno") int qno, Model model, @ModelAttribute("cri") Criterion cri) {
		QuestionVO qvo = qsv.getQuestion(qno);
		model.addAttribute("qvo", qvo);
	}

	@PostMapping("/questionremove")
	public String questionremove(@RequestParam("img") String img, @RequestParam("qno") int qno,
			RedirectAttributes reAttr, Criterion cri) {
		int isRm = fp.QuestionRemove(img);
		isRm = qsv.remove(qno);
		if (isRm > 0) {
			reAttr.addFlashAttribute("pSign", "삭제가 완료되었습니당");
		}
		return "redirect:/admin/questionlist?pageNum=" + cri.getPageNum() + "&amount=" + cri.getAmount();
	}

	@PostMapping(value = "/new", consumes = "application/json", // 흡수
			produces = "application/text; charset=utf-8") // 처리, 진행
	public ResponseEntity<String> answerwrite(@RequestBody AnswerVO avo) {// JSON을 @RequestBody로 받아서 cvo에 저장

		log.info(">>> content" + avo.getContent());
		log.info(">>>qno" + avo.getQno());
		log.info(">>>writer" + avo.getWriter());
		int isOk = ansv.regist(avo);
		/*
		 * if(isOk==1) { return new ResponseEntity<>("댓글이 등록 되었습니다!", HttpStatus.OK);
		 * }else { return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); }
		 */
		return isOk == 1 ? new ResponseEntity<>("댓글이 등록 되었습니다!", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/list/{qno}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE }) // 보낼 타입의 데이터 형식을맞춤
	public ResponseEntity<List<AnswerVO>> answerlist(@PathVariable("qno") int qno) {
		ArrayList<AnswerVO> aList = (ArrayList<AnswerVO>) ansv.getlist(qno);
		return new ResponseEntity<List<AnswerVO>>(ansv.getlist(qno), HttpStatus.OK); // 뽑아온 리스트를 json데이터타입으로 반환함
	}

	@DeleteMapping(value = "/{ano}", produces = "application/text; charset=utf-8") // 삭제는 cno만받고 메세지넘기면되서 json필요없음
	public ResponseEntity<String> answerremove(@PathVariable("ano") int ano) {
		return ansv.remove(ano) == 1 ? new ResponseEntity<>(ano + "번 댓글을 삭제하였습니다", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}


	@GetMapping("/pquestionlist")
	   public void pquestionlist(Model model, Criterion cri) {// @RequestParam("pno")int pno
		// test pno
		int testpno = 6;
	      PQuestionDTO list1 = pqsv.getlist(cri, testpno);
	      model.addAttribute("pqList", list1.getPqlist());
	      List<PQuestionVO>slist=pqsv.getsList();
	      model.addAttribute("sList", slist);
	      model.addAttribute("pgvo", new PagingVO(list1.getPqCnt(), cri));
	   }

	@GetMapping("/pquestiondetail")
	public void pquestiondetail(@RequestParam("pqno") int pqno, Model model, Criterion cri) {
		int pno = 1;
		PQuestionDTO list = pqsv.getlist(cri, pno);
		model.addAttribute("pqList", list.getPqlist());
		PQuestionVO pqvo = pqsv.getPQuestion(pqno);
		model.addAttribute("pqvo", pqvo);
		model.addAttribute("pgvo", new PagingVO(list.getPqCnt(), cri));
	}
	
	@RequestMapping("/pquestionremove")
	public String pquestionremove(@RequestParam("pqno") int pqno, RedirectAttributes reAttr, Criterion cri) {
		int isRm = pqsv.remove(pqno);
		if (isRm > 0) {
			reAttr.addFlashAttribute("pSign", "삭제가 완료되었습니당");
		}
		return "redirect:/admin/pquestionlist?pageNum=" + cri.getPageNum() + "&amount=" + cri.getAmount();
	}
	
	@PostMapping(value = "/panswernew", consumes = "application/json", // 흡수
			produces = "application/text; charset=utf-8")
	public ResponseEntity<String> panswerwrite(@RequestBody PAnswerVO pavo){
		
		int isOk=pasv.regist(pavo);
		return isOk==1? new ResponseEntity<>("댓글이 등록 되었습니다!", HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/panswerlist/{pqno}",
			produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})		
	public ResponseEntity<List<PAnswerVO>>panswerlist(@PathVariable("pqno")int pqno){
		ArrayList<PAnswerVO>paList=(ArrayList<PAnswerVO>)pasv.getlist(pqno);
		return new ResponseEntity<List<PAnswerVO>>(pasv.getlist(pqno), HttpStatus.OK);
		
	}
	
	@DeleteMapping(value="/panswerremove/{pano}",produces = "application/text; charset=utf-8") 
	public ResponseEntity<String> panswerremove(@PathVariable("pano")int pano){
	return pasv.remove(pano) ==1 ?
	new ResponseEntity<>(pano+"번 댓글을 삭제하였습니다",HttpStatus.OK)
	:new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
		// 제품 목록
		@GetMapping("/plist")
		public void plist(Model model, Criterion cri) {
			cri.setAmount(10);
			String where = "";
			String where2 = "";
			if(cri.getKeyword() != null) {
				where = "and (tp.pname like '%" + cri.getKeyword() + "%' or tt.tname like '%" + cri.getKeyword() + "%')";
				where2 = "tp join tbl_tag tt on tp.tno = tt.tno where pname like '%" + cri.getKeyword() + "%' or tname like '%" + cri.getKeyword() + "%' ";
			}
			model.addAttribute("pList", psv.getSList(cri, where));
			int totalCount = psv.getTotalCount("pno", "tbl_product", where2);
			model.addAttribute("pgvo", new PagingVO(totalCount, cri));
		}
	   // 제품 등록 - Get
	   @GetMapping("/pregister")
	   public void pregister(Model model) {
	      model.addAttribute("cateList", psv.getCateList());
	   }
	   // 제품 등록 - Post
	   @PostMapping("/pregister")
	   public String write(MultipartHttpServletRequest multiReq, RedirectAttributes reAttr) {
	      log.info(multiReq.getParameter("imgfile"));
	      ProductVO pvo = fp.fileSave(multiReq);
	      int isIn = asv.pregister(pvo);
	      return "redirect:/admin/plist";
	   }
	   // 제품 수정 - Get
	   @GetMapping("/pmodify")
	   public void pmodify(@RequestParam("pno")int pno, Model model, Criterion cri) {
	      ProductVO pvo = psv.getProduct(pno);
	      
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
	      model.addAttribute("cateList", psv.getCateList());
	      model.addAttribute("tList", tList);
	   }
	   // 제품 수정 - Post
	   @PostMapping("/pmodify")
	   public String modify(MultipartHttpServletRequest multiReq, Criterion cri, RedirectAttributes reAttr) {
	      int isUp = asv.pmodify(fp.fileModify(multiReq));
	      reAttr.addAttribute("keyword", cri.getKeyword());
	      return "redirect:/admin/plist?&pageNum="+cri.getPageNum()
	            +"&amount="+cri.getAmount()
	            +"&type="+cri.getType();
	   }
	   // 제품 제거
	   @GetMapping("/premove")
	   public String remove(@RequestParam("pno") int pno, @RequestParam("img") String img, 
	         RedirectAttributes reAttr, Criterion cri) {
	      fp.removeFile(img);
	      int isRm = asv.premove(pno);

	      if (isRm > 0) {
	         reAttr.addFlashAttribute("pSign", "삭제가 완료되었습니다");
	      }
	      reAttr.addAttribute("keyword", cri.getKeyword());
	      return "redirect:/admin/plist?&pageNum="+cri.getPageNum()
	      +"&amount="+cri.getAmount()
	      +"&type="+cri.getType();
	   }
	   // 후기 리스트 출력
	   @GetMapping("/rlist")
	   public void rlist (Model model, Criterion cri, int rate) {
	      cri.setAmount(10);
	      String where = "";
	      String where2 = "";
	      if(rate != 0) {
	         where = "and rate = '" + rate + "' ";
	         where2 = "where rate = '" + rate + "' ";
	      }
	      
	      model.addAttribute("rList", asv.getrList(cri, where));
	      int totalCount = psv.getTotalCount("rno", "tbl_review", where2);
	      model.addAttribute("pgvo", new PagingVO(totalCount, cri));
	      model.addAttribute("rate", rate);
	   }
	}

/********************************************************************
1. Title: 

2. Author: 

3. Revision history
 

*****************************************************************/