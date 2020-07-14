package com.myweb.ctrl;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.domain.MemberVO;
import com.myweb.persistence.MemberDAO;
import com.myweb.persistence.ProductDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DummyInsert {
	private static Logger log = LoggerFactory.getLogger(DummyInsert.class);
	
	@Inject
	private ProductDAO pdao;
	
	@Inject
	private MemberDAO mdao;
	
//	@Inject
//	private CommentDAO cdao;
	
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
		for (int i = 0; i < 200; i++) {
			MemberVO mvo = new MemberVO();
			mvo.setEmail("test" + i + "@test.com");
			mvo.setPwd("1234");
			mvo.setName("TESTER" + i);
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
}
