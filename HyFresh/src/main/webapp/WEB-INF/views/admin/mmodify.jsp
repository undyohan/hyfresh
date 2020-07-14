<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<section class="py-5">
  <div class="container">
    <h1>회원정보 수정</h1>
    <form action="/member/modify" method="post">
      <div class="form-group">
        <label for="mno">회원번호:</label> <input type="number"
          class="form-control" value="${mvo.mno }" name="mno" readonly>
      </div>
      <div class="form-group">
        <label for="email">Email:</label> <input type="email"
          class="form-control" value="${mvo.email }" name="email" readonly>
      </div>
      <div class="form-group">
        <label for="pwd">Password:</label> <input type="password"
          class="form-control" id="pwd" value="${mvo.pwd }"
          name="pwd">
      </div>
      <div class="form-group">
        <label for="nick">Name:</label> <input type="text"
          class="form-control" id="nick" value="${mvo.nickname }"
          name="nickname">
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
</section>
<jsp:include page="../common/footer.jsp"></jsp:include>