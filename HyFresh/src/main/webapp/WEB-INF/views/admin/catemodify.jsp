<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>

<section class="py-5">
  <div class="container">
    <h1>카테고리 수정</h1>
    <form action="/admin/catemodify" method="post" enctype="multipart/form-data">
      <input type="hidden" id="hidVal" name="delImg" value="0">
      <input type="hidden" name="old_cateno" value="${catevo.cateno }">
      <div class="form-group mt-5 mb-5">
        <table class="table text-center">
          <thead>
            <tr>
              <th>카테고리 대분류 코드</th>
              <th>카테고리 소분류 코드</th>
              <th>카테고리 이름</th>
              <th>기존 아이콘</th>
              <th>아이콘 이미지</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><input type="number" class="form-control" name="catecode" value="${catevo.catecode }"></td>
              <td><input type="number" class="form-control" name="cateno" value="${catevo.cateno }"></td>
              <td><input type="text" class="form-control" name="catename" value="${catevo.catename }"></td>
              <td>
	              <c:if test="${catevo.iconfile != null }">
	               <img src="/images/${catevo.iconfile }" width="30">
	              </c:if>
	              <input type="hidden" name="old_imgfile" value="${catevo.iconfile }">
              </td>
              <td><input type="file" class="form-control" name="iconfile" value="${catevo.iconfile }"></td>
            </tr>
          </tbody>
        </table>
      </div>
      <button type="submit" id="modBtn" class="btn btn-primary">수정하기</button>
      <a href="/admin/catelist"><button type="button" class="btn btn-outline-danger">수정 취소</button></a>
    </form>
  </div>
</section>
<script>
$(function(){
	$("#modBtn").on("click", function(e){
		e.preventDefault();
		let iconfileName = $("input[name=iconfile]").val();
		if(iconfileName == ''){
			let isOk = confirm("기존 아이콘 파일이 삭제되어도 괜찮습니까?");
			isOk == true ? $("#hidVal").val("1") : 
				  $("#hidVal").val("0");
		} else{
			$("#hidVal").val("2");
		}
		$("form").submit();
	});
});
</script>
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>