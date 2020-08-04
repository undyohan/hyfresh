<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<!-- Content section -->

<section class="py-5">
  <div class="container">
    <h1>장바구니</h1>


    <div class="float-right form-group">
      <h4>
        <span class="text-primary">01 장바구니 <i class="fas fa-chevron-right"></i> </span> 02 주문서 작성 <i class="fas fa-chevron-right"></i> 03 주문완료
      </h4>
    </div>

    <c:choose>
      <c:when test="${cartList ne null && cartList.size() != 0 }">
        <table class="table table-hover">
          <thead>
            <tr class="table-info">
              <th>
                <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" id="allchk">
                  <label class="custom-control-label" for="allchk"></label>
                </div>
              </th>
              <th colspan="5"></th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${cartList }" var="cart">
              <tr>
                <td><input type="checkbox" onclick="itemSum()"
                  class="chBox"
                  value="${cart.price * cart.qt},${((cart.price)-(cart.price * (1 - cart.discount / 100)))*cart.qt},${cart.dfee},${(cart.price * (1 - cart.discount / 100)) * cart.qt}"
                  data-cno="${cart.cno }" data-pno="${cart.pno}"
                  style="width: 15px; height: 15px;" /></td>
              <td><a href="/product/detail?pno=${cart.pno}"><img src="${cart.img }" style="width:200px;"></a></td>
                <td><span><fmt:parseDate var="dateTempParse"
                      value="${cart.getd8}" pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
                      value="${dateTempParse}" pattern="yyyy-MM-dd (E)" /></span> <a
                  href="#" class="dayChange" data-cno="${cart.cno}">배송일변경</a> <br>
                  <strong>${cart.pname}</strong><br> <c:if
                    test="${cart.discount > 0 }">
                    <del>
                      <fmt:formatNumber pattern="###,###,###"
                        value="${cart.price }" />
                    </del>
                  </c:if> <fmt:formatNumber pattern="###,###,###"
                    value="${(cart.price * (1 - cart.discount / 100)) }" />원</td>
                <td><input type="number" value=${cart.qt } class="qt"
                  name="qt" style="width: 65px">
                  <button class="btn btn-primary modQt" data-pno="${cart.pno }">변경</button></td>
                <td width=120><span class="sumMoney"><fmt:formatNumber
                      pattern="###,###,###"
                      value="${(cart.price * (1 - cart.discount / 100)) * cart.qt}" /></span>원</td>
                <td width=120><a href="#" class="btn delBtn"
                  data-cno="${cart.cno }"><i class="fas fa-times"></i></a><br>
                  <a href="#" class="btn btn-primary order"
                  data-cno="${cart.cno }">주문하기</a></td>
              </tr>
            </c:forEach>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="6"><button type="button" id="selectDel"
                  class="btn btn-danger">선택삭제</button></td>
            </tr>
          </tfoot>
        </table>

        <div class="text-center sum">
        <div class=" flex-container">
          <ul class="displayCal">
            <li><p>총 주문금액</p><span id="price"></span></li>
            <li><br><i class="fas fa-minus"></i></li>
            <li><p>할인금액</p><span id="discount"></span></li>
            <li><br><i class="fas fa-plus"></i></li>
            <li><p>배송비</p><span id="dfee"></span></li>
            <li><br><i class="fas fa-equals"></i></li>
            <li><p>총 결제금액</p><span id="totalSum" class="text-primary"></span></li>
          </ul>
          <input type="hidden" id="dfeeVal" value="">
          </div>
        </div>


        <div class="text-center">
          <button type="button" class="btn btn-outline-primary selOrder ">선택상품
            주문하기</button>
          <button type="button" class="btn btn-primary allOrder">전체상품
            주문하기</button>
        </div>
      </c:when>
      <c:otherwise>
        <table class="table table-hover">
          <thead>
            <tr class="table-info">
              <th>
                <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" id="allchk">
                  <label class="custom-control-label" for="allchk"></label>
                </div>
              </th>
              <th colspan="5"></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td colspan="6"><div class="text-center">
                  <img src="/resources/img/u_basket_none.gif">
                </div> <br>
                <h3 class="text-center">장바구니가 비어있습니다!</h3></td>

            </tr>
          </tbody>
        </table>
      </c:otherwise>
    </c:choose>

    <!--장바구니 모달창  -->

    <!-- The Modal -->
    <div class="modal" id="Modal">
      <div class="modal-dialog">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">배송일변경</h4>
          </div>
          <!-- Modal body -->
          <div class="modal-body">
            <select id="date" class="form-control">
              <c:forEach items="${cList }" var="cal" varStatus="i">
                <c:set var="day">day${i.count}</c:set>
                <c:set var="dow">dow${i.count}</c:set>
                <c:if test="${i.count <= 7 }">
                  <c:if test="${cList[day] ne ''}">
                    <option value="${cList[day]}">${cList[day]}
                      (${cList[dow]})</option>
                  </c:if>
                </c:if>
              </c:forEach>
            </select>

          </div>
          <div class="modal-footer">
            <div class="container text-center">
              <button type="button" class="btn btn-primary" id="modDate">변경</button>
              <a href="/cart/list" class="btn btn-outline-dark" id="close">취소</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!--장바구니 모달끝  -->



