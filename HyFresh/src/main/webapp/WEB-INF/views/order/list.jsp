<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<!-- Content section -->
<section class="py-5">
   <div class="container">
   <div class="topmenu">
      <h1 class="text-center">주문배송 조회</h1>
      <div class="container">
    <div class="form-group">
    <label for="status">신청 상태 </label>
    <select id="status" style="width:180px">
    <option>선택</option>    
    <option value="00">전체</option>    
    <option value="1">결제완료</option>
    <option value="2">배송준비중</option>
    <option value="3">배송중</option>
    <option value="4">배송완료</option>
    <option value="-1">취소</option>
    <option value="-2">반품</option>
    <option value="-3">교환</option>
  </select>
  </div>
  
  <label for="period">기간 조회</label>
      <div class="btn-group" id="period">
            <a class="btn btn-outline-dark month-0"></a> <a
               class="btn btn-outline-dark month-1"></a> <a
               class="btn btn-outline-dark month-2"></a> <a
               class="btn btn-outline-dark month-3"></a>
            <div class="btn-group">
               <button type="button"
                  class="btn btn-outline-primary dropdown-toggle"
                  data-toggle="dropdown">이전내역 보기</button>
               <div class="dropdown-menu">
                  <a class="dropdown-item" href="#"> <input type="date"
                     class="form-control" id="date"></a>
               </div>
            </div>
         </div>
   </div>
   </div>      
         <input type="hidden" name="pageNum" value="1"> <input
            type="hidden" name="amount" value="${pgvo.cri.amount }">
         <c:set var="chk" value="" />
            <table class="table table-hover" style="border-collapse: collapse; border-spacing: 0">
         <c:choose>
      <c:when test="${orderInfo ne null && orderInfo.size() != 0 }">
               <c:forEach var="order" items="${orderInfo }" varStatus="status">
                  <c:if test="${chk != order.ocode}">
                     <thead>
                        <tr>
                           <td colspan="4" class="table-info"><a
                              href="/order/detail?ocode=${order.ocode }"><fmt:formatDate
                                    value="${order.orderd8 }" pattern="yyyy.MM.dd HH:mm" />
                                 &nbsp;주문번호 ${order.ocode} </a></td>
                        </tr>
                     </thead>
                  </c:if>
                  <tbody>
                     <c:set var="chk" value="${order.ocode }" />
                     <tr>
                        <td width=100><img src="${order.img }" style="width:200px;"></td>
                        <td width=300><span class="text-secondary">배송일 <fmt:parseDate var="dateTempParse"
                    value="${order.deliverd8}" pattern="yyyy-MM-dd HH:mm:ss" /> 
                    <fmt:formatDate
                    value="${dateTempParse}" pattern="yyyy-MM-dd" /></span><br><br>
                    <span class="font-weight-bold">${order.pname }</span><br> <span class="text-primary"><fmt:formatNumber
                              pattern="###,###,###" value="${order.price * order.qt}" /> 원</span>
                           / <span class="font-weight-bold"> ${order.qt }</span>개
                        </td>
                       <c:choose>
                  <c:when test="${order.status== 0 }">
                    <td>결제완료</td>
                  </c:when>
                  <c:when test="${order.status== 1 }">
                    <td>배송준비중</td>
                  </c:when>
                  <c:when test="${order.status== 2 }">
                    <td>배송중</td>
                  </c:when>
                  <c:when test="${order.status== 3 }">
                    <td>배송완료</td>
                  </c:when>
                  <c:when test="${order.status== 4 }">
                    <td>구매완료</td>
                  </c:when>
                  <c:when test="${order.status== -1 }">
                    <td>취소완료</td>
                  </c:when>
                  <c:when test="${order.status== -2 }">
                    <td>반품</td>
                  </c:when>
                  <c:when test="${order.status== -3 }">
                    <td>교환</td>
                  </c:when>
                </c:choose>
                        <c:if test="${order.status ne -1 }">
                            <td>
                              <button type="button" class="btn btn-outline-dark cancel"
                                 data-odno="${order.odno }">주문취소</button> <br>
                                                     <c:if test="${order.rno == 1 }">
                                  <c:set var="disabled" value="disabled"/>
                                 </c:if>
                                 <c:if test="${order.rno == 0 }">
                                  <c:set var="disabled" value=""/>
                                 </c:if>
                    <button type="button" data-pno="${order.pno }" data-odno="${order.odno }" class="btn btn-outline-dark reviewBtn" data-target="#myModal" data-toggle="modal" ${disabled }>상품후기</button></td>
                        </c:if>
                          <c:if test="${order.status eq -1 }">
                  <td></td>
                </c:if>
                     </tr>
                  </tbody>
               </c:forEach>
               </c:when>
               <c:otherwise>
               <tr>   <td><h3 class="text-center">주문 내역이 없습니다.</h3></td></tr>
               </c:otherwise>
         </c:choose>
            </table>

         <div class="container">
            <ul class="pagination justify-content-center">
               <c:if test="${pgvo.prev }">
                  <li class="page-item"><a class="page-link"
                     href="/order/list?pageNum=${pgvo.beginPagingNum - 1 }&amount=${pgvo.cri.amount}&month=${month}">Prev</a>
                  </li>
               </c:if>
               <c:forEach begin="${pgvo.beginPagingNum }"
                  end="${pgvo.endPagingNum }" var="i">
                  <li class="page-item ${pgvo.cri.pageNum == i ? 'active' : ''}">
                     <a class="page-link"
                     href="/order/list?pageNum=${i }&amount=${pgvo.cri.amount}&month=${month}">${i }</a>
                  </li>
               </c:forEach>
               <c:if test="${pgvo.next }">
                  <li class="page-item"><a class="page-link"
                     href="/order/list?pageNum=${pgvo.endPagingNum + 1 }&amount=${pgvo.cri.amount}&month=${month}">Next</a>
                  </li>
               </c:if>
            </ul>
         </div>
      </div>

       <!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" style="text-align: center">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form action="/member/newReview" method="post" enctype="multipart/form-data" id="r-form">
        Modal body..
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" id="modOkBtn" class="btn btn-primary" style="background-color: #17a2b8">확인</button>
      </div>
    </div>
  </div>
