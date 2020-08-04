<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<!-- Content section -->
<section class="py-5">
  <div class="container">
  <span class="title">주문 완료</span>
     <div class="float-right form-group">
        <span class="menu">01 장바구니 <i class="fas fa-chevron-right"></i>  02 주문서 작성 <i class="fas fa-chevron-right"></i> <span class="text-primary">03 주문완료 </span></span>
    </div>
    
      <div class="container-fluid center">
    <!-- Control the column width, and how they should appear on different devices -->
    <div class="row center">
      <div class="col"></div>
      <div class="col"> <img src="/resources/img/u_order_compelete.jps.JPG"></div>
      <div class="col" ><h4>감사합니다.<br> 주문이 완료되었습니다.</h4><br>소중한 후기를 남겨주시면 <br>감사의 마음을 담아<br> 적립금을 적립해드립니다.</div>
      <div class="col"></div> 
    </div>
    </div>
    

    
    <table class="table table-hover">
    <tbody>
     <tr>
     <th class="table-active">주문 번호</th>
     <td>${order.ocode}</td>
     </tr>
     <tr>
     
     <th class="table-active">주문 정보</th>
     <td><c:forEach items="${detail }" var="detail">${detail.pname} ${detail.qt}개 <br></c:forEach></td>
     </tr>
     <tr>
     <th class="table-active">받으시는 분</th>
     <td>${order.receiver} (${order.tel})</td>
     </tr>
     <tr>
     <th class="table-active">배송 주소</th>
     <td> [${order.zipcode}] ${order.addr}</td>
     </tr>
    <tr>
     <th class="table-active">결제정보</th>
     <td colspan="2">결제 금액:${order.oprice}  | 적립금사용: ${order.point} |   
     적립금 충전:<fmt:formatNumber pattern="###,###,###" value="${(order.oprice *0.1)}" /></td>
     </tr>
    </tbody>    
  </table>
    <div class="text-center"><a href="/order/list" class="btn btn-secondary orderlist">주문내역 조회</a></div>
  </div>
</section>
<jsp:include page="../common/footer.jsp"></jsp:include>