<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<!-- Content section -->
<section class="py-5">
	<div class="container">

		<h1>관리자 공지사항 수정</h1>
		<form action="/admin/noticemodify" method="post" enctype="multipart/form-data">
		<input type="hidden" class="form-control" value="${nvo.nno }" name="nno">
    <input type="hidden" name="pageNum" value="${cri.pageNum }"> <!--Post방식, 정보 보이지않음 -->
    <input type="hidden" name="amount" value="${cri.amount }"> 
    <input type="hidden" name="type" value="${cri.type}">
    <input type="hidden" name="keyword" value="${cri.keyword }">
    <input type="hidden" id="hidVal" name="delImg" value="0">
    
			<div class="form-group">
				<label for="title">제목: </label> <input type="text"
					class="form-control" value="${nvo.title }" name="title">
			</div>
			<div class="form-group">
				<label for="writer">작성자: </label> <input type="text" name="writer"
					class="form-control"  value="${sesInfo.name }" readonly >
			</div>
			<div class="form-group">
        <label for="modd8">수정일:</label> <input type="text"
          class="form-control" id="modd8" name="modd8"
          value="${nvo.modd8 }" readonly>
      </div>
			<div class="form-group">
				<label for="content">상세정보: </label>
				<textarea cols="5" class="form-control" name="content">${nvo.content }</textarea>
			</div>
			<div class="form-group">
        <label for="img">기존이미지: </label> <input type="text"
         class="form-control" name="old_imgfile" value="${nvo.img }" readonly>
      </div>
			<div class="form-group">
				<label for="img">그림파일: </label> <input type="file"
					class="form-control" name="img">
			</div>
			<button type="submit" class="btn btn-primary" id="modSubmit">Submit</button>
		</form>
	</div>
</section>
<script>
$(function(){
    $("#modSubmit").on("click", function(e){
      e.preventDefault();
      let imgfileName=$("input[type=file]").val();
      if(imgfileName == ''){
        let isOk = confirm("기존 파일이 삭제되어도 괜찮습니까?");
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