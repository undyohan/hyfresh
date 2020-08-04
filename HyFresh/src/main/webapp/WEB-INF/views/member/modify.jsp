<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<div class="container">
  <div class="row row-offcanvas row-offcanvas-left">
    <!-- Sidebar -->
    <div class="col-6 col-md-2 sidebar-offcanvas sidebar" id="sidebar">
      <div class="list-group">
        <a href="/member/mypage?mno=${mvo.mno }" class="list-group-item list-group-item-success text-center pt-5 pb-5 mypagehead border-0"><strong>마이페이지</strong></a>
        <a href="#" class="list-group-item list-group-item-action border-top border-white">주문배송조회</a>
        <a href="#" class="list-group-item list-group-item-action border-top border-white collapsed" data-toggle="collapse" data-target="#collapseBoard">
          <div class="sb-sidenav-collapse-arrow">
            상담 및 내글
            <i class="fas fa-angle-down"></i> 
          </div>
        </a>
        <div id="collapseBoard" class="collapse">
          <nav class="nav">
            <a href="#" class="nav-link text-muted">제품 Q&A</a>
            <a href="#" class="nav-link text-muted">문의내역</a>
          </nav>
        </div>
        <a href="#" class="list-group-item list-group-item-action border-top border-white collapsed" data-toggle="collapse" data-target="#collapseInfo">
          <div class="sb-sidenav-collapse-arrow">
            내 정보 관리
            <i class="fas fa-angle-down"></i>
          </div>
        </a>
        <div id="collapseInfo" class="collapse">
          <nav class="nav">
            <a href="/member/modify?mno=${sesInfo.mno }" class="nav-link text-muted">회원정보 변경</a>
            <a href="/member/addr?mno=${sesInfo.mno }" class="nav-link text-muted">배송지 관리</a>
            <a href="/member/resign" class="nav-link text-muted">회원탈퇴</a>
          </nav>
        </div>
      </div>
    </div>
    <!-- Content -->
    <div class="col-12 col-md-9 mt-4 mb-5">
      <h4>회원정보 수정</h4>
      <div class="mt-4">
       <form action="/member/modify" method="POST" class="row">
         <div class="col-md-5 m-3">
           <h5>가입정보</h5>
           <input type="hidden" class="form-control" id="pwd" value="${mvo.pwd }" name="pwd">
           <div class="form-label-group">
             <input type="number" class="form-control" value="${mvo.mno }" name="mno" readonly>
             <label for="mno" class="col-sm-5 control-label">회원번호</label>
           </div>
           <div class="form-label-group">
             <input type="email" class="form-control" value="${mvo.email }" name="email" readonly>
             <label for="email" class="col-sm-5 control-label">이메일</label>
           </div>
           <div class="d-flex justify-content-end">
            <a href="#" class="btn btn-primary" id="showModPwdBtn">비밀번호 변경</a>
           </div>
         </div>
         <div class="col-md-6 m-3" id="basicInfo">
           <h5>기본정보</h5>
           <div class="form-label-group">
             <input type="text" class="form-control" id="name" value="${mvo.name }" name="name">
             <label for="name" class="col-sm-5 control-label">이름 *</label>
           </div>
           <div class="form-label-group input-group">
             <input type="text" class="form-control" id="zipcode" value="${mvo.zipcode }" name="zipcode">
             <label for="home" class="col-sm-5 control-label">우편번호 *</label>
             <div class="input-group-append">
               <button class="btn btn-secondary pl-3 pr-3" type="button" id="findZipCode">검색</button>
             </div>
           </div>
           <input type="hidden" class="form-control" id="getHome" value="${mvo.home}">
           <div class="form-label-group">
             <input type="text" class="form-control" id="home1" name="home" readonly>
             <label for="home" class="col-sm-5 control-label">기본주소 *</label>
           </div>
           <div class="form-label-group">
             <input type="text" class="form-control" id="home2" name="home">
             <label for="home" class="col-sm-5 control-label">상세주소 *</label>
           </div>
           <div class="form-label-group">
             <input type="text" class="form-control" id="tel" value="${mvo.tel }" name="tel">
             <label for="tel" class="col-sm-5 control-label">전화번호 *</label>
           </div>
           <div class="form-label-group">
             <input type="date" class="form-control" id="birth" value="${mvo.birth }" name="birth">
             <label for="birth" class="col-sm-5 control-label">생년월일</label>
           </div>
           <div class="alert alert-danger col-sm" id="alert-empty">필수 입력에 빠진 부분이 있습니다.</div>
           <div class="small text-muted"> * 표시는 필수 입력</div>
           <div class="d-flex justify-content-end">
             <button type="submit" class="btn btn-primary" id="modBtn" disabled>수정하기</button>
           </div>
         </div>
        </form>
        <form action="/member/modifyPwd" method="POST" class="row" id="modPwd">
          <div class="col-md-5 m-3">
           <h5>비밀번호 변경</h5>
           <input type="hidden" class="form-control" value="${mvo.mno }" name="mno">
           <div class="form-label-group">
             <input type="password" class="form-control" id="pwd" name="pwd">
             <label for="pwd" class="col-sm-5 control-label">기존 비밀번호</label>
           </div>
           <div class="form-label-group">
             <input type="password" class="form-control" id="newPwd" name="newPwd">
             <label for="pwd" class="col-sm-5 control-label">변경할 비밀번호</label>
           </div>
           <div class="form-label-group">
             <input type="password" class="form-control" id="confirmNewpwd" name="confirmNewPwd">
             <label for="pwd" class="col-sm-5 control-label">비밀번호 확인</label>
           </div>
           <div class="alert alert-success col-sm" id="alert-success">비밀번호가 일치합니다.</div>
           <div class="alert alert-danger col-sm" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
           <div class="d-flex justify-content-end">
             <button type="submit" class="btn btn-primary" id="modPwdBtn" disabled>비밀번호 변경하기</button>
             <a href="#" class="btn btn-outline-primary ml-3" id="cancelModBtn">취소하기</a>
           </div>
            </div>
        </form>
      </div>
      </div>
  </div>
