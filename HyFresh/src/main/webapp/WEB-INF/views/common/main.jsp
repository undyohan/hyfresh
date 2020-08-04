<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/resources/css/main.css" rel="stylesheet">
<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators" style="">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href="/notice/detail?nno=1&pSign=0"><img src="/resources/img/main_banner_1.jpg" width="1100" height="500"></a>
    </div>
    <div class="carousel-item">
      <a href="/notice/detail?nno=2&pSign=0"><img src="/resources/img/main_banner_2.png" width="1100" height="500"></a>
    </div>
    <div class="carousel-item">
      <a href="/notice/detail?nno=3&pSign=0"><img src="/resources/img/main_banner_3.jpg" width="1100" height="500"></a>
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>    
  <div class="container mt-3 mb-3">
  <h4 class="mt-3 mb-3" style="text-align: center;">베스트제품</h4>
  <c:forEach items="${pList }" var="pvo" varStatus="i">
    <c:if test="${i.count eq 1 or i.count eq 5 }">
      <div class="row" style="margin: 10px 0; padding: 10px">
        <div class="col" style="max-width:276.67px; padding: 5px;">
     <div class="card" style="height:100%; cursor:pointer;" onclick="location.href='/product/detail?pno=${pvo.pno }';">
        <img class="card-img-top" src="${pvo.img }" alt="Card image" style="width: 100%; height: 248px; object-fit: cover; overflow:hidden">
        <div class="card-body">
          <p class="card-text" style="color: #C8C8C8;font-size: 13px;">
          ${pvo.tname }
          </p>
          <h4 class="card-title" style="font-size: 20px; margin: 0px"><a>${pvo.pname }</a></h4>
          <span class="card-text" style="font-size: 20px; color: #009edb">
          <fmt:parseNumber value="${pvo.price}" integerOnly="true" var="price" />
          <fmt:parseNumber value="${pvo.discount}" integerOnly="true" var="discount" />
          <c:if test="${pvo.discount != 0 }">
          <span style="font-size: 15px; text-decoration: line-through; color: #b2b2b2"><fmt:formatNumber value="${pvo.price}" type="currency" currencySymbol=""/>원</span>
          <fmt:formatNumber value="${price * (1 - discount / 100) }" type="currency" currencySymbol=""/>
          </c:if>
          <c:if test="${pvo.discount == 0 }">
          <fmt:formatNumber value="${pvo.price}" type="currency" currencySymbol=""/>
          </c:if>
          </span>
          <span style="font-size: 13px; color: #009edb">원</span>
        </div>
      </div>
      </div>
    </c:if>
    <c:if test="${i.count ne 1 and i.count ne 5 }">
      <div class="col" style="max-width:276.67px; padding: 5px;">
    <div class="card" style="height:100%; cursor:pointer;" onclick="location.href='/product/detail?pno=${pvo.pno }';">
        <img class="card-img-top" src="${pvo.img }" alt="Card image" style="width: 100%; height: 248px; object-fit: cover; overflow:hidden">
        <div class="card-body">
          <p class="card-text" style="color: #C8C8C8;font-size: 13px;">
          ${pvo.tname }
          </p>
          <h4 class="card-title" style="font-size: 20px; margin: 0px"><a>${pvo.pname }</a></h4>
          <span class="card-text" style="font-size: 20px; color: #009edb">
          <fmt:parseNumber value="${pvo.price}" integerOnly="true" var="price" />
          <fmt:parseNumber value="${pvo.discount}" integerOnly="true" var="discount" />
          <c:if test="${pvo.discount != 0 }">
          <span style="font-size: 15px; text-decoration: line-through; color: #b2b2b2"><fmt:formatNumber value="${pvo.price}" type="currency" currencySymbol=""/>원</span>
          <fmt:formatNumber value="${price * (1 - discount / 100) }" type="currency" currencySymbol=""/>
          </c:if>
          <c:if test="${pvo.discount == 0 }">
          <fmt:formatNumber value="${pvo.price}" type="currency" currencySymbol=""/>
          </c:if>
          </span>
          <span style="font-size: 13px; color: #009edb">원</span>
        </div>
      </div>
    </div>
    </c:if>
    <c:if test="${i.count % 4 == 0 }">
        </div>
    </c:if>
  </c:forEach>
</div>
</div>

<div class="container-fluid">
  <img src="/resources/img/main_sub_banner.jpg">
</div>

<!-- carousel 아니고 정지된 이미지라 바꿈 -->
<!-- <div id="demo2" class="carousel slide" data-ride="carousel">

  Indicators
  <ul class="carousel-indicators">
    <li data-target="#demo2" data-slide-to="0" class="active"></li>
    <li data-target="#demo2" data-slide-to="1"></li>
    <li data-target="#demo2" data-slide-to="2"></li>
  </ul>

  The slideshow
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/resources/img/main_sub_banner.jpg">
    </div>
    <div class="carousel-item">
      <img src="/resources/img/main_sub_banner.jpg">
    </div>
    <div class="carousel-item">
      <img src="/resources/img/main_sub_banner.jpg">
    </div>
  </div>

  Left and right controls
  <a class="carousel-control-prev" href="#demo2" data-slide="prev" style="left: 150px">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo2" data-slide="next" style="right: 150px">
    <span class="carousel-control-next-icon"></span>
  </a> -->

</div>
  <div class="container mt-3 mb-3">
    <h4 class="mt-3 mb-3" style="text-align: center;">신제품</h4>
    <div class="row">
    <c:forEach items="${pList2 }" var="pvo2" varStatus="i">
     <div class="col font-weight-bolder mb-5" style="max-width: 350px; text-align:center; overflow:hidden; padding: 0; margin: 0 15px;">
       <a href="/product/detail?pno=${pvo2.pno }" class="new-a">
         <img src="${pvo2.img }" class="new-img">
         <span class="new-span">${pvo2.pname }<br><fmt:formatNumber value="${pvo2.price}" type="currency" currencySymbol=""/>원</span>
       </a>
     </div>
     </c:forEach>
    </div>
  </div>