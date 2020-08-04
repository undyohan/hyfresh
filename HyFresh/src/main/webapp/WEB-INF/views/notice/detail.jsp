<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<div class="container">
  <a href="/notice/list?&pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}" class="btn btn-success" style="display: block; width:50px; background-color: #17a2b8; border: 1px solid #17a2b8;">목록</a>
  <h2 style="display: inline-block;">${nvo.title }</h2><span> | ${nvo.modd8 }</span>
  <hr>
  <img src="/images/${nvo.img }">
  <br>
</div>
    <form action="/notice/remove" id="delForm" method="post">
      <input type="hidden" name="nno" value="${nvo.nno }">
      <input type="hidden" name="img" value="${nvo.img }">
      <input type="hidden" name="pageNum" value="${cri.pageNum }"> 
    <input type="hidden" name="amount" value="${cri.amount }"> 
    <input type="hidden" name="type" value="${cri.type }">
    <input type="hidden" name="keyword" value="${cri.keyword }"> 
    </form>
      <div class="btn_top">
   <a href="#top" style="right:10px;"><img src="/resources/img/btn_quick_to_top.png" alt="TOP"></a>
  </div>
<script>
   $('a[href^="#"]').on('click',function(e) {
       e.preventDefault();
       var target = this.hash;
       console.log(target);
       if(target == '#top') {
         
         var $target = $(document);
         $('html, body').stop().animate({
               'scrollTop': 0
           }, 900, 'swing');
       }else {
         var $target = $(target);
         $('html, body').stop().animate({
               'scrollTop': $target.offset().top-42
           }, 900, 'swing');
       }
       
   });
  $(function() {
    $("#delBtn").on("click", function(e) {
      e.preventDefault();
      $("#delForm").submit();
    });
  });
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>