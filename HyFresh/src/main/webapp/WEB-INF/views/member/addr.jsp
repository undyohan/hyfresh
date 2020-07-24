<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<div class="container">
  <div class="row row-offcanvas row-offcanvas-left">
    <!-- Sidebar -->
    <div class="col-6 col-md-2 sidebar-offcanvas sidebar" id="sidebar">
      <div class="list-group">
        <a href="/member/mypage?mno=${mvo.mno }" class="list-group-item list-group-item-success text-center pt-5 pb-5 mypagehead border-0"><strong>마이페이지</strong></a>
        <a href="#" class="list-group-item list-group-item-action border-top border-white">주문배송조회</a>
        <a href="#" class="list-group-item list-group-item-action border-top border-white collapsed" data-toggle="collapse" data-target="#collapseBoard">
          <div class="sb-sidenav-collapse-arrow">
            상담 및 내글
            <i class="fas fa-angle-down"></i> 
          </div>
        </a>
        <div id="collapseBoard" class="collapse">
          <nav class="nav">
            <a href="#" class="nav-link text-muted">제품 Q&A</a>
            <a href="#" class="nav-link text-muted">문의내역</a>
          </nav>
        </div>
        <a href="#" class="list-group-item list-group-item-action border-top border-white collapsed" data-toggle="collapse" data-target="#collapseInfo">
          <div class="sb-sidenav-collapse-arrow">
            내 정보 관리
            <i class="fas fa-angle-down"></i>
          </div>
        </a>
        <div id="collapseInfo" class="collapse">
          <nav class="nav">
            <a href="/member/modify?mno=${sesInfo.mno }" class="nav-link text-muted">회원정보 변경</a>
            <a href="/member/addr?mno=${sesInfo.mno }" class="nav-link text-muted">배송지 관리</a>
            <a href="/member/resign" class="nav-link text-muted">회원탈퇴</a>
          </nav>
        </div>
      </div>
    </div>
    <!-- Content -->
    <div class="col-12 col-md-9 mt-4">
      <h4>배송지관리</h4>
      <a href="#" class="btn btn-sm btn-outline-primary pl-3 pr-3 mt-2 mb-2" id="addaddr">배송지 추가</a>
      <div id="showinput">
        <form action="/member/addaddr" method="post" id="sendForm">
		      <div class="border">
		        <div class="col-md-8">
		          <div class="form-group form-inline">
				        <input type="hidden" class="form-control" value="${sesInfo.mno }" name="mno">
				        <input type="hidden" class="form-control" name="addrno" id="tempAddrno">
		          </div>
		        </div>
		        <div class="col-md-12">
		          <div class="form-group form-inline">
		            <label for="addrname" class="col-sm-4 control-label">배송지 이름</label>
		            <input type="text" class="form-control" id="addrname" name="addrname">
		          </div>
		        </div>
		        <div class="col-md-12">
		          <div class="form-group form-inline">
		            <label for="receiver" class="col-sm-4 control-label">수령인</label>
		            <input type="text" class="form-control" id="receiver" name="receiver">
		          </div>
		        </div>
		        <div class="col-md-12">
		          <div class="form-group form-inline">
		            <label for="tel" class="col-sm-4 control-label">연락처</label>
		            <input type="text" class="form-control" id="tel" name="tel">
		          </div>
		        </div>
		        <div class="col-md-12">
		          <div class="form-group form-inline">
		            <label for="addr" class="col-sm-4 control-label">배송주소</label>
		            <input type="text" class="form-control col-sm-7" id="addr" name="addr">
		          </div>
		        </div>
		        <div class="d-flex justify-content-center">
		         <button type="submit" class="btn btn-sm btn-outline-secondary pl-3 pr-3 m-3" id="sendinput">저장</a>
		         <button type="submit" class="btn btn-sm btn-outline-secondary pl-3 pr-3 m-3" id="modaddr">수정</a>
		         <button type="button" class="btn btn-sm btn-secondary pl-3 pr-3 m-3" id="cancelinput">취소</a>
		        </div>
		      </div>
	      </form>
      </div>
      <c:choose>
        <c:when test="${aList ne null }">
          <c:forEach items="${aList}" var="avo">
					  <form action="/member/chooseaddr" method="post" id="sendForm">
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
								    [${avo.addrname }] &nbsp; ${avo.receiver } 
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
	                  <input type="hidden" class="form-control" id="addrname" value="${avo.addrname }" name="addrname">
	                  <input type="hidden" class="form-control" id="receiver" value="${avo.receiver }" name="receiver">
	                  <input type="hidden" class="form-control" id="tel" value="${avo.tel }" name="tel">
	                  <input type="hidden" class="form-control" id="mno" value="${avo.mno }" name="mno">
                    <input type="hidden" class="form-control" id="addr" value="${avo.addr }" name="addr">
                    <input type="hidden" class="form-control" id="addrno" value="${avo.addrno }" name="addrno">
										<a href="#" class="btn btn-sm btn-light pl-2 pr-2 ml-2" id="openmod"><i class="fas fa-edit"></i></a>
										<a href="/member/removeaddr?mno=${avo.mno }&addrno=${avo.addrno}" class="btn btn-sm btn-light pl-2 pr-2 ml-2"><i class="fas fa-times"></i></a>
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
    </div>
  </div>
</div>
<script>
  $(function() {
	  $("#showinput").hide();
	  $("#modaddr").hide();
	  $("#addaddr").on("click", function() {
      $("#sendForm").attr('action','/member/addaddr');
		  $("#showinput").show();
		  $("#modaddr").hide();
		  $("#addaddr").hide();
		  $("#tempAddrno").removeAttr('name');
	  });
	  $("#cancelinput").on("click", function() {
		  $("#addaddr").show();
		  $("#sendinput").show();
		  $("#modaddr").hide();
		  $("#showinput").hide();
		  $("#addrname").val("");
		  $("#receiver").val("");
		  $("#addr").val("");
		  $("#tel").val("");
	  });
	  
 	  $(document).on("click", "#openmod", function() {
 		  $("#tempAddrno").attr('name');
 		  $("#addaddr").hide();
 		  $("#showinput").show();
      $("#sendinput").hide();
      $("#modaddr").show();
      let modAddrno = $(this).siblings('#addrno').val();
      let modMno = $(this).siblings('#mno').val();
      let modAddrname = $(this).siblings('#addrname').val();
      let modReceiver = $(this).siblings('#receiver').val();
      let modTel = $(this).siblings('#tel').val();
      let modAddr = $(this).siblings('#addr').val();
		  $("#sendForm").find("input[name=addrno]").val(modAddrno);
		  $("#sendForm").find("input[name=mno]").val(modMno);
		  $("#sendForm").find("input[name=addrname]").val(modAddrname);
		  $("#sendForm").find("input[name=receiver]").val(modReceiver);
		  $("#sendForm").find("input[name=tel]").val(modTel);
		  $("#sendForm").find("input[name=addr]").val(modAddr);
		  $("#sendForm").attr('action','/member/modifyaddr');
	  });
	  $("#modaddr").on("click", function() {
		  $("#showinput").hide();
		  $("#sendinput").show();
      $("#modaddr").hide();
	  });
  });
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>