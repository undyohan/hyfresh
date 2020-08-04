<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<section class="py-5">
	<div class="container">
		<h1>개인문의 게시판</h1>
		<table class="table table-hover">
			<thead>
				<tr class="table-info">
					<th>NO</th>
					<th>TITLE</th>
					<th>DATE</th>
					<th>작성자</th>
					<th>첨부</th>
					<th>답변</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${qList ne null && nList.size()!=0}">
						<c:forEach items="${qList }" var="qvo">
							<c:if
								test="${sesInfo.name eq qvo.writer || sesInfo.email eq 'admin@admin.com'}">
								<tr>
									<td>${qvo.qno }</td>
									<td><a
										href="/question/detail?qno=${qvo.qno }&pageNum=${pgvo.cri.pageNum}&amount=${pgvo.cri.amount}">${qvo.title }</a></td>
									<td>${qvo.regd8 }</td>
									<td>${qvo.writer }</td>
									<td>
									 <c:if test="${qvo.img ne 'NONE' }">
                <i class='far fa-file-image' style='font-size:24px'></i>
                </c:if>
									</td>
									<td>
                  <c:forEach items="${sList }" var="sqvo">
                   <c:if test="${sqvo.qno eq qvo.qno}">
               <i class="fa fa-check" style="font-size:24px"></i>
                </c:if>
                  </c:forEach>
                  </td> 
								</tr>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<th colspan="6"><h3 class="text-center">공지사항이 없습니다</h3></th>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
			<c:if test="${sesInfo ne null }">
				<tfoot>
					<tr>
						<th colspan="5"><a href="/question/write"
							class="btn btn-primary">일반문의등록</a></th>
					</tr>
				</tfoot>
			</c:if>
		</table>
<c:if test="${sesInfo ne '' && sesInfo ne null}">
		<ul class="pagination">
			<c:if test="${pgvo.prev }">
				<li class="page-item"><a class="page-link"
					href="/question/list?pageNum=${pgvo.beginPagingNum-1 }&amount=${pgvo.cri.amount}">Previous</a></li>
			</c:if>
			<c:forEach begin="${pgvo.beginPagingNum }"
				end="${pgvo.endPagingNum }" var="i">
				<li class="page-item ${pgvo.cri.pageNum==i ?'active':'' }"><a
					class="page-link"
					href="/question/list?pageNum=${i }&amount=${pgvo.cri.amount}">${i}</a></li>
			</c:forEach>
			<c:if test="${pgvo.next }">
				<li class="page-item"><a class="page-link"
					href="/question/list?pageNum=${pgvo.endPagingNum +1 }&amount=${pgvo.cri.amount}">Next</a></li>
			</c:if>
		</ul>
</c:if>

	</div>
</section>
<jsp:include page="../common/footer.jsp"></jsp:include>
