<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<section class="py-5">
  <div class="container">
    <h1>카테고리 상세정보</h1>
      <div class="form-group mt-5 mb-5">
        <table class="table text-center">
          <thead>
            <tr class="table-info">
              <th style="width:200px">카테고리 번호</th>
              <th style="width:200px">카테고리 코드</th>
              <th style="width:200px">카테고리 이름</th>
              <th style="width:200px">아이콘 이미지</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>${catevo.cateno }</td>
              <td>${catevo.catecode }</td>
              <td>${catevo.catename }</td>
              <td><c:if test="${catevo.iconfile != null }">
                <img src="/images/${catevo.iconfile }" width="50">
              </c:if></td>
            </tr>
          </tbody>
        </table>
      </div>
      <a href="/admin/catemodify?cateno=${catevo.cateno }" class="btn btn-warning">수정</a>
      <button type="button" id="delBtn" class="btn btn-outline-danger">삭제</button>
      <a href="/admin/catelist"><button type="button" class="btn btn-info">리스트로 돌아가기</button></a>
      <form action="/admin/cateremove" id="delForm" method="post">
        <input type="hidden" name="cateno" value="${catevo.cateno }">
        <input type="hidden" name="iconfile" value="${catevo.iconfile }">
      </form>
  </div>
</section>
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>
<script>
$(function(){
	$("#delBtn").on("click", function(e){
		e.preventDefault();
		$("#delForm").submit();
	});
});
</script>