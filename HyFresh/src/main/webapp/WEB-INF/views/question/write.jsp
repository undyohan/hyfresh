<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<section class="py-5">
	<div class="container">
		<h1>공지사항 등록</h1>
		<form action="/question/write" method="post" enctype="multipart/form-data">
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
        <label for="img">그림파일: </label> <input type="file"
          class="form-control" name="img">
      </div>
     
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</section>
<jsp:include page="../common/footer.jsp"></jsp:include>