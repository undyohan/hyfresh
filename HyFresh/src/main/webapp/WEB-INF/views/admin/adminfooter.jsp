<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      </div>
    </main>
  </div>
</div>

<script>
$(function(){
  let msg = '<c:out value="${msg}"/>';
  if(msg!=''){
    alert(msg);
  }
});
</script>
</body>

</html>
