package com.myweb.ctrl;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.Criterion;
import com.myweb.domain.PQuestionDTO;
import com.myweb.domain.PQuestionVO;
import com.myweb.domain.PagingVO;
import com.myweb.domain.ProductVO;
import com.myweb.service.PQuestionService;

@Controller
@RequestMapping("/pquestion/*")
public class PQuestionCtrl {
	private static Logger logger = LoggerFactory.getLogger(PQuestionCtrl.class);

	@Inject
	PQuestionService pqsv;

	@PostMapping(value = "/new", consumes = "application/json", // 흡수
			produces = "application/text; charset=utf-8") // 처리, 진행
	public ResponseEntity<String> write1(@RequestBody PQuestionVO pqvo) {// JSON을 @RequestBody로 받아서 cvo에 저장

		int isOk = pqsv.regist(pqvo);
		/*
		 * if(isOk==1) { return new ResponseEntity<>("댓글이 등록 되었습니다!", HttpStatus.OK);
		 * }else { return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); }
		 */
		return isOk == 1 ? new ResponseEntity<>("상품문의가 등록 되었습니다!", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value="/list/{pno}/{page}",    
			produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})   //보낼 타입의 데이터 형식을맞춤
			public ResponseEntity<PQuestionDTO> list(@PathVariable("pno")int pno, @PathVariable("page")int page, PQuestionVO pqvo){
		Criterion cri= new Criterion(10, page); //페이지 정보추가
		return new ResponseEntity<PQuestionDTO>(pqsv.getlist(cri, pno), HttpStatus.OK); 
			}
	
	@GetMapping("/list")
	public void list(Model model, Criterion cri, @RequestParam("pno")int pno) {
		PQuestionDTO list1 = pqsv.getlist(cri, pno);
		model.addAttribute("pqList", list1.getPqlist());
		model.addAttribute("pgvo", new PagingVO(list1.getPqCnt(), cri));
	}

	@DeleteMapping(value="/{pqno}",produces = "application/text; charset=utf-8") //삭제는 cno만받고 메세지넘기면되서 json필요없음
	public ResponseEntity<String> remove(@PathVariable("pqno")int pqno){
	return pqsv.remove(pqno) ==1 ?
	new ResponseEntity<>(pqno+"번 댓글을 삭제하였습니다",HttpStatus.OK)
	:new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}

	
	@GetMapping("/write")
	public void write() {
	}

	@PostMapping("/write")
	public String write(PQuestionVO pqvo, ProductVO pvo, @RequestParam("pno")int pno) {// 
		logger.info(">>>>>>>>>1받아와라" + pqvo.getIsLock());
		pqsv.regist(pqvo);
		return "redirect:/pquestion/detail?pno="+pvo.getPno();
	}

	@GetMapping("/detail")
	public void detail(@RequestParam("pqno") int pqno, Model model, Criterion cri, @RequestParam("pno")int pno) {
		PQuestionDTO list = pqsv.getlist(cri, pno);
		model.addAttribute("pqList", list.getPqlist());
		PQuestionVO pqvo = pqsv.getPQuestion(pqno);
		model.addAttribute("pqvo", pqvo);
		model.addAttribute("pgvo", new PagingVO(list.getPqCnt(), cri));
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("pqno") int pqno, RedirectAttributes reAttr) {
		int isRm = pqsv.remove(pqno);
		if (isRm > 0) {
			reAttr.addFlashAttribute("pSign", "삭제가 완료되었습니당");
		}
		return "redirect:/pquestion/list";
	}
}
