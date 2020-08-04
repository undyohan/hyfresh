<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </div>
  </div>
  <script src="/resources/js/dashboard.js"></script>
  <script src="/resources/js/admin.js"></script>
  <script src="https://cdnjs.clou dflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
  
  <script>
  $(function(){
      let msg = '<c:out value="${msg}"/>';
      if(msg!=''){
        alert(msg);
      }
    });
  $(function() {
      "use strict";
  
      // Add active state to sidbar nav links
      var path = window.location.href; // because the 'href' property of the DOM element is the absolute path
          $("#layoutSidenav_nav .sb-sidenav a.nav-link").each(function() {
              if (this.href === path) {
                  $(this).addClass("active");
              }
          });
  
      // Toggle the side navigation
      $("#sidebarToggle").on("click", function(e) {
          e.preventDefault();
          $("body").toggleClass("sb-sidenav-toggled");
      });
  })
  </script>
</body>

</html>
