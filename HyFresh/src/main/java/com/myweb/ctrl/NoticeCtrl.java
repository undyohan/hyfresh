package com.myweb.ctrl;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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

import com.myweb.domain.Criterion;
import com.myweb.domain.NoticeVO;
import com.myweb.domain.PagingVO;
import com.myweb.service.NoticeService;
import com.myweb.util.FileProcessor;

@Controller
@RequestMapping("/notice/*")
public class NoticeCtrl {
	private static Logger logger = LoggerFactory.getLogger(NoticeCtrl.class);

	@Inject
	NoticeService nsv;

	@Inject
	FileProcessor fp;

	@GetMapping("/list")
	public void list(Model model, Criterion cri) {
		// model.addAttribute("pList", psv.getList());
		List<NoticeVO> list = nsv.getList(cri);
		model.addAttribute("nList", list);
		int totalCount = nsv.getTotalCount(cri);
		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
	}


	@GetMapping({ "/detail", "/modify" })
	public void detail(@RequestParam("nno") int nno, Model model, @RequestParam("pSign") int pSign,
			RedirectAttributes reAttr, @ModelAttribute("cri") Criterion cri) {
		NoticeVO nvo = nsv.getNotice(nno);
		model.addAttribute("nvo", nvo);
		if (pSign > 0) {
			reAttr.addFlashAttribute("pSign", "상품 수정이 완료되었심 ㅎㅎ");
		}
	}

	@PostMapping("/modify")
	public String modify(MultipartHttpServletRequest multiReq, Model model, Criterion cri, RedirectAttributes reAttr) {
		int isUp = nsv.modify(fp.NoticeModify(multiReq));
		reAttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/notice/detail?pSign=" + isUp + "&nno=" + multiReq.getParameter("nno") + "&pageNum="
				+ cri.getPageNum() + "&amount=" + cri.getAmount() + "&type=" + cri.getType();
	}

	/*
	 * @PostMapping("/remove") public String remove(@RequestParam("img")String
	 * img,@RequestParam("nno") int nno, RedirectAttributes reAttr, Criterion cri) {
	 * int isRm=fp.Noticeremove(img); isRm =nsv.remove(nno); if (isRm > 0) {
	 * reAttr.addFlashAttribute("pSign", "삭제가 완료되었습니다"); } String
	 * encodedKeyword=null; try { encodedKeyword=URLEncoder.encode(cri.getKeyword(),
	 * "UTF-8"); } catch (UnsupportedEncodingException e) { e.printStackTrace(); }
	 * return "redirect:/notice/list?pageNum="+cri.getPageNum()
	 * +"&amount="+cri.getAmount() +"&type="+cri.getType()
	 * +"&keyword="+encodedKeyword; }
	 */
}
