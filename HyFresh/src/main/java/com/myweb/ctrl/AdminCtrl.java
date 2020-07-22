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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.CategoryVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.domain.PagingVO;
import com.myweb.service.AdminService;
import com.myweb.util.FileProcessor;

@Controller
@RequestMapping("/admin/*")
public class AdminCtrl {
	private static Logger log = LoggerFactory.getLogger(AdminCtrl.class);
	
	@Inject
	AdminService asv;
	
	@Inject
	FileProcessor fp;
	
	@GetMapping("/main")
	public void main() {
	}
	
	@GetMapping("/mlist")
	public void mList(Model model, Criterion cri) {
		List<MemberVO> list = asv.getListMember(cri);
		model.addAttribute("mList", list);
		int mTotalCount = asv.getTotalMCount(cri);
		model.addAttribute("pgvo", new PagingVO(mTotalCount, cri));
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
		asv.addCategory(fp.fileSave(multiReq));
		return "redirect:/admin/catelist";
	}
	
	@GetMapping("/catelist")
	public void catelist(Model model) {
		List<CategoryVO> clist = asv.getCateList();
		model.addAttribute("cList", clist);
	}
	
	@GetMapping({"/catedetail", "/catemodify"})
	public void catedetail(@RequestParam("cateno") int cateno, Model model) {
		model.addAttribute("catevo", asv.getCateDetail(cateno));
	}
	
	@PostMapping("/catemodify")
	public String catemodify(MultipartHttpServletRequest multiReq) {
		asv.modifyCate(fp.fileModify(multiReq));
		return "redirect:/admin/catedetail?cateno="+multiReq.getParameter("cateno");
	}
	
	@PostMapping("/cateremove")
	public String remove(@RequestParam("cateno") int cateno,
			@RequestParam("iconfile") String iconfile, RedirectAttributes reAttr) {
		int isRm = fp.removeFile(iconfile);
		isRm = asv.removeCate(cateno);
		if(isRm > 0) {
			reAttr.addFlashAttribute("msg", "카테고리 삭제 완료");
		}
		return "redirect:/admin/catelist";
	}
}
