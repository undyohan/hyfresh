<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Footer -->
<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; 1팀(김희수,송민영,안요한,윤희국,이준우)
			2020</p>
	</div>
	<!-- /.container -->
</footer>

<script>

	$(function() {
		$("#chkemail").on(
				"blur",
				function() {
					let emailVal = $("#chkemail").val();
					$.ajax({
						url : "/member/checkDuple",
						type : "get",
						data : {
							email : emailVal
						},
						success : function(result) {
							if (result > 0) {
								$("#chkEmail").text("중복된 이메일 입니다!").css(
										"color", "#f00");
							} else {
								$("#chkEmail").text("사용가능한 이메일 입니다!").css(
										"color", "#0f0");
							}
						}
					});
				});
	});
</script>
</body>

</html>










