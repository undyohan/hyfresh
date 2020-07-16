<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="py-5">
<div class="container">
  <img src="../../resources/img/banner.png" style="display: block; margin: 0 auto; padding-top: 20px">
  <c:forEach items="${pList }" var="pvo" varStatus="i">
    <c:if test="${i.count eq 1 or i.count eq 5}">
      <div class="row" style="margin: 10px 0; padding: 10px">
	      <div class="col" style="padding: 5px;">
	    <div class="card" style="">
	      <img class="card-img-top" src="${pvo.img }" alt="Card image" style="width:100%">
	      <div class="card-body">
	        <p class="card-text" style="color: #C8C8C8;font-size: 13px;">
	        ${pvo.tname }
	        </p>
	        <h4 class="card-title" style="font-size: 20px; margin: 0px"><a href="/product/detail?pno=${pvo.pno }">${pvo.pname }</a></h4>
	        <span class="card-text" style="font-size: 20px; color: #009edb">${pvo.price }</span><span style="font-size: 13px; color: #009edb">원</span>
	      </div>
	    </div>
	    </div>
    </c:if>
	  <c:if test="${i.count ne 1 and i.count ne 5 }">
      <div class="col" style="padding: 5px;">
    <div class="card" style="">
      <img class="card-img-top" src="${pvo.img }" alt="Card image" style="width:100%">
      <div class="card-body">
        <p class="card-text" style="color: #C8C8C8;font-size: 13px;">
        ${pvo.tname }
        </p>
        <h4 class="card-title" style="font-size: 20px; margin: 0px"><a href="/product/detail?pno=${pvo.pno }">${pvo.pname }</a></h4>
        <span class="card-text" style="font-size: 20px; color: #009edb">${pvo.price }</span><span style="font-size: 13px; color: #009edb">원</span>
      </div>
    </div>
    </div>
    </c:if>
    <c:if test="${i.count eq 4 }">
        </div>
    </c:if>
  </c:forEach>
</div>
<div>
  <ul class="pagination">
      <c:if test="${pgvo.prev }">
        <li class="page-item"><a class="page-link" href="/product/list?pageNum=${pgvo.beginPagingNum - 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type }&keyword=${pgvo.cri.keyword }">Prev</a></li>
      </c:if>
        <c:forEach begin="${pgvo.beginPagingNum }" end="${pgvo.endPagingNum }" var="i">
         <li class="page-item ${pgvo.cri.pageNum == i ? 'active':'' }"><a class="page-link" href="/product/list?pageNum=${i }&amount=${pgvo.cri.amount }&type=${pgvo.cri.type }&keyword=${pgvo.cri.keyword }">${i }</a></li>
        </c:forEach>
      <c:if test="${pgvo.next }">  
        <li class="page-item"><a class="page-link" href="/product/list?pageNum=${pgvo.endPagingNum + 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type }&keyword=${pgvo.cri.keyword }">Next</a></li>
      </c:if>
    </ul>
</div>
</section>
<jsp:include page="../common/footer.jsp"></jsp:include>