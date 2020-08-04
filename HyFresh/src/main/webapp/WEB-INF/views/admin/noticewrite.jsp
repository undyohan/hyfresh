<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<main>
  <div class="container-fluid">
		<h3 class="mt-4">관리자 공지사항 등록</h3>
		<form action="/admin/noticewrite" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">제목: </label> <input type="text"
					class="form-control" placeholder="제목입력" name="title">
			</div>
			<div class="form-group">
				<label for="writer">작성자: </label> <input type="text"
					class="form-control" value="${sesInfo.name }" readonly
					name="writer">
			</div>
			 <div class="form-group">
        <label for="content">내용정보: </label> 
        <textarea cols="5" class="form-control" name="content"></textarea>
      </div>
 			<div class="form-group">
        <label for="imgfile">그림파일: </label> <input type="file"
          class="form-control" name="img">
      </div> 
     
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</main>
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>