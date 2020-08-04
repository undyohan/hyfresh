<link href="/resources/css/detail.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<section class="py-5">
	<div class="container">
		<p class="mt-3 deliverP">먼저 배송 받을 날을 선택해 주세요.</p>
		<div class="mb-4 deliver-wrap">
			<div class="btn-group mt-3 deliver-bg" id="deliveryDiv">
			   <button disabled="disabled" style="background: url(/resources/img/left.png) 0 0 no-repeat; text-indent: -9999999999em;border: none; width: 62px; height: 67px; margin-top: 29px">뒤로</button>
				<c:forEach items="${cList }" var="cal" varStatus="i">
				  <c:set var="year">year${i.count}</c:set>
					<c:set var="day">day${i.count}</c:set>
					<c:set var="dow">dow${i.count}</c:set>
					<c:if test="${i.count <= 7 }">
						<c:if test="${cList[day] ne ''}">
						  <button type="button" class="deliver-btn btn btn-primary" id="${cList[year] }/${cList[day] }" onclick="date('${cList[year] }/${cList[day] }')">${cList[dow]}<p class="deliver-p">${cList[day]}</p></button>
						</c:if>
					</c:if>
				</c:forEach>
				<button disabled="disabled" style="background: url(/resources/img/right.png) 0 0 no-repeat; text-indent: -9999999999em; border: none; width: 62px; height: 67px; margin-top: 29px">앞으로</button>
			</div>
		</div>
		<!--주문영역  -->
		<form action="/order/orderpage" id="orderForm" method="post">
      <input type="hidden" value="none" class="date" name="getd8">
      <input type="hidden" value="${pvo.dfee }" name="dfee" class="dfee">
      <input type="hidden" value="${pvo.pno }" name="pno" class="pno">
      <input type="hidden" value="${pvo.pname }" name="pname">
      <input type="hidden" value="${pvo.price }" name="price">
      <input type="hidden" value="1" name="qt" class="qt">
      <input type="hidden" value="${pvo.img }" name="img" >
      <input type="hidden" value="${pvo.discount }" name="discount">
    <!--주문정보 끝  -->
			<div class="container d-flex">
				<div class="col-sm-5">
				  <img src="${pvo.img }" class="card-img-top">
				</div>
				<div class="col-sm-7">
					<ul>
						<li><hr></li>
						<li class="detail-tit">${pvo.pname }</li>
						<li class="mb-3 tag-bg">
							<span class="tag-span">TAG</span>
							<c:forEach items="${tList }" var="tag" varStatus="i">
							<c:if test="${tag != '#' }">
							<c:set var="tLength" value="${fn:length(tag)}"/>
							 <c:set var="searchT" value="${fn:substring(tag,1,tLength) }"/>
							 <a href="/product/slist?search=${searchT }" class="tag"> ${tag }</a>
							 </c:if>
							 <c:if test="${tag == '#' }">
							   태그가 존재하지 않습니다.
							 </c:if>
							</c:forEach>
            </li>
            <li class="mb-3 blank"></li>
						<li class="mb-3" class="discount">
							<c:if test="${pvo.discount ne 0 }">
								<p class="d-price"><span><fmt:formatNumber value="${pvo.price }" type="currency" currencySymbol=""/></span>원</p>
								<fmt:parseNumber value="${pvo.price}" integerOnly="true" var="price" />
								<fmt:parseNumber value="${pvo.discount}" integerOnly="true" var="discount" />
								<span class="o-price" id="price"><fmt:formatNumber value="${price * (1 - discount / 100) }" type="currency" currencySymbol=""/></span>원
							</c:if>
							<c:if test="${pvo.discount eq 0 }">
							 <span class="o-price" id="price"><fmt:formatNumber value="${pvo.price}" type="currency" currencySymbol=""/></span>원
							</c:if> 
							<div class="btn-group qt-wrap">
								<button type="button" class="btn btn-primary plus-minus-btn" id="minus">-</button>
								<input type="text" class="btn btn-primary qt-input qt" value="1" size=1 style="" name="qt" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
								<button type="button" class="btn btn-primary plus-minus-btn" id="plus">+</button>
							</div>
						</li>
						<li class="mb-3 blank">
              <c:choose>
                <c:when test="${pvo.dfee == 0 }">
                                    무료배송                
                </c:when>
                <c:when test="${pvo.dfee != 0 }">
                  <fmt:formatNumber value="${pvo.dfee}" type="currency" currencySymbol=""/>원
                </c:when>
              </c:choose>
               | 도서산간 배송비 <i class='fas fa-info-circle' style="font-size:12px"></i></li>
						<li class="mb-3 blank"><span class="deliver-info">묶음배송</span> | 택배배송 | 2일 이내 출고</li>
						<li class="mb-3 blank"><span class="deliver-info2">(주말, 공휴일 제외)</span></li>
						<li class="mb-3 blank-10"></li>
						<li class="mb-3 blank-15"><span class="sellCount">${pvo.sellcount }개</span> 구매</li>
						<li class="mb-3" style="text-align: center">
						<button type="button" id="cart" class="cart-buy-btn btn btn-secondary btn-lg">장바구니</button>
						<button type="submit" id="buy" class="cart-buy-btn btn btn-primary btn-lg">바로구매</button>
					</ul>
				</div>
			</div>
		</form>
	</div>
	<div class="container-fluid reco-div">
		<div class="container">
			<p class="reco-p">이 제품과 비슷한 제품</p>
			<div class="row">
				<c:forEach items="${pList }" var="pvo">
					<div class="col-sm-3">
						<div class="card reco-card-div">
							<img class="card-img-top mb-2 reco-card-img" src="${pvo.img }" alt="Card image" style="">
							<div class="card-body">
								<h4 class="card-title reco-card-tit"><a href="/product/detail?pno=${pvo.pno }">${pvo.pname }</a></h4>
								<p class="card-text"><fmt:formatNumber value="${pvo.price }" type="currency" currencySymbol=""/>원</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="container menuDiv" id="menuDiv">
		<ul class="nav nav-tabs nav-justified" style="border-top-left-radius: 0; border-top-right-radius: 0;">
			<li class="nav-item">
			 <a class="nav-link active active-custom" href="#content">상품설명</a>
			</li>
			<li class="nav-item">
			 <a class="nav-link nav-custom" href="#review">상품후기(${star.count })</a>
			</li>
			<li class="nav-item">
			 <a class="nav-link nav-custom" href="#question">상품문의(${fn:length(rList) })</a>
			</li>
			<li class="nav-item">
			 <a class="nav-link nav-custom" href="#delivery">배송안내</a>
			</li>
		</ul>
	</div>
	<div class="container content mb-3" id="content">
		<img src="${pvo.content }">
	</div>
	<div class="container" id="review">
		<p class="review-p">소중한 후기 작성시</p> 
		<p class="review-p">적립금 포인트를 드립니다.</p>
		
		<div class="mt-3 review-average">
			<c:choose>
				<c:when test="${star.avg < 1.0 }">
				  <img src="../resources/img/ico_starss0.png">
				</c:when>
				<c:when test="${star.avg < 2.0 }">
				  <img src="../resources/img/ico_starss1.png">
				</c:when>
				<c:when test="${star.avg < 3.0 }">
				  <img src="../resources/img/ico_starss2.png">
				</c:when>
				<c:when test="${star.avg < 4.0 }">
				  <img src="../resources/img/ico_starss3.png">
				</c:when>
				<c:when test="${star.avg < 5.0 }">
				  <img src="../resources/img/ico_starss4.png">
				</c:when>
				<c:when test="${star.avg == 5.0 }">
				  <img src="../resources/img/ico_starss5.png">
				</c:when>
			</c:choose>
			<span class="review-average-txt"><fmt:formatNumber pattern="0.0" type="number" value="${star.avg}"/></span>
		</div>
		<p style="text-align:left">전체 <span class="review-all">(총${star.count }건)</span></p>
		<div id="rvwList">    
		</div>
		<div class="mt-3 review-paging-div">
			<div id="rvwPaging">
			</div>
		</div>
	</div>
	<div class="container mt-5" style="text-align: center" id="question">
		<h4>제품에 관한 궁금한 점을 올리시면 신속한 답변을 드립니다.</h4>
		<p>배송, 결제, 교환/반품 등에 대한 문의는 <a href="/question/write">고객센터>이메일 상담</a>을 이용해주세요.</p>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	
	<div class="container">
   <button type="button" id="pqBtn" >상품문의하기</button>
    <div id="writeform">
      <div class="form-group">
        잠금선택<input type="radio" id="lock"
          name="isLock" value="0" checked required> <label for="lock">비공개</label>
        <input type="radio" id="unlock" name="isLock" value="1" required><label
          for="unlock">공개</label><br>
      </div>
      <div class="form-group">
        제목:  <input type="text" id="title"
          class="form-control" placeholder="제목입력" name="title">
      </div>
      <div class="form-group">
        작성자: <input type="text" id="writer"
          class="form-control" value="${sesInfo.name }" readonly
          name="writer">
      </div>
      <div class="form-group">
        <label for="content">내용정보: </label>
        <textarea cols="5" class="form-control" id="info" name="info"></textarea>
      </div>
      <button type="submit" id="sub" class="btn btn-primary">Submit</button>