</div>

   
</section>
<script src="/resources/js/review.js"></script>
<jsp:include page="../common/footer.jsp"></jsp:include>



<script>
   $(function() {
      month();
      
      //이전달 보기 버튼생성
      function month() {
         let date = new Date();
         let month = date.getMonth() + 1;
         let amount = '<c:out value="${pgvo.cri.amount}"/>';
         for (var i = 0; i < 4; i++) {
            if (i == 0) {
               $(".month-" + i).text("1개월");
            } else {
               $(".month-" + i).text(month - i + "월");
            }
            $(".month-" + i).attr(
                  "href",
                  '/order/list?pageNum=1&amount=' + amount
                        + '&month=sysdate,-' + (i + 1));
         }
      }

      $(".cancel").on("click", function() {
         var confirm_val = confirm("정말 주문취소 하시겠습니까?");
         if (confirm_val) {
            let odno = $(this).data("odno");
            let status = -1;
            console.log(odno);
            $.ajax({
               url : "/order/modify",
               type : "post",
               data : {
                  odno : odno,
                  status : status
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

      $("#date").on("change", function() {
         let date = "'";
         date += $("#date").val();
         date += "',0";
         location.href = "/order/list?month=" + date;
      });
      
      
      $("#status").change(function(){
          var status =  $(this).val();
           let amount = '<c:out value="${pgvo.cri.amount}"/>';
      
          location.href = '/order/list?pageNum=1&amount='+amount
                       + '&status='+status;   
      });
      
       $(".reviewBtn").on("click", function() {
            let pno = $(this).data("pno");
            let odno = $(this).data("odno");
            let writer = '<c:out value="${sesInfo.name}"/>';
            transferToModal(pno, writer, odno);
         });
       $(document).on("click","#modOkBtn",function(){
            $("#r-form").submit();
         });

         $("#date").on("blur", function() {
            let date = "'";
            date += $("#date").val();
            date += "',0";
            location.href = "/order/list?month=" + date;
         });
         //별점
       $(document).on("mouseover", "img[id*='star']", function(e) {
          let idNum = $(this).attr("id");
          if(idNum == 'star01') {
              $("#starDiv").children().attr("src", "/resources/img/star.png");
            $("#starDiv").children().eq(0).attr("src", "/resources/img/star_covered.png");
          }else if(idNum == 'star02') {
              $("#starDiv").children().attr("src", "/resources/img/star.png");
             $("#starDiv").children().eq(2).prevAll().attr("src", "/resources/img/star_covered.png");
          }else if(idNum == 'star03') {
              $("#starDiv").children().attr("src", "/resources/img/star.png");
             $("#starDiv").children().eq(3).prevAll().attr("src", "/resources/img/star_covered.png");
         }else if(idNum == 'star04') {
            $("#starDiv").children().attr("src", "/resources/img/star.png");
            $("#starDiv").children().eq(4).prevAll().attr("src", "/resources/img/star_covered.png");
         }else if(idNum == 'star05') {
            $("#starDiv").children().attr("src", "/resources/img/star.png");
            $("#starDiv").children().attr("src", "/resources/img/star_covered.png");
         }
       });
       $(document).on("click", "img[id*='star']", function(e) {
           let idNum = $(this).attr("id");
           if(idNum == 'star01') {
             $("#starDiv").children().eq(0).attr("src", "/resources/img/star_covered.png");
             $("#rate").val('1');
           }else if(idNum == 'star02') {
             $("#starDiv").children().eq(2).prevAll().attr("src", "/resources/img/star_covered.png");
             $("#rate").val('2');
           }else if(idNum == 'star03') {
             $("#starDiv").children().eq(3).prevAll().attr("src", "/resources/img/star_covered.png");
             $("#rate").val('3');
           }else if(idNum == 'star04') {
             $("#starDiv").children().eq(4).prevAll().attr("src", "/resources/img/star_covered.png");
             $("#rate").val('4');
           }else if(idNum == 'star05') {
             $("#starDiv").children().attr("src", "/resources/img/star_covered.png");
             $("#rate").val('5');
           }
         });
   
   });
   
</script>