</section>



<jsp:include page="../common/footer.jsp"></jsp:include>


<script>
  //금액합계 펑션
  function itemSum() {
    console.log("체크체크");
    var str = "";
    var price = 0;
    var sum = 0;
    var discount = 0;
    var dfee = 0;
    var count = $(".chBox").length;
    console.log(count);
    for (var i = 0; i < count; i++) {
      if ($(".chBox")[i].checked == true) {
        let priceInfo = $(".chBox")[i].value.split(",");
        for (var j = 0; j < 2; j++) {
          if (priceInfo[2] > dfee) {
            dfee = priceInfo[2]
          }
        }
        console.log(priceInfo[0]);
        console.log(priceInfo[1]);
        console.log(priceInfo[2]);
        console.log(priceInfo[3]);
        price += parseFloat(priceInfo[0]);
        discount += parseFloat(priceInfo[1]);
        sum += parseFloat(priceInfo[3]);
      }
    }
    if (sum >= 30000) {
      dfee = 0;
    }
    sum += Number(dfee);

    $("#price").html(AddComma(price) + "원");
    $("#totalSum").html(AddComma(sum) + "원");
    $("#discount").html(AddComma(discount) + "원");
    $("#dfee").html(AddComma(dfee) + "원");
    $("#dfeeVal").val(dfee);
    console.log("디피:" + dfee);
  }

  //콤마
  function AddComma(data_value) {
    return Number(data_value).toLocaleString('en');
  }

  //페이지 로딩시 체크박스
  function chk() {
    $("#allchk").prop("checked", true);
    $(".chBox").prop("checked", true);
    itemSum();
  }

  $(function() {
    chk();

    //장바구니담기
    $("#addCart").on("click", function() {
      let pno = 1;
      let qt = 10;
      let data = {
        pno : pno,
        qt : qt
      };
      console.log(data);
      $.ajax({
        type : "post",
        url : "/cart/add",
        data : JSON.stringify(data),
        contentType : "application/json; charset:utf-8"
      }).done(function(result) {
        alert(result);
        location.href = "/cart/list";
      });
    });

    //수량 수정
    $(".modQt").on("click", function() {
      let pno = $(this).data("pno");
      let qt = $(this).closest("td").find("input[class='qt']").val();
      console.log("pno:" + pno);
      console.log("qt:" + qt);
      let data = {
        pno : pno,
        qt : qt
      };
      $.ajax({
        type : "post",
        url : "/cart/modqt",
        data : JSON.stringify(data),
        contentType : "application/json; charset:utf-8"
      }).done(function(result) {
        alert(result);
        location.href = "/cart/list";
      });
    });

    //체크박스 
    $("#allchk").on("click", function() {
      let chk = $(this).prop("checked");
      if (chk) {
        $(".chBox").prop("checked", true);
      } else {
        $(".chBox").prop("checked", false);
      }
      itemSum();
    });
    $(".chBox").on("click", function() {
      $("#allchk").prop("checked", false);
    });

    //체크된거 삭제
    $("#selectDel").click(function() {
      var confirm_val = confirm("정말 삭제하시겠습니까?");
      if (confirm_val) {
        var checkArr = new Array();
        $("input[class='chBox']:checked").each(function() {
          checkArr.push($(this).data("cno"));
        });
        console.log("checkArr:" + checkArr);

        $.ajax({
          url : "/cart/remove",
          type : "post",
          data : {
            chbox : checkArr
          },
          success : function(result) {
            console.log("result:" + result)
            if (result == 1) {
              location.href = "/cart/list";
            } else {
              alert("삭제 실패");
            }
          }
        });
      }
    });
    //개별삭제
    $(".delBtn").click(function() {
      var confirm_val = confirm("정말 삭제하시겠습니까?");

      if (confirm_val) {
        var checkArr = new Array();
        checkArr.push($(this).data("cno"));
        $.ajax({
          url : "/cart/remove",
          type : "post",
          data : {
            chbox : checkArr
          },
          success : function(result) {
            console.log("result:" + result)
            if (result == 1) {
              location.href = "/cart/list";
            } else {
              alert("삭제 실패");
            }
          }
        });
      }
    });
    //선택상품 주문
    $(".selOrder").click(function(e) {
      var checkArr = new Array();
      let dfee = $("#dfeeVal").val();
      console.log("dfee:" + dfee);
      $("input[class='chBox']:checked").each(function() {
        checkArr.push($(this).data("cno"));
      });
      console.log("cnoArr:" + checkArr);

      $.ajax({
        url : "/order/cartorder",
        type : "post",
        data : {
          chbox : checkArr,
          dfee : dfee
        },
        success : function(result) {
          console.log("result:" + result)
          if (result == 1) {
            location.href = "../order/orderpage";
          } else {
            alert("로그인이 필요합니다");
            location.href = "/member/login";
          }
        }
      });
    });

    //전체상품 주문
    $(".allOrder").click(function(e) {
      var checkArr = new Array();
      let dfee = $("#dfeeVal").val();
      console.log("dfee:" + dfee);

      $("input[class='chBox']").each(function() {
        checkArr.push($(this).data("cno"));
      });
      console.log("cnoArr:" + checkArr);
      $.ajax({
        url : "/order/cartorder",
        type : "post",
        data : {
          chbox : checkArr,
          dfee : dfee
        },
        success : function(result) {
          console.log("result:" + result)
          if (result == 1) {
            location.href = "../order/orderpage";
          } else {
            alert("로그인이 필요합니다");
            location.href = "/member/login";
          }
        }
      });
    });
    //하나 주문
    $(".order").click(function() {
      var checkArr = new Array();
      let dfee = $("#dfeeVal").val();
      checkArr.push($(this).data("cno"));

      console.log("cnoArr:" + checkArr);
      $.ajax({
        url : "/order/cartorder",
        type : "post",
        data : {
          chbox : checkArr,
          dfee : dfee
        },
        success : function(result) {
          console.log("result:" + result)
          if (result == 1) {
            location.href = "../order/orderpage";
          } else {
            alert("로그인이 필요합니다");
            location.href = "/member/login";
          }
        }
      });
    });
    //배송일 변경
    $(".dayChange").on("click", function(e) {
      e.preventDefault();
      let cno = $(this).data("cno");
      let getd8 = $(this).closest("td").find("span").text();
      let getdate = getd8.substr(0, 11)
      console.log("getd8:" + getd8);
      console.log("getdate:" + getdate);
      $("#date").attr("data-cno", cno);
      $("#date option[value=" + getdate + "]").attr("selected", true);
      $("#Modal").show();
    });

    $("#close").on("click", function() {
      $("#Modal").hide();
    });

    $("#modDate").on("click", function() {
      let cno = $("#date").data("cno");
      let getd8 = $("#date").val();
      $.ajax({
        url : "/cart/modDate",
        type : "post",
        data : {
          cno : cno,
          getd8 : getd8
        },
        success : function(result) {
          console.log("result:" + result)
          if (result == 1) {
            location.href = "/cart/list";
            $("#Modal").hide();
          } else {
            alert("변경 실패");
          }
        }
      });
    });
  });
</script>