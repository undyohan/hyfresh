<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<section class="py-5">
  <div class="container">
  <div class="container">
  <div class="btn-group" style="background: url(http://www.hyfresh.co.kr/resources/ko/pc/images/common/con_calendar_gh842353.png) 0 -40px repeat-x;">
    <button style="background: url(http://www.hyfresh.co.kr/resources/ko/pc/images/common/btnback8315_off.png) 0 0 no-repeat; text-indent: -9999999999em;border: none; width: 62px; height: 67px; margin-top: 29px">뒤로</button>
    <button type="button" class="btn btn-primary" style="width: 123px; height: 123px; border-radius: 123px; margin-right: 15px; margin-left: 50px">금<p style="font-size: 30px; margin: 0;">07/17</p></button>
    <button type="button" class="btn btn-primary" style="width: 123px; height: 123px; border-radius: 123px; margin-right: 15px;">토<p style="font-size: 30px; margin: 0;">07/18</p></button>
    <button type="button" class="btn btn-primary" style="width: 123px; height: 123px; border-radius: 123px; margin-right: 15px;">월<p style="font-size: 30px; margin: 0;">07/20</p></button>
    <button type="button" class="btn btn-primary" style="width: 123px; height: 123px; border-radius: 123px; margin-right: 15px;">화<p style="font-size: 30px; margin: 0;">07/21</p></button>
    <button type="button" class="btn btn-primary" style="width: 123px; height: 123px; border-radius: 123px; margin-right: 50px">수<p style="font-size: 30px; margin: 0;">07/22</p></button>
    <button style="background: url(http://www.hyfresh.co.kr/resources/ko/pc/images/common/btnnext8315_off.png) 0 0 no-repeat; text-indent: -9999999999em; border: none; width: 62px; height: 67px; margin-top: 29px">앞으로</button>
  </div>
</div>
    <div class="mb-3">
      <a href="/product/list?pageNum=${cri.pageNum }&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}" class="btn btn-success">상품목록</a>
    </div>
    <h3>상품 상세정보</h3>
    <form action="/product/detail" method="post">
      <div class="container d-flex">
        <div class="col-sm-5">
          <img src="${pvo.img }" class="detail-img">
        </div>
        <div class="col-sm-7">
          <ul style="list-style: none;">
            <li><hr></li>
            <li class="detail-tit" style="font-size: 36px;">${pvo.pname }</li>
            <li class="mb-3" style="background-color: #f2f2f2; border-radius: 0.5em; ">
            &nbsp; TAG &nbsp; &nbsp; &nbsp; &nbsp;
	            <c:forEach items="${tList }" var="tag" varStatus="i">
	             <a href=""> ${tag }</a>
	            </c:forEach>
            </li>
            <li class="mb-3">
              <span style="font-size: 24px" id="price">${pvo.price }</span>원 
              <div class="btn-group" style="float:right;">
							  <button type="button" class="btn btn-primary" style="background-color: white; color: black" id="minus">-</button>
							  <input type="text" class="btn btn-primary" value="1" size=1 style="background-color: white; color: black" id="num">
							  <button type="button" class="btn btn-primary" style="background-color: white; color: black" id="plus">+</button>
						  </div>
            </li>
            <li class="mb-3" style="float:right;">
              <a href="" class="btn btn-secondary">장바구니</a>
              <a href="" class="btn btn-primary">바로구매</a>
            </li>
            <li>
            
            </li>
          </ul>
        </div>
      </div>
    </form>
  </div>
</section>
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>

$(function() {
	$("#minus").on("click", function(e) {
		e.preventDefault;
		if($("#num").val() != 0) {
			let num = $("#num").val() - 1;
      let price = Number('<c:out value="${pvo.price}"/>') * num;
      $("#price").text(price);
			$("#num").val(num);
			formatChange($("#price").text());
	}
	});
	 $("#plus").on("click", function(e) {
		    e.preventDefault;
	      let num = Number($("#num").val()) + 1;
	      $("#num").val(num);
	      let price = Number('<c:out value="${pvo.price}"/>') * num;
	      $("#price").text(price);
	      formatChange($("#price").text());
	});
});
function formatChange(inputNumber){
	$("#price").text(inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
};
formatChange('<c:out value="${pvo.price}"/>');
console.log('<c:out value="${pvo.price}"/>');
</script>

