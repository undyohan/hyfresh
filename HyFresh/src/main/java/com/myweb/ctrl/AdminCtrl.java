package com.myweb.ctrl;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.Criterion;
import com.myweb.service.AdminService;
import com.myweb.service.MemberService;
import com.myweb.service.ProductService;
import com.myweb.util.FileProcessor;

@Controller
@RequestMapping("/admin/*")
public class AdminCtrl {
	private static Logger log = LoggerFactory.getLogger(AdminCtrl.class);
	
	@Inject
	MemberService msv;
	
	@Inject
	ProductService psv;
	
	@Inject
	AdminService asv;
	
	@Inject
	FileProcessor fp;
	
	@GetMapping("/main")
	public void main() {
	}
	
	@GetMapping("/mlist")
	public void mlist() {
	}
	
	@GetMapping("/plist")
	public void plist() {
	}
	
	@GetMapping("/pregister")
	public void pregister() {
	}
	
	@PostMapping("/pregister")
	public String write(MultipartHttpServletRequest multiReq, RedirectAttributes reAttr) {
		/*
		 * if (pvo.getImgfile() == null) { pvo.setImgfile("NONE"); } int isIn =
		 * psv.register(pvo);
		 */
		int isIn = asv.pregister(fp.fileSave(multiReq));
		if(isIn > 0) {
			reAttr.addFlashAttribute("pSign", "상품등록이 완료되었습니다.");
		}
		return "redirect:/product/list";
	}
	
	@GetMapping("/admindummy")
	public void admindummy() {
	}
	
	@PostMapping("/pmodify")
	public String modify(MultipartHttpServletRequest multiReq, Criterion cri, RedirectAttributes reAttr) {
		int isUp = asv.pmodify(fp.fileModify(multiReq));
		log.info(">>> check1 keyword : " + cri.getKeyword());
		reAttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/product/detail?pSign="+isUp+
				"&pno="+multiReq.getParameter("pno")
				+"&pageNum="+cri.getPageNum()
				+"&amount="+cri.getAmount()
				+"&type="+cri.getType();
	}
	
	@PostMapping("/premove")
	public String remove(@RequestParam("pno") int pno, @RequestParam("imgfile") String imgfile, 
			RedirectAttributes reAttr, Criterion cri) {
		fp.removeFile(imgfile);
		int isRm = asv.premove(pno);

		if (isRm > 0) {
			reAttr.addFlashAttribute("pSign", "삭제가 완료되었습니다");
		}
		reAttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/product/list?&pageNum="+cri.getPageNum()
				+"&amount="+cri.getAmount()
				+"&type="+cri.getType();
	}
}
