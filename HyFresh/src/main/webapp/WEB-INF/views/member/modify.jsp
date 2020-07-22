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
	    <h3>회원정보 수정</h3>
	    <div class="mt-4">
	     <form action="/member/modify" method="post">
	       <div class="col-md-6">
	         <div class="form-group form-inline">
	           <label for="mno" class="col-sm-5 control-label">회원번호</label> <input type="number"
	             class="form-control" value="${mvo.mno }" name="mno" readonly>
	         </div>
	         <div class="form-group form-inline">
	           <label for="name" class="col-sm-5 control-label">이름</label> <input type="text"
	             class="form-control" id="name" value="${mvo.name }"
	             name="name" readonly>
	         </div>
	         <div class="form-group form-inline">
	           <label for="email" class="col-sm-5 control-label">이메일</label> <input type="email"
	             class="form-control" value="${mvo.email }" name="email" readonly>
	         </div>
         </div>
         <div class="col-md-6">
	         <div class="form-group form-inline">
	           <label for="pwd" class="col-sm-5 control-label">비밀번호 변경</label> <input type="password"
	             class="form-control" id="pwd" value="${mvo.pwd }"
	             name="pwd">
	         </div>
	         <div class="form-group form-inline">
	           <label for="confirmPwd" class="col-sm-5 control-label">비밀번호 확인</label> <input type="password"
	             class="form-control" placeholder="변경시 재입력" id="confirmPwd" name="confirmPwd">
	         </div>
           <div class="alert alert-success col-sm" id="alert-success">비밀번호가 일치합니다.</div>
           <div class="alert alert-danger col-sm" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
	         <div class="form-group form-inline">
	           <label for="home" class="col-sm-5 control-label">주소</label>
	            <input type="text" class="form-control" id="home" value="${mvo.home }" name="home">
	         </div>
	         <div class="form-group form-inline">
	           <label for="tel" class="col-sm-5 control-label">전화번호</label> <input type="text"
	             class="form-control" id="tel" value="${mvo.tel }"
	             name="tel">
	         </div>
	         <div class="form-group form-inline">
	           <label for="birth" class="col-sm-5 control-label">생년월일</label> <input type="date"
	             class="form-control" id="birth" value="${mvo.birth }"
	             name="birth">
	         </div>
            <button type="submit" class="btn btn-primary">Submit</button>
         </div>
        </form>
	    </div>
	  </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>