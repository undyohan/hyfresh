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
      
      
    </div>
  </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>