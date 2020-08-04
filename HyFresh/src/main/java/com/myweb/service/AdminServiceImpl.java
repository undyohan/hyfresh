package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.domain.CategoryVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.domain.OrderDetailVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.ReviewVO;
import com.myweb.domain.TagVO;
import com.myweb.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	private static Logger log = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	AdminDAO adao;

	@Override
	public List<MemberVO> getListMember(Criterion cri) {
		return adao.selectMList(cri);
	}
	
	@Override
	public List<MemberVO> getListManager(Criterion cri) {
		return adao.selectManagerList(cri);
	}
	
	@Override
	public List<MemberVO> getListResignM(Criterion cri) {
		return adao.selectResignMList(cri);
	}
	
	@Transactional
	@Override
	public int modifyMember(MemberVO mvo) {
		adao.updateAddr(mvo.getAddr(), mvo.getAddrno());
		return adao.updateMember(mvo);
	}

	@Override
	public int resignMember(int mno) {
		return adao.resignMember(mno);
	}

	@Override
	public int deleteMember(int mno) {
		return adao.deleteMember(mno);
	}

	@Override
	public int getTotalMCount(Criterion cri) {
		return adao.selectTotalMCount(cri);
	}
	
	@Override
	public int getTotalManagerCount(Criterion cri) {
		return adao.selectTotalManagerCount(cri);
	}

	@Override
	public int getTotalResignCount(Criterion cri) {
		return adao.selectTotalResignCount(cri);
	}
	
	@Override
	public int getTotalPCount(Criterion cri) {
		return adao.selectTotalPCount(cri);
	}

	@Override
	public int addCategory(CategoryVO catevo) {
		return adao.insertCategory(catevo);
	}

	@Override
	public List<CategoryVO> getCateList(Criterion cri) {
		return adao.selectCateList(cri);
	}
	
	@Override
	public CategoryVO getCateDetail(int cateno) {
		return adao.selectCateDetail(cateno);
	}

	@Override
	public int modifyCate(CategoryVO catevo) {
		return adao.updateCategory(catevo);
	}
	
	@Override
	public int removeCate(int cateno) {
		return adao.deleteCategory(cateno);
	}
	
	@Override
	public int getOrderCount() {
		return adao.selectOrderCount();
	}

	@Override
	public int getOrderSale() {
		return adao.selectOrderSale();
	}
	
	/********************************************************************
	1. Title: AdminServiceImpl

	2. Author: 이준우

	3. Revision history
	 2020-07-29 14:26  이준우 최초 정리
	 2020-07-30 10:07 이준우 후기 리스트

	*****************************************************************/
	@Override
	public int pregister(ProductVO pvo) {
		if(pvo.getTname() != null) {
			int tCount = adao.selectTag(pvo.getTname());
			int tno;
			if(tCount > 0) {
			}else {
				adao.insertTag(pvo.getTname());
			}
			tno = adao.getTno(pvo.getTname());
			pvo.setTno(tno);
		}
		return adao.insertProduct(pvo);
	}

	@Override
	public int pmodify(ProductVO pvo) {
		if(pvo.getTname() != null) {
			int tCount = adao.selectTag(pvo.getTname());
			int tno;
			if(tCount > 0) {
			}else {
				adao.insertTag(pvo.getTname());
			}
			tno = adao.getTno(pvo.getTname());
			pvo.setTno(tno);
		}
		return adao.updateProduct(pvo);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public int premove(int pno) {
		int result = adao.deleteProduct(pno); 
		/* adao.deleteTag(pno); */
		return result;
	}
	
	@Override
	public ProductVO getProduct(int pno) {
		return adao.selectProduct(pno);
	}

	@Override
	public List<ReviewVO> getrList(Criterion cri, String where) {
		return adao.getrList(cri, where);
	}
	
	@Override
	public List<OrderDetailVO> getOrderListStatus(Criterion cri, int status) {
		return adao.getOrderListStatus(cri, status);
	}
}
