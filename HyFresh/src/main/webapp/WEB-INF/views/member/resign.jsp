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
        <a href="/member/mypage?mno=${sesInfo.mno }" class="list-group-item list-group-item-success text-center pt-5 pb-5 mypagehead border-0"><strong>마이페이지</strong></a>
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
    <div class="col-12 col-md-9">
      <div class="d-flex justify-content-center mt-5">
        <div class="d-flex flex-column mt-5 mb-5">
	        <h5 class="mx-auto">그동안 사용해주셔서 감사합니다.</h5>
	        <div class="mt-4"></div>
	        <span class="mx-auto">이메일 ${sesInfo.email }로 재가입 할 수 없게 됩니다.</span>
	        <div class="mt-1"></div>
	        <span class="mx-auto">탈퇴하시면 보유한 포인트는 소멸됩니다. 그래도 진행할까요?</span>
	        <div class="mt-5 mb-5 mx-auto">
	          <a href="/member/updateResign?mno=${sesInfo.mno }&ses=${sesInfo.email}" class="btn btn-light mr-3 pl-4 pr-4">예 / 탈퇴</a>
	          <a href="/member/mypage?mno=${sesInfo.mno }" class="btn btn-light ml-3 pl-4 pr-4">아니오</a>
	        </div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>