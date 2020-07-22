<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<section class="py-5">
  <div class="container">
    <div class="mb-3">
      <a href="/product/list?pageNum=${cri.pageNum }&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}" class="btn btn-success">상품목록</a>
    </div>
    <h3>상품 상세정보</h3>
    <form action="/product/detail" method="post">
      <div class="container d-flex">
        <div class="col-sm-5">
          <img src="/images/${pvo.img }" class="detail-img">
        </div>
        <div class="col-sm-7">
          <ul>
            <li class="detail-tit">${pvo.title }</li>
            <li class="mb-3">등록자 : ${pvo.writer }</li>
            <li class="mb-3">
              <a href="" class="btn btn-secondary">장바구니</a>
              <a href="" class="btn btn-primary">바로구매</a>
              <a href="" class="btn btn-danger">♡</a>
            </li>
            <li>조회수 ${pvo.readcount }</li>
            <li class="mt-3 detail-subtit">상세설명</li>
            <li style="white-space:pre;">${pvo.content }</li>
            <li>최초등록일 : ${pvo.regd8 }</li>
            <li>최종수정일 : ${pvo.modd8 }</li>
            <li>상품번호 : ${pvo.pno }</li>
          </ul>
        </div>
      </div>
    </form>
    <div class="mt-3">
	    <c:if test="${sesInfo.email eq pvo.writer || sesInfo.email eq 'admin@admin.com'}">
		   <a href="/product/modify?pno=${pvo.pno }&pSign=0&pageNum=${cri.pageNum }&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}"
		      class="btn btn-warning">수정</a>
       <a href="#" class="btn btn-outline-danger" id="delBtn">삭제</a>
	    </c:if>
    </div>
    <form action="/product/remove" id="delForm" method="POST">
      <input type="hidden" name="pno" value="${pvo.pno }">
      <input type="hidden" name="imgfile" value="${pvo.img}">
      <input type="hidden" name="pageNum" value="${cri.pageNum}">
      <input type="hidden" name="amount" value="${cri.amount}">
      <input type="hidden" name="type" value="${cri.type}">
      <input type="hidden" name="keyword" value="${cri.keyword}">
    </form>
    <c:if test="${sesInfo.email ne ''}">
	    <div class="input-group mt-3">
			  <input type="text" id="cmtInput" class="form-control" placeholder="댓글 입력">
			  <div class="input-group-append">
			    <button class="btn btn-primary" type="button" id="cmtOkBtn">OK</button>
			    <button class="btn btn-danger" type="button" id="cmtResetBtn">Cancel</button>
			  </div>
			</div>
    </c:if>
		
		<div id="cmtList">
		  <ul class="nav nav-pills nav-justified">
		    <li class="nav-item">작성자</li>
		    <li class="nav-item">댓글내용</li>
		    <li class="nav-item">작성일</li>
		    <li class="nav-item">기능</li>
		  </ul>
		</div>
		<div id="cmtPaging">
		</div>
		<!-- The Modal -->
	  <div class="modal" id="modModal">
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
$(function(){
	$("#delBtn").on("click", function(e) {
		e.preventDefault();
		$("#delForm").submit();
	})
	/* Comment part */
	let cmt_writer = '<c:out value="${sesInfo.nickname}"/>';
	let cmt_pno = '<c:out value="${pvo.pno}"/>';
	
	listComment(cmt_pno);
	$(document).on("click", "#cmtPaging li a", function(e){
		e.preventDefault();
		listComment(cmt_pno,$(this).attr("href"));
	});
	
	$("#cmtOkBtn").on("click", function() {
		let cmt_content = $("#cmtInput").val();
		if (cmt_content == null || cmt_content == '') {
			alert("댓글 내용을 입력해주세요!");
			return false;
		} else {
			let cmtData = {
				pno : cmt_pno,
				writer : cmt_writer,
				content : cmt_content
			};
			$.ajax({
				type : "post",
				url : "/comment/new",
				data : JSON.stringify(cmtData),
				contentType : "application/json; charset:utf-8"
			}).done(function(result) {
				alert(result);
				listComment(cmt_pno);
			});
		}
		$("#cmtInput").val('');
	});
	
	$(document).on("click",".modBtn", function(){
		let parentsUl = $(this).closest("ul");
    let writer = $(parentsUl).find("li:first-child").text();
		let content = $(parentsUl).find("li:nth-child(2)").text();
		let cno = $(parentsUl).find("li:last-child button:first-child").data("cno");
		transferToModal(writer,content,cno);
	});
	
	$(document).on("click", "#modOkBtn", function(){
	 let content = $(document).find("#modInput").val();
	 let cno = $(document).find("#modInput").data("cno");
	 modifySubmit(cmt_pno,content,cno);
	 $(document).find(".close").click();
	});
	
	$(document).on("click",".delBtn", function(){
		let cno = $(this).data("cno");
		removeComment(cno,cmt_pno);
	});
});
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>