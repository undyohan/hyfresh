<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>

<section class="py-5">
	<div class="container">
	<h1>카테고리 관리</h1>
	<form action="/admin/addcategory">
	 <button type="submit" class="btn btn-primary mt-5 mb-5">카테고리 등록</button>
	 </form>
	 <form action="admin/catelist">
	 <input type="hidden" name="cateno" value="${catevo.cateno }">
	 <table class="table table-hover text-center">
      <thead>
        <tr class="table-info">
          <th style="width:200px">카테고리 코드</th>
          <th style="width:200px">카테고리 이름</th>
          <th style="width:200px">카테고리 아이콘</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${cList }" var="catevo">
          <tr>
            <td>${catevo.catecode }</td>
            <td><a href="/admin/catedetail?cateno=${catevo.cateno}">${catevo.catename }</a></td>
            <td>
	            <c:if test="${catevo.iconfile != null }">
	              <img src="/images/${catevo.iconfile }" width="50">
	            </c:if>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
	</form>
	</div>
</section>
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>
<script>
$(function(){
	$(document).on("click", "#modBtn", function(){
		let parentTr = $(this).closest("tr");
		let catecode = $(parentTr).find("td:nth-child(1)").text();
		let catename = $(parentTr).find("td:nth-child(2)").text();
		let imgsrc = $(parentTr).find("td:nth-child(4) img").attr('src');
		let old_imgfile = imgsrc.substring(imgsrc.indexOf("_")+1);
		$(parentTr).find("td:nth-child(1)").html('<input type="number" name="catecode" class="form-control" value="'+catecode+'">');
		$(parentTr).find("td:nth-child(2)").html('<input type="text" name="catename" class="form-control" value="'+catename+'">');
		$(parentTr).find("td:nth-child(4)").html('<input type="text" name="old_imgfile" class="text-center" value="기존파일명: '+old_imgfile+'" readonly><input type="file" name="iconfile" class="form-control">');
		let modFinBtn = '<a href="#" id="modFinBtn" class="btn btn-warning">수정완료</a>'
    $(this).closest("td").prepend(modFinBtn).trigger("create");
    $(this).remove();
	});
	$(document).on("click", "#modFinBtn", function(){
		let cateno = $(this).closest("tr").find("td:nth-child(3)").text();
		let catecode = $("input[name=catecode]").val();
		let catename = $("input[name=catename]").val();
		let iconfile = $("input[name=iconfile]").val();
		let cateData = {cateno:cateno, catecode:catecode, catename:catename, iconfile:iconfile};
		$.ajax({
      type: "post",
      url: "/admin/catemodify",
      data: JSON.stringify(cateData),
      contentType: "application/json; charset=UTF-8"
    }).done(function(result){
      if(result > 0){
        alert("카테고리 수정이 완료되었습니다.");
      } else{
        alert("카테고리 수정 실패");
      }
    }).fail(function(request, status, error){
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }).always(function(){
      location.replace("/admin/catelist");
    });
	});
});
</script>





