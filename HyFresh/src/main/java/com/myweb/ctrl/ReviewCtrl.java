package com.myweb.ctrl;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myweb.domain.Criterion;
import com.myweb.domain.ReviewDTO;
import com.myweb.domain.ReviewVO;
import com.myweb.service.MemberService;
import com.myweb.service.ProductService;
import com.myweb.util.FileProcessor;

@RestController
@RequestMapping("/review/**")
public class ReviewCtrl {
	private static Logger log = LoggerFactory.getLogger(ReviewCtrl.class);
	
	@Inject
	ProductService psv;
	
	@Inject
	MemberService msv;

	/********************************************************************
	1. Title: ReviewCtrl

	2. Author: 이준우

	3. Revision history
	 2020-07-29 14:26  이준우 최초 정리
	 2020-07-29 16:11 이준우 리뷰 작성 추가

	*****************************************************************/
	
	// 각 제품에 맞는 리뷰 리스트 출력
	@GetMapping(value = "/list/{pno}/{page}", produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReviewDTO> list(@PathVariable("pno") int pno, @PathVariable("page") int page) {
//		ArrayList<CommentVO> cList = (ArrayList<CommentVO>) csv.getList(pno);
		Criterion cri = new Criterion(10, page);
		return new ResponseEntity<ReviewDTO>(psv.listReview(cri, pno), HttpStatus.OK);
	}
}