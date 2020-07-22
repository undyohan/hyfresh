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
import com.myweb.domain.ProductVO;
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
	public int registProduct(ProductVO pvo) {
		return adao.insertProduct(pvo);
	}

	@Override
	public int modifyProduct(ProductVO pvo) {
		return adao.updateProduct(pvo);
	}

	@Override
	public int removeProduct(int pno) {
		return adao.deleteProduct(pno);
	}
	
	@Override
	public List<ProductVO> getListProduct(Criterion cri) {
		return adao.selectPList(cri);
	}

	@Override
	public ProductVO getProduct(int pno) {
		return adao.selectProduct(pno);
	}
	
	@Override
	public int getTotalMCount(Criterion cri) {
		return adao.selectTotalMCount(cri);
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
	public List<TagVO> getTagList(Criterion cri) {
		return adao.selectTagList(cri);
	}


	@Override
	public int addCategory(CategoryVO catevo) {
		return adao.insertCategory(catevo);
	}

	@Override
	public List<CategoryVO> getCateList() {
		return adao.selectCateList();
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

}
