<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<!-- Content section -->
<section class="py-5">
	<div class="container">
		<h1>상품문의 상세정보</h1>
		<table class="table table-hover">
			<tr class="table-info">
				<th>공지사항 번호</th>
				<td>${pqvo.pqno }</td>
			</tr>
			<tr class="table-info">
				<th>작성자</th>
				<td>${pqvo.writer }</td>
			</tr>
			<tr class="table-info">
				<th>잠금</th>
				<td>${pqvo.isLock }</td>
			</tr>
			<tr class="table-info">
				<th>제목</th>
				<td>${pqvo.title }</td>
			</tr>
			<tr class="table-info">
				<th>상세내용</th>
				<td>${pqvo.content }</td>
			</tr>
			<tr class="table-info">
				<th>등록일</th>
				<td>${pqvo.regd8 }</td>
			</tr>
			<tr>
				<th colspan="2"><a href="/pquestion/list"
					class="btn btn-success">목록</a> <a
					href="/pquestion/remove?pqno=${pqvo.pqno }"
					class="btn btn-outline-danger" id="delBtn">삭제</a></th>
			</tr>
		</table>
		<h1>상품문의 부분</h1>
		<button type="button" id="pqBtn">상품문의하기</button>

		<form action="/pquestion/write" method="post" id="writeform">
			<input type="hidden" name="pno" value="1" id="pno"> <br>
			<div class="form-group">
				<label for="lock">잠금선택:</label> <input type="radio" id="lock"
					name="isLock" value="0" checked required> <label for="lock">비공개</label>
				<input type="radio" id="unlock" name="isLock" value="1" required><label
					for="unlock">공개</label><br>
			</div>
			<div class="form-group">
				<label for="title">제목: </label> <input type="text" id="title"
					class="form-control" placeholder="제목입력" name="title">
			</div>
			<div class="form-group">
				<label for="writer">작성자: </label> <input type="text" id="writer"
					class="form-control" value="${sesInfo.name }" readonly
					name="writer">
			</div>
			<div class="form-group">
				<label for="content">내용정보: </label>
				<textarea cols="5" class="form-control" id="content" name="content"></textarea>
			</div>
			<button type="submit" id="sub" class="btn btn-primary">Submit</button>
		</form>

		<div id="pqList"></div>
		<div id="pqPaging"></div>


		<form action="/pquestion/remove" id="delForm" method="post">
			<input type="hidden" name="pqno" value="${pqvo.pqno }"> <input
				type="hidden" name="pno" value="${pqvo.pno }">
		</form>


	</div>
</section>

<script>
/*전역으로 빼놓음*/
let cmt_writer='<c:out value="${sesInfo.name}"/>';
let cmt_pqno='<c:out value="${pqvo.pqno}"/>';
let pno=$("#pno").val();


/*pquestion*/
$(function() {
    $("#writeform").hide();
        $("#pqBtn").on("click", function(e) {
          e.preventDefault();
          $("#writeform").show(); 
        });
});


listPQuestion(pno, 1, cmt_pqno);//진짜 선언해준거 적어주기


$(document).on("click", "#pqPaging li a", function(e) {//123456789클릭부분해서 이동하는 부분
    e.preventDefault();
    listPQuestion(pno, $(this).attr("href"), cmt_pqno);
  });
  
$("#sub").on("click",function(){
  let isLock=$('input[name="isLock"]:checked').val();
  let pno=$("#pno").val();
  let title=$("#title").val();
  let writer=$("#writer").val();
  let content=$("#content").val();
   console.log("zzzzzzzzzzzzzz"+content);//찍히는거 확인
   if((title==null || title=='')&&(content==null || content=='')){
     alert("제목 or 내용을 입력해 주세요!");
         return false;
   }else{
     let pqdata={pno:pno, title:title, isLock:isLock, writer:writer, content:content};
     $.ajax({
       type:"post",
            url:"/pquestion/new",
            data:JSON.stringify(pqdata),
            contentType:"application/json; charset=utf-8"
            }).done(function(result){
              alert(result);
              listPQuestion(param_pno);
     });
   }
});

