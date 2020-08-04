<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Footer -->
<footer class="py-4 bg-dark mt-auto footer">
  <div class="container-fluid">
    <p class="d-flex align-items-center justify-content-center small ">
      Copyright &copy; 1팀 (김희수,송민영,안요한,윤희국,이준우) 2020
    </p>
  </div>
  <!-- /.container -->
</footer>

<script type='text/javascript'>
  let msg = '<c:out value="${msg}"/>';
  if(msg != '') {alert(msg);}
  
  $(function() {
       $("#alert-possible").hide();
       $("#alert-duple").hide();
       $("#email").on("blur", function() {
             let emailVal = $("#email").val();
             $.ajax({
               url : "/member/checkDuple",
               type : "GET",
               data : {
                 email : emailVal
               },
               success : function(result) {
                 console.log(result);
                 if (result > 0) {
                    $("#alert-duple").show();
                     $("#alert-possible").hide();
                   } else {
                     $("#alert-duple").hide();
                     $("#alert-possible").show();
                 }
               }
             });
           })
     });
  $(function() {
    $("#alert-success").hide();
    $("#alert-danger").hide();
    $("#confirmPwd").keyup(function() {
      var pwd = $("#pwd").val();
      var confirmPwd = $("#confirmPwd").val();
      if (pwd != "" && confirmPwd != "") {
        if (pwd == confirmPwd) {
          $("#alert-success").show();
          $("#alert-danger").hide();
          $("#registerBtn").removeAttr('disabled');
        } else {
          $("#alert-success").hide();
          $("#alert-danger").show();
          $("#registerBtn").attr("disabled", "disabled");
        }
      }
    });
  });
  
  /* Kakao.init('5bd55378dbfa2926c3d82cc62d002004') */
  function loginFormWithKakao() {
    Kakao.Auth.loginForm({
      success: function(authObj) {
        showResult(JSON.stringify(authObj))
      },
      fail: function(err) {
        showResult(JSON.stringify(err))
      },
    })
  }
  function showResult(result) {
    document.getElementById('login-form-result').innerText = result
  }
</script>
</body>

</html>









