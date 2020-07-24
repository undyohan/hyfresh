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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.AddressVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.domain.PagingVO;
import com.myweb.service.AddressService;
import com.myweb.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberCtrl {
	private static Logger log = LoggerFactory.getLogger(MemberCtrl.class);
	
	@Inject
	MemberService msv;
	
	@Inject
	AddressService asv;
	
	// 패스워드 암호화를 위한 Inject
//	@Autowired
//	BCryptPasswordEncoder bcPwdEnc;
	
	@GetMapping("/join")
	public void join() {
	}
	
	@PostMapping("/join")
	public String join(MemberVO mvo) {
		// 암호화 없는 메서드
		int isOk = msv.register(mvo);
		// 패스워드 암호화
//		String encPwd = bcPwdEnc.encode(mvo.getPwd());
//        mvo.setPwd(encPwd);
//        int isOk = msv.register(mvo);
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
	public void login() {}
	
	@PostMapping("/login")
	public String login(MemberVO mvo, HttpSession ses) {
//		String encPwd = bcPwdEnc.encode(mvo.getPwd());
		MemberVO mInfo = msv.login(mvo);
		ses.setAttribute("mInfo", mInfo);
		ses.setMaxInactiveInterval(60*30); // 30 mins.
//		if (mInfo != null) {
//			// 암호화 패스워드 매치
//			if (bcPwdEnc.matches(mvo.getPwd(), encPwd)) {
//				ses.setAttribute("mInfo", mInfo);
//				ses.setMaxInactiveInterval(60*30); // 30 mins.
//			}
//		}
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession ses) {
		ses.invalidate();
		return "redirect:/";
	}
	
	// 회원관리
		@GetMapping("/list")
		public void list(Model model, Criterion cri) {
			List<MemberVO> list = msv.getList(cri);
			model.addAttribute("mList", list);
			int totalCount = msv.getTotalCount(cri);
			model.addAttribute("pgvo", new PagingVO(totalCount, cri));
		}
		
		@GetMapping({"/detail","/modify","/mypage"})
		public void detail(@RequestParam("mno") int mno, Model model, @ModelAttribute("cri") Criterion cri) {
			MemberVO mvo = msv.getInfo(mno);
			model.addAttribute("mvo", mvo);
		}
		
		// 회원정보 수정
		@PostMapping("/modify")
		public String modify(MemberVO mvo, Model model, RedirectAttributes reAttr) {
			// Addrno에 데이터가 없으면 주소 등록시 회원주소를 기본배송지로 등록
			List<AddressVO> list = asv.getList(mvo.getMno());
			if (list.size() == 0) {
				asv.firstAddr(mvo);
			}
			int isUp = msv.modify(mvo);
			if (isUp > 0) {
				model.addAttribute("mvo", mvo);
				reAttr.addFlashAttribute("msg", "회원정보가 수정되었습니다.");
			}
			return "redirect:/member/mypage?mno="+ mvo.getMno();
		}
		
		// 탈퇴페이지 이동
		@GetMapping("/resign")
		public void resign() {
		}
		
		// 탈퇴
		@GetMapping("/updateresign")
		public String updateresign(@RequestParam("email") String email, @RequestParam("ses") String ses_email, RedirectAttributes reAttr, HttpSession ses) {
			int isRm = msv.updateResign(email);
			String redirect = "";
			if (isRm > 0) {
				if (ses_email.equals("admin@admin.com")) {
					reAttr.addFlashAttribute("msg", "최고 관리자는 탈퇴할 수 없습니다");
				} else if (email.equals(ses_email)) {
					ses.invalidate();
					redirect = "redirect:/"; 
					reAttr.addFlashAttribute("msg", "회원탈퇴가 완료되었습니다");
				}
			}
			return redirect;
		}
		
		// 배송지 관리
		@GetMapping("/addr")
		public void detail(@RequestParam("mno") int mno, Model model) {
			List<AddressVO> aList = asv.getList(mno);
			model.addAttribute("aList", aList);
			MemberVO mvo = msv.getInfo(mno);
			model.addAttribute("mvo", mvo);
		}
		
		// 배송지주소 추가
		@PostMapping("/addaddr")
		public String addr(AddressVO avo, Model model) {
			int isUp = asv.add(avo);
			if (isUp > 0) {
				model.addAttribute("avo", avo);
			}
			return "redirect:/member/addr?mno=" + avo.getMno();
		}
		
		// 배송지 수정
		@PostMapping("/modifyaddr")
		public String modifyaddr(AddressVO avo, Model model) {
			int isUp = asv.modify(avo);
			if (isUp > 0) {
				model.addAttribute("avo", avo);
			}
			return "redirect:/member/addr?mno=" + avo.getMno();
		}
		
		// 배송지 삭제
		@GetMapping("/removeaddr")
		public String removeaddr(AddressVO avo, Model model) {
			asv.remove(avo);
			return "redirect:/member/addr?mno=" + avo.getMno();
		}
		
		// 기본 배송지로 설정
		@GetMapping("/chooseaddr")
		public String chooseaddr(AddressVO avo, Model model) {
			int mno = avo.getMno();
			int addrno = avo.getAddrno();
			MemberVO mvo = new MemberVO(mno, addrno);
			msv.chooseaddr(mvo);
			model.addAttribute("mvo", mvo);
			return "redirect:/member/addr?mno=" + avo.getMno();
		}
}
