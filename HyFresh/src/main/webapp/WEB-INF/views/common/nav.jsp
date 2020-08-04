<link href="/resources/css/detail.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="sesInfo" value="${mInfo }" scope="session"/>
<c:set var="sesCate" value="${navCate }" scope="session"/>
<div class="container">
  <header class="header py-3">
    <div class="d-flex justify-content-end align-items-center mb-2">
     <ul class="d-flex nav justify-content-end align-items-center">
        <c:if test="${sesInfo.email eq 'admin@admin.com' }">
          <li class="nav-item">
            <a class="btn btn-sm btn-secondary m-1 adminBtn"  href="/admin/main">관리자페이지</a>
          </li>
        </c:if>
        <c:if test="${sesInfo ne null }">
          <li class="nav-item">
            <a class="nav-link text-muted navtext" href="/member/logout">로그아웃</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-muted navtext" href="/member/modify?mno=${sesInfo.mno }">${sesInfo.name }님
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
            <a class="nav-link text-muted navtext" href="/member/mypage?mno=${sesInfo.mno }">마이페이지</a>
          </li>
        </c:if>
        
        <c:if test="${sesInfo eq null }">
          <li class="nav-item">
            <a class="nav-link text-muted navtext" href="/member/login">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-muted navtext" href="/member/join">회원가입</a>
          </li>
        </c:if>
        <li class="nav-item">
          <a class="nav-link text-muted navtext adminBtn"  href="/product/list">상품목록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-muted navtext adminBtn"  href="/cart/list">장바구니<span class="badge badge-info ml-1">${cartQt }</span></a>
        </li>
      </ul>
      
    </div>
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-md-3 pt-1">
        <a class="text-muted ml-3" href="#" id="eatsOn"><img src="/resources/img/main_slogan_eatson.gif"></a>
      </div>
      <div class="col-md-6 text-center">
        <a class="nav-logo text-dark" href="/"><img src="/resources/img/brand.gif" class="nav-logo"></a>
      </div>
      
      <div class="col-md-3 search mr-3">
        <form action="/product/slist" id="search_form" class="form-inline">
          <input type="hidden" name="pageNum" value="1">
          <input type="text" placeholder="밀키트를 검색해 보세요" class="search_input"
          name="keyword" value="${cri.keyword }">
          <a href="#" id="search_btn"><img src="/resources/img/search_btn.png" alt="검색"></a>
        </form>
      </div>
      
      
      <!-- 준우가 만든 버튼 -->
 <!-- <div class="col-4 d-flex justify-content-end align-items-center">
        <div class="input-group">
        <form action="/product/slist" class="form-inline">
          <input type="text" class="form-control bg-light border-0 small"
            placeholder="Search for..." aria-label="Search" name="search" value="${search }"
            aria-describedby="basic-addon2">
          <div class="input-group-append">
            <button class="btn btn-primary" type="submit">
              <i class="fas fa-search fa-sm"></i>
            </button>
          </div>
          </form>
        </div> --!>
        <!-- 여기까지 -->
        
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

  <div class="container menuDiv mainMenu">
    <ul class="nav nav-justified">
      <li class="nav-item dropdown">
      <button class="dropbtn"><img src="/resources/img/hamburger.png"></button>
       <div class="menudrop dropdown-content clearfix">
      <c:forEach items="${sesCate }" var="catevo">
          <c:if test="${catevo.cateno eq 1000 }">
            <ul>
          </c:if>
          <c:if test="${catevo.cateno eq 2000 }">
             </ul>
             <ul>
            </c:if>
            <c:if test="${catevo.cateno eq 3000 }">
             </ul>
             <ul>
            </c:if>
            <c:if test="${catevo.cateno eq 4000 }">
             </ul>
             <ul>
            </c:if>
            <c:if test="${catevo.cateno eq 5000 }">
             </ul>
             <ul>
            </c:if>
            <c:if test="${catevo.cateno eq 6000 }">
             </ul>
             <ul>
            </c:if>
            <c:if test="${catevo.cateno eq 7000 }">
             </ul> 
             <ul>
            </c:if>
          <c:if test="${catevo.iconfile != null }">
            <img src="/images/${catevo.iconfile }" width="25">
          </c:if>
          <c:choose>
          <c:when test="${catevo.cateno.toString().substring(1) eq '000' }">
            <span class="bigCate">${catevo.catename }</span>
             <%-- <a href="/product/catelist?cateno=${catevo.cateno }" class="bigCate">${catevo.catename }</a> --%>
             <%-- <li><a href="/product/catelist?cateno=${catevo.cateno }">전체보기</a></li> --%>
          </c:when>
          <c:otherwise>
             <li><a href="/product/catelist?cateno=${catevo.cateno }">${catevo.catename }</a></li>
          </c:otherwise>
          </c:choose>
      </c:forEach>
      </div>
      
      </li>
      <li class="nav-item">
       <a class="nav-link text-body mt-1 font-weight-bolder" href="/product/list">신제품</a>
      </li>
      <li class="nav-item">
       <a class="nav-link text-body mt-1 font-weight-bolder" href="/product/dlist">알뜰쇼핑</a>
      </li>
      <li class="nav-item">
       <a class="nav-link text-body mt-1 font-weight-bolder" href="">이벤트</a>
      </li>
      <li class="nav-item">
       <a class="nav-link text-body mt-1 font-weight-bolder" href="/product/custom">맞춤쇼핑</a>
      </li>
      <li class="nav-item">
       <a class="nav-link text-body mt-1 font-weight-bolder" href="/notice/list">공지사항</a>
      </li>
      <li class="nav-item">
       <a class="nav-link text-body mt-1 font-weight-bolder" href="/question/list">개인문의</a>
      </li>
    </ul>
  </div>
  </div>
  
  <script>
  $(function(){
    $("#eatsOn").on("click", function(e){
      e.preventDefault();
      alert("잇츠온 배송 서비스를 준비중입니다.");
    });
    $("#search_btn").on("click", function(e){
      e.preventDefault();
      $("#search_form").submit();
    });
  });
  </script>
  