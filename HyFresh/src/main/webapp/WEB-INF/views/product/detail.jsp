<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="py-5">
    <div class="container">
      <h1>Product Information List</h1>
      <table class="table table-hover">
      <tr>
        <th class="table-info">상품 번호</th>
        <td>${pvo.pno }</td>
      </tr>
      <tr>
        <th class="table-info">상품명</th>
        <td>${pvo.title }</td>
      </tr>
      <tr>
        <th class="table-info">등록자</th>
        <td>${pvo.writer }</td>
      </tr>
      <tr>
        <th class="table-info">상품내용</th>
        <td>${pvo.content }</td>
      </tr>
      <tr>
        <th class="table-info">조회수</th>
        <td>${pvo.readcount }</td>
      </tr>
      <tr>
        <th class="table-info">최종수정일</th>
        <td>${pvo.modd8 }</td>
      </tr>
      <tr>
        <th class="table-info">상품 이미지</th>
        <td><img src="/images/${pvo.imgfile }" style="width: 50%;"></td>
      </tr>
	      <tr>
	        <th colspan="2">
	        <a href="/product/list?pageNum=${cri.pageNum }&amount=${cri.amount }&type=${cri.type }&keyword=${cri.keyword }" class="btn btn-success">목록</a>
	        <c:if test="${sesInfo.email eq pvo.writer }">
	          <a href="/product/modify?pno=${pvo.pno }&pageNum=${cri.pageNum }&amount=${cri.amount }&type=${cri.type }&keyword=${cri.keyword }" class="btn btn-warning">수정</a>
	          <a href="/product/remove?pno=${pvo.pno }" class="btn btn-outline-danger" id="delBtn">삭제</a>
	        </c:if>
	        </th>
	      </tr>
    </table>
    <form action="/product/remove" id="delForm" method="post">
      <input type="hidden" name="pno" value="${pvo.pno }">
      <input type="hidden" name="imgFile" value="${pvo.imgfile }">
      <input type="hidden" value="${cri.pageNum }" name="pageNum">
      <input type="hidden" value="${cri.amount }" name="amount">
      <input type="hidden" value="${cri.type }" name="type">
      <input type="hidden" value="${cri.keyword }" name="keyword">
    </form>
    <c:if test="${sesInfo.email ne '' }">
		<div class="input-group mb-3">
			<input type="text" id="cmtInput" class="form-control" placeholder="댓글을 입력해주세요.">
			<div class="input-group-append">
				<button class="btn btn-primary" type="button" id="cmtOkBtn">OK</button>
				<button class="btn btn-danger" type="button" id="cmtResetBtn">Cancel</button>
			</div>
    </div>
    </c:if>
    <div id="cmtList">
      <ul>
        <li>작성자</li>
        <li>댓글 내용</li>
        <li>작성일</li>
        <li>기능</li>
      </ul>
    </div>
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" id="modOkBtn" class="btn btn-primary">확인</button>
      </div>

    </div>
  </div>
  </div>
  </div>
</section>
<script src="/resources/js/comment.js"></script>
<script>
$(function() {
	$("#delBtn").on("click", function(e) {
		e.preventDefault();
		$("#delForm").submit();
	});
	/* Comment Part */
	let cmt_writer = '<c:out value="${sesInfo.nickname}"/>';
    let cmt_pno = '<c:out value="${pvo.pno}"/>';
    
    listComment(cmt_pno);
    
    $("#cmtOkBtn").on("click",function(){
      let cmt_content = $("#cmtInput").val();
      if(cmt_content == null || cmt_content == ''){
        alert("댓글 내용을 입력해주세요!");
        return false;
      }else{
        let cmtData = {pno:cmt_pno,writer:cmt_writer,content:cmt_content};
        $.ajax({
          type: "post",
          url: "/comment/new",
          data: JSON.stringify(cmtData),
          contentType: "application/json; charset:utf-8"
        }).done(function(result){
          alert(result);
          listComment(cmt_pno);
        });
      }
    });
    $(document).on("click",".modBtn",function(){
      let parentsUl = $(this).closest("ul");
      let writer = $(parentsUl).find("li:first-child").text();
      let content = $(parentsUl).find("li:nth-child(2)").text();
      let modd8 = $(parentsUl).find("li:nth-child(3)").text();
      let cno = $(parentsUl).find("li:last-child button:first-child").data("cno");
      transferToModal(writer,content,modd8,cno);
    });
     
    $(document).on("click","#modOkBtn",function(){
      let content = $(document).find("#modInput").val();
      let cno = $(document).find("#modInput").data("cno");
      modifySubmit(cmt_pno,content,cno);
      $(document).find(".close").click();
      });
    
    $(document).on("click", ".delBtn", function(){
    	console.log("dsdsad");
    	let cno = $(this).data("cno");
    	removeComment(cno,cmt_pno);
    });
});
</script>

<jsp:include page="../common/footer.jsp"></jsp:include>