</div>
  </div>


    <div id="pqList"></div>
    <div id="pqPaging"></div>

<c:forEach items="${pqList }" var="pqvo">
  <input type="text" name="pqno" value="${pqvo.pqno }">
    <form action="/pquestion/remove" id="delForm" method="post">
      <input type="hidden" name="pqno" value="${pqvo.pqno }" id="pqno"> 
      <input type="hidden" name="pno" value="${pqvo.pno }" id="pno">
    </form>
  </c:forEach>
	  
	<div class="container mt-3" id="delivery">
		<h4>배송/교환/반품안내(신선간편식)</h4>
		<table class="table deliver-info-table">
			<tr class="table-active">
			 <td>배송안내</td>
			</tr>
			<tr>
			 <td><p class="deliver-info-p">
			 <strong>배송비</strong>
				<br>
				일반주문, 정기주문 모두 Fresh 매니저가 배달해 드립니다.
				<br>
				배송비는 상품 배송 형태에 따라 상이하며, 자세한 내용은 배송서비스 안내를 참고 바랍니다. ※ 도서/산간지역의 경우 추가 배송비가 부과 될 수 있습니다.
				<br>
				<br>
				<strong>[배송 안내]</strong>
				<br>
				매니저 상품 : Fresh매니저 직접 배송
				<br>
				택배 상품 : 계약 택배사 배송
				<br>
				단, 매니저 상품 중 매니저 전달 불가 지역은 택배 배송되며 (택배 배송비 기준 적용), 일부 상품은 배송이 불가 합니다
				<br>
				<br>
				<strong>[배송 유형별 배송비 안내]</strong>
				<br>
				매니저 배송 시, 주문 가능 기준 : 동일 날짜에 3,500원 이상 배송 요청시
				<br>
				무료 배송 기준 : ① 무료 배송으로 표시된 상품 구매시 ②무료배송이 포함된 상품과 함께 동일 날짜에 배송 요청 시
				<br>
				택배 배송 시, 기본 배송비 : 3천원 (도서산간 6천원)
				<br>
				무료 배송 기준 : ① 무료 배송으로 표시된 상품 구매시 ②해당 센터별 동일날짜 배송 요청 4만원 이상 구매시 (프레시센터 A, 프레시 센터 B)</p></td>
			</tr>
			<tr class="table-active">
			 <td>주문취소 및 교환·반품 안내</td>
			</tr>
			<tr>
				<td>
					<p class="deliver-info-p"><strong>교환 및 환불을 원하실 경우, 우선 상담센터 1577-3651로 전화하여 주시기 바랍니다.</strong>
					<br>
					하기 기재된 교환 및 반품 가능한 경우에 한하여 환불 및 보상이 가능하며, 재판매가 불가한 신선 식품의 상품 특성상 주문마감(D-1 오후 4시 이후), 단순 변심 등의 사유로 환불이 불가능합니다.
					<br>
					<br>
					<strong>[주문 취소/변경 관련]</strong>
					<br>
					수령일 기준 D-1 오후 4시까지 주문취소, 변경(배송지, 연락처)이 가능합니다.
					<br>
					D-1 오후 4시 이후에는 재료 수급이 진행되므로 상품의 취소 및 수령일 변경이 불가능합니다.
					<br>
					<br>
					<strong>[교환 및 환불 관련]</strong>
					<br>
					교환 및 환불을 원하시는 경우, [하이프레시 hyfresh.co.kr 로그인 → 마이페이지→ 주문배송조회 → "주문내역 상세보기" → 교환 or 반품신청] 또는 고객센터(☎ 1577-3651)로 전화하여 주시기 바랍니다.</p>
				</td>
			</tr>
			<tr class="table-active">
			 <td>교환 및 반품 가능한 경우</td>
			</tr>
			<tr>
				<td>
					<p class="deliver-info-p"><strong>제품하자(변질/파손)</strong>
					<br>
					제품 변질 파손 등 상품에 문제가 있는 경우 정도에 따라 부분환불, 환불, 재배송 처리해드립니다.
					<br>
					단, 제품 수령일 2일 이후의 접수건에 대해서는 제품하자에 대한 판단이 어려워 보상이 불가능합니다.
					<br>
					접수방법 : 고객센터 혹은 Fresh 매니저에게 주문번호, 수령인정보, 수령일, 하자가 있는 상품 혹은 사진을 전달해 주세요.
					<br>
					<br>
					<strong>제품누락</strong>
					<br>
					누락된 제품을 추가 배송하여 드립니다.
					<br>
					접수방법 : 고객센터 혹은 Fresh 매니저에게 주문번호, 수령인정보, 수령일 누락된 상품 정보를 전달해 주세요.
					<br>
					<br>
					<strong>배송사고</strong>
					<br>
					배송예정일에 제품이 도착하지 않거나, 제품이 오배송 된 경우 환불해 드립니다. 단, 제품주문시 반드시 배송예정일 확인을 해주십시오. 제품의 도난, 분실로 인한 부분은 환불되지 않습니다.
					<br>
					접수방법 : 고객센터 혹은 Fresh 매니저에게 주문번호, 수령인정보, 배송사고된 제품의 상품 정보를 전달해 주세요.
					<br>
					<br>
					<strong>신체적이상</strong>
					<br>
					상품 섭취 후 신체적 이상이 발생한 경우, 증빙자료(진료확인서, 소견서 등)을 제출해주시면, 가입보험사를 통해 직접 조사 및 판정에 따라 보상이 됩니다.
					<br>
					접수방법 : 고객센터 혹은 Fresh 매니저에게 주문번호, 수령인정보, 증빙자료를 전달해 주세요.
					<br>
					</p>
				</td>
			</tr>
			<tr class="table-active">
			 <td>교환 및 반품 가능한 경우</td>
			</tr>
			<tr>
				<td><p class="deliver-info-p"><strong>주문마감</strong>
					<br>
					배송마감시간 D-1 오후 4시 이후 주문취소 및 환불이 불가능합니다.
					<br>
					<br>
					<strong>단순변심</strong>
					<br>
					반품 후 재판매가 불가능한 제품 특성상 단순변심에 의한 교환 및 반품이 불가능 합니다.
					<br>
					<br>
					<strong>개인적 기호</strong>
					<br>
					신선식품은 그날의 재료 상태나 조리방법에 따라 조금씩 맛이 다를 수 있습니다.
					<br>
					혹은 개인적 기호에 따라 같은 제 품도 다르게 느끼실 수 있습니다.
					<br>
					개인적 기호에 의한 교환/환불 요청은 처리가 불가능 합니다.
					<br>
					<br>
					<strong>제품 가치 변화</strong>
					<br>
					고객님의 사용, 시간 경과, 일부 소비에 의한 상품의 가치가 현저히 감소한 경우 교환/환불이 불가능 합니다.
					<br>
					<br>
					<strong>배송서비스 불만</strong>
					<br>
					배송서비스 (불친절, 배송조회불가, 희망시간배송불가 등)으로 인한 반품은 환불처리가 불가합니다.
					<br>
					<br>
					<strong>상품정보 이미지 상이</strong>
					<br>
					상품의 이미지는 실제와 다를 수 있으며, 이로 인한 환불은 불가합니다.
					<br>
					</p>
				</td>
			</tr>
		</table>
	</div>
	
	<!--장바구니 모달창  -->
	  <div class="container">
  <!-- The Modal -->
  <div class="modal" id="cartModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">장바구니 담기</h4>
        </div>
        <!-- Modal body -->
        <div class="modal-body text-center">
                          선택한 상품을 장바구니에 담았습니다.<br><br>             
            <button type="button" class="btn btn-primary" id="close">계속쇼핑하기</button>
            <a href="/cart/list" class="btn btn-outline-dark">장바구니 가기</a>
        </div>
      </div>
    </div>
  </div>
