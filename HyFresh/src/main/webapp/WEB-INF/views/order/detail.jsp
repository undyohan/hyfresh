<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<c:set var="order" value="${detail}" />
<c:set var="sum" value="0" />
<c:forEach var="list" items="${detailList }">
   <c:set var="sum" value="${sum + (list.price * list.qt)}" />
</c:forEach>
<!-- Content section -->
<section class="py-5">
   <div class="container">
      <h1 class="text-center">주문 상세정보</h1>
    <form action="/order/modPlace" method="get">
      <input type="hidden" value="${order.ocode }" name="ocode">
  
      <div class="ordertop">
         <h6><fmt:formatDate value="${order.orderd8 }" pattern="yyyy.MM.dd HH:mm" />
         &nbsp;|&nbsp;주문번호 ${order.ocode}</h6>
      </div>

      <h2>결제 정보</h2>

      <table class="table table-hover">
         <thead>
            <tr>
               <td colspan="2" class="text-center">주문금액</td>
               <td colspan="2" class="text-center">할인금액</td>
               <td colspan="2" class="text-center">배송비</td>
               <td colspan="2" class="text-center">적립금 사용</td>
               <td colspan="2" class="text-center">최종결제 금액</td>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td colspan="2" class="text-center"><fmt:formatNumber value="${sum }" type="currency"
                     currencySymbol="" /></td>
               <td colspan="2" class="text-center"><fmt:formatNumber value="${order.discount }"
                     type="currency" currencySymbol="" /> <i class="fas fa-plus-circle"></i></td>
                  <td colspan="2" class="text-center"><fmt:formatNumber value="${order.dfee }"
              type="currency" currencySymbol="" /> <i class="fas fa-minus-circle"></i></td>
    
               <td colspan="2" class="text-center"><fmt:formatNumber value="${order.point }" type="currency"
                     currencySymbol="" /> <i class="fas fa-minus-circle"></i> </td>
               <td colspan="2" class="text-primary text-center"><fmt:formatNumber value="${order.oprice }" type="currency"
                     currencySymbol="" /></td>
            </tr>
         </tbody>
      </table>

      <h2>배송지</h2>

      <table class="table table-hover">
         <thead>
            <tr>
               <td>${order.receiver }(${order.tel })</td>
               <td colspan="3">[${order.zipcode }] ${order.addr }</td>
            </tr>
         </thead>
         <c:forEach var="list" items="${detailList }">
            <tbody>
               <tr>
                  <td width=300><a href="/product/detail?pno=${list.pno }"><img src="${list.img }" style="width:200px"></a></td>
                  <td width=400><span class="text-primary">배송일 <fmt:parseDate
                  var="dateTempParse" value="${list.deliverd8}"
                  pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
                  value="${dateTempParse}" pattern="yyyy-MM-dd" /></span><br>${list.pname }<br>
                  <fmt:formatNumber value="${list.price }" type="currency"
                        currencySymbol="" /> / ${list.qt}
                  </td>

                  <c:if test="${list.status ne -1 }">
                     <td><button type="submit" class="btn btn-outline-dark">배송지변경</button>
                     <br>
                        <button type="button" class="btn btn-outline-dark cancel"
                           data-odno="${list.odno }">주문취소</button></td>
                  </c:if>
                  <c:if test="${list.status eq -1 }">
                     <td></td>
                  </c:if>
                  <td><c:choose>
                        <c:when test="${list.status== -1 }">
                           취소완료
                        </c:when>
                        <c:when test="${list.status== 0 }">
                           결제완료
                        </c:when>
                        <c:when test="${list.status== 1 }">
                           배송준비중
                        </c:when>
                        <c:when test="${list.status== 2 }">
                           배송중
                        </c:when>
                        <c:when test="${list.status== 3 }">
                           배송완료
                        </c:when>
                        <c:when test="${list.status== 4 }">
                           구매완료
                        </c:when>
                     </c:choose> <br>
               
               </tr>
            </tbody>
         </c:forEach>
      </table>
        </form>
   </div>
</section>
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>
   $(function() {

      $(".cancel").on("click", function() {
         var confirm_val = confirm("정말 취소 하시겠습니까?");
         if (confirm_val) {
            let odno = $(this).data("odno");
            console.log(odno);
            $.ajax({
               url : "/order/modify",
               type : "post",
               data : {
                  odno : odno,
                  status : -1
               },
               success : function(result) {
                  if (result == 1) {
                     alert("주문이 취소되었습니다")
                     location.href = "/order/list";
                  } else {
                     alert("취소 실패")
                  }
               }

            });
         }
      });

   });
</script>