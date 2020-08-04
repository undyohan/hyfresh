<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
   <div class="container">
     <div class="row">
       <div class="col-lg-10 col-xl-9 mx-auto">
         <div class="card card-signin flex-row my-5">
           <div class="card-img-left d-none d-md-flex">
           <!-- Background image for card set in CSS! -->
           </div>
           <div class="card-body">
             <h3 class="card-title text-center">회원가입</h3>
             <form class="form-signin" action="/member/join" method="post">
               <div class="form-label-group">
                 <input type="text" id="name" class="form-control" placeholder="Username" name="name" required autofocus>
                 <label for="name">Name</label>
               </div>
               <div class="form-label-group">
                 <input type="email" id="email" class="form-control" placeholder="Email address" name="email" required>
                 <label for="email">Email address</label>
               </div>
               <div class="alert alert-danger" id="alert-duple">중복된 이메일입니다.</div>
              <div class="alert alert-success" id="alert-possible">사용가능한 이메일입니다.</div>
              
               <hr>
   
               <div class="form-label-group">
                 <input type="password" id="pwd" class="form-control" placeholder="Password" name="pwd" required>
                 <label for="pwd">Password</label>
               </div>
               
               <div class="form-label-group">
                 <input type="password" id="confirmPwd" class="form-control" placeholder="Confirm Password" name="confirmPwd" required>
                 <label for="confirmPwd">Confirm password</label>
               </div>
               
               <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
               <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
   
               <button id="registerBtn" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" disabled>회원가입</button>
               <a class="d-block text-center mt-2 small" href="/member/login">로그인</a>
               <hr class="my-4">
               <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>
              <button class="btn btn-lg btn-naver btn-block text-uppercase" type="submit">N &nbsp; Sign in with Naver</button>
              <button class="btn btn-lg btn-kakao btn-block text-uppercase" type="submit"><i class="fab fa-kaggle mr-2"></i> Sign in with Kakaotalk</button>
             </form>
           </div>
         </div>
       </div>
     </div>
   </div>
<jsp:include page="../common/footer.jsp"></jsp:include>