package com.myweb.persistence;

import java.util.List;

import com.myweb.domain.CategoryVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.TagVO;

public interface AdminDAO {
	public List<MemberVO> selectMList(Criterion cri);
	public List<MemberVO> selectResignMList(Criterion cri);
	public int updateMember(MemberVO mvo);
	public int resignMember(int mno);
	public int deleteMember(int mno);
	public int insertProduct(ProductVO pvo);
	public int updateProduct(ProductVO pvo);
	public int deleteProduct(int pno);
	public List<ProductVO> selectPList(Criterion cri);
	public ProductVO selectProduct(int pno);
	public int selectTotalMCount(Criterion cri);
	public int selectTotalResignCount(Criterion cri);
	public int selectTotalPCount(Criterion cri);
	public List<TagVO> selectTagList(Criterion cri);
	public int insertCategory(CategoryVO catevo);
	public List<CategoryVO> selectCateList();
	public CategoryVO selectCateDetail(int cateno);
	public int updateCategory(CategoryVO catevo);
	public int deleteCategory(int cateno);
	public int selectOrderCount();
	public int selectOrderSale();
	public int updateAddr(String addr, int addrno);
	
}
