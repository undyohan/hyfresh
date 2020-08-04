<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<style>
ul {
list-style: none;
}
ul:after {display:block; content: ''; clear: both;}
.checkA {
  background: url(/resources/img/icon_quick_order_input_radio.png) 0 0 no-repeat !important;
}
.checkS {
  background: url(/resources/img/icon_quick_order_input_radio.png) 0 0 no-repeat !important;
}
.checkS2 {
  border: 1px solid #009edb !important;
  color: #009edb;
  font-weight: bold;
}
.checkSi {
  border: 1px solid #009edb !important;
  color: #009edb;
  font-weight: bold;
}
</style>
<form action="/product/custom" id="c-form" method="post">
<input type="hidden" name="custom" id="custom" value="">
<div class="container-fluid" style="background-color: #f2f2f2;">
<div class="container" style="text-align:center;">
  <h3 style="line-height:64px">내게 맞는제품 찾기</h3>
  <p>정보를 선택하시면 고객님께 제품을 추천해 드립니다.</p>
  <div class="container">
    <h4 style="font-weight: bold; margin-bottom: 15px">연령대 선택</h4>
    <ul style="display: table; margin: 0 auto; text-align: center; padding:0">
      <li class="text-center" style="float:left; padding: 0 40px; text-align: center; background: url(/resources/img/bg_find_age_select.gif) 50% 13px repeat-x;">
      <div class="ageDiv" style="display: flex; justify-content: center; cursor: pointer;">
        <div class="innerAgeDiv" style="background: url(/resources/img/icon_quick_order_input_radio.png) 0 -70px no-repeat; width: 30px; height: 30px;">
         <input type="radio" name="custom1" value="1" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>10대 이하</span>
      </li>
      <li class="text-center" style="float:left; padding: 0 40px; text-align: center; background: url(/resources/img/bg_find_age_select.gif) 100% 13px repeat-x;">
      <div class="ageDiv" style="display: flex; justify-content: center; cursor: pointer;">
        <div class="innerAgeDiv" style="background: url(/resources/img/icon_quick_order_input_radio.png) 0 -70px no-repeat; width: 30px; height: 30px;">
         <input type="radio" name="custom1" value="2" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>20대</span>
      </li>
      <li class="text-center" style="float:left; padding: 0 40px; text-align: center; background: url(/resources/img/bg_find_age_select.gif) 100% 13px repeat-x;">
      <div class="ageDiv" style="display: flex; justify-content: center; cursor: pointer;">
        <div class="innerAgeDiv" style="background: url(/resources/img/icon_quick_order_input_radio.png) 0 -70px no-repeat; width: 30px; height: 30px;">
         <input type="radio" name="custom1" value="3" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>30대</span>
      </li>
      <li class="text-center" style="float:left; padding: 0 40px; text-align: center; background: url(/resources/img/bg_find_age_select.gif) 100% 13px repeat-x;">
      <div class="ageDiv" style="display: flex; justify-content: center; cursor: pointer;">
        <div class="innerAgeDiv" style="background: url(/resources/img/icon_quick_order_input_radio.png) 0 -70px no-repeat; width: 30px; height: 30px;">
         <input type="radio" name="custom1" value="4" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>40대</span>
      </li>
      <li class="text-center" style="float:left; padding: 0 40px; text-align: center; background: url(/resources/img/bg_find_age_select.gif) 100% 13px repeat-x;">
      <div class="ageDiv" style="display: flex; justify-content: center; cursor: pointer;">
        <div class="innerAgeDiv" style="background: url(/resources/img/icon_quick_order_input_radio.png) 0 -70px no-repeat; width: 30px; height: 30px;">
         <input type="radio" name="custom1" value="5" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>50대</span>
      </li>
      <li class="text-center" style="float:left; padding: 0 40px; text-align: center; background: url(/resources/img/bg_find_age_select2.gif) 50% 13px repeat-x;">
      <div class="ageDiv" style="display: flex; justify-content: center; cursor: pointer;">
        <div class="innerAgeDiv" style="background: url(/resources/img/icon_quick_order_input_radio.png) 0 -70px no-repeat; width: 30px; height: 30px;">
         <input type="radio" name="custom1" value="6" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>60대 이상</span>
      </li>
    </ul>
  </div>
  <div class="container"style="margin-top: 40px;">
    <img src="/resources/img/icon_big_arrow_down_gray.png" style="margin-bottom: 16px;">
    <h4 style="font-weight: bold; margin-bottom: 15px">성별 선택</h4>
    <ul style="display: table; margin: 0 auto; text-align: center; padding:0">
      <li class="sexLi" style="background-color: white; float:left; padding: 40px 40px; text-align: center; border: 1px solid #ccc; margin-right: 16px; cursor: pointer;">
      <span>여자</span>
      <div style="display: flex; justify-content: center;">
        <div class="sexDiv" style="background: url(/resources/img/icon_quick_order_input_radio.png) 0 -70px no-repeat; width: 30px; height: 30px;">
         <input type="radio" name="custom2" value="f" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
      </li>
      <li class="sexLi" style="background-color: white; float:left; padding: 40px 40px; text-align: center; border: 1px solid #ccc; cursor: pointer;">
      <span>남자</span>
      <div style="display: flex; justify-content: center;">
        <div class="sexDiv" style="background: url(/resources/img/icon_quick_order_input_radio.png) 0 -70px no-repeat; width: 30px; height: 30px;">
         <input type="radio" name="custom2" value="m" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
      </li>
      </ul>
  </div>
    <div class="container"style="margin-top: 40px;">
    <img src="/resources/img/icon_big_arrow_down_gray.png" style="margin-bottom: 16px;">
    <h4 style="font-weight: bold; margin-bottom: 15px">상황 선택</h4>
    <ul style="display: table; margin: 0 auto; text-align: center; padding:0">
      <li class="sitLi" style="background-color: white; float:left; padding: 40px 40px; text-align: center; border: 1px solid #ccc; margin-right: 16px; cursor: pointer;">
      <div style="display: flex; justify-content: center; margin-bottom:10px">
        <div class="sitDiv" style="background: url(/resources/img/icon_find_product_label.png) 0 0 no-repeat; width: 70px; height: 70px;">
         <input type="radio" name="tag" value="위" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>위 건강</span>
      </li>
      <li class="sitLi" style="background-color: white; float:left; padding: 40px 40px; text-align: center; border: 1px solid #ccc; margin-right: 16px; cursor: pointer;">
      <div style="display: flex; justify-content: center; margin-bottom:10px">
        <div class="sitDiv" style="background: url(/resources/img/icon_find_product_label.png) -140px 0 no-repeat; width: 70px; height: 70px;">
         <input type="radio" name="tag" value="유산균" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>장 건강</span>
      </li>
      <li class="sitLi" style="background-color: white; float:left; padding: 40px 40px; text-align: center; border: 1px solid #ccc; margin-right: 16px; cursor: pointer;">
      <div style="display: flex; justify-content: center; margin-bottom:10px">
        <div class="sitDiv" style="background: url(/resources/img/icon_find_product_label.png) -280px 0 no-repeat; width: 70px; height: 70px;">
         <input type="radio" name="tag" value="간건강" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>간 건강</span>
      </li>
      <li class="sitLi" style="background-color: white; float:left; padding: 40px 40px; text-align: center; border: 1px solid #ccc; margin-right: 16px; cursor: pointer;">
      <div style="display: flex; justify-content: center; margin-bottom:10px">
        <div class="sitDiv" style="background: url(/resources/img/icon_find_product_label.png) -420px 0 no-repeat; width: 70px; height: 70px;">
         <input type="radio" name="tag" value="비타민" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>비타민</span>
      </li>
      <li class="sitLi" style="background-color: white; float:left; padding: 40px 40px; text-align: center; border: 1px solid #ccc; margin-right: 16px; cursor: pointer;">
      <div style="display: flex; justify-content: center; margin-bottom:10px">
        <div class="sitDiv" style="background: url(/resources/img/icon_find_product_label.png) -560px 0 no-repeat; width: 70px; height: 70px;">
         <input type="radio" name="tag" value="홍삼" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>홍삼</span>
      </li>
      <li class="sitLi" style="background-color: white; float:left; padding: 40px 40px; text-align: center; border: 1px solid #ccc; cursor: pointer;">
      <div style="display: flex; justify-content: center; margin-bottom:10px">
        <div class="sitDiv" style="background: url(/resources/img/icon_find_product_label.png) -700px 0 no-repeat; width: 70px; height: 70px;">
         <input type="radio" name="tag" value="기능강화" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>기능강화</span>
      </li>
      </ul>
      <ul>
      </ul>
      <ul style="display: table; margin: 0 auto; text-align: center; padding:0">
      <li class="sitLi" style="background-color: white; float:left; padding: 40px 40px; text-align: center; border: 1px solid #ccc; margin-right: 16px; cursor: pointer;">
      <div style="display: flex; justify-content: center; margin-bottom:10px">
        <div class="sitDiv" style="background: url(/resources/img/icon_find_product_label.png) 0 -240px no-repeat; width: 70px; height: 70px;">
         <input type="radio" name="tag" value="체중" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>체중관리</span>
      </li>
      <li class="sitLi" style="background-color: white; float:left; padding: 40px 40px; text-align: center; border: 1px solid #ccc; margin-right: 16px; cursor: pointer;">
      <div style="display: flex; justify-content: center; margin-bottom:10px">
        <div class="sitDiv" style="background: url(/resources/img/icon_find_product_label.png) -140px -240px no-repeat; width: 70px; height: 70px;">
         <input type="radio" name="tag" value="뷰티" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>이너 뷰티</span>
      </li>
      <li class="sitLi" style="background-color: white; float:left; padding: 40px 40px; text-align: center; border: 1px solid #ccc; margin-right: 16px; cursor: pointer;">
      <div style="display: flex; justify-content: center; margin-bottom:10px">
        <div class="sitDiv" style="background: url(/resources/img/icon_find_product_label.png) -280px -240px no-repeat; width: 70px; height: 70px;">
         <input type="radio" name="tag" value="우유" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>뼈 건강</span>
      </li>
      <li class="sitLi" style="background-color: white; float:left; padding: 40px 40px; text-align: center; border: 1px solid #ccc; margin-right: 16px; cursor: pointer;">
      <div style="display: flex; justify-content: center; margin-bottom:10px">
        <div class="sitDiv" style="background: url(/resources/img/icon_find_product_label.png) -420px -240px no-repeat; width: 70px; height: 70px;">
         <input type="radio" name="tag" value="성장발육" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>성장 발육</span>
      </li>
      <li class="sitLi" style="background-color: white; float:left; padding: 40px 40px; text-align: center; border: 1px solid #ccc; margin-right: 16px; cursor: pointer;">
      <div style="display: flex; justify-content: center; margin-bottom:10px">
        <div class="sitDiv" style="background: url(/resources/img/icon_find_product_label.png) -560px -240px no-repeat; width: 70px; height: 70px;">
         <input type="radio" name="tag" value="밀키트" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>식사대용</span>
      </li>
      <li class="sitLi" style="background-color: white; float:left; padding: 40px 40px; text-align: center; border: 1px solid #ccc; cursor: pointer;">
      <div style="display: flex; justify-content: center; margin-bottom:10px">
        <div class="sitDiv" style="background: url(/resources/img/icon_find_product_label.png) -700px -240px no-repeat; width: 70px; height: 70px;">
         <input type="radio" name="tag" value="간식대용" style="position: absolute; right: 0; top: -25px;"/>
        </div>
        </div>
        <span>간식대용</span>
      </li>
      </ul>
  </div>
  <div class="container" style="margin-top: 40px;">
    <img src="/resources/img/icon_big_arrow_down_gray.png" style="margin-bottom: 16px;">
    <ul style="display: table; margin: 0 auto; text-align: center; padding:0">
      <li class="text-center" style="float:left; padding: 40px 40px; text-align: center; margin-right: 16px;">
        <button type="button" id="reset" class="btn btn-secondary btn-lg" style="width: 170px; padding:17px 0">초기화</button>
      </li>
      <li class="text-center" style="float:left; padding: 40px 40px; text-align: center;">
        <button type="submit" id="result" class="btn btn-primary btn-lg" style="width: 170px; padding:17px 0">결과보기</button>
      </li>
      </ul>
  </div>
