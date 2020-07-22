<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>

<section class="py-5">
  <div class="container">
    <h1>카테고리 수정</h1>
    <form action="/admin/catemodify" method="post" enctype="multipart/form-data">
      <div class="form-group mt-5 mb-5">
        <table class="table text-center">
          <thead>
            <tr>
              <th>카테고리 번호</th>
              <th>카테고리 코드</th>
              <th>카테고리 이름</th>
              <th>기존 아이콘</th>
              <th>아이콘 이미지</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><input type="number" class="form-control" name="cateno" value="${catevo.cateno }" readonly></td>
              <td><input type="number" class="form-control" name="catecode" value="${catevo.catecode }"></td>
              <td><input type="text" class="form-control" name="catename" value="${catevo.catename }"></td>
              <td><input type="text" class="form-control" name="old_imgfile" value="${catevo.iconfile }" readonly></td>
              <td><input type="file" class="form-control" name="iconfile" value="${catevo.iconfile }"></td>
            </tr>
          </tbody>
        </table>
      </div>
      <button type="submit" id="modSubmit" class="btn btn-primary">수정하기</button>
      <a href="/admin/catedetail?cateno=${catevo.cateno }"><button type="button" class="btn btn-outline-info">상세정보로 돌아가기</button></a>
    </form>
  </div>
</section>
<script>
$(function(){
	$("#modSubmit").on("click", function(e){
		e.preventDefault();
		let iconfileName = $("input[type=file]").val();
		let hiddenVal = '<input type="hidden" id="hidVal" name="delImg" value="">';
		$("form").prepend(hiddenVal).trigger("create");
		if(iconfileName == ''){
			let isOk = confirm("기존 아이콘 파일 삭제 ㄱㅊ?");
			isOk == true ? $(document).find("#hidVal").val("1") : 
				  $(document).find("#hidVal").val("0");
		} else{
			$(document).find("#hidVal").val("2");
		}
		$("form").submit();
	});
});
</script>
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>