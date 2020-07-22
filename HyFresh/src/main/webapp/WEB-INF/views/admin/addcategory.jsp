<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>

<section class="py-5">
  <div class="container">
    <h1>카테고리 등록</h1>
    <form action="/admin/addcategory" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <table class="table">
          <thead>
            <tr>
              <th>카테고리 코드</th>
              <th>카테고리 이름</th>
              <th>아이콘 이미지</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><input type="number" class="form-control" name="catecode"></td>
              <td><input type="text" class="form-control" name="catename"></td>
              <td><input type="file" class="form-control" name="iconfile"></td>
            </tr>
          </tbody>
        </table>
      </div>
      <button type="submit" class="btn btn-primary">등록하기</button>
      <a href="/admin/catelist"><button type="button" class="btn btn-info">리스트로 돌아가기</button></a>
    </form>
  </div>
</section>
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>
