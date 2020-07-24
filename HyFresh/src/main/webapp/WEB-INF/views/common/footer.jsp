<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Footer -->
<footer class="py-5 bg-dark blog-footer">
  <div class="container">
    <p class="m-0 text-center text-white">Copyright &copy;
      1팀 Avengers (김희수,송민영,안요한,윤희국,이준우) 2020</p>
  <!-- /.container -->
</footer>

<script type='text/javascript'>
	let msg = '<c:out value="${msg}"/>';
	if(msg != '') {alert(msg);}
	
  $(function() {
    $("#chkemail").on("blur", function() {
          let emailVal = $("#chkemail").val();
          $.ajax({
            url : "/member/checkDuple",
            type : "GET",
            data : {
              email : emailVal
            },
            success : function(result) {
              if (result > 0) {
                $("#chkEmail").text("중복된 이메일입니다.").css("color",
                    "#f00");
              } else {
                $("#chkEmail").text("사용가능한 이메일입니다.").css(
                    "color", "#0f0");
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
          $("#submit").attr("disabled", "disabled");
        }
      }
    });
    $("#confirmPwd").on("keyup", function() {
  			if($("#pwd").val() == $("confirmPwd").val()) {
  				$("#registerBtn").removeAttr('disabled');
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










