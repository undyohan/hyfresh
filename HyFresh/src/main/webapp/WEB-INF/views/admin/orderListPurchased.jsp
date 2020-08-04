<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<main>
<div class="container-fluid">
  <h3 class="mt-4">구매확정 리스트</h3>
  <div>
    <!-- 여기 안에 내용 작성 -->
    <div class="float-right form-group">
      <form action="/product/list?pageNum" class="form-inline">
        <input type="hidden" name="pagenum" value="1">
        <input type="hidden" name="amount" value="${pgvo.cri.amount }">
        <div class="input-group">

          <div class="input-group-prepend">
            <select class="form-control" id="stype" name="type">
              <option value="twc">선택</option>
              <option value="t">상품명</option>
              <option value="w">작성자</option>
              <option value="c">상세내용</option>
              <option value="tw">상품명+작성자</option>
              <option value="tc">상품명+상세내용</option>
              <option value="wc">작성자+상세내용</option>
            </select>
          </div>
          <input type="text" class="form-control" placeholder="키워드를 입력하세요"
            name="keyword">
          <div class="input-group-append">
            <button class="btn btn-sm btn-primary" type="submit">검색</button>
          </div>
        </div>
      </form>
    </div>
    <table class="table table-sm table-hover">
      <thead class="thead-dark">
        <tr>
          <th>주문개별번호</th>
          <th>주문번호</th>
          <th>상품번호</th>
          <th>리뷰번호</th>
          <th>상품명</th>
          <th>가격</th>
          <th>수량</th>
          <th>배송완료일</th>
          <th>배송일</th>
          <th>상태번호</th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${listTotal ne null && listTotal.size() != 0}">
            <c:forEach items="${listTotal }" var="odvo">
              <tr>
                <td>${odvo.odno }</td>
                <td>${odvo.ocode }</td>
                <td>${odvo.pno }</td>
                <td>${odvo.rno }</td>
                <td>${odvo.pname }</td>
                <td>${odvo.price }</td>
                <td>${odvo.qt }</td>
                <td>${odvo.deliverd8 }</td>
                <td>${odvo.sendd8 }</td>
                <td>${odvo.status }</td>
              </tr>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <tr><td class="text-center" colspan="12">등록된 상품이 없습니다!</td></tr>
          </c:otherwise>
        </c:choose>
      </tbody>
    </table>
    <div class="container">
      <ul class="pagination justify-content-center">
        <c:if test="${pgvo.prev }">
          <li class="page-item"><a class="page-link"
            href="/product/list?pageNum=${pgvo.beginPagingNum - 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Prev</a>
          </li>
        </c:if>
        <c:forEach begin="${pgvo.beginPagingNum }"
          end="${pgvo.endPagingNum }" var="i">
          <li class="page-item ${pgvo.cri.pageNum == i ? 'active' : ''}">
            <a class="page-link"
            href="/product/list?pageNum=${i }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">${i }</a>
          </li>
        </c:forEach>
        <c:if test="${pgvo.next }">
          <li class="page-item"><a class="page-link"
            href="/product/list?pageNum=${pgvo.endPagingNum + 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Next</a>
          </li>
        </c:if>
      </ul>
    </div>
  </div>
</div>
</main>

<jsp:include page="../admin/adminfooter.jsp"></jsp:include>