</div>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
$(document).ready(function(){
    let getHome = $("#getHome").val();
    let homeArr = getHome.split(',');
    let home1 = homeArr[0];
    let home2 = homeArr[1];
    $("#home1").val(home1);
    $("#home2").val(home2);
  });

$(document).on("keyup", "#tel", function() {
	  $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	});

$(function() {
	$("#findZipCode, #zipcode").on("click", function() {
     new daum.Postcode({oncomplete: function(data) {
           $('#zipcode').val(data.zonecode);
           $('#home1').val(data.address);
           $('#home2').val(data.buildingName);
         }
       }).open();
     });
	
  $("#alert-empty").hide();
  $("input").keyup(function() {
    if($("#name").val() =='' || $("#home1").val() == '' || $("#home2").val() == '' || $("#tel").val() == ''){
      $("#alert-empty").show();
      $("#modBtn").attr("disabled", "disabled"); 
    } else {
      $("#alert-empty").hide();
      $("#modBtn").removeAttr('disabled');
    }
  });
  
  $("#modPwd").hide();
  $("#showModPwdBtn").on("click", function() {
    $("#modPwd").show();
    $("#showModPwdBtn").hide();
    $("#basicInfo").hide();
  });
  
  $("#confirmNewpwd").keyup(function() {
    var newPwd = $("#newPwd").val();
    var confirmNewPwd = $("#confirmNewpwd").val();
    if (newPwd != "" && confirmNewPwd != "") {
      if(newPwd == confirmNewPwd) {
        $("#alert-success").show();
        $("#alert-danger").hide();
        $("#modPwdBtn").removeAttr('disabled');
      } else {
        $("#alert-success").hide();
        $("#alert-danger").show();
        $("#modPwdBtn").attr("disabled", "disabled");
      }
    }
  });
  
  $("#modPwdBtn").on("click", function() {
    $("#modPwd").hide();
    $("#showModPwdBtn").show();
    $("#basicInfo").show();
  });
  
  $("#cancelModBtn").on("click", function() {
	  $("#modPwd").hide();
	  $("#showModPwdBtn").show();
	  $("#basicInfo").show();
  });
});
</script>

<jsp:include page="../common/footer.jsp"></jsp:include>