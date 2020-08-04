<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<!-- Content section -->
<section class="py-5">
	<div class="container">
		<h1>관리자 공지사항 정보</h1>
		<table class="table table-hover">
			<tr class="table-info">
				<th>공지사항 번호</th>
				<td>${nvo.nno }</td>
			</tr>
			<tr class="table-info">
				<th>작성자</th>
				<td>${nvo.writer }</td>
			</tr>
			<tr class="table-info">
				<th>제목</th>
				<td>${nvo.title }</td>
			</tr>
			<tr class="table-info">
				<th>조회수</th>
				<td>${nvo.readcount }</td>
			</tr>
			<tr class="table-info">
				<th>등록일</th>
				<td>${nvo.modd8 }</td>
			</tr>
			<tr class="table-info">
				<th>상세내용</th>
				<td>${nvo.content }</td>
			</tr>
			<tr class="table-info">
				<th>파일</th>
				<td><img src="/images/${nvo.img }" width="480"></td>
			</tr>
			<tr>
      <th colspan="2">
          <a href="/admin/noticelist?&pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}" class="btn btn-success">목록</a>
              <c:if test="${sesInfo.email eq 'admin@admin.com' }" >
          <a href="/admin/noticemodify?nno=${nvo.nno }&pSign=0&pageNum=${cri.pageNum }&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}" class="btn btn-warning">수정</a>
          <a href="/admin/noticeremove?nno=${nvo.nno }" class="btn btn-outline-danger" id="delBtn">삭제</a>  
          </c:if>
      </th>
      </tr>
		</table>
		<form action="/admin/noticeremove" id="delForm" method="post">
			<input type="hidden" name="nno" value="${nvo.nno }">
			<input type="hidden" name="img" value="${nvo.img }">
		  <input type="hidden" name="pageNum" value="${cri.pageNum }"> 
    <input type="hidden" name="amount" value="${cri.amount }"> 
    <input type="hidden" name="type" value="${cri.type }">
    <input type="hidden" name="keyword" value="${cri.keyword }"> 
		</form>

	</div>
</section>
<script>
	$(function() {
		$("#delBtn").on("click", function(e) {
			e.preventDefault();
			$("#delForm").submit();
		});
	});
</script>
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>