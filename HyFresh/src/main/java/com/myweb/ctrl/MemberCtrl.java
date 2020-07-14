package com.myweb.ctrl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.domain.PagingVO;
import com.myweb.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberCtrl {
	private static Logger log = LoggerFactory.getLogger(MemberCtrl.class);
	
	@Inject
	MemberService msv;
	
	@GetMapping("/join")
	public void join() {
	}
	
	@PostMapping("/join")
	public String join(MemberVO mvo) {
		int isOk = msv.register(mvo);
		log.debug(">>> isOk : " + isOk);
		log.debug(isOk==1? "Register Success" : "Register Fail");
		return "redirect:/";
	}
	
	@ResponseBody
	@GetMapping("/checkDuple")
	public String emailCheck(@RequestParam("email") String email) {
		int isExt = msv.checkDuple(email);
		return isExt == 1 ? "1" : "0";
	}
	
	@GetMapping("/login")
	public void login() {
	}
	
	@PostMapping("/login")
	public String login(MemberVO mvo, HttpSession ses) {
		MemberVO mInfo = msv.login(mvo);
		if (mInfo != null) {
			ses.setAttribute("mInfo", mInfo);
			ses.setMaxInactiveInterval(60*30); // 30 mins.
		}
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession ses) {
		ses.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/list")
	public void list(Model model, Criterion cri) {
		List<MemberVO> list = msv.getList(cri);
		model.addAttribute("mList", list);
		int totalCount = msv.getTotalCount(cri);
		model.addAttribute("pgvo", new PagingVO(totalCount, cri));
	}
	
	@GetMapping({"/detail","/modify"})
	public void detail(@RequestParam("email") String email, Model model, @ModelAttribute("cri") Criterion cri) {
		MemberVO mvo = msv.getInfo(email);
		model.addAttribute("mvo", mvo);
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO mvo, Model model) {
		int isUp = msv.modify(mvo);
		if (isUp > 0) {
			model.addAttribute("mvo", mvo);
		}
		return "redirect:/member/detail?email=" + mvo.getEmail();
	}
	
	@GetMapping("/resign")
	public String resign(@RequestParam("email") String email, @RequestParam("ses") String ses_email, RedirectAttributes reAttr, HttpSession ses) {
		int isRm = msv.resign(email);
		String redirect = "";
		if (isRm > 0) {
			if (ses_email.equals("admin@admin.com")) {
				redirect = "redirect:/member/list";
			} else if (email.equals(ses_email)) {
				ses.invalidate();
				redirect = "redirect:/"; 
			}
			reAttr.addFlashAttribute("msg",  "회원탈퇴가 완료되었습니다");
		}
		return redirect;
	}
}
