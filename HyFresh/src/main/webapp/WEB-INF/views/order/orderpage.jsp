<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cart" value="${cartList }" scope="session" />
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<c:set value="${product }" var="product" />
<c:set var="sum" value="0" />
<c:set var="defaultPrice" value="0" />
<c:set var="discount" value="0" />
<!-- Content section -->
<section class="py-5">
   <div class="container">
      <h1>주문하기</h1>
      <br>
      <div class="float-right form-group">
         <h4>
            01 장바구니 <i class="fas fa-chevron-right"></i> <span
               class="text-primary">02 주문서 작성 <i
               class="fas fa-chevron-right"></i></span> 03 주문완료
         </h4>
      </div>
      <form action="/order/insert" method="post">
         <h2>주문상품</h2>
         <table class="table table-hover">
            <thead>
               <tr class="table-info">
                  <th>이미지</th>
                  <th>상품명</th>
                  <th>상품 금액</th>
                  <th>수량</th>
                  <th>주문금액</th>
               </tr>
            </thead>
            <c:if test="${product ne null}">
               <tbody>
                  <tr>
                     <td><img src="${product.img }" style="width:200px;"><input type="hidden" name="img"
                        value="${product.img } "></td>
                     <td><span class="text-secondary">배송일 <fmt:parseDate
                              var="dateTempParse" value="${product.getd8}"
                              pattern="yyyy/MM/dd" /> <fmt:formatDate
                              value="${dateTempParse}" pattern="yyyy-MM-dd (E)" /></span><br>
                      ${product.pname} <input type="hidden" name="pname"
                        value="${product.pname } "></td>
                     <td><fmt:formatNumber pattern="###,###,###"
                           value="${(product.price * (1 - product.discount / 100))}" /><input
                        type="hidden" name="img"
                        value="${(product.price * (1 - product.discount / 100))} "></td>
                     <td>${product.qt }<input type="hidden" name="qt"
                        value="${product.qt } "></td>
                     <td><fmt:formatNumber pattern="###,###,###"
                           value="${(product.price * (1 - product.discount / 100)) *product.qt}" /></td>
                  </tr>
                  <c:set var="defaultPrice" value="${product.price * product.qt}" />
                  <c:set var="discount"
                     value="${discount+((product.price)-(product.price * (1 - product.discount / 100)))* product.qt}" />
                  <c:set var="sum"
                     value="${(product.price * (1 - product.discount / 100)) * product.qt}" />
               </tbody>
            </c:if>

            <c:if test="${cartList ne null && product eq null}">
               <tbody>
                  <c:forEach items="${cartList }" var="cart">
                     <input type="hidden" data-cno=${cart.cno } class="cno">
                     <tr>
                        <td><img src="${cart.img }" style="width: 200px;"></td>
                        <td><span class="text-secondary">배송일 <fmt:parseDate
                                 var="dateTempParse" value="${cart.getd8}"
                                 pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
                                 value="${dateTempParse}" pattern="yyyy-MM-dd (E)" /></span><br>
                        <strong>${cart.pname}</strong></td>
                        <td><fmt:formatNumber pattern="###,###,###"
                              value="${(cart.price * (1 - cart.discount / 100))}" />원</td>
                        <td>${cart.qt }</td>
                        <td><fmt:formatNumber pattern="###,###,###"
                              value="${(cart.price * (1 - cart.discount / 100)) * cart.qt}" />원</td>
                     </tr>
                     <c:set var="defaultPrice"
                        value="${defaultPrice+(cart.price * cart.qt)}" />
                     <c:set var="discount"
                        value="${discount+((cart.price)-(cart.price * (1 - cart.discount / 100)))* cart.qt}" />
                     <c:set var="sum"
                        value="${sum+((cart.price * (1 - cart.discount / 100))* cart.qt)}" />
                  </c:forEach>
               </tbody>
            </c:if>
         </table>
         <h2>배송지정보</h2>
         <table class="table table-hover">
            <tr>
               <th>배송지선택</th>
               <td colspan="3"><label class="radio-inline"> <input type="radio" value="0"
              name="radio" id="radio1" checked> 기본 배송지
          </label> <label class="radio-inline"> <input type="radio"
              name="radio" value="1"> 직접입력
          </label>
                  <button type="button" class="btn btn-outline-secondary" id="alist">배송지목록</button>
               </td>
            </tr>
            <tr>
               <th>수령인</th>
               <td colspan="3"><input type="text" value="${adr.receiver}" id="df_re" class="form-control dfaddr"  name="receiver" readonly>
               <input type="text" id="input_re" class="form-control inputaddr"  name="receiver" ></td>
            </tr>
            <tr>
               <th>연락처</th>
               <td colspan="3"><input type="text" value="${adr.tel}" id="df_tel" class="form-control dfaddr"  name="tel"readonly>
               <input type="text" id="input_tel" class="form-control inputaddr"  name="tel">
               </td>
            </tr>
            <tr>
               <th>주소 <button type="button" class="btn btn-outline-primary" onclick="openZipSearch()">검색</button> </th>
               <td colspan="3"> <input type="text" value="${adr.zipcode }" id="df_zipcode" class="form-control dfaddr" name="zipcode" readonly >
               <input type="text"  id="input_zipcode" class="form-control inputaddr" name="zipcode"><br>
              <input type="text" value="${adr.addr }" id="df_addr1" class="form-control dfaddr" name="addr" readonly>
              <input type="text" id="input_addr1" class="form-control inputaddr" name="addr">
              <input type="text" id="input_addr2" class="form-control inputaddr" name="addr"></td>
            </tr>
            <tr>
               <th>배송메세지</th>
               <td colspan="3"><input type="text" class="form-control"
                  name="memo"></td>
            </tr>
         </table>
         <br>

         <div class="container">
            <div class="row">
               <div class="col-lg-6">
                  <h2>적립금</h2>
                  <span>최소 사용 100원 이상</span>
                  <table class="table table-hover">
                     <tr>
                        <td>사용 가능한 적립금</td>
                        <td colspan="2"><fmt:formatNumber value="${sesInfo.point}"
                              type="currency" currencySymbol="" />P</td>
                     </tr>
                     <tr>
                        <td><input type="number" class="form-control" id="point"
                           style="width: 200px"></td>
                        <td><div class="custom-control custom-checkbox">
                              <input type="checkbox" class="custom-control-input"
                                 id="applyAll"> <label class="custom-control-label"
                                 for="applyAll">모두적용</label>
                           </div></td>
                        <td><button type="button" class="btn btn-outline-dark"
                              id="apply">적용</button></td>
                     </tr>
                     <tr>
                        <td><span id="lackPoint"></span></td>
                     </tr>
                  </table>
               </div>
               <div class="col-lg-6">
                  <h2>결제금액</h2>
                  <table class="table table-hover">
                     <tr>
                        <td>총 주문금액</td>
                        <td><fmt:formatNumber pattern="###,###,###"
                              value="${defaultPrice }" /></td>
                     </tr>
                     <tr>
                        <td>할인금액</td>
                        <td><fmt:formatNumber pattern="###,###,###"
                              value="${discount }" /> <input type="hidden"
                           value="${discount }" name="discount" id="discount"></td>
                     </tr>
                     <tr>
                        <td>배송비</td>
                        <td><fmt:formatNumber pattern="###,###,###" value="${dfee}" />
                           <input type="hidden" value="${dfee }" name="dfee" id="dfee"></td>
                     </tr>
                     <tr>
                        <td>적립금사용</td>
                        <td id="usePoint"></td>
                     </tr>
                     <tr>
                        <td>총 결제금액</td>
                        <td><h3>
                              <span id="totalSal"></span> <input type="hidden" name="oprice"
                                 id="oprice">
                           </h3></td>
                     </tr>
                     <tr>
                        <td colspan="2"><button type="button"
                              class="btn btn-primary btn-block" id="orderBtn">결제하기</button></td>
                     </tr>
                  </table>
               </div>
            </div>
         </div>
      </form>
   </div>
   <!-- The Modal -->
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
               <div>
                <div class="float-right form-group">
               <button type="button" class="btn btn-primary" id="addAddr">배송지 추가</button>
               </div>
               <div id="inputAddr" style="display:none">
        <table>
         <tr><td>배송지명 : <input type="text" name="addrname" class="form-control"/></td></tr>
         <tr><td>받으시는 분 : <input type="text" name="receiver" class="form-control"/></td></tr>
         <tr><td>연락처 : <input type="text" name="tel" class="form-control"/></td></tr>
          <tr><td>우편번호 <button type="button" class="btn btn-outline-primary" onclick="openZipSearch()">검색</button> <input type="text" name="zipcode" class="form-control"/></td></tr>
        <tr><td>주소 : <input type="text" name="addr" class="form-control" /><br></td></tr>
        <tr><td>상세주소 : <input type="text" name="addr" class="form-control"/><br></td></tr>
        </table>
        <button type="submit" class="btn btn-outline-primary">저장</button>
       
               </div>
                  <div id="addrlist">
                     <c:forEach items="${aList}" var="avo" varStatus="i">
                        <table class="table table-hover">
                           <tr class="table-active">
                              <td><button type="button" class="btn btn-primary" >기본배송지 등록</button></td>
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
      </div>
