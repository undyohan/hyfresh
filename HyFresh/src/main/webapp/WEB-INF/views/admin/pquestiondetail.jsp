<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<!-- Content section -->
<section class="py-5">
	<div class="container">
		<h1>관리자용 상품문의 상세정보</h1>
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
				<th colspan="2"><a href="/admin/pquestionlist?pageNum=${pgvo.cri.pageNum}&amount=${pgvo.cri.amount}"
					class="btn btn-success">목록</a> 
					<a
					href="/admin/pquestionremove?pqno=${pqvo.pqno }"
					class="btn btn-outline-danger" id="delBtn">삭제</a></th>
			</tr>
		</table>
		<form action="/admin/pquestionremove" id="delForm" method="post">
      <input type="hidden" name="pqno" value="${pqvo.pqno }">
       <input type="hidden" name="pno" value="${pqvo.pno }">
       <input type="hidden" name="pageNum" value="${pgvo.cri.pageNum }"> 
    <input type="hidden" name="amount" value="${pgvo.cri.amount }"> 
      </form>
		 		<p>관리자 댓글 부분</p>
		<c:if test="${sesInfo.email eq 'admin@admin.com' }">
			<div class="input-group mt-3">
				<input type="text" id="cmtInput2" class="form-control"
					placeholder="댓글을 입력하세요..">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button" id="cmtOkBtn2">OK</button>
					<button class="btn btn-danger" type="button" id="cmtResetBtn2">Cancel</button>
				</div>
			</div>
		</c:if>
		<div id="cmtList2">
			
		</div>
	</div>
</section>

<script>
/*전역으로 빼놓음*/
let cmt_writer='<c:out value="${sesInfo.name}"/>';
let cmt_pqno='<c:out value="${pqvo.pqno}"/>';
let pno='<c:out value="${pqvo.pno}"/>'

listAnswer2(cmt_pqno);

$("#cmtOkBtn2").on("click", function(){
  let cmt_content=$("#cmtInput2").val();
  console.log(cmt_writer);//admin이라 찍힘
    console.log(cmt_pqno);//pqno찍힘
    console.log(cmt_content);//내용찍힘
    console.log(pno);//상품번호
    if(cmt_content==null || cmt_content==''){
      alert("댓글 내용 입력하셈");
      return false;
    }else{
      let cmt_data={pqno:cmt_pqno, writer:cmt_writer, content:cmt_content, pno:pno};
      $.ajax({
        type:"post",
        url:"/panswer/new",
        data:JSON.stringify(cmt_data),
        contentType:"application/json; charset=utf-8"
      }).done(function(result) {
    	  $("#cmtInput2").val("");
      alert(result);
      listAnswer2(cmt_pqno);
    });
    }
});

function listAnswer2(param_pqno){
  $.getJSON("/panswer/list/"+param_pqno+".json", function(paList) {
    printListAnswer2(paList);
    console.log(paList);
  }).fail(function() {
    alert("댓글리스트 출력실패")
  });
}

function printListAnswer2(listArr) {
   $("#cmtList2 ul:first-child").nextAll().remove();
      for (let pavo of listArr) {//작은것이 앞에
      let ulTag ='<div class="container p-3 my-3 border"><ul class="nav nav-pills nav-justified row">';
      ulTag += '<li class="nav-item col-md-2">'+pavo.writer+'</li>';
      ulTag += '<li class="nav-item col-md-7">'+pavo.content+'</li>';
      ulTag += '<li class="nav-item col-md-2">'+displayTime(pavo.regd8)+'</li>';
      ulTag += '<c:if test="${sesInfo.email eq 'admin@admin.com' }">';
      ulTag += '<button class="btn btn-outline-danger col-md-1 delBtn2" type="button" data-pano="'+pavo.pano+'">삭제</button></li></ul>'
      ulTag +='</c:if>';
      $("#cmtList2").append(ulTag);
      }
}

$(document).on("click", ".delBtn2", function(){
  let pano=$(this).data("pano");
  console.log(pano, cmt_pqno);
  removeAnswer(pano,cmt_pqno);
});

 function removeAnswer(pano, pqno){
      $.ajax({
          url:"/admin/panswerremove/"+pano,
          type:"delete"
        }).done(function(result){
          alert(result);
          listAnswer2(pqno);
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
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>