<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<main>
<div class="container-fluid">
	<h3 class="mt-4">상품리스트</h3>
	<div>
		<!-- 여기 안에 내용 작성 -->
		<a href="index.jsp?tg=reg" class="btn btn-sm btn-primary mb-3 mt-3">상품등록</a>
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
					<input type="text" class="form-control" placeholder="키워드를 입력하세요"
						name="keyword">
					<div class="input-group-append">
						<button class="btn btn-sm btn-primary" type="submit">검색</button>
					</div>
				</div>
			</form>
		</div>
		<table class="table table-sm table-hover">
			<thead class="thead-dark">
				<tr>
					<th>상품번호</th>
					<th>카테고리</th>
					<th>상품사진</th>
					<th>상품명</th>
					<th>상품가격</th>
					<th>재고</th>
					<th>배송비</th>
					<th>조회수</th>
					<th>판매수</th>
					<th>등록자</th>
					<th>최종수정일</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${pList ne null && pList.size() != 0}">
						<c:forEach items="${pList }" var="pvo">
							<tr>
								<td>${pvo.pno }</td>
								<td>${pvo.cateno }</td>
								<td>${pvo.img }</td>
								<td><a href="/product/detail?pno=${pvo.pno }&pSign=0&pageNum=${pgvo.cri.pageNum}&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">${pvo.pname }</a></td>
								<td>${pvo.price }</td>
								<td>${pvo.stock }</td>
								<td>${pvo.dfee }</td>
								<td>${pvo.readcount }</td>
								<td>${pvo.sellcount }</td>
								<td>${pvo.writer }</td>
								<td>${pvo.modd8 }</td>
								<td><a href="/admin/pmodify"><i class="fas fa-edit"></i></a> <a href="/admin/premove"><i class="fas fa-trash"></i></a></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td class="text-center" colspan="12">등록된 상품이 없습니다!</td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
			<c:if test="${sesInfo.email ne null }">
				<tfoot>
					<tr>
						<th colspan="5"><a href="/product/write"
							class="btn btn-primary">상품등록</a></th>
					</tr>
				</tfoot>
			</c:if>
		</table>
		<div class="container">
			<ul class="pagination justify-content-center">
				<c:if test="${pgvo.prev }">
					<li class="page-item"><a class="page-link"
						href="/product/list?pageNum=${pgvo.beginPagingNum - 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Prev</a>
					</li>
				</c:if>
				<c:forEach begin="${pgvo.beginPagingNum }"
					end="${pgvo.endPagingNum }" var="i">
					<li class="page-item ${pgvo.cri.pageNum == i ? 'active' : ''}">
						<a class="page-link"
						href="/product/list?pageNum=${i }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">${i }</a>
					</li>
				</c:forEach>
				<c:if test="${pgvo.next }">
					<li class="page-item"><a class="page-link"
						href="/product/list?pageNum=${pgvo.endPagingNum + 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
</main>

<jsp:include page="../admin/adminfooter.jsp"></jsp:include>