</div>
	<!--장바구니 모달끝  -->
	
	<div class="btn_top">
	 <a href="#top" style="right:10px;"><img src="/resources/img/btn_quick_to_top.png" alt="TOP"></a>
	</div>
</section>

<script src="/resources/js/review.js?after"></script>
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>
/*전역으로 빼놓음*/
let cmt_writer='<c:out value="${sesInfo.name}"/>';
let pno='<c:out value="${pvo.pno}"/>';
let pqno=$("#pqno").val();
/*pquestion*/
$(function() {
    $("#writeform").hide();
        $("#pqBtn").on("click", function(e) {
          e.preventDefault();
          $("#writeform").show(); 
        });
});


listPQuestion(pno, 1);//진짜 선언해준거 적어주기


$(document).on("click", "#pqPaging li a", function(e) {//123456789클릭부분해서 이동하는 부분
    e.preventDefault(e);
    listPQuestion(pno, $(this).attr("href"));
  });
  
$("#sub").on("click",function(){
  let isLock=$('input[name="isLock"]:checked').val();
  pno;
  let title=$("#title").val();
  let writer=$("#writer").val();
  let info=$("#info").val();

   if((title==null || title=='')&&(content==null || content=='')){
     alert("제목 or 내용을 입력해 주세요!");
         return false;
   }else{
     let pqdata={pno:pno, title:title, isLock:isLock, writer:writer, content:info};
     $.ajax({
       type:"post",
            url:"/pquestion/new",
            data:JSON.stringify(pqdata),
            contentType:"application/json; charset=utf-8"
            }).done(function(result){
              alert(result);
              listPQuestion(pno);
     });
   }
});

