<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<!-- Content section -->
<section class="py-5">
	<div class="container">
		<h1 class="text-center">주문 상세정보</h1>

		<div class="ordertop">
			<h6><fmt:formatDate value="${order.orderd8 }" pattern="yyyy.MM.dd HH:mm" />
			&nbsp;|&nbsp;주문번호 ${order.ocode}</h6>
		</div>
		<table class="table table-hover">
		<thead><tr><td colspan="2">아래 상품들의 배송지가 일괄적으로 변경됩니다</td></tr></thead>
			<c:forEach var="list" items="${olist}">
				<tbody>
					<tr>
						<td width=300><a href="/product/detail?pno=${list.pno }"><img src="${list.img }"></a></td>
						<td width=400><span class="text-primary">배송일 <fmt:parseDate
                  var="dateTempParse" value="${list.deliverd8}"
                  pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
                  value="${dateTempParse}" pattern="yyyy-MM-dd" /></span><br>${list.pname }<br>
						<fmt:formatNumber value="${list.price }" type="currency"
								currencySymbol="" /> / ${list.qt}
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<form action="/order/placeChange" method="post">
		<button type="button" class="btn btn-outline-primary" id="alist">내 배송지 목록</button><br>
		<input type="hidden" value="${order.ocode }" name="ocode">
		 수령인: <input type="text"  id="df_re" class="form-control dfaddr"  name="receiver" readonly> 
         전화번호: <input type="text"  id="df_tel" class="form-control dfaddr"  name="tel"readonly>
     우편번호: <input type="text"  id="df_zipcode" class="form-control dfaddr" name="zipcode" readonly >
    주소:  <input type="text" id="df_addr" class="form-control dfaddr" name="addr" readonly>
        <button type="submit" class="btn btn-primary">변경</button><br>
    </form>
	</div>
	<div class="modal" id="Modal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">배송지 조회</h4>
           <button type="button" class="close" data-dismiss="Modal">&times;</button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
            <div id="addrlist">
              <c:forEach items="${aList}" var="avo">
                <table class="table table-hover">
                  <tr class="table-active">
                    <td><span class="aname text-primary">[${avo.addrname }] </span><span class="are"> ${avo.receiver}</span></td>
                    <td><button type="button" class="btn btn-primary choice" data-addrno="${avo.addrno }">선택</button></td>
                  </tr>
                  <tr>
                    <td colspan="3"><span class="azip">${avo.zipcode }</span><br><span class="atel">${avo.tel}</span><br><span class="aaddr">${avo.addr}</span></td>
                  </tr>
                </table>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
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
	
	///배송지 목록  모달
	  $("#alist").on("click", function() {
	    $("#Modal").show();
	  });
	  
	  $(".close").on("click", function() {
	      $("#Modal").hide();
	    });
	  
	  
	  //배송지 목록에서 선택
	  $('.choice').click(function () {
	      let re=$(this).closest("td").siblings("td").find(".are").text();
	      //let aname=$(this).closest("td").siblings("td").find(".aname").text();
	      let tel=$(this).closest("tr").siblings("tr").find(".atel").text();
	      let zip=$(this).closest("tr").siblings("tr").find(".azip").text();
	      let addr=$(this).closest("tr").siblings("tr").find(".aaddr").text();
	      //$("#df_aname").val(aname);
	      $("#df_re").val(re);
	      $("#df_tel").val(tel);
	      $("#df_re").val(re);
	      $("#df_zipcode").val(zip);
	      $("#df_addr").val(addr);
	      $("#Modal").hide();
	  });
	
</script>