</section>
<jsp:include page="../common/footer.jsp"></jsp:include>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<script>
   OrderPrice();
    $(".inputaddr").hide();
   $(".inputaddr").attr("disabled",true)

    $("#orderBtn").click(function(){
     
        });
   
   //결제금액 계산
   function OrderPrice() {
      let usepoint = Math.floor($("#point").val());
      if(usepoint<0){
         usepoint=0;
      }
      let discount = '<c:out value="${discount}"/>';
      let dfee = '<c:out value="${dfee}"/>';
      let totalPrice = '<c:out value="${sum}"/>';
      console.log("usepoint:" + usepoint);
      console.log("totalPrice:" + totalPrice);
      console.log("discount:" + discount);

      let result = Number(totalPrice) - Number(usepoint) + Number(dfee);
      $("#totalSal").text(AddComma(result));
      let val = $("#oprice").val(result);
   };

   //콤마
   function AddComma(data_value) {
      return Number(data_value).toLocaleString('en');
   }

   //적립금 적용 유효성 체크
   function chkPoint(point, totalPrice) {
      if (Number(point) >= Number(totalPrice)) {
         $("#point").val(Math.floor(totalPrice));
      }

      if (point >= 100 ) {
         $("#point").attr("name", "point");
         $("#usePoint").text(
               $("#point").val().toString().replace(
                     /\B(?=(\d{3})+(?!\d))/g, ",")

         );
      } else {
         alert("100원이상부터 사용가능합니다!")
      }
      OrderPrice();
   }

   //주문한 상품 장바구니에서 지우기
   $("#orderBtn").click(function() {
          var isRight = true;
          if($("input[name=radio]:checked").val() == "1"){
           $("form").find(".inputaddr").each(function(index, item){
               // 아무값없이 띄어쓰기만 있을 때도 빈 값으로 체크되도록 trim() 함수 호출
               if ($(this).val().trim() == '') {
                   alert("주소를 입력해주세요");
                   isRight = false;
                   return false;
               }
           });

           if (!isRight) {
               return;
           }

           $(this).prop("disabled", true);
           $(this).prop("disabled", false);
          }
      $("form").submit()

      setTimeout(function removeCart() {
         var cnoArr = new Array();

         $("input[class='cno']").each(function() {
            cnoArr.push($(this).data("cno"));
         });
         console.log("cnoArr:" + cnoArr);

         $.ajax({
            url : "/cart/remove",
            type : "post",
            data : {
               chbox : cnoArr
            }
         });
      }, 3000);
   });

   //보유 적립금 체크
   $("#point").blur(function() {
      let point = $("#point").val();
      let memberPoint = '<c:out value="${sesInfo.point}"/>';
      if (Number(point) > Number(memberPoint)) {
         $("#point").val(Math.floor(memberPoint));
         $("#lackPoint").text("보유 적립금이 부족합니다.");
         $("#lackPoint").css("color", "red");
      }
   });

   //적립금 적용버튼
   $("#apply").click(function() {
      let point = $("#point").val();
      let totalPrice = '<c:out value="${sum}"/>';

      chkPoint(point, totalPrice);
      $("#applyAll").prop("checked", false);
   });

   //적립금 모두 적용
   $("#applyAll").change(function() {
      if ($("#applyAll").is(":checked")) {
         let memberPoint = '<c:out value="${sesInfo.point}"/>';
         if (memberPoint >= 0) {
            $("#point").val(Math.floor(memberPoint));
            let point = $("#point").val();
            let totalPrice = '<c:out value="${sum}"/>';
            chkPoint(point, totalPrice)
         } else {
            alert("보유 중인 포인트가 없습니다!");
            $("#applyAll").prop("checked", false);
            $("#point").val(0);

         }
      } else {
         $("#point").val(0);
         OrderPrice();
      }
   });

   function openZipSearch() {
      new daum.Postcode({
         oncomplete : function(data) {
            $('#input_zipcode').val(data.zonecode); // 우편번호 (5자리)
            $('#input_addr1').val(data.address,data.buildingName);
            $('#input_addr2').val(data.buildingName);
         }
      }).open();
   }

   ///배송지 목록  모달
   $("#alist").on("click", function() {
      $("#Modal").show();
   });
   
   $(".close").on("click", function() {
       $("#Modal").hide();
     });
   
   $('#addAddr').click(function () {  
       if($("#inputAddr").css("display") == "none"){   
           jQuery('#inputAddr').show();  
       } else {  
           jQuery('#inputAddr').hide();  
       }  
   }); 
   
   //배송지 목록에서 선택