function printListPQuestion(listArr1, pquestionTotal, page, listArr2) {//정보값 불러오기, 페이징 넣어주기
    $("#pqList").children().remove();
    for (let pqvo of listArr1) {
       if(pqvo.isLock==0){
           let ulTag ='<c:if test="${sesInfo.name eq pqvo.writer || sesInfo.email eq 'admin@admin.com'}">';
           ulTag ='<div style="width:50%; margin-left:400px;" class="card justify-content-center"><div class="card-header"><ul id="'+pqvo.pqno+'" class="card-link" style="text-align: center; ">';
           ulTag += '<li style="list-style:none;" class="nav-item" >'+'no: '+pqvo.pqno+'</li>';
           ulTag += '<li style="list-style:none;" class="nav-item" >'+'제목: '+pqvo.title+'</li>';
           ulTag += '<li style="list-style:none;" class="nav-item">'+'잠금표시: '+pqvo.isLock+'</li>';
           ulTag += '<li style="list-style:none;" class="nav-item">'+'글쓴이: '+pqvo.writer+'</li>';
           ulTag += '<li style="list-style:none;" class="nav-item">'+'내용: '+pqvo.content+'</li>';
           ulTag += '<li style="list-style:none;" class="nav-item">'+'시간: '+displayTime(pqvo.regd8)+'</li>';
           ulTag += '<c:if test="${sesInfo.email eq 'admin@admin.com' || sesInfo.name eq pqvo.writer }">';
           ulTag += '<button class="btn btn-outline-danger col-md-1 delBtn2" type="button" data-pqno="'+pqvo.pqno+'">삭제</button></c:if>';
           ulTag += '<ul></div></c:if>';
           $("#pqList").append(ulTag);
       } else{
           let ulTag ='<div class="card"><div class="card-header"><ul id="'+pqvo.pqno+'" class="card-link" style="text-align: center;">';
              ulTag += '<li style="list-style:none;" class="nav-item" >'+'no: '+pqvo.pqno+'</li>';
              ulTag += '<li style="list-style:none;" class="nav-item" >'+'제목: '+pqvo.title+'</li>';
              ulTag += '<li style="list-style:none;" class="nav-item">'+'잠금표시: '+pqvo.isLock+'</li>';
              ulTag += '<li style="list-style:none;" class="nav-item">'+'글쓴이: '+pqvo.writer+'</li>';
              ulTag += '<li style="list-style:none;" class="nav-item">'+'내용: '+pqvo.content+'</li>';
              ulTag += '<li style="list-style:none;" class="nav-item">'+'시간: '+displayTime(pqvo.regd8)+'</li>';
              ulTag += '<c:if test="${sesInfo.email eq 'admin@admin.com' || sesInfo.name eq pqvo.writer }">';
              ulTag += '<button class="btn btn-outline-danger col-md-1 delBtn2" type="button" data-pqno="'+pqvo.pqno+'">삭제</button></c:if>';
              ulTag += '<ul></div></div>';
              $("#pqList").append(ulTag);  
       } 
       }
    printPQuestionPaging(pquestionTotal, page);
  }
  
