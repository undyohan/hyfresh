<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>

<section class="py-5">
   <div class="container">
   <h1>카테고리 관리</h1>
   <form action="/admin/addcategory">
    <button type="submit" class="btn btn-primary mt-5">카테고리 등록</button>
   </form>
    <div class="float-right form-group mb-5">
      <form action="/admin/catelist" class="form-inline">
        <div class="input-group">
          <div class="input-group-prepend">
           <select class="form-control" name="type" id="sel">
            <option value="">카테고리 선택</option>
            <option value="1000">[1000] 유제품·유산균</option>
            <option value="2000">[2000] 건강식품</option>
            <option value="3000">[3000] 밀키트</option>
            <option value="4000">[4000] 국·반찬·채소</option>
            <option value="5000">[5000] 정육·수산·달걀</option>
            <option value="6000">[6000] 커피·음료·생수</option>
            <option value="7000">[7000] 샐러드·선식·콩류</option>
           </select>
           </div>
           <div class="input-group-append">
             <button type="submit" id="okBtn" class="btn btn-success">검색</button>
           </div>
        </div>
      </form>
    </div>
    <table class="table table-sm table-hover text-center">
      <thead class="thead-dark">
        <tr>
          <th>대분류 코드</th>
          <th>소분류 코드</th>
          <th>카테고리 이름</th>
          <th>카테고리 아이콘</th>
          <th>수정</th>
          <th>삭제</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${cList }" var="catevo">
          <tr>
            <td>${catevo.catecode }</td>
            <td>${catevo.cateno }</td>
            <td>${catevo.catename }</td>
            <td>
               <c:if test="${catevo.iconfile != null }">
                 <img src="/images/${catevo.iconfile }" width="30">
               </c:if>
            </td>
            <td><a href="/admin/catemodify?cateno=${catevo.cateno }" class="btn btn-warning">수정</a></td>
            <td>
            <form action="/admin/cateremove" id="delForm" method="post">
              <input type="hidden" name="iconfile" value="${catevo.iconfile }">
              <input type="hidden" name="cateno" value="${catevo.cateno }">
              <button type="button" id="delBtn" class="btn btn-outline-danger">삭제</button>
            </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
   </div>
</section>
<script>
$(function(){
   $("#okBtn").on("click", function(){
      let type = $("#sel option:selected").val();
   });
   $(document).on("click", "#delBtn", function(e){
      e.preventDefault();
      let isOk = confirm("카테고리 삭제를 진행하시겠습니까?");
      if(isOk == true) $(this).closest("form").submit();
   });
});
</script>
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>



