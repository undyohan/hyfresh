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
	              <form action="/member/login" method="post">
	                <div class="form-label-group">
	                  <input type="email" id="email" class="form-control" placeholder="Email address" name="email" required autofocus>
	                  <label for="email">Email address<span id="chkEmail"></span></label>
	                </div>
	                <div class="form-label-group">
	                  <input type="password" id="pwd" class="form-control" placeholder="Password" name="pwd" required>
	                  <label for="pwd">Password</label>
	                </div>
	
	                <div class="custom-control custom-checkbox mb-3">
	                  <input type="checkbox" class="custom-control-input" id="rememberPwd">
	                  <label class="custom-control-label" for="rememberPwd">Remember password</label>
	                </div>
	                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">Sign in</button>
	                <div class="text-center">
	                  <a class="small" href="#">Forgot password?</a>
                  </div>
                  <hr class="my-4">
		              <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>
		              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button>
	              </form>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
</section>
<jsp:include page="../common/footer.jsp"></jsp:include>