$(document).on("click",".card-header ul", function(e) {

   let id = Number($(this).attr("id"));
   function printListAnswer(listArr) {
        for (let pavo of listArr) {
          if(id==pavo.pqno){
        let ulTag ='<ul class="nav nav-pills nav-justified>';
        ulTag += '<li class="nav-item">'+pavo.writer+'</li>';
        ulTag += '<li class="nav-item">'+pavo.content+'</li>';
        ulTag += '<li class="nav-item">'+displayTime(pavo.regd8)+'</li></ul></div>';
        
        $("#"+id).append(ulTag);
       
      }
       }
  } 
   console.log(">>>>>>>>id"+id);
   if(id > 0) { 
      
      function listPAnswer(param_pqno){
       $.getJSON("/panswer/list/"+id+".json", function(paList) {
          printListAnswer(paList);
            console.log(paList);
          }).fail(function() {
            alert("댓글리스트 출력실패")
          });
       }   
       
       listPAnswer(id);
   }
    
  
});

    function listPQuestion(param_pno, page){//문의사항 리스트 출력
       let pageNo = page > 1 ? page : 1;
      $.getJSON("/pquestion/list/"+param_pno+"/"+pageNo+".json",function(pqdto){
            printListPQuestion(pqdto.pqlist, pqdto.pqCnt, pageNo);
              console.log(">>리스트" + pqdto.pqlist);
              console.log(pqdto.pqCnt);
              console.log(pageNo);
            }).fail(function(){
              alert("문의사항 리스트 출력 실패")
            });
    }
    

