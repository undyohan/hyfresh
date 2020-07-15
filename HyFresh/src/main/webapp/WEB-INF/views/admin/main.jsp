<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container">
    <a class="navbar-brand" href="#">관리자페이지</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
				<c:if test="${sesInfo ne null }">
				  <li class="nav-item">
				    <a class="nav-link" href="#">${sesInfo.name }
              <c:choose>
                <c:when test="${grade >= 90 }">(관리자)</c:when>
                <c:when test="${grade >= 80 }">(매니저)</c:when>
                <c:when test="${grade >= 50 }">(VIP)</c:when>
                <c:when test="${grade >= 30 }">(GOLD)</c:when>
                <c:when test="${grade >= 10 }">(SILVER)</c:when>
                <c:otherwise>(FAMILY)</c:otherwise>
              </c:choose>
            </a>
          </li>
				</c:if>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> 설정 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="/">쇼핑몰가기</a>
						<a class="dropdown-item" href="">비밀번호 변경</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="/member/logout">로그아웃</a>
					</div>
				</li>
				<li class="nav-item">
				  <a class="nav-link" href="/member/logout">로그아웃</a>
        </li>
			</ul>
    </div>
  </div>
</nav>
<div class="d-flex" id="wrapper">
  <!-- Sidebar -->
  <div class="bg-light border-right" id="sidebar-wrapper">
    <div class="list-group list-group-flush">
      <a href="#" class="list-group-item list-group-item-action bg-light">상품관리</a>
      <a href="#" class="list-group-item list-group-item-action bg-light">주문/배송관리</a>
      <a href="#" class="list-group-item list-group-item-action bg-light">취소/반품/교환 관리</a>
      <a href="#" class="list-group-item list-group-item-action bg-light">회원관리</a>
      <a href="#" class="list-group-item list-group-item-action bg-light">상품 분류 관리</a>
      <a href="#" class="list-group-item list-group-item-action bg-light">게시판 관리</a>
      <a href="#" class="list-group-item list-group-item-action bg-light">통계</a>
      <a href="#" class="list-group-item list-group-item-action bg-light">설정</a>
    </div>
  </div>
  <div id="page-content-wrapper">
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
			<button class="btn btn-primary" id="menu-toggle">Toggle Menu</button>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
					<li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Dropdown </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div></li>
				</ul>
			</div>
		</nav>
		<div class="container-fluid">
      <h1 class="mt-4">Simple Sidebar</h1>
      <p>The starting state of the menu will appear collapsed on
        smaller screens, and will appear non-collapsed on larger screens.
        When toggled using the button below, the menu will change.</p>
      <p>
        Make sure to keep all page content within the
        <code>#page-content-wrapper</code>
        . The top navbar is optional, and just for demonstration. Just
        create an element with the
        <code>#menu-toggle</code>
        ID which will toggle the menu when clicked.
      </p>
    </div>
  </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>