function printListPQuestion(listArr1, pquestionTotal, page, listArr2) {//정보값 불러오기, 페이징 넣어주기
	  $("#pqList").children().remove();
	  for (let pqvo of listArr1) {
	     let ulTag ='<div class="card"><div class="card-header"><ul class="card-link" data-toggle="collapse">';
	         ulTag += '<li style="list-style:none;" class="nav-item">'+pqvo.title+'</li>';
	         ulTag += '<li style="list-style:none;" class="nav-item">'+pqvo.isLock+'</li>';
	         ulTag += '<li style="list-style:none;" class="nav-item">'+pqvo.writer+'</li>';
	         ulTag += '<li style="list-style:none;" class="nav-item">'+pqvo.content+'</li>';
	         ulTag += '<li style="list-style:none;" class="nav-item">'+displayTime(pqvo.regd8)+'</li><ul></div></div>';
	         for(let pavo of listArr2){
	         if(pqvo.pqno==pavo.pqno){
	           ulTag += '<div class="card-body" style="width: 80%; margin: 0 auto; text-align: center;">';
	            ulTag += '<li style="list-style:none;" class="nav-item">'+pavo.writer+'</li>';
	            ulTag += '<li style="list-style:none;" class="nav-item">'+pavo.content+'</li>';
	            ulTag += '<li style="list-style:none;" class="nav-item">'+displayTime(pavo.regd8)+'</li></div>';
	         }
	         }
	  $("#pqList").append(ulTag);
	     }
	  printPQuestionPaging(pquestionTotal,page);
	}
/* function printListAnswer(listArr) {
	   $("#cmtList2 ul:first-child").nextAll().remove();
	      for (let pavo of listArr) {
	    	  if(pqvo.pqno==pavo.pqno){
	      let ulTag ='<ul class="nav nav-pills nav-justified>';
	      ulTag += '<li class="nav-item">'+pavo.writer+'</li>';
	      ulTag += '<li class="nav-item">'+pavo.content+'</li>';
	      ulTag += '<li class="nav-item">'+displayTime(pavo.regd8)+'</li></ul>';
	      //$("#paList").append(ulTag);
	      }
	    }
	} */

	  function listPQuestion(param_pno, page, param_pqno){//문의사항 리스트 출력
	    let pageNo = page > 1 ? page : 1;
	    $.getJSON("/pquestion/list/"+param_pno+"/"+pageNo+".json",function(pqdto){
	    	$.getJSON("/panswer/list/"+param_pqno+".json", function(paList) {
	          printListPQuestion(pqdto.pqlist, pqdto.pqCnt, pageNo, paList);
	            console.log(">>리스트" + pqdto.pqlist);
	            console.log(pqdto.pqCnt);
	            console.log(pageNo);
	            console.log("ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ"+paList);
	          }).fail(function(){
	            alert("문의사항 리스트 출력 실패")
	      });
	    });
	  }
  
  
/*   function listPAnswer(param_pqno){//문의사항 댓글리스트 출력
    $.getJSON("/admin/panswerlist/"+param_pqno+".json", function(paList) {
      printListPQuestion(paList);
      console.log(paList);
    }).fail(function() {
      alert("댓글리스트 출력실패")
    });
  }  */


function printPQuestionPaging(pquestionTotal, page) {//페이징 불러오기
    let pquestionPagingObj = '<ul class="pagination">';
    let endPagingNum = Math.ceil(page/10.0) * 10;
    let beginPagingNum = endPagingNum - 9;
    let prev = beginPagingNum != 1;
    let next = false;
    if(endPagingNum * 10 >= pquestionTotal) {
      endPagingNum = Math.ceil(pquestionTotal/10.0);
    } else {
      next = true;
    }
    if(prev){
      pquestionPagingObj += '<li class="page-item">';
      pquestionPagingObj += '<a class="page-link" href="'+(beginPagingNum-1)+'">Prev</a></li>';
    }
    for (var i = beginPagingNum; i <= endPagingNum ; i++) {
      let classActive = page == i ? ' active' : '';
      pquestionPagingObj += '<li class="page-item'+classActive+'">';
      pquestionPagingObj += '<a class="page-link" href="'+i+'">'+i+'</a></li>';
      console.log("i"+i);
    }
    if(next){
      pquestionPagingObj += '<li class="page-item">';
      pquestionPagingObj += '<a class="page-link" href="'+(endPagingNum+1)+'">Next</a></li>';
    }
    pquestionPagingObj += '</ul>';
    $("#pqPaging").html(pquestionPagingObj);
  }



  
  $(document).on("click", ".delBtn", function(e) {
     let pqno=$(this).data("pqno"); //this가 가르키는것: 버튼객체에서 data-cno값 cno를찾음
        removePQuestion(pqno,pno);
  });
  
  function removePQuestion(pqno, pno){
     $.ajax({
    url:"/pquestion/"+pqno,
    type:"delete"
     }).done(function(result){
     alert(result);
     listPQuestion(pno);
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