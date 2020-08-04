<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<main>
  <div class="container-fluid">
    <h3 class="mt-4">탈퇴회원 리스트</h3>
    <div class="float-right form-group">
      <form action="/admin/resignlist" class="form-inline">
       <input type="hidden" name="pageNum" value="1">
       <input type="hidden" name="amount" value="${pgvo.cri.amount }">
        <div class="input-group">
          <div class="input-group-prepend">
           <select class="form-control" id="stype" name="type">
            <option value="en">이메일+이름</option>
            <option value="e">이메일</option>
            <option value="n">이름</option>
           </select>
           </div>
           <input type="text" class="form-control" placeholder="키워드를 입력하세요" name="keyword">
           <div class="input-group-append">
             <button class="btn btn-success" type="submit">검색</button>
           </div>
        </div>
      </form>
    </div>
    <table class="table table-sm table-hover">
      <thead class="thead-dark">
        <tr>
          <th>회원번호</th>
          <th>이메일</th>
          <th>이름</th>
          <th>집주소</th>
          <th>기본 배송지</th>
          <th>전화번호</th>
          <th>생년월일</th>
          <th>회원등급</th>
          <th>회원가입 날짜</th>
          <th>적립금</th>
          <th>삭제</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${resignList }" var="mvo">
          <tr>
            <td>${mvo.mno }</td>
            <td>${mvo.email }</td>
            <td>${mvo.name }</td>
            <td>${mvo.home }</td>
            <td>${mvo.addr }</td>
            <td>${mvo.tel }</td>
            <td>${mvo.birth }</td>
            <td>${mvo.grade }</td>
            <td>${mvo.regd8 }</td>
            <td>${mvo.point }</td>
            <td><a href="/admin/delete?mno=${mvo.mno }&pageNum=${pgvo.cri.pageNum}&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}" class="btn btn-danger">영구 삭제</a></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <div class="container">
      <ul class="pagination justify-content-center">
       <c:if test="${pgvo.prev }">
        <li class="page-item">
         <a class="page-link"
           href="/admin/resignlist?pageNum=${pgvo.beginPagingNum - 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Prev</a>
        </li>
       </c:if>
       <c:forEach begin="${pgvo.beginPagingNum }" end="${pgvo.endPagingNum }" var="i">
        <li class="page-item ${pgvo.cri.pageNum == i ? 'active' : ''}">
         <a class="page-link"
           href="/admin/resignlist?pageNum=${i }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">${i }</a>
        </li>
       </c:forEach>
       <c:if test="${pgvo.next }">
        <li class="page-item">
         <a class="page-link"
           href="/admin/resignlist?pageNum=${pgvo.endPagingNum + 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Next</a>
        </li>
       </c:if> 
      </ul> 
    </div>
  </div>
</main>
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>




