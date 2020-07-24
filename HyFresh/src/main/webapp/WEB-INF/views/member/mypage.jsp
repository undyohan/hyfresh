<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	          <a href="/member/modify?mno=${mvo.mno }" class="nav-link text-muted">회원정보 변경</a>
	          <a href="/member/addr?mno=${mvo.mno }" class="nav-link text-muted">배송지 관리</a>
	          <a href="/member/resign" class="nav-link text-muted">회원탈퇴</a>
          </nav>
        </div>
	    </div>
	  </div>
	  <!-- Content -->
	  <div class="col-12 col-md-9">
	    <div class="border-top">
	      <div class="mt-4 mb-5">
		      <h4>${mvo.name }님 <a href="/member/modify?mno=${mvo.mno }"><i class="fas fa-cog dataspace"></i></a></h4>
		      <p class="text-muted">${mvo.mno }</p>
		      <p>회원등급 (
		        <c:choose>
	             <c:when test="${mvo.grade >= 90 }">관리자</c:when>
	             <c:when test="${mvo.grade >= 80 }">매니저</c:when>
	             <c:when test="${mvo.grade >= 50 }">VIP</c:when>
	             <c:when test="${mvo.grade >= 30 }">GOLD</c:when>
	             <c:when test="${mvo.grade >= 10 }">SILVER</c:when>
	             <c:otherwise>FAMILY</c:otherwise>
	           </c:choose>
	           )
		      </p>
		      <div class="card mt-2">
			      <div class="dataLabel p-4">총 적립금
			       <span class="dataNum"><fmt:formatNumber value="${mvo.point }" pattern="#,###" /></span>
			       원
		        </div>
		      </div>
	      </div>
	      <div class="mb-5">
	        <div class="d-flex justify-content-between">
	          <div class="d-inline-flex">
				      <h4>주문배송조회</h4>
		          <p class="ml-3 text-muted"> | 최근 1개월</p>
	          </div>
	          <div><a href="#">전체보기 <i class="fas fa-chevron-right dataspace"></i></a></div>
	        </div>
	        <div class="divider">
	        <div class="mt-3 mb-3">
		        <div class="d-flex row">
			        <a href="#" class="col-md-2 text-center dataNum">0</a>
			        <div class="text-center dataNum dataspace"></div>
			        <a href="#" class="col-md-2 text-center dataNum">0</a>
			        <div class="text-center dataNum dataspace"></div>
			        <a href="#" class="col-md-2 text-center dataNum">0</a>
			        <div class="text-center dataNum dataspace"></div>
			        <a href="#" class="col-md-2 text-center dataNum">0</a>
		        </div>
		        <div class="d-flex row">
			        <div class="col-md-2 text-center dataName">결제완료</div>
			        <div class="text-center dataName dataspace"><i class="fas fa-chevron-right"></i></div>
			        <div class="col-md-2 text-center dataName">배송준비중</div>
			        <div class="text-center dataName dataspace"><i class="fas fa-chevron-right"></i></div>
			        <div class="col-md-2 text-center dataName">배송중</div>
			        <div class="text-center dataName dataspace"><i class="fas fa-chevron-right"></i></div>
			        <div class="col-md-2 text-center dataName">배송완료</div>
		        </div>
	         </div>
	      </div>
	    </div>
	  </div>
  </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>