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
	    <h4>회원정보 수정</h4>
	    <div class="mt-4">
	     <form action="/member/modify" method="post" class="row">
	       <div class="col-md-5 m-3">
	         <h5>가입정보</h5>
	         <div class="form-label-group">
	           <input type="number" class="form-control" value="${mvo.mno }" name="mno" readonly>
	           <label for="mno" class="col-sm-5 control-label">회원번호</label>
	         </div>
	         <div class="form-label-group">
	           <input type="email" class="form-control" value="${mvo.email }" name="email" readonly>
	           <label for="email" class="col-sm-5 control-label">이메일</label>
	         </div>
	         <div class="form-label-group">
	           <input type="password" class="form-control" id="pwd" value="${mvo.pwd }" name="pwd">
	           <label for="pwd" class="col-sm-5 control-label">비밀번호 변경</label>
	         </div>
	         <div class="form-label-group">
	           <input type="password" class="form-control" placeholder="변경시 재입력" id="confirmPwd" name="confirmPwd">
	           <label for="confirmPwd" class="col-sm-5 control-label">비번확인</label>
	         </div>
           <div class="alert alert-success col-sm" id="alert-success">비밀번호가 일치합니다.</div>
           <div class="alert alert-danger col-sm" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
         </div>
         <div class="col-md-6 m-3">
           <h5>개인정보</h5>
           <div class="form-label-group">
             <input type="text" class="form-control" id="name" value="${mvo.name }" name="name">
             <label for="name" class="col-sm-5 control-label">이름</label>
           </div>
	         <div class="form-label-group">
             <input type="text" class="form-control" id="home" value="${mvo.home }" name="home">
	           <label for="home" class="col-sm-5 control-label">주소</label>
	         </div>
	         <div class="form-label-group">
	           <input type="text" class="form-control" id="tel" value="${mvo.tel }" name="tel">
	           <label for="tel" class="col-sm-5 control-label">전화번호</label>
	         </div>
	         <div class="form-label-group">
	           <input type="date" class="form-control" id="birth" value="${mvo.birth }" name="birth">
	           <label for="birth" class="col-sm-5 control-label">생년월일</label>
	         </div>
	         <div class="d-flex justify-content-end">
	          <button type="submit" class="btn btn-primary modBtn">수정하기</button>
	         </div>
         </div>
        </form>
	    </div>
	  </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>