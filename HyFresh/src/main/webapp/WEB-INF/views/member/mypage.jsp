<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<main role="main" class="container">  
   <div class="row row-offcanvas row-offcanvas-left">
      <!-- Sidebar -->
     <div class="col-6 col-md-2 sidebar-offcanvas sidebar" id="sidebar">
       <div class="list-group">
         <a href="/member/mypage?mno=${mvo.mno }" class="list-group-item list-group-item-success text-center pt-5 pb-5 mypagehead border-0"><strong>마이페이지</strong></a>
         <a href="/order/list" class="list-group-item list-group-item-action border-top border-white">주문배송조회</a>
         <a href="#" class="list-group-item list-group-item-action border-top border-white collapsed" data-toggle="collapse" data-target="#collapseBoard">
           <div class="sb-sidenav-collapse-arrow">
            상담 및 내글
            <i class="fas fa-angle-down"></i> 
          </div>
         </a>
         <div id="collapseBoard" class="collapse">
           <nav class="nav">
              <a href="/pquestion/list" class="nav-link text-muted">제품 Q&A</a>
              <a href="/question/list" class="nav-link text-muted">개인문의</a>
           </nav>
         </div>
         <a href="#" class="list-group-item list-group-item-action border-top border-white collapsed" data-toggle="collapse" data-target="#collapseInfo">
           <div class="sb-sidenav-collapse-arrow">
            내 정보 관리
            <i class="fas fa-angle-down"></i>
          </div>
         </a>
         <div id="collapseInfo" class="collapse">
           <nav class="nav">
             <a href="/member/modify?mno=${mvo.mno }" class="nav-link text-muted">회원정보 변경</a>
             <a href="/member/addr?mno=${mvo.mno }" class="nav-link text-muted">배송지 관리</a>
             <a href="/member/resign" class="nav-link text-muted">회원탈퇴</a>
          </nav>
        </div>
       </div>
     </div>
     <!-- Content -->
     <div class="col-12 col-md-10">
       <div class="border-top">
         <div class="mt-4 mb-5">
            <h4 class="mb-2">${mvo.name }님 <a href="/member/modify?mno=${mvo.mno }"><i class="fas fa-cog dataspace"></i></a></h4>
            <p class="text-muted mb-0">회원번호 ${mvo.mno }</p>
            <p class="text-muted">회원등급 (
              <c:choose>
                <c:when test="${mvo.grade >= 90 }">관리자</c:when>
                <c:when test="${mvo.grade >= 80 }">매니저</c:when>
                <c:when test="${mvo.grade >= 50 }">VIP</c:when>
                <c:when test="${mvo.grade >= 30 }">GOLD</c:when>
                <c:when test="${mvo.grade >= 10 }">SILVER</c:when>
                <c:otherwise>FAMILY</c:otherwise>
              </c:choose>
              )
            </p>
            <div class="card mt-2">
               <div class="dataLabel p-4">총 적립금
                <span class="dataNum"><fmt:formatNumber value="${mvo.point }" pattern="#,###" /></span>
                원
              </div>
            </div>
            <div class="d-flex justify-content-end mt-3">
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#pointInfoModal">
              적립금 안내 <i class="fas fa-chevron-right dataspace"></i>
            </button>
            </div>
         </div>
         <div class="mb-5">
           <div class="d-flex justify-content-between">
             <div class="d-inline-flex">
                  <h4>주문배송조회</h4>
                <p class="ml-3 text-muted"> | &nbsp; 최근 1개월</p>
             </div>
             <div><a href="/order/list">전체보기 <i class="fas fa-chevron-right dataspace"></i></a></div>
           </div>
           <div class="divider"></div>
           <div class="mt-3 mb-3">
              <div class="d-flex row justify-content-center">
                 <a href="#" class="col-md-2 text-center dataNum">${getPayment }</a>
                 <div class="text-center dataNum dataspace"></div>
                 <a href="#" class="col-md-2 text-center dataNum">${getReadyShipping }</a>
                 <div class="text-center dataNum dataspace"></div>
                 <a href="#" class="col-md-2 text-center dataNum">${getShipping }</a>
                 <div class="text-center dataNum dataspace"></div>
                 <a href="#" class="col-md-2 text-center dataNum">${getShipped }</a>
              </div>
              <div class="d-flex row justify-content-center">
                 <div class="col-md-2 text-center dataName">결제완료</div>
                 <div class="text-center dataName dataspace"><i class="fas fa-chevron-right"></i></div>
                 <div class="col-md-2 text-center dataName">배송준비중</div>
                 <div class="text-center dataName dataspace"><i class="fas fa-chevron-right"></i></div>
                 <div class="col-md-2 text-center dataName">배송중</div>
                 <div class="text-center dataName dataspace"><i class="fas fa-chevron-right"></i></div>
                 <div class="col-md-2 text-center dataName">배송완료</div>
              </div>
           </div>
         </div>
       </div>
       <!-- Modal -->
         <div class="modal fade" id="pointInfoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
           <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
             <div class="modal-content">
               <div class="modal-header d-flex flex-column">
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                 </button>
                 <h4 class="modal-title p-2" id="modalTitle"><i class="fas fa-piggy-bank"></i> 하이프레시 적립금이란?</h4>
                 <p class="p-2 pl-5 small">하이프레시 고객님께서 몰에서 주문하신 금액과 정기배송으로 결제하신 금액에 대해 1%를 적립해 드리는 제도 입니다.</p>
               </div>
               <div class="modal-body mb-3">
                 <ul>
                  <strong>적립대상</strong>
                  <li class="text-muted small">- 하이프레시에서 주문 결제 하신 금액 (일부상품 제외)</li>
                  <li class="text-muted small">- 월 단위 정기주문(후불결제 제품) 금액(하이프레시 회원만 가능)</li>
                 </ul>
                 <ul>
                  <strong>적립률</strong>
                  <li class="text-muted small">- 기본 적립률 1%</li>
                  <li class="text-muted small">- 정기주문(후불결제) 이용 기간에 따른 적립률 우대(5년이상:추가0.5%, 10년이상:추가:1.0%)</li>
                  <li class="text-muted small">- 우대 적립금 대상은 매 분기(3,6,9,12월) 기준으로 산정합니다.</li>
                  <li class="text-muted small">- 3개월 이상 정기주문(후불결제) 금액이 없는 경우 이용 기간은 초기화 됩니다.</li>
                 </ul>
                 <ul>
               <strong>적립금 지급</strong>
                  <li class="text-muted small">- 하이프레시 주문의 경우 제품 전달 완료일 다음날 적립됩니다.</li>
                  <li class="text-muted small">- 정기주문(후불결제)은 해당월 결제 금액에 대해 익월 중순 적립됩니다.</li>
                 </ul>
                 <ul>
               <strong>적립금 사용</strong>
                  <li class="text-muted small">- 하이프레시에서 주문 결제 시 사용 가능합니다.</li>
                  <li class="text-muted small">- 누적 적립금이 100원 이상일 경우 사용 가능합니다.</li>
                 </ul>
                 <ul>
               <strong>적립금 유효기간</strong>
                  <li class="text-muted small">- 일반 적립금의 유효기간은 적립 시점부터 1년간 입니다.</li>
                  <li class="text-muted small">- 이벤트 적립금은 별도의 유효기간 일자가 지정되어 있습니다.</li>
                  <li class="text-muted small">- 소멸기한이 1개월 내로 임박한 적립금은 마이페이지에서 확인하실 수 있습니다.</li>
                  <li class="text-muted small">- 적립금은 자동으로 유효기한이 적게 남은 금액부터 사용됩니다.</li>
                 </ul>
                 <ul>
               <strong>멤버스 포인트 사용</strong>
                  <li class="text-muted small">- 기존 보유하고 계신 멤버스 포인트는 멤버십몰에서 2020년 12월 31일까지 사용가능합니다.</li>
                  <li class="text-muted small">- 멤버스 포인트를 적립금으로 변환하여 사용 가능합니다.(1P -> 60원)</li>
                  <li class="text-muted small">- 2020년 12월 31일까지 미 사용된 포인트는 적립금으로 자동 전환됩니다.</li>
                 </ul>
               </div>
             </div>
           </div>
         </div> <!-- /Modal -->
    </div> <!-- Content -->
  </div>
</main>
<script>
$('#openModalBtn').on('shown.bs.modal', function () {
   $('#pointInfoModal').modal('show');
   })
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>