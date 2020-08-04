package com.myweb.ctrl;

import java.util.List;

import javax.inject.Inject;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ctc.wstx.shaded.msv_core.verifier.regexp.REDocumentDeclaration;
import com.myweb.domain.Criterion;
import com.myweb.domain.PagingVO;
import com.myweb.domain.QuestionVO;
import com.myweb.service.QuestionService;
import com.myweb.util.FileProcessor;

@Controller
@RequestMapping("/question/*")
public class QuestionCtrl {
	private static Logger logger = LoggerFactory.getLogger(QuestionCtrl.class);

	@Inject FileProcessor fp;
	
	@Inject
	QuestionService qsv;
	
	@GetMapping("/list")
	public void list(Model model, Criterion cri) {
		List<QuestionVO>list=qsv.getList(cri);
		model.addAttribute("qList", list);
		List<QuestionVO>slist=qsv.getsList();
		model.addAttribute("sList", slist);
		int totalCount=qsv.getTotalCount();
		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
	}
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String write(MultipartHttpServletRequest multiReq, RedirectAttributes reAttr) {
		/*
		 * if(qvo.getImg()==null) { qvo.setImg("NONE"); } qsv.regist(qvo);
		 */
		qsv.regist(fp.QuestionSave(multiReq));
		return "redirect:/question/list";
	}
	
	@GetMapping("/detail")
	public void detail(@RequestParam("qno")int qno, Model model, @ModelAttribute("cri")Criterion cri) {
		QuestionVO qvo=qsv.getQuestion(qno);
		model.addAttribute("qvo", qvo);
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("img")String img, @RequestParam("qno")int qno, RedirectAttributes reAttr) {
		int isRm=fp.QuestionRemove(img);
		isRm=qsv.remove(qno);
		if(isRm>0) {
			reAttr.addFlashAttribute("pSign","삭제가 완료되었습니당");
		}
		return "redirect:/question/list";
	}
}
