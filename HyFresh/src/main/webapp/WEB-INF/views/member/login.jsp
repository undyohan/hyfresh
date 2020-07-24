<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<section class="py-5">
	<div class="container-fluid">
	  <div class="row no-gutter">
	    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
	    <div class="col-md-8 col-lg-6">
	      <div class="login d-flex align-items-center py-5">
	        <div class="container">
	          <div class="row">
	            <div class="col-md-9 col-lg-8 mx-auto">
	              <h3 class="login-heading mb-4">로그인</h3>
	              <form action="/member/login" method="post" class="form-signin">
	                <div class="form-label-group">
	                  <input type="email" id="email" class="form-control" placeholder="Email address" name="email" required autofocus>
	                  <label for="email">Email address<span id="chkEmail"></span></label>
	                </div>
	                <div class="form-label-group">
	                  <input type="password" id="pwd" class="form-control" placeholder="Password" name="pwd" required>
	                  <label for="pwd">Password</label>
	                </div>
	
	                <div class="custom-control custom-checkbox mb-3">
	                  <input type="checkbox" class="custom-control-input" id="idSaveCheck">
	                  <label class="custom-control-label" for="idSaveCheck">Email 기억하기</label>
	                </div>
	                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">로그인</button>
	                <div class="text-center">
	                  <a class="small" href="#">비밀번호 찾기</a>
                  </div>
                  <hr class="my-4">
		              <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>
		              <!-- <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button> -->
		              <button class="btn btn-lg btn-naver btn-block text-uppercase" type="submit">N &nbsp; Sign in with Naver</button>
		              <button class="btn btn-lg btn-kakao btn-block text-uppercase" type="submit"><i class="fab fa-kaggle mr-2"></i> Sign in with Kakaotalk</button>
		              <div class="mt-2">
			              <a id="login-form-btn" href="javascript:loginFormWithKakao()">
		   							  <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/>
	  								</a>
									  <p id="login-form-result"></p>
		              </div>
	              </form>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
</section>
<script>
   $(document).ready(function() {
      var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
      $("input[name='email']").val(userInputId);

      if ($("input[name='email']").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩
         // 아이디 저장하기 체크되어있을 시,
         $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
      }

      $("#idSaveCheck").change(function() { // 체크박스에 변화가 발생시
         if ($("#idSaveCheck").is(":checked")) { // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='email']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
         } else { // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
         }
      });

      // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
      $("input[name='email']").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
         if ($("#idSaveCheck").is(":checked")) { // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='email']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
         }
      });
   });

   function setCookie(cookieName, value, exdays) {
      var exdate = new Date();
      exdate.setDate(exdate.getDate() + exdays);
      var cookieValue = escape(value)
            + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
      document.cookie = cookieName + "=" + cookieValue;
   }

   function deleteCookie(cookieName) {
      var expireDate = new Date();
      expireDate.setDate(expireDate.getDate() - 1);
      document.cookie = cookieName + "= " + "; expires="
            + expireDate.toGMTString();
   }

   function getCookie(cookieName) {
      cookieName = cookieName + '=';
      var cookieData = document.cookie;
      var start = cookieData.indexOf(cookieName);
      var cookieValue = '';
      if (start != -1) {
         start += cookieName.length;
         var end = cookieData.indexOf(';', start);
         if (end == -1)
            end = cookieData.length;
         cookieValue = cookieData.substring(start, end);
      }
      return unescape(cookieValue);
   }
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>