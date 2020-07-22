<<<<<<< HEAD
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
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<section class="py-5">
	<div class="container">
		<h1>상품목록</h1>
		<div class="float-right form-group">
			<form action="/product/list?pageNum" class="form-inline">
			 <input type="hidden" name="pagenum" value="1">
			 <input type="hidden" name="amount" value="${pgvo.cri.amount }">
				<div class="input-group">
				
					<div class="input-group-prepend">
	         <select class="form-control" id="stype" name="type">
					  <option value="twc">선택</option>
					  <option value="t">상품명</option>
					  <option value="w">작성자</option>
					  <option value="c">상세내용</option>
					  <option value="tw">상품명+작성자</option>
					  <option value="tc">상품명+상세내용</option>
					  <option value="wc">작성자+상세내용</option>
						</select>
			     </div>
			     <input type="text" class="form-control" placeholder="키워드를 입력하세요" name="keyword">
			     <div class="input-group-append">
				     <button class="btn btn-success" type="submit">검색</button>
				   </div>
				</div>
			</form>
		</div>
		
		<table class="table table-hover">
			<thead>
				<tr class="table-info">
					<th>상품번호</th>
					<th>상품명</th>
					<th>등록자</th>
					<th>조회수</th>
					<th>최종수정일</th>
					<th>첨부</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
				 <c:when test="${pList ne null && pList.size() != 0}">
						<c:forEach items="${pList }" var="pvo">
							<tr>
								<td>${pvo.pno }</td>
								<td><a href="/product/detail?pno=${pvo.pno }&pSign=0&pageNum=${pgvo.cri.pageNum}&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">${pvo.title }</a></td>
								<td>${pvo.writer } 
								  <span class="badge badge-pill badge-warning">${pvo.cmtcnt }</span>
								</td>
								<td>${pvo.readcount }</td>
								<td>${pvo.modd8 }</td>
								<td>
								  <c:if test="${pvo.imgfile ne 'NONE'}">
								    <i class='far fa-file-image'></i>
								  </c:if>
								</td>
							</tr>
						</c:forEach>
				 </c:when>
				 <c:otherwise>
				   <th colspan="6"><h3 class="text-center">등록된 상품이 없습니다!</h3></th>
				 </c:otherwise>
				</c:choose>
			</tbody>
			<c:if test="${sesInfo.email ne null }">
				<tfoot>
				 <tr>
				   <th colspan="5">
				     <a href="/product/write" class="btn btn-primary">상품등록</a>
				   </th>
				 </tr>
				</tfoot>
			</c:if>
		</table>
		<div class="container">
			<ul class="pagination justify-content-center">
		   <c:if test="${pgvo.prev }">
		    <li class="page-item">
		     <a class="page-link"
		       href="/product/list?pageNum=${pgvo.beginPagingNum - 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Prev</a>
	      </li>
		   </c:if>
		   <c:forEach begin="${pgvo.beginPagingNum }" end="${pgvo.endPagingNum }" var="i">
		    <li class="page-item ${pgvo.cri.pageNum == i ? 'active' : ''}">
		     <a class="page-link"
		       href="/product/list?pageNum=${i }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">${i }</a>
		    </li>
		   </c:forEach>
		   <c:if test="${pgvo.next }">
		    <li class="page-item">
		     <a class="page-link"
		       href="/product/list?pageNum=${pgvo.endPagingNum + 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Next</a>
		    </li>
		   </c:if> 
		  </ul>
		</div>
	</div>
</section>
<jsp:include page="../common/footer.jsp"></jsp:include>