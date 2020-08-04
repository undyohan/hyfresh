<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<main>
<div class="container-fluid">
  <h3 class="mt-4">상품등록</h3>
  <div>
    <!-- 여기 안에 내용 작성 -->  
    <div class="btn-toolbar mb-2 mb-md-0 mt-3">
      <form action="/admin/pregister" method="post" enctype="multipart/form-data" id="s-form">
      <input type="hidden" value="1" id="tagCount">
      <input type="hidden" value="" id="tname" name="tname">
      <input type="hidden" value="0a" id="custom" name="custom">
      <div class="form-group">
        <label for="title">이미지파일</label> <input type="file" class="form-control" name="imgfile">
      </div>
        <div class="form-label-group">
          <div class="mb-3 form-inline form-group">
            <label for="cateno">카테고리</label>
            <select class="custom-select d-block w-100" id="cateno" name="cateno" required>
              <option value="" selected>카테고리 선택</option>
              <c:forEach items="${cateList }" var="cvo">
                <c:if test="${cvo.cateno != cvo.catecode }">
	                <c:forEach items="${cateList }" var="cvo2">
	                   <c:if test="${cvo.catecode == cvo2.cateno }">
	                     <c:set var="cateName" value="${cvo2.catename }"/>
	                   </c:if>  
	                </c:forEach>
                  <option value="${cvo.cateno }">${cateName } > ${cvo.catename }</option>
                </c:if>
              </c:forEach>
            </select>
          </div>
          <div class="mb-3 form-inline form-group">
            <label for="custom1">추천 범주</label>
            <select class="custom-select d-block w-100" id="custom1" name="custom1">
              <option value="0">전체</option>
              <option value="1">10대</option>
              <option value="2">20대</option>
              <option value="3">30대</option>
              <option value="4">40대</option>
              <option value="5">50대</option>
              <option value="6">60대</option>
            </select>
          </div>
          <div class="c-block my-3">
            <label for="custom2">성별</label>
            <div class="custom-control custom-radio">
              <input id="all" value="a" name="custom2" type="radio" class="custom-control-input" checked>
              <label class="custom-control-label" for="all">전체</label>
            </div>
            <div class="custom-control custom-radio">
              <input id="male" value="m" name="custom2" type="radio" class="custom-control-input" required>
              <label class="custom-control-label" for="male">남자</label>
            </div>
            <div class="custom-control custom-radio">
              <input id="female" value="f" name="custom2" type="radio" class="custom-control-input" required>
              <label class="custom-control-label" for="female">여자</label>
            </div>
          </div>
          <div class="mb-3">
            <label for="pname">상품명</label>
            <input type="text" id="pname" class="form-control" placeholder="상품명" name="pname" required autofocus/>
          </div>
          <div class="row">
            <div class="col-md-6 mb-3 input-group">
              <label for="price">상품가격</label>
              <input type="number" id="price" class="form-control" placeholder="가격" name="price" required/>
            </div>
            <div class="col-md-6 mb-3 input-group">
              <label for="price">할인률</label>
              <input type="number" id="discount" class="form-control" placeholder="할인률" id="discount" name="discount"/>
              <div class="input-group-append">
                 <span class="input-group-text">%</span>
               </div>
            </div>
          </div>
          <div class="form-group">
            <label for="title">상세내용</label><input type="file" class="form-control" name="content">
          </div>
          <div class="mb-3">
            <label for="stock">재고수량</label>
            <input type="text" id="stock" class="form-control" placeholder="재고수량" name="stock" required/>
          </div>
          <div class="mb-3" id="tagDiv">
            <label for="stock">태그</label>
	          <div class="input-group">
		          <div class="input-group-prepend">
	              <span class="input-group-text">#</span>
	            </div>
              <input type="text" id="tempT" class="form-control" placeholder="태그" name="tname">
	            <div class="input-group-append">
	              <button type="button" id="plusTag">+</button>
	            </div>
            </div>

          </div>
          <div class="d-block my-3">
            <label for="dfee">배송비</label>
            <div class="custom-control custom-radio">
              <input id="freedelivery" value="0" name="dfee" type="radio" class="custom-control-input" checked required>
              <label class="custom-control-label" for="freedelivery">무료배송</label>
            </div>
            <div class="custom-control custom-radio">
              <input id="basicdelivery" value="2500" name="dfee" type="radio" class="custom-control-input" required>
              <label class="custom-control-label" for="basicdelivery">유료배송(기본 2,500원)</label>
            </div>
            <div class="custom-control custom-radio">
              <input id="chargedelivery" name="dfee" type="radio" class="custom-control-input" required>
              <label class="custom-control-label" for="chargedelivery">유료배송(직접입력)</label>
              <div class="input-group">
                <input type="number" class="form-control" name="dfee">
                <div class="input-group-append">
                  <span class="input-group-text">원</span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <hr class="my-4">
        <button class="btn btn-lg btn-primary" id="regist" type="submit">상품등록</button>
      </form>
    </div>
  </div>
</div>
</main>
  
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>

<script>
$(function() {
	$("#plusTag").on("click", function(e) {
		e.preventDefault;
		var tagCount = Number($("#tagCount").val());
		var pre = '<div class="input-group" id="tagDiv"><div class="input-group-prepend"><span class="input-group-text">#</span></div>';
	  var str = '<input type="text" id="tempT' + tagCount + '" class="form-control" placeholder="태그" name="tempT">';
	  var apen = '<div class="input-group-append"><button type="button" id="minusTag">-</button></div></div>';
	  
	  var tot = pre + str + apen;
	  tagCount += 1;
	  $("#tagDiv").append(tot);
	  $("#tagCount").val(tagCount);
	});
	$(document).on("click", "#minusTag", function(e) {
	    e.preventDefault;
	    var tagCount = Number($("#tagCount").val());
	    tagCount -= 1;
	    $(this).closest('#tagDiv').remove();
	    $("#tagCount").val(tagCount);
	  });
	
 	$("button[type='submit']").on("click", function(e) {
		let count = Number($("#tagCount").val());
		let tagFinal = "#" + $("#tempT").val();
		let discount = $("#discount").val();
		for(var i = 1; i < count; i++) {
			tagFinal += " #"+$("#tempT"+i).val();
		}
		if(discount == '') {
			$("#discount").val(0);
		}
		$("#tname").val(tagFinal);
		let customVal1 = $("#custom1").val();
		let customVal2 = $('input:radio[name="custom2"]:checked').val();
		let tot = customVal1 + customVal2;
		$("#custom").val(tot);
	});
});
</script>