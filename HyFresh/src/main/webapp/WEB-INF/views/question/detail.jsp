
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<!-- Content section -->
<section class="py-5">
	<div class="container">
		<h1>공지사항 정보</h1>
		<table class="table table-hover" >
			<tr>
				<th class="bg-light">공지사항 번호</th>
				<td>${qvo.qno }</td>
			</tr>
			<tr>
				<th class="bg-light">작성자</th>
				<td>${qvo.writer }</td>
			</tr>
			<tr>
				<th class="bg-light">제목</th>
				<td>${qvo.title }</td>
			</tr>
			<tr>
				<th class="bg-light">등록일</th>
				<td>${qvo.regd8 }</td>
			</tr>
			<tr>
				<th class="bg-light">정보</th>
				<td>${qvo.content }</td>
			</tr>
			<tr>
				<th class="bg-light">파일</th>
				<td><img src="/images/${qvo.img }" width="480"></td>
			</tr>
			<tr>
				<th colspan="2"><a href="/question/list?pageNum=${cri.pageNum}&amount=${cri.amount}"
					class="btn btn-success">목록</a> <a
					href="/question/remove?qno=${qvo.qno }"
					class="btn btn-outline-danger" id="delBtn">삭제</a></th>
			</tr>
		</table>
		<form action="/question/remove" id="delForm" method="post">
			<input type="hidden" name="qno" value="${qvo.qno }">
			<input type="hidden" name="img" value="${qvo.img }">
		</form>
		<div id="cmtList">
			<ul class="nav nav-pills nav-justified row">
				<li class="nav-item col-md-2">작성자</li>
				<li class="nav-item col-md-8">댓글내용</li>
				<li class="nav-item col-md-2">작성일</li>
			</ul>
		</div>
	</div>
</section>

<script>
	$(function() {
		$("#delBtn").on("click", function(e) {
			e.preventDefault();
			$("#delForm").submit();
		});
	});
	
	/*comment part*/
	let cmt_writer='<c:out value="${sesInfo.name}"/>';
	let cmt_qno='<c:out value="${qvo.qno}"/>';
	
	listAnswer(cmt_qno);
	
	$("#cmtOkBtn").on("click", function(){
		let cmt_content=$("#cmtInput").val();
		console.log(cmt_writer);//admin이라 찍힘
		console.log(cmt_qno);//qno찍힘
		console.log(cmt_content);//내용찍힘
		if(cmt_content==null || cmt_content==''){
		      alert("댓글 내용을 입력해 주세요!");
		      return false;
		    }else{
		    	let cmtData={qno:cmt_qno, writer:cmt_writer, content:cmt_content};
		    	$.ajax({
		    	type:"post",
		    	url:"/answer/new",
		    	data:JSON.stringify(cmtData),
		    	contentType:"application/json; charset=utf-8"
		    	}).done(function(result){
		    		alert(result);
		    		listAnswer(cmt_qno);
		    	});
		    }
	});
	function listAnswer(param_qno){
		  $.getJSON("/answer/list/"+param_qno+".json", function(aList){
			  printListAnswer(aList);
			  console.log(aList);//aList라 이름 정한 이유는?

		  }).fail(function(){
		    alert("댓글 리스트 출력 실패");
		  });
		}

	function printListAnswer(listArr) {
	      $("#cmtList ul:first-child").nextAll().remove();
	      for (let avo of listArr) {
	      let ulTag ='<div class="container p-3 my-3 border"><ul class="nav nav-pills nav-justified row">';
	      ulTag += '<li class="nav-item col-md-2">'+avo.writer+'</li>';
	      ulTag += '<li class="nav-item col-md-8">'+avo.content+'</li>';
	      ulTag += '<li class="nav-item col-md-2">'+displayTime(avo.regd8)+'</li>';
	      ulTag += '</ul></div>'
	      $("#cmtList").append(ulTag);
	      }
	    }
	
 		 $(document).on("click",".delBtn",function(){
		      let ano=$(this).data("ano"); //this가 가르키는것: 버튼객체에서 data-ano값 ano를찾음
		      console.log(ano, cmt_qno);//ano찍힘
		      
		      removeAnswer(ano,cmt_qno);
		    });

	function removeAnswer(ano, qno){
		  $.ajax({
			    url:"/answer/"+ano,
			    type:"delete"
			  }).done(function(result){
			    alert(result);
			    listAnswer(qno);
			  });
			}
	
	 function displayTime(regd8){
	      let today = new Date();
	      let changeModd8 = new Date(regd8);
	      
	      let todayYear = today.getFullYear();
	      let todayMonth = today.getMonth()+1; // 0~11
	      let todayDate = today.getDate();
	      
	      let modYear = changeModd8.getFullYear();
	      let modMonth = changeModd8.getMonth()+1;
	      let modDate = changeModd8.getDate();
	      
	      let modHour = changeModd8.getHours();
	      let modMin = changeModd8.getMinutes();
	      let modSec = changeModd8.getSeconds();
	      
	      let hour = (modHour > 9 ? "" :"0") + modHour;
	      let min = (modMin > 9 ? "" : "0") + modMin;
	      let sec = (modSec > 9 ? "" : "0") + modSec;
	      let month = (modMonth > 9 ? "" : "0") + modMonth;
	      let day = (modDate > 9 ? "" : "0") + modDate;
	      
	      let diff = todayYear == modYear && todayMonth == modMonth && todayDate == modDate;
	      let dateStr = modYear+"-"+month+"-"+day;
	      let timeStr = hour+":"+min+":"+sec;
	      
	      return diff ? timeStr : dateStr;
	    }
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>