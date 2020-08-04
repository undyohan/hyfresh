package com.myweb.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myweb.domain.AddressVO;
import com.myweb.domain.CategoryVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.MemberVO;
import com.myweb.domain.OrderDetailVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.ReviewVO;
import com.myweb.domain.TagVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	private static Logger log = LoggerFactory.getLogger(AdminDAOImpl.class);
	private static String ns = "AdminMapper.";
	
	@Inject
	SqlSession sql;

	@Override
	public List<MemberVO> selectMList(Criterion cri) {
		return sql.selectList(ns + "mList", cri);
	}
	
	@Override
	public List<MemberVO> selectManagerList(Criterion cri) {
		return sql.selectList(ns + "managerList", cri);
	}

	@Override
	public List<MemberVO> selectResignMList(Criterion cri) {
		return sql.selectList(ns + "resignList", cri);
	}
	
	@Override
	public int updateMember(MemberVO mvo) {
		return sql.update(ns + "modifyMember", mvo);
	}
	
	@Override
	public int updateAddr(String addr, int addrno) {
		Map<String, String> map = new HashMap<>();
		map.put("addr", addr);
		map.put("addrno", String.valueOf(addrno));
		return sql.update(ns + "modifyMAddr", map);
	}
	
	@Override
	public int resignMember(int mno) {
		return sql.update(ns + "resignMember", mno);
	}

	@Override
	public int deleteMember(int mno) {
		return sql.delete(ns + "deleteMember", mno);
	}
	
	@Override
	public int selectTotalMCount(Criterion cri) {
		return sql.selectOne(ns + "totalMCount", cri);
	}

	@Override
	public int selectTotalManagerCount(Criterion cri) {
		return sql.selectOne(ns + "totalManagerCount", cri);
	}
	
	@Override
	public int selectTotalResignCount(Criterion cri) {
		return sql.selectOne(ns + "totalResignCount", cri);
	}

	@Override
	public int selectTotalPCount(Criterion cri) {
		return sql.selectOne(ns + "totalPCount", cri);
	}

	@Override
	public List<TagVO> selectTagList(Criterion cri) {
		return sql.selectList(ns + "tagList", cri);
	}

	@Override
	public int insertCategory(CategoryVO catevo) {
		return sql.insert(ns + "addCategory", catevo);
	}
	
	@Override
	public List<CategoryVO> selectCateList(Criterion cri) {
		return sql.selectList(ns + "cateList", cri);
	}
	
	@Override
	public CategoryVO selectCateDetail(int cateno) {
		return sql.selectOne(ns + "cateDetail", cateno);
	}
	
	@Override
	public int updateCategory(CategoryVO catevo) {
		return sql.update(ns + "modifyCategory", catevo);
	}
	
	@Override
	public int deleteCategory(int cateno) {
		return sql.delete(ns + "deleteCategory", cateno);
	}

	@Override
	public int selectOrderCount() {
		return sql.selectOne(ns + "orderCount");
	}

	@Override
	public int selectOrderSale() {
		return sql.selectOne(ns + "orderSale");
	}
	
	/********************************************************************
	1. Title: AdminDAOImpl

	2. Author: 이준우

	3. Revision history
	 2020-07-29 14:26  이준우 최초 정리
	 2020-07-30 10:07 이준우 후기 리스트

	*****************************************************************/
	
	@Override
	public int insertProduct(ProductVO pvo) {
		return sql.insert(ns+"register", pvo);
	}
	
	@Override
	public int updateProduct(ProductVO pvo) {
		return sql.insert(ns+"modifyProduct", pvo);
	}

	@Override
	public int deleteProduct(int pno) {
		return sql.delete(ns+"removeProduct", pno);
	}

	@Override
	public void insertTag(String tname) {
		sql.insert(ns+"insertTag", tname);
	}

	@Override
	public int selectTag(String tname) {
		return sql.selectOne(ns+"selectTag", tname);
	}

	@Override
	public void deleteTag() {
		sql.delete(ns+"deleteTag");
	}

	@Override
	public int getTno(String tname) {
		return sql.selectOne(ns+"getTno", tname);
	}

	@Override
	public List<ProductVO> selectPList(Criterion cri) {
		return sql.selectList(ns + "pList", cri);
	}

	@Override
	public ProductVO selectProduct(int pno) {
		return sql.selectOne(ns + "detailProduct", pno);
	}

	@Override
	public List<ReviewVO> getrList(Criterion cri, String where) {
		Map<String, Object> map = new HashMap<>();
		log.info(">>>>>>>>>>>>"+ cri.getPageNum());
		map.put("cri", cri);
		map.put("where", where);
		return sql.selectList(ns + "getrList", map);
	}
	
	@Override
	public List<OrderDetailVO> getOrderListStatus(Criterion cri, int status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("status", status);
		// 타입 검증
		boolean isWhat = map.get("status") instanceof Integer;
		log.info(">>> status instanceof : " + isWhat);
		log.info(">>> status : " + map.get("status"));
		return sql.selectList(ns + "getOrderListStatus", map);
	}
}
