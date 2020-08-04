package com.myweb.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.PAnswerVO;
import com.myweb.service.PAnswerService;

@RestController
@RequestMapping("/panswer/**")
public class PAnswerCtrl {
	private static Logger logger = LoggerFactory.getLogger(PAnswerCtrl.class);

	@Inject
	PAnswerService pasv;
	
	
	
	@PostMapping(value = "/new", consumes = "application/json", // 흡수
			produces = "application/text; charset=utf-8")
	public ResponseEntity<String> write(@RequestBody PAnswerVO pavo){
		int isOk=pasv.regist(pavo);
		return isOk==1? new ResponseEntity<>("댓글이 등록 되었습니다!", HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/list/{pqno}",
			produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})		
	public ResponseEntity<List<PAnswerVO>>list(@PathVariable("pqno")int pqno, PAnswerVO pavo, Model model){
		ArrayList<PAnswerVO>paList=(ArrayList<PAnswerVO>)pasv.getlist(pqno);

		return new ResponseEntity<List<PAnswerVO>>(pasv.getlist(pqno), HttpStatus.OK);
		
	}
	@DeleteMapping(value="/{pano}",produces = "application/text; charset=utf-8") 
	public ResponseEntity<String> remove(@PathVariable("pano")int pano){
	return pasv.remove(pano) ==1 ?
	new ResponseEntity<>(pano+"번 댓글을 삭제하였습니다",HttpStatus.OK)
	:new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
