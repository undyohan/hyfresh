<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="sesInfo" value="${mInfo }" scope="session"/>
<div class="container">
  <header class="blog-header py-3">
    <div class="d-flex justify-content-end align-items-center">
      <ul class="nav justify-content-end">
        <li class="nav-item">
          <a class="nav-link" href="/product/list">상품목록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/notice/list">공지목록</a>
        </li>
        <c:if test="${sesInfo eq null }"> 
	        <li class="nav-item">
	          <a class="btn btn-sm btn-secondary" href="/member/join">회원가입</a>
	        </li>
	        <li class="nav-item">
	          <a class="btn btn-sm btn-outline-secondary" href="/member/login">로그인</a>
	        </li>
        </c:if>
        <c:if test="${sesInfo ne null }">
          <li class="nav-item">
            <a class="nav-link" href="/member/detail?email=${sesInfo.email }">${sesInfo.name }
              <c:choose>
                <c:when test="${sesInfo.grade >= 90 }">(관리자)</c:when>
                <c:when test="${sesInfo.grade >= 80 }">(매니저)</c:when>
                <c:when test="${sesInfo.grade >= 50 }">(VIP)</c:when>
                <c:when test="${sesInfo.grade >= 30 }">(GOLD)</c:when>
                <c:when test="${sesInfo.grade >= 10 }">(SILVER)</c:when>
                <c:otherwise>(FAMILY)</c:otherwise>
              </c:choose>
            </a>
          <li>
            <a class="nav-link" href="/member/mypage">마이페이지</a>
          </li>
        <c:if test="${sesInfo.email eq 'admin@admin.com' }">
          <li class="nav-item">
            <a class="nav-link btn btn-sm btn-primary" href="/admin/main">관리자페이지</a>
          </li>
        </c:if>          
        <li class="nav-item">
          <a class="nav-link" href="/member/logout">로그아웃</a>
        </li>
        </c:if>
      </ul>
      
    </div>
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
        <a class="text-muted" href="#">Subscribe</a>
      </div>
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" href="/"><img src="/resources/img/brand.png" class="blog-header-logo"></a>
      </div>
      
      <div class="col-4 d-flex justify-content-end align-items-center">
				<div class="input-group">
					<input type="text" class="form-control bg-light border-0 small"
						placeholder="Search for..." aria-label="Search"
						aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button class="btn btn-primary" type="button">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
				</div>
				<!-- Topbar Search -->
				<!-- <form
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small"
							placeholder="Search for..." aria-label="Search"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form> -->
				
      </div>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex">
      <a class="p-2 text-muted" href="#">전체 카테고리</a>
      <a class="p-2 text-muted" href="#">신제품</a>
      <a class="p-2 text-muted" href="#">알뜰쇼핑</a>
      <a class="p-2 text-muted" href="#">이벤트</a>
      <a class="p-2 text-muted" href="#">맞춤쇼핑</a>
    </nav>
  </div>
  
  