</div>
</div>
</form>
<div id="customList" class="container">    
</div>
<div class="mt-3" style="display: flex; justify-content: center;">
  <div id="customPaging">
  </div>
</div>
<script>
$(function() {
  $(".ageDiv").on("click", function() {
    if($(this).children('div').attr("class") == "innerAgeDiv") {
        $(".innerAgeDiv").attr("class", "innerAgeDiv");
        $(this).find('input').prop("checked", "true");
        $(this).children('div').attr("class", "innerAgeDiv checkA");
    }
  });
   $(".sexLi").on("click", function() {
        if($(this).find('.sexDiv').attr("class") == "sexDiv") {
            $(".sexDiv").attr("class", "sexDiv");
            $(".sexLi").attr("class", "sexLi");
            $(this).attr("class", "sexLi checkS2");
            $(this).find('input').prop("checked", "true");
            $(this).find('.sexDiv').attr("class", "sexDiv checkS");
        }
      });
     $(".sitLi").on("click", function() {
          if($(this).find('.sitDiv').attr("class") == "sitDiv") {
              $(".sitDiv").attr("class", "sitDiv");
              let backPo = $('.checkSi').find('.sitDiv').css('background-position');
              if(backPo){
                let backPoX = backPo.substring(0, backPo.indexOf(" "));
                let backPoY = backPo.substring(backPo.indexOf(" ")+1);
                backPoY = backPoY.substring(0, backPoY.indexOf("px"));
                backPoY = Number(backPoY) + 390;
                $('.checkSi').find('.sitDiv').css('background-position', backPoX + ' ' + backPoY + "px");
              }
                
              backPo = $(this).find('.sitDiv').css('background-position');
              backPoX = backPo.substring(0, backPo.indexOf(" "));
              backPoY = backPo.substring(backPo.indexOf(" ")+1);
              backPoY = backPoY.substring(0, backPoY.indexOf("px"));
              backPoY = Number(backPoY) - 390;
              $('.checkSi').find('input').prop("checked", "false");
              $(".sitLi").attr("class", "sitLi");
              $(this).attr("class", "sitLi checkSi");
              $(this).find('input').prop("checked", "true");
              $(this).find('.sitDiv').attr("class", "sitDiv");
              $(this).find('.sitDiv').css('background-position', backPoX + ' ' + backPoY + "px");
          }
     });
     $("button[type='submit']").on("click", function(e) {
       e.preventDefault();
       $("#custom").val($("input[name='custom1']:checked").val()+$("input[name='custom2']:checked").val());
       let custom = $("#custom").val();
       let tag = $('input[name=tag]:checked').val();
       listCustom(custom, tag);
     });
     
     function listCustom(custom, tag, page){
       let pageNo = page > 1 ? page : 1;
       $.getJSON("/custom/list/"+custom+"/"+tag+"/"+pageNo+".json",function(cdto){
          console.log(cdto.customCnt);
         printListCustom(cdto.clist, cdto.customCnt, pageNo);
       }).fail(function(){
         alert("후기 리스트 출력 실패")
       });
     }
     
     function printListCustom(listArr, customTotal, page){
       $("#customList").children().remove();
       let count = 0;
       let customTag = '';
       for (let pvo of listArr) {
         count++;
         if(count == 1 || count == 5) {
           customTag += '<ul style="margin: 10px 0; padding: 10px; height: 100%;">';
         }
         customTag += '<li id="'+pvo.pno+'" class="pLi" style="float:left; padding: 5px;">';
         customTag += '<div class="card" style="max-width: 260px; height:417px; margin: 0; cursor:pointer;">';
         customTag += '<img class="card-img-top" src="'+pvo.img+'" alt="Card image" style="width: 100%; height: 248px; object-fit: cover; overflow:hidden">';
         customTag += '<div class="card-body"><p class="card-text" style="color: #C8C8C8;font-size: 13px;">'+pvo.tname+'</p>';
         customTag += '<h4 class="card-title" style="font-size: 20px; margin: 0px"><a>'+pvo.pname+'</a></h4>';
         customTag += '<span class="card-text" style="font-size: 20px; color: #009edb">';
         customTag += '</span><span style="font-size: 13px; color: #009edb" >'+pvo.price+'</span><span>원</span></div></div></div>';
         
         if(count == 4 || count == 8) {
            customTag += '</ul>';
         }
         
       }
       $("#customList").append(customTag);
       printCustomPaging(customTotal, page);
     
     }
     function printCustomPaging(customTotal, page) {
       let customPagingObj = '<ul class="pagination">';
       let endPagingNum = Math.ceil(page/10.0) * 10;
       let beginPagingNum = endPagingNum - 9;
       let prev = beginPagingNum != 1;
       let next = false;
       
       if(endPagingNum * 10 >= customTotal) {
         endPagingNum = Math.ceil(customTotal/10.0);
       } else {
         next = true;
       }
       
       if(prev){
         customPagingObj += '<li class="page-item">';
         customPagingObj += '<a class="page-link" href="'+(beginPagingNum-1)+'" style="position:static;">Prev</a></li>';
       }
       for (var i = beginPagingNum; i <= endPagingNum ; i++) {
         let classActive = page == i ? ' active' : '';
         customPagingObj += '<li class="page-item'+classActive+'">';
         customPagingObj += '<a class="page-link" href="'+i+'" style="position:static;">'+i+'</a></li>';
       }
       if(next){
         customPagingObj += '<li class="page-item">';
         customPagingObj += '<a class="page-link" href="./'+(endPagingNum+1)+'" style="position:static;">Next</a></li>';
       }
       customPagingObj += '</ul>';
       $("#customPaging").html(customPagingObj);
     }
     $('#reset').click(function() {
        location.reload();
    });
     $(document).on("click", "#customPaging li a", function(e){
         e.preventDefault();
         let custom = $("#custom").val();
         let tag = $('input[name=tag]:checked').val();
         listCustom(custom,tag,$(this).attr("href"));
       });
     $(document).on("click", '.pLi',function() {
        let id = $(this).attr('id');
        location.href = "/product/detail?pno="+ id;
     });
});
</script>

<jsp:include page="../common/footer.jsp"></jsp:include>