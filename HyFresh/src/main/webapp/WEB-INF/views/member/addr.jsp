<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<div class="container">
  <div class="row row-offcanvas row-offcanvas-left">
    <!-- Sidebar -->
    <div class="col-6 col-md-3 sidebar-offcanvas" id="sidebar">
      <div class="list-group">
        <a href="#" class="list-group-item active text-center">마이페이지</a>
        <a href="#" class="list-group-item">주문배송조회</a>
        <a href="#" class="list-group-item collapsed" data-toggle="collapse" data-target="#collapseBoard">상담 및 내글관리
          <div class="sb-sidenav-collapse-arrow">
            <i class="fas fa-angle-down"></i>
          </div>
        </a>
        <div id="collapseBoard" class="collapse list-group">
          <a href="#" class="list-group-item">제품 Q&A</a>
          <a href="#" class="list-group-item">문의내역</a>
        </div>
        <a href="#" class="list-group-item collapsed" data-toggle="collapse" data-target="#collapseInfo">내 정보 관리
          <div class="sb-sidenav-collapse-arrow">
            <i class="fas fa-angle-down"></i>
          </div>
        </a>
        <div id="collapseInfo" class="collapse list-group">
          <a href="/member/modify?mno=${sesInfo.mno }" class="list-group-item">회원정보 변경</a>
          <a href="/member/addr?mno=${sesInfo.mno }" class="list-group-item">배송지 관리</a>
          <a href="/member/resign" class="list-group-item">회원탈퇴</a>
        </div>
      </div>
    </div>
    <!-- Content -->
    <div class="col-12 col-md-9 mt-4">
      <h3>배송지관리</h3>
      <a href="#" class="btn btn-sm btn-outline-primary" id="addaddr">배송지 추가</a>
      <div id="showinput" class="col-md-7">
	      <form action="/member/addr" method="post" id="sendmod">
		      <div class="card">
		        <div class="col-md-8">
		          <div class="form-group form-inline">
				        <input type="hidden" class="form-control" value="${modavo.mno }" name="mno">
		          </div>
		        </div>
		        <div class="col-md-12">
		          <div class="form-group form-inline">
		            <label for="addrname" class="col-sm-4 control-label">배송지 이름</label>
		            <input type="text" class="form-control" id="addrname" name="addrname" value="${modavo.addrname }">
		          </div>
		        </div>
		        <div class="col-md-12">
		          <div class="form-group form-inline">
		            <label for="receiver" class="col-sm-4 control-label">수령인</label>
		            <input type="text" class="form-control" id="receiver" name="receiver" value="${modavo.receiver }">
		          </div>
		        </div>
		        <div class="col-md-12">
		          <div class="form-group form-inline">
		            <label for="tel" class="col-sm-4 control-label">연락처</label>
		            <input type="text" class="form-control" id="tel" name="tel" value="${modavo.tel }">
		          </div>
		        </div>
		        <div class="col-md-12">
		          <div class="form-group form-inline">
		            <label for="addr" class="col-sm-4 control-label">배송주소</label>
		            <input type="text" class="form-control" id="addr" name="addr" value="${modavo.addr }">
		          </div>
		        </div>
		        <div class="m-auto">
		         <button type="submit" class="btn btn-sm btn-outline-secondary m-3" id="sendinput">저장</a>
			       <!-- <a href="/member/modifyaddr?mno=${avo.mno }&addr=${avo.addrno })"
			            class="btn btn-sm btn-outline-secondary">수정</a> -->
		         <button type="button" class="btn btn-sm btn-outline-secondary m-3" id="modaddr">수정</a>
		         <button type="button" class="btn btn-sm btn-secondary m-3" id="closeinput">닫기</a>
		        </div>
		      </div>
	      </form>
      </div>
      <c:choose>
        <c:when test="${aList ne null }">
          <c:forEach items="${aList}" var="avo">
					  <form action="/member/chooseaddr" method="post" id="sendForm">
				      <input type="hidden" class="form-control" id="mno" value="${avo.mno }" name="mno">
				      <input type="hidden" class="form-control" id="addrno" value="${avo.addrno }" name="addrno">
							<div class="card mb-3">
							  <c:choose>
							   <c:when test="${mvo.addrno eq avo.addrno}">
									<div class="card-header text-white bg-dark d-flex">
							   </c:when>
							   <c:otherwise>
									<div class="card-header text-white bg-secondary d-flex">
							   </c:otherwise>
							  </c:choose>
								  <div class="mr-auto p-2 custom-control custom-radio">
								    <!-- <fmt:parseNumber var="i" type = "number" value = "${avo.addrno}" /> -->
								    [${avo.addrname }] ${avo.receiver } 
							    </div>
									<div class="p-2">
									 <c:choose>
                    <c:when test="${mvo.addrno ne avo.addrno}">
									   <a href="/member/chooseaddr?mno=${avo.mno }&addrno=${avo.addrno}" class="btn btn-sm btn-outline-light">기본배송지로</a>
                    </c:when>
                    <c:otherwise>
                      <button type="button" class="btn btn-sm btn-warning">현재 배송지</button>
                    </c:otherwise>
                   </c:choose>  
									 <a href="/member/openmod?mno=${avo.mno }&addrno=${avo.addrno}" class="btn btn-sm btn-light" id="openmod">수정</a>
									 <a href="/member/removeaddr?mno=${avo.mno }&addrno=${avo.addrno}" class="btn btn-sm btn-light">삭제</a>
								  </div>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">
									 <div>${avo.addr }</div>
									 <div>${avo.tel }</div>
									</li>
								</ul>
							</div>
					  </form>
				  </c:forEach>
        </c:when>
      </c:choose>
      <!-- <button type="button" class="btn btn-sm btn-primary" id="chooseAddr">기본배송지로 설정</button> -->
    </div>
  </div>
</div>
<script>
  $(function() {
	  $("#showinput").hide();
	  $("#modaddr").hide();
	  $("#addaddr").on(
			  "click", function() {
				  $("#showinput").show();
				  $("#addaddr").hide();
			  });
	  $("#closeinput").on(
			  "click", function() {
				  $("#addaddr").show();
				  $("#showinput").hide();
				  $("#addrname").val("");
				  $("#receiver").val("");
				  $("#addr").val("");
				  $("#tel").val("");
			  });
	  $("#openmod").on(
			  "click", function() {
				  $("#showinput").show();
				  $("#sendinput").hide();
				  $("#modaddr").show();
			  });
	  $("#modaddr")>on(
			  "click", function() {
				  $(this).parent().find("#sendmod").submit();
				  $("#showinput").hide();
				  $("#sendinput").show();
          $("#modaddr").hide();
			  });
/* 	  $("#chooseAddr").on(
			  "click", function() {
				  if ($("input[name='addrno']:checked").val() != ''){
					  $(this).parent().find("#sendForm").submit();
				  }
			  }); */
  });
/*   $(document).ready(function() {
	  if ($("#sesAddrno").val() == $("#addrno")) {
		  $("#addrno").children().find("#cardheader").attr({"class":"card-header text-white bg-dark d-flex"});
	  }
	}); */
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>