function printPQuestionPaging(pquestionTotal, page) {//페이징 불러오기
    let pquestionPagingObj = '<ul style="text-align: center;  margin-left:400px;" class="pagination">';
    let endPagingNum = Math.ceil(page/10.0) * 10;
    let beginPagingNum = endPagingNum - 9;
    let prev = beginPagingNum != 1;
    let next = false;
    if(endPagingNum * 10 >= pquestionTotal) {
      endPagingNum = Math.ceil(pquestionTotal/10.0);
    } else {
      next = true;
    }
    if(prev){
      pquestionPagingObj += '<li class="page-item">';
      pquestionPagingObj += '<a class="page-link" href="'+(beginPagingNum-1)+'">Prev</a></li>';
    }
    for (var i = beginPagingNum; i <= endPagingNum ; i++) {
      let classActive = page == i ? ' active' : '';
      pquestionPagingObj += '<li class="page-item'+classActive+'">';
      pquestionPagingObj += '<a class="page-link" href="'+i+'">'+i+'</a></li>';
      console.log("i"+i);
    }
    if(next){
      pquestionPagingObj += '<li class="page-item">';
      pquestionPagingObj += '<a class="page-link" href="'+(endPagingNum+1)+'">Next</a></li>';
    }
    pquestionPagingObj += '</ul>';
    $("#pqPaging").html(pquestionPagingObj);
  }


  $(document).on("click", ".delBtn2", function(e) {
     let pqno=$(this).data("pqno"); //this가 가르키는것: 버튼객체에서 data-cno값 cno를찾음
        removePQuestion(pqno,pno);
  });
  
  function removePQuestion(pqno, pno){
     $.ajax({
    url:"/pquestion/"+pqno,
    type:"delete"
     }).done(function(result){
     alert(result);
     listPQuestion(pno);
     });
    } 

  function displayTime(regd8){
      let today = new Date();
      let changeModd8 = new Date(regd8);
      
      let todayYear = today.getFullYear();
      let todayMonth = today.getMonth()+1; // 0~11
      let todayDate = today.getDate();
      
      let modYear = changeModd8.getFullYear();
      let modMonth = changeModd8.getMonth()+1;
      let modDate = changeModd8.getDate();
      
      let modHour = changeModd8.getHours();
      let modMin = changeModd8.getMinutes();
      let modSec = changeModd8.getSeconds();
      
      let hour = (modHour > 9 ? "" :"0") + modHour;
      let min = (modMin > 9 ? "" : "0") + modMin;
      let sec = (modSec > 9 ? "" : "0") + modSec;
      let month = (modMonth > 9 ? "" : "0") + modMonth;
      let day = (modDate > 9 ? "" : "0") + modDate;
      
      let diff = todayYear == modYear && todayMonth == modMonth && todayDate == modDate;
      let dateStr = modYear+"-"+month+"-"+day;
      let timeStr = hour+":"+min+":"+sec;
      
      return diff ? timeStr : dateStr;
    }


