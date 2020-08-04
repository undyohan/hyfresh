<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<main>
<div class="container-fluid">
  <h3 class="mt-4">상품수정</h3>
  <div>
    <!-- 여기 안에 내용 작성 -->  
    <c:set value="${tList }" var="tagList"/>
    <div class="btn-toolbar mb-2 mb-md-0 mt-3">
      <form action="/admin/pmodify" method="post" enctype="multipart/form-data" id="s-form">
      <input type="hidden" value="${pvo.pno }" name="pno">
      <input type="hidden" value="${fn:length(tagList) }" id="tagCount">
      <input type="hidden" value="" id="tname" name="tname">
      <input type="hidden" value="${pvo.custom }" id="custom" name="custom">
      <input type="hidden" value="${pvo.img }" name="old_imgfile">
      <input type="hidden" value="${pvo.content }" name="old_contentfile">
      <input type="hidden" id="hidVal" name="delImg" value="0">
      <input type="hidden" id="hidVal2" name="delImg2" value="0">
      <div class="form-group">
        <label for="title">이미지파일</label> <input type="file" class="form-control" id="imgfile" name="imgfile">
      </div>
        <div class="form-label-group">
          <div class="mb-3 form-inline form-group">
            <label for="cateno">카테고리</label>
            <select class="custom-select d-block w-100" id="cateno" name="cateno" required>
              <option value="">카테고리 선택</option>
              <c:forEach items="${cateList }" var="cvo">
                <c:if test="${cvo.cateno != cvo.catecode }">
                  <c:forEach items="${cateList }" var="cvo2">
                    <c:if test="${pvo.cateno == cvo.cateno }">
                      <c:set var="select" value='selected="selected"'/>
                    </c:if>
                     <c:if test="${cvo.catecode == cvo2.cateno }">
                       <c:set var="cateName" value="${cvo2.catename }"/>
                     </c:if>  
                  </c:forEach>
                  <option value="${cvo.cateno }" ${select }>${cateName } > ${cvo.catename }</option>
                </c:if>
              </c:forEach>
            </select>
          </div>
          <div class="mb-3 form-inline form-group">
            <label for="custom1">추천 범주</label>
            <select class="custom-select d-block w-100" id="custom1" name="custom1">
              <c:forEach var="i" begin="0" end="6">
                <c:set var="selected" value=""/>
                <fmt:parseNumber value = "${fn:substring(pvo.custom, 0, 2) }" var="temp"/>
                <c:if test="${i ==  temp}">
	               <c:set var="selected" value="selected"/>
	              </c:if>
	              <c:choose>
	              <c:when test="${i == 0 }">
	               <option value="0" ${selected }>전체</option>
	              </c:when>
	              <c:otherwise>
	               <option value="${i }" ${selected }>${i }0대</option>
	              </c:otherwise>
	              </c:choose>
              </c:forEach>
            </select>
          </div>
          <div class="c-block my-3">
            <label for="custom2">성별</label>
            <c:choose>
              <c:when test="${fn:substring(pvo.custom, 1, 3) == 'a' }">
                <c:set var="checked1" value="checked"/>  
              </c:when>
              <c:when test="${fn:substring(pvo.custom, 1, 3) == 'm' }">
                <c:set var="checked2" value="checked"/>  
              </c:when>
              <c:when test="${fn:substring(pvo.custom, 1, 3) == 'f' }">
                <c:set var="checked3" value="checked"/>  
              </c:when>
            </c:choose>
            
            <div class="custom-control custom-radio">
              <input id="all" value="a" name="custom2" type="radio" class="custom-control-input" ${checked1 }>
              <label class="custom-control-label" for="all">전체</label>
            </div>
            <div class="custom-control custom-radio">
              <input id="male" value="m" name="custom2" type="radio" class="custom-control-input" ${checked2 }>
              <label class="custom-control-label" for="male">남자</label>
            </div>
            <div class="custom-control custom-radio">
              <input id="female" value="f" name="custom2" type="radio" class="custom-control-input" ${checked3 }>
              <label class="custom-control-label" for="female">여자</label>
            </div>
          </div>
          <div class="mb-3">
            <label for="pname">상품명</label>
            <input type="text" id="pname" class="form-control" value="${pvo.pname }" placeholder="상품명" name="pname" required autofocus/>
          </div>
          <div class="row">
            <div class="col-md-6 mb-3 input-group">
              <label for="price">상품가격</label>
              <input type="number" id="price" class="form-control" value="${pvo.price }" placeholder="가격" name="price" required/>
               <div class="input-group-append">
                 <span class="input-group-text">원</span>
               </div>
            </div>
            <div class="col-md-6 mb-3 input-group">
              <label for="price">할인률</label>
              <input type="number" id="discount" class="form-control" value="${pvo.discount }" placeholder="할인률" name="discount">
              <div class="input-group-append">
                 <span class="input-group-text">%</span>
               </div>
            </div>
          </div>
          <div class="form-group">
            <label for="title">상세내용</label> <input type="file" class="form-control" id="content" name="content">
          </div>
          <div class="mb-3">
            <label for="stock">재고수량</label>
            <input type="text" id="stock" class="form-control" value="${pvo.stock }" placeholder="재고수량" name="stock"/>
          </div>
          <div class="mb-3" id="tagDiv">
            <label for="stock">태그</label>
            <c:forEach items="${tList }" var="tag" varStatus="i">
		          <div class="input-group" id="tagDiv">
			          <div class="input-group-prepend">
		              <span class="input-group-text">#</span>
		            </div>
		            <c:set var="max" value="${fn:length(tag)}"/>
	              <input type="text" id="tempT${i.count }" class="form-control" placeholder="태그" name="tname" value="${fn:substring(tag, 1, max) }">
		            <div class="input-group-append">
		            <c:choose>
		            <c:when test="${i.count == 1 }">
		              <button type="button" id="plusTag">+</button>
		              </c:when>
		              <c:otherwise>
		              <button type="button" id="minusTag">-</button>
		              </c:otherwise>
		              </c:choose>
		            </div>
	            </div>
            </c:forEach>
          </div>
          <div class="d-block my-3">
            <label for="dfee">배송비</label>
            <c:choose>
	            <c:when test="${pvo.dfee eq 0 }">
	              <c:set var="free" value="checked"/>
	            </c:when>
	            <c:when test="${pvo.dfee eq 2500 }">
	               <c:set var="basic" value="checked"/>
	            </c:when>
	            <c:otherwise>
                 <c:set var="custom" value="checked"/>
                 <c:set var="price" value='value="${pvo.dfee }"'/>
              </c:otherwise>
            </c:choose>
            <div class="custom-control custom-radio">
              <input id="freedelivery" value="0" name="dfee" type="radio" class="custom-control-input" ${free } required>
              <label class="custom-control-label" for="freedelivery">무료배송</label>
            </div>
            <div class="custom-control custom-radio">
              <input id="basicdelivery" value="2500" name="dfee" type="radio" class="custom-control-input" ${basic } required>
              <label class="custom-control-label" for="basicdelivery">유료배송(기본 2,500원)</label>
            </div>
            <div class="custom-control custom-radio">
              <input id="chargedelivery" name="dfee" type="radio" class="custom-control-input" ${custom } required>
              <label class="custom-control-label" for="chargedelivery">유료배송(직접입력)</label>
              <div class="input-group">
                <input type="number" class="form-control" name="dfee" ${price }>
                <div class="input-group-append">
                  <span class="input-group-text">원</span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <hr class="my-4">
        <button class="btn btn-lg btn-primary" id="regist" type="submit">수정완료</button>
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
		var tagCount = $('#tagDiv').children().length;
		console.log(tagCount);
		var pre = '<div class="input-group" id="tagDiv"><div class="input-group-prepend"><span class="input-group-text">#</span></div>';
	  var str = '<input type="text" id="tempT' + tagCount + '" class="form-control" placeholder="태그" name="tempT">';
	  var apen = '<div class="input-group-append"><button type="button" id="minusTag">-</button></div></div>';
	  var tot = pre + str + apen;
	  $("#tagDiv").append(tot);
	  $("#tagCount").val(tagCount);
	});
	$(document).on("click", "#minusTag", function(e) {
	    e.preventDefault;
	    var tagCount = $('#tagDiv').children().length;
	    tagCount -= 2;
	    $(this).closest('#tagDiv').remove();
	    $("#tagCount").val(tagCount);
	  });
	
	$("button[type='submit']").on("click", function(e) {
		e.preventDefault();
		let count = Number($("#tagCount").val());
		let tagFinal = '#';
	  let discount = $("#discount").val();
		for(var i = 1; i < count+1; i++) {
			console.log($("#tempT"+i).val());
			if(i != 1) {
				tagFinal += " #";
			}
			tagFinal += $("#tempT"+i).val();
		}
    if(discount == '') {
        $("#discount").val(0);
    }
		$("#tname").val(tagFinal);
		
    let customVal1 = $("#custom1").val();
    let customVal2 = $('input:radio[name="custom2"]:checked').val();
    let tot = customVal1 + customVal2;
    $("#custom").val(tot);

    let imgfileName = $("#imgfile").val();
    let contentfileName = $("#content").val(); 
    if (imgfileName == '') {
      let isOk = confirm("첨부된  상품 이미지 파일이 삭제되어도 괜찮습니까?");
      isOk == true ? $("#hidVal").val("1") : $("#hidVal").val("0");
    } else {
      $("#hidVal").val("2");
    }
    if(contentfileName == '') {
        $("#hidVal2").val("1");
    } else {
    	  $("#hidVal2").val("2");
    }
    $("#s-form").submit();
	});
	let custom = '<c:out value="${pvo.custom }"/>';
	for(var i = 1; i < 14; i++) {
		if($("select option:eq(" + i + ")").val() == custom) {
			$("select option:eq(" + i + ")").attr("selected", "selected");
		}
	}
});
</script>