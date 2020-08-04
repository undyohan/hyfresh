<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="py-5">
<div class="container">
  <img src="../../resources/img/dbanner.png" style="display: block; margin: 0 auto; padding-top: 20px">
  <c:forEach items="${pList }" var="pvo" varStatus="i">
    <c:if test="${i.count eq 1 or i.count eq 5 or i.count eq 9 or i.count eq 13 }">
      <div class="row" style=" margin: 10px 0; padding: 10px">
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
	  <c:if test="${i.count ne 1 and i.count ne 5 and i.count ne 9 and i.count ne 13}">
      <div class="col" style="max-width:276.67px;padding: 5px;">
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
    <c:if test="${i.count eq 4 or i.count eq 8 or i.count eq 12 }">
        </div>
    </c:if>
  </c:forEach>
</div>
<div>
<div class="container" style="display: flex; justify-content: center;">
  <ul class="pagination">
      <c:if test="${pgvo.prev }">
        <li class="page-item"><a class="page-link" href="/product/dlist?pageNum=${pgvo.beginPagingNum - 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type }&keyword=${pgvo.cri.keyword }">Prev</a></li>
      </c:if>
        <c:forEach begin="${pgvo.beginPagingNum }" end="${pgvo.endPagingNum }" var="i">
         <li class="page-item ${pgvo.cri.pageNum == i ? 'active':'' }"><a class="page-link" href="/product/dlist?pageNum=${i }&amount=${pgvo.cri.amount }&type=${pgvo.cri.type }&keyword=${pgvo.cri.keyword }">${i }</a></li>
        </c:forEach>
      <c:if test="${pgvo.next }">  
        <li class="page-item"><a class="page-link" href="/product/dlist?pageNum=${pgvo.endPagingNum + 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type }&keyword=${pgvo.cri.keyword }">Next</a></li>
      </c:if>
    </ul>
    </div>
</div>
</section>
<jsp:include page="../common/footer.jsp"></jsp:include>