$('.choice').click(function () {
     let re=$(this).closest("td").siblings("td").find(".are").text();
     let tel=$(this).closest("tr").siblings("tr").find(".atel").text();
     let zip=$(this).closest("tr").siblings("tr").find(".azip").text();
     let addr=$(this).closest("tr").siblings("tr").find(".aaddr").text();
     $("#df_re").val(re);
     $("#df_tel").val(tel);
     $("#df_re").val(re);
     $("#df_zipcode").val(zip);
     $("#df_addr1").val(addr);
     $("#radio1").prop("checked", true);
     $(".dfaddr").show();
     $(".inputaddr").hide(); 
     $("#Modal").hide();
});

   
   //직접 입력선택
$("input:radio[name=radio]").click(function(){
    if($("input[name=radio]:checked").val() == "1"){ //직접입력
           $(".inputaddr").attr("disabled",false);
           $(".dfaddr").attr("disabled",true);
           $(".dfaddr").hide();
           $(".inputaddr").show();
           // radio 버튼의 value 값이 1이라면 활성화

       }else if($("input[name=radio]:checked").val() == "0"){ //기본
           $(".inputaddr").attr("disabled",true);
           $(".dfaddr").attr("disabled",false);
           $(".dfaddr").show();
           $(".inputaddr").hide(); 
         
       };
  
});

   
$("input[type=submit]").click(function(){
    var isRight = true;
    $("form").find("input[type=text]").each(function(index, item){
        // 아무값없이 띄어쓰기만 있을 때도 빈 값으로 체크되도록 trim() 함수 호출
        if ($(this).val().trim() == '') {
            alert($(this).attr("data-name")+" 항목을 입력하세요.");
            isRight = false;
            return false;
        }
    });

    if (!isRight) {
        return;
    }

    $(this).prop("disabled", true);
    $(this).prop("disabled", false);
});


   
</script>