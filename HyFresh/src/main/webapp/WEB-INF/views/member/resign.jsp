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
    <div class="col-12 col-md-9">
      <div class="d-flex justify-content-center mt-5">
        <div class="d-flex flex-column">
	        <h5>그동안 사용해주셔서 감사합니다.</h5>
	        <div class="mt-4"></div>
	        <h6>탈퇴하시는 이메일 ${sesInfo.email }로 재가입 할 수 없게 됩니다.</h6>
	        <h6>보유한 포인트는 소멸됩니다. 그래도 진행할까요?</h6>
	        <div class="mt-5 mb-5">
	          <a href="/member/resign?email=${sesInfo.email }&ses=${sesInfo.email}" class="btn btn-danger m-auto">예/탈퇴</a>
	          <a href="/member/mypage" class="btn btn-primary m-atuo">아니오</a>
	        </div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>