package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.domain.CartVO;
import com.myweb.domain.CategoryVO;
import com.myweb.domain.Criterion;
import com.myweb.domain.CustomDTO;
import com.myweb.domain.OrderVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.ReviewDTO;
import com.myweb.domain.ReviewVO;
import com.myweb.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
   private static Logger log = LoggerFactory.getLogger(ProductServiceImpl.class);
   
   @Inject
   ProductDAO pdao;

   @Override
   public List<ProductVO> getList(Criterion cri, String where) {
      return pdao.getList(cri, where);
   }
   
   @Override
   public Object getNewList(Criterion cri, String where) {
      return pdao.getNewList(cri, where);
   }

   @Override
   public ReviewDTO listReview(Criterion cri, int pno) {
      List<ReviewVO> list = pdao.listReview(cri, pno);
      int rvwCnt = pdao.getTotalCount("pno", "tbl_review", "where pno = '"+ pno +"'");
      ReviewDTO rdto = new ReviewDTO(rvwCnt, list);
      return rdto;
   }

   @Override
   public int addReview(ReviewVO rvo) {
      return pdao.addReview(rvo);
   }

   @Override
   public int modifyReview(ReviewVO rvo) {
      return pdao.modifyReview(rvo);
   }

   @Override
   public int deleteReview(int rno) {
      return pdao.deleteReview(rno);
   }
   
   @Transactional(isolation = Isolation.READ_COMMITTED)
   @Override
   public ProductVO getProduct(int pno) {
      pdao.updateReadCnt(pno);
      return pdao.getProduct(pno);
   }

   @Override
   public ReviewVO getStar(int pno) {
      return pdao.getStar(pno);
   }
   
   @Override
   public List<ProductVO> getSameList(Criterion cri, String where, int pno) {
      return pdao.getSameList(cri, where, pno);
   }
   
   @Override
   public CustomDTO getCustomList(Criterion cri, String where1, String where2, int pno) {
      List<ProductVO> list = pdao.getCustomList(cri, " and "+ where1, where2, pno);
      String where = "tp join tbl_tag tt on tp.tno = tt.tno" + where2 +"and ( "+ where1 +" ) ";
      int customCnt = pdao.getTotalCount("pno", "tbl_product", where);
      CustomDTO cdto = new CustomDTO(customCnt, list);
      return cdto;
   }
   

   @Override
   public int getTotalCount(String count, String db, String where) {
      return pdao.getTotalCount(count, db, where);
   }

   
   @Override
   public List<ProductVO> listCart(Criterion cri, int mno) {
      return pdao.listCart(cri, mno);
   }

   @Override
   public int addCart(CartVO cvo) {
      return pdao.addCart(cvo);
   }

   @Override
   public int modifyCart(CartVO cvo) {
      return pdao.modifyCart(cvo);
   }

   @Override
   public int deleteCart(CartVO cvo) {
      return pdao.deleteCart(cvo);
   }

   @Override
   public List<OrderVO> listOrder(int mno) {
      return pdao.listOrder(mno);
   }

   @Override
   public int insertOrder(OrderVO ovo) {
      return pdao.insertOrder(ovo);
   }

   @Override
   public int modifyOrder(OrderVO ovo, int status) {
      return pdao.modifyOrder(ovo, status);
   }

   @Override
   public List<CategoryVO> getCateList() {
      return pdao.getCateList();
   }
   
   @Override
   public List<ProductVO> getSList(Criterion cri, String where) {
      return pdao.getSList(cri, where);
   }
}