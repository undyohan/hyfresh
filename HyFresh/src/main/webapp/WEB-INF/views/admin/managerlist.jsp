<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<section class="py-5">
  <div class="container">
    <h1>운영자 관리</h1>
    <div class="float-right form-group">
      <form action="/admin/managerlist" class="form-inline">
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
          <th>회원등급</th>
          <th>회원번호</th>
          <th>이메일</th>
          <th>이름</th>
          <th>전화번호</th>
          <th>생년월일</th>
          <th>회원가입 날짜</th>
          <th>적립금</th>
          <th>수정</th>
          <th>탈퇴</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${managerList }" var="mvo">
          <tr>
            <td>${mvo.grade }</td>
            <td>${mvo.mno }</td>
            <td>${mvo.email }</td>
            <td>${mvo.name }</td>
            <td>${mvo.tel }</td>
            <td>${mvo.birth }</td>
            <td>${mvo.regd8 }</td>
            <td>${mvo.point }</td>
            <td>
              <a href="#" id="modBtn" class="btn btn-warning">수정</a>
            </td>
            <td>
              <a href="/admin/resign?mno=${mvo.mno }&pageNum=${pgvo.cri.pageNum}&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}" class="btn btn-danger">탈퇴</a>
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
           href="/admin/managerlist?pageNum=${pgvo.beginPagingNum - 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Prev</a>
        </li>
       </c:if>
       <c:forEach begin="${pgvo.beginPagingNum }" end="${pgvo.endPagingNum }" var="i">
        <li class="page-item ${pgvo.cri.pageNum == i ? 'active' : ''}">
         <a class="page-link"
           href="/admin/managerlist?pageNum=${i }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">${i }</a>
        </li>
       </c:forEach>
       <c:if test="${pgvo.next }">
        <li class="page-item">
         <a class="page-link"
           href="/admin/managerlist?pageNum=${pgvo.endPagingNum + 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Next</a>
        </li>
       </c:if> 
      </ul> 
    </div>
  </div>
</section>
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>
<script>
$(function(){
  $(document).on("click", "#modBtn", function(){
    let parentTr = $(this).closest("tr");
    let grade = $(parentTr).find("td:nth-child(1)").text();
    let tel = $(parentTr).find("td:nth-child(5)").text();
    let birth = $(parentTr).find("td:nth-child(6)").text();
    let point = $(parentTr).find("td:nth-child(8)").text();
    $(parentTr).find("td:nth-child(1)").html('<input type="text" name="grade" class="form-control" value="'+grade+'">');
    $(parentTr).find("td:nth-child(5)").html('<input type="text" name="tel" class="form-control" value="'+tel+'">');
    $(parentTr).find("td:nth-child(6)").html('<input type="text" name="birth" class="form-control" value="'+birth+'">');
    $(parentTr).find("td:nth-child(8)").html('<input type="text" name="point" class="form-control" value="'+point+'">');
    let modFinBtn = '<a href="#" id="modFinBtn" class="btn btn-warning">수정완료</a>'
    $(this).closest("td").prepend(modFinBtn).trigger("create");
    $(this).remove();
  });
  $(document).on("click", "#modFinBtn", function(){
    let mno = $(this).closest("tr").find("td:nth-child(2)").text();
    let tel = $("input[name=tel]").val();
    let birth = $("input[name=birth]").val();
    let grade = $("input[name=grade]").val();
    let point = $("input[name=point]").val();
    let memData = {mno:mno, tel:tel, birth:birth, grade:grade, point:point};
    $.ajax({
    	type: "post",
      url: "/admin/mmodify",
      data: JSON.stringify(memData),
      contentType: "application/json; charset=UTF-8"
    }).done(function(result){
    	if(result > 0){
    		alert("회원 정보 수정이 완료되었습니다.");
    	} else{
    		alert("회원 정보 수정 실패");
    	}
    }).fail(function(request, status, error){
    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }).always(function(){
      location.replace("/admin/managerlist");
    });
  });
});
</script>


