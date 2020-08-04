package com.myweb.ctrl;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myweb.domain.Criterion;
import com.myweb.domain.CustomDTO;
import com.myweb.service.ProductService;

@RestController
@RequestMapping("/custom/**")
public class CustomCtrl {
   private static Logger log = LoggerFactory.getLogger(CustomCtrl.class);
   
   @Inject
   ProductService psv;
   
   /********************************************************************
   1. Title: CustomCtrl

   2. Author: 이준우

   3. Revision history
    2020-07-29 14:26  이준우 최초 정리
    2020-07-29 16:43 이준우 맞춤 추천 조건문 수정

   *****************************************************************/
   // 맞춤 쇼핑 - 결과 출력 - ajax
   @GetMapping(value = "/list/{custom}/{tag}/{page}", produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
   public ResponseEntity<CustomDTO> List(@PathVariable(value = "custom", required = false) String custom, @PathVariable(value="tag", required = false) String tag, @PathVariable(value="page", required = false) int page) {
      String customTemp1 = custom.substring(0, 1);
      String customTemp2 = custom.substring(1);
      String where1 = "custom='"+ custom +"' or custom= '"+ customTemp1 + "a" + "' or custom= '" +  "0" +  customTemp1 + "' or custom='0a'";
      String where2 = " where tname like '%"+ tag + "%'";
      Criterion cri = new Criterion(10, page);
      return new ResponseEntity<CustomDTO>(psv.getCustomList(cri, where1, where2, 0), HttpStatus.OK);
   }
}