<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<section class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
  <div class="container">
    <h1>회원목록</h1>
    <div class="float-right form-group">
      <form action="/member/list?pageNum" class="form-inline">
       <input type="hidden" name="pagenum" value="1">
       <input type="hidden" name="amount" value="${pgvo.cri.amount }">
        <div class="input-group">
          <div class="input-group-prepend">
           <select class="form-control" id="stype" name="type">
            <option value="en">이메일+닉네임</option>
            <option value="e">이메일</option>
            <option value="n">닉네임</option>
            <option value="m">회원번호</option>
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
          <th>회원번호</th>
          <th>Email</th>
          <th>Name</th>
          <th>Register Date</th>
          <th>수정 / 탈퇴</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${mList }" var="mvo">
          <tr>
            <td>${mvo.mno }</td>
            <td>${mvo.email }</td>
            <td><a href="/member/detail?email=${mvo.email }">${mvo.nickname }</a></td>
            <td>${mvo.regd8 }</td>
            <td>
              <a href="/member/modify?email=${mvo.email }" class="btn btn-warning">수정</a>
              <a href="/member/resign?email=${mvo.email }&ses=${sesInfo.email }" class="btn btn-danger">탈퇴</a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <div class="container">
      <ul class="pagination justify-content-center">
       <c:if test="${pgvo.prev }">
        <li class="page-item">
         <a class="page-link"
           href="/member/list?pageNum=${pgvo.beginPagingNum - 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Prev</a>
        </li>
       </c:if>
       <c:forEach begin="${pgvo.beginPagingNum }" end="${pgvo.endPagingNum }" var="i">
        <li class="page-item ${pgvo.cri.pageNum == i ? 'active' : ''}">
         <a class="page-link"
           href="/member/list?pageNum=${i }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">${i }</a>
        </li>
       </c:forEach>
       <c:if test="${pgvo.next }">
        <li class="page-item">
         <a class="page-link"
           href="/member/list?pageNum=${pgvo.endPagingNum + 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Next</a>
        </li>
       </c:if> 
      </ul>
    </div>
  </div>
</section>
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>