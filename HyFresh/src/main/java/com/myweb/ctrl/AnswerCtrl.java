package com.myweb.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myweb.domain.AnswerVO;
import com.myweb.service.AnswerService;

@RestController
@RequestMapping("/answer/**")
public class AnswerCtrl {
	private static Logger logger = LoggerFactory.getLogger(AnswerCtrl.class);

	@Inject
	AnswerService asv;

	/*
	 * @PostMapping(value = "/new", consumes = "application/json", // 흡수 produces =
	 * "application/text; charset=utf-8") // 처리, 진행 public ResponseEntity<String>
	 * write(@RequestBody AnswerVO avo) {// JSON을 @RequestBody로 받아서 cvo에 저장
	 * 
	 * logger.info(">>> content" + avo.getContent()); logger.info(">>>qno" +
	 * avo.getQno()); logger.info(">>>writer" + avo.getWriter()); int isOk =
	 * asv.regist(avo);
	 * 
	 * if(isOk==1) { return new ResponseEntity<>("댓글이 등록 되었습니다!", HttpStatus.OK);
	 * }else { return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); }
	 * 
	 * return isOk == 1 ? new ResponseEntity<>("댓글이 등록 되었습니다!", HttpStatus.OK) : new
	 * ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); }
	 */

	@GetMapping(value = "/list/{qno}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE }) // 보낼 타입의 데이터 형식을맞춤
	public ResponseEntity<List<AnswerVO>> list(@PathVariable("qno") int qno) {
		ArrayList<AnswerVO> aList = (ArrayList<AnswerVO>) asv.getlist(qno);
		return new ResponseEntity<List<AnswerVO>>(asv.getlist(qno), HttpStatus.OK); // 뽑아온 리스트를 json데이터타입으로 반환함
	}

	/*
	 * @DeleteMapping(value = "/{ano}", produces =
	 * "application/text; charset=utf-8") // 삭제는 cno만받고 메세지넘기면되서 json필요없음 public
	 * ResponseEntity<String> remove(@PathVariable("ano") int ano) { return
	 * asv.remove(ano) == 1 ? new ResponseEntity<>(ano + "번 댓글을 삭제하였습니다",
	 * HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); }
	 */

}