$(function() {
	
	let date=$(".deliver-btn").eq('0').attr('id');
  $(".date").val(date);
     
	$("#minus").on("click", function(e) {
		e.preventDefault;
		if($(".qt").val() != 0) {
	        e.preventDefault;
	        let discount = Number('<c:out value="${pvo.discount}"/>');
	        let price = Number('<c:out value="${pvo.price}"/>');
	        let num = Number($(".qt").val()) - 1;
	        $(".qt").val(num);
	        if(discount == 0) {
	          price = price * num;
	        }else {
	          price = (price * (1 - discount / 100)) * num;
	        }
	        price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        $("#price").text(price);
	 }
	});
	$("input[name='qt']").on("blur", function(e) {
		$(".qt").val($("input[name='qt']").val());
	    if($("input[name='qt']").val() != 0) {
	    	console.log($("input[name='qt']").val());
	          e.preventDefault;
	          let discount = Number('<c:out value="${pvo.discount}"/>');
	          let price = Number('<c:out value="${pvo.price}"/>');
	          let num = Number($("input[name='qt']").val());
	          if(discount == 0) {
	            price = price * num;
	          }else {
	            price = (price * (1 - discount / 100)) * num;
	          }
	          price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	          $("#price").text(price);
	   }
	 });
	 $("#plus").on("click", function(e) {
		    e.preventDefault;
		    let discount = Number('<c:out value="${pvo.discount}"/>');
		    let price = Number('<c:out value="${pvo.price}"/>');
		    let num = Number($(".qt").val()) + 1;
		    $(".qt").val(num);
		    if(discount == 0) {
		      price = price * num;
		    }else {
		    	price = (price * (1 - discount / 100)) * num;
		    }
		    price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		    $("#price").text(price);
	});
});
function date(date){
    $(".date").val(date);
    $('button[class="deliver-btn btn btn-primary active"]').attr("class", "deliver-btn btn btn-primary");
    $('button[id="'+date+'"]').attr("class", "deliver-btn btn btn-primary active");
    console.log(date);
};

