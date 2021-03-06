<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<main>
  <div class="container-fluid">
	<h3 class="mt-4">관리자용 공지목록</h3>
	   <div class="float-right">
    <form action="/admin/list" class="form-inline form-group"><!-- 폼형 이쁘게 만드는 방법, 안치면 get 방식--> 
    <input type="hidden" name="pageNum" value="1"><!--검색을 했을때 첫번째 페이지를 보여줘야해서 1-->
    <input type="hidden" name="amount" value="${pgvo.cri.amount }">
    <div class="input-group">
      <div class="input-group-prepend">
        <select class="form-control" name="type" id="stype">
          <option value="t">제목</option>
        </select>
      </div>
      <input type="text" name="keyword" class="form-control" placeholder="키워드를 입력하세요">
      <div class="input-group-append">
        <button class="btn btn-success" type="submit">검색</button>
      </div>
    </div>
    </form>
    </div>
		<table class="table table-sm table-hover">
			<thead class="thead-dark">
				<tr>
					<th>NO</th>
					<th>TITLE</th>
					<th>DATE</th> 
					<th>조회수</th>	
					<th>첨부</th>	
				</tr>
			</thead>
			<tbody>
				<c:choose>
			 		<c:when test="${nList ne null && nList.size()!=0}">
						<c:forEach items="${nList }" var="nvo">
							<tr>
								<td>${nvo.nno }</td>
								<td><a href="/admin/noticedetail?nno=${nvo.nno }&pSign=0&pageNum=${pgvo.cri.pageNum}&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">${nvo.title }</a></td>
								<td>${nvo.modd8 }</td>
								<td>${nvo.readcount }</td>
								<td>
                <c:if test="${nvo.img ne 'NONE' }">
                <i class='far fa-file-image' style='font-size:24px'></i>
                </c:if>
                </td>
							</tr>
						</c:forEach>
					</c:when> 
					<c:otherwise>
						<tr>
							<th colspan="6"><h5 class="text-center">공지사항이 없습니다</h5></th>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
			 <tfoot>
			 <c:if test="${sesInfo.grade >= 80 }">
					<tr>
						<th colspan="5"><a href="/admin/main"
							class="btn btn-primary">관리자 페이지 가기</a></th>
					</tr>
</c:if>
			</tfoot> 
		</table>
<ul class="pagination">
      <c:if test="${pgvo.prev }">
        <li class="page-item"><a class="page-link"
         href="/admin/noticelist?pageNum=${pgvo.beginPagingNum-1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Previous</a></li>
      </c:if>
<c:forEach begin="${pgvo.beginPagingNum }" end="${pgvo.endPagingNum }" var="i">
      <li class="page-item ${pgvo.cri.pageNum==i ?'active':'' }">
      <a class="page-link" 
      href="/admin/noticelist?pageNum=${i }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">${i}</a></li>
    </c:forEach>
      <c:if test="${pgvo.next }">
        <li class="page-item"><a class="page-link"
        href="/admin/noticelist?pageNum=${pgvo.endPagingNum +1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Next</a></li>
      </c:if>
    </ul>
	</div>
</main>
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>
