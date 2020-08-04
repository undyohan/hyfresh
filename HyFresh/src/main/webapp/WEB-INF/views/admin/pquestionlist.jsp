<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<main>
  <div class="container-fluid">
		<h3 class="mt-4">관리자용 상품문의 리스트</h3>
 		<table class="table table-sm table-hover">
			<thead class="thead-dark">
				<tr>
					<th>NO</th>
					<th>TITLE</th>
					<th>잠김표시</th>
					<th>DATE</th>
					<th>작성자</th>
					<th>답변</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${pqList ne null && nList.size()!=0}">
						<c:forEach items="${pqList }" var="pqvo">
							<tr>
								<td>${pqvo.pqno }</td>
								<c:if
									test="${pqvo.isLock==0 && (sesInfo.name eq  pqvo.writer || sesInfo.email eq 'admin@admin.com')}"> 
									<td><a href="/admin/pquestiondetail?pqno=${pqvo.pqno }&pageNum=${pgvo.cri.pageNum}&amount=${pgvo.cri.amount}">${pqvo.title }</a></td>
			 					</c:if> 
				 				<c:if test="${pqvo.isLock==1 }">
									<td><a href="/admin/pquestiondetail?pqno=${pqvo.pqno }&pageNum=${pgvo.cri.pageNum}&amount=${pgvo.cri.amount}">${pqvo.title }</a></td>
								</c:if> 
								<c:if test="${pqvo.isLock==0 && (sesInfo.name ne  pqvo.writer && sesInfo.email ne 'admin@admin.com')}">
									<td>${pqvo.title }</td>
								</c:if>
								<td><c:if test="${pqvo.isLock ==0 && (sesInfo.name ne  pqvo.writer && sesInfo.email ne 'admin@admin.com') }">
										<i class='fab fa-expeditedssl' style='font-size: 24px'></i>
									</c:if></td>

								<td>${pqvo.regd8 }</td>
								<td>${pqvo.writer }</td>
								<td>
                  <c:forEach items="${sList }" var="sqvo">
                   <c:if test="${sqvo.pqno eq pqvo.pqno}">
               <i class="fa fa-check" style="font-size:24px"></i>
                </c:if>
                  </c:forEach>
                  </td> 
							</tr>
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
				<!-- 	<tr>
						<th colspan="5"><a href="/pquestion/write"
							class="btn btn-primary">상품문의등록</a></th>
					</tr> -->
				</tfoot>
			</c:if>
		</table>
      <ul class="pagination">
      <c:if test="${pgvo.prev }">
        <li class="page-item"><a class="page-link"
         href="/admin/pquestionlist?pageNum=${pgvo.beginPagingNum-1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Previous</a></li>
      </c:if>
    <c:forEach begin="${pgvo.beginPagingNum }" end="${pgvo.endPagingNum }" var="i">
      <li class="page-item ${pgvo.cri.pageNum==i ?'active':'' }">
      <a class="page-link" 
      href="/admin/pquestionlist?pageNum=${i }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">${i}</a></li>
    </c:forEach>
      <c:if test="${pgvo.next }">
        <li class="page-item"><a class="page-link"
        href="/admin/pquestionlist?pageNum=${pgvo.endPagingNum +1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Next</a></li>
      </c:if>
    </ul> 

	</div>
</main>
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>
<script>



</script>