let review_pno = '<c:out value="${pvo.pno}"/>';
listReview(review_pno);
$(document).on("click", "#rvwPaging li a", function(e){
  e.preventDefault();
  listReview(review_pno,$(this).attr("href"));
});

$('a[href^="#"]').on('click',function(e) {
    e.preventDefault();
    var target = this.hash;
    console.log(target);
    if(target == '#top') {
    	
    	var $target = $(document);
    	$('html, body').stop().animate({
            'scrollTop': 0
        }, 900, 'swing');
    }else {
    	var $target = $(target);
    	$('html, body').stop().animate({
            'scrollTop': $target.offset().top-42
        }, 900, 'swing');
    }
    
});

/* 장바구니 스크립트 */
$("#cart").on("click", function() {
  let pno =$(".pno").val() ;
  let qt = $(".qt").val();
  let date=$(".date").val();
  let dfee=$(".dfee").val();

  $.ajax({
    type : "post",
    url : "/cart/add",
    data : {pno:pno, qt:qt,getd8:date,dfee:dfee},
    success:function(result){
           $("#cartModal").show();
    }
  });
});
$("#close").on("click", function() {
    $("#cartModal").hide();
  });

/*장바구니 끝 */

$(window).on('scroll',function() {
    if(checkVisible($('#content'))) {
    	$("a[class='nav-link active active-custom']").attr("class", "nav-link nav-custom");
    	$("a[href='#content']").attr("class", "nav-link active active-custom");
    }else if(checkVisible($('#review'))) {
      $("a[class='nav-link active active-custom']").attr("class", "nav-link nav-custom");
      $("a[href='#review']").attr("class", "nav-link active active-custom");
    }else if(checkVisible($('#question'))) {
      $("a[class='nav-link active active-custom']").attr("class", "nav-link nav-custom");
      $("a[href='#question']").attr("class", "nav-link active active-custom");
    }else if(checkVisible($('#delivery'))) {
      $("a[class='nav-link active active-custom']").attr("class", "nav-link nav-custom");
      $("a[href='#delivery']").attr("class", "nav-link active active-custom");
    }
});


function checkVisible( elm, eval ) {
    eval = eval || "object visible";
    var viewportHeight = $(window).height(), // Viewport Height
        scrolltop = $(window).scrollTop(), // Scroll Top
        y = $(elm).offset().top-42,
        elementHeight = $(elm).height();   
    
    if (eval == "object visible") return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
    if (eval == "above") return ((y < (viewportHeight + scrolltop)));
}

</script>