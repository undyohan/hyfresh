package com.myweb.ctrl;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.domain.ProductVO;
import com.myweb.domain.AddressVO;
import com.myweb.domain.MemberVO;
import com.myweb.persistence.AdminDAO;
import com.myweb.persistence.MemberDAO;
import com.myweb.persistence.ProductDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DummyInsert {
	private static Logger log = LoggerFactory.getLogger(DummyInsert.class);

//	@Inject 
//	private ProductDAO pdao;

	@Inject
	private MemberDAO mdao;

//	@Inject
//	private CommentDAO cdao;

//	@Inject
//	private AdminDAO adao;

//	@Test
//	public void insertAddressDummy() {
//		for (int i = 0; i < 70; i++) {
//			AddressVO avo = new AddressVO();
//			avo.setAddr("서울시 별빛 " + i + "동");
//			avo.setAddrname("집");
//			avo.setAddrno(i);
//			avo.setMno(i + (int) Math.random() * 200);
//			avo.setReceiver("희수쨩");
//			avo.setTel("010" + i + i + i);
//			adao.insertAddr(avo);
//		}
//	}

//	@Test
//	public void insertProductDummy() {
//		for (int i = 0; i < 255; i++) {
//			ProductVO pvo = new ProductVO();
//			pvo.setTitle(i + "번째 상품명");
//			pvo.setWriter("admin@admin.com");
//			pvo.setContent(i + "번째 상풍 상세 정보");
//			pvo.setPrice(i+10000);
//			pvo.setImgfile("NONE");
//			pdao.insertProduct(pvo);
//		}
//	}

	@Test
	public void insertMemberDummy() {
		for (int i = 0; i < 100; i++) {
			MemberVO mvo = new MemberVO();
			mvo.setEmail("heezzang" + i + "@world.com");
			mvo.setPwd("111");
			mvo.setName("희짱이" + i);
			mvo.setAddr("집");
			mvo.setTel("010"+i+i+i);
			mvo.setBirth("2020-07-01");
			mvo.setAddrno(9);
			mvo.setGrade(12);
			mvo.setPoint(500);
			mdao.insertMember(mvo);
		}
	}

//	@Test
//	public void insertCommentDummy() {
//		for (int i = 255; i > 0; i--) {
//			int rnum = (int)(Math.random()*128);
//			for (int j = 1; j < rnum; j++) {
//				CommentVO cvo = new CommentVO();
//				cvo.setPno(i);
//				cvo.setContent(j + "번째 댓글 테스트");
//				cvo.setWriter("tester"+j+"@tester.com");
//				cdao.insertComment(cvo);
//			}
//		}
//	}

	/*
	 * @Test public void insertProductDummy() { for (int i = 0; i < 255; i++) {
	 * ProductVO pvo = new ProductVO(); pvo.setPname(i + "번째 상품명");
	 * pvo.setContent(i+"번째 상품 상세 정보"); pvo.setPrice(i+10000); pvo.setImg("NONE");
	 * pdao.insertProduct(pvo); } } }
	 */
}
