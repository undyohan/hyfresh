<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<main>
<div class="container-fluid">
  <h3 class="mt-4">리뷰리스트</h3>
  <div>
    <!-- 여기 안에 내용 작성 -->
    <div class="float-right form-group">
      <form action="/amdin/rlist?pageNum" class="form-inline">
        <input type="hidden" name="pagenum" value="1">
        <input type="hidden" name="amount" value="${pgvo.cri.amount }">
      </form>
    </div>
    <ul class="nav nav-tabs">
       <c:choose>
         <c:when test="${rate==0 }">
          <c:set var="active0" value="active"/>
        </c:when>
        <c:when test="${rate==1 }">
         <c:set var="active1" value="active"/>
        </c:when>
        <c:when test="${rate==2 }">
         <c:set var="active2" value="active"/>
        </c:when>
        <c:when test="${rate==3 }">
         <c:set var="active3" value="active"/>
        </c:when>
        <c:when test="${rate==4 }">
         <c:set var="active4" value="active"/>
        </c:when>
        <c:when test="${rate==5 }">
         <c:set var="active5" value="active"/>
        </c:when>
      </c:choose>
       <li class="nav-item">
         <a class="nav-link ${active0 }" href="/admin/rlist?rate=0">전체</a>
       </li>
       <li class="nav-item">
         <a class="nav-link ${active5 }" href="/admin/rlist?rate=5">5점</a>
       </li>
       <li class="nav-item">
         <a class="nav-link ${active4 }" href="/admin/rlist?rate=4">4점</a>
       </li>
       <li class="nav-item">
        <a class="nav-link ${active3 }" href="/admin/rlist?rate=3">3점</a>
      </li>
      <li class="nav-item">
        <a class="nav-link ${active2 }" href="/admin/rlist?rate=2">2점</a>
      </li>
      <li class="nav-item">
        <a class="nav-link ${active1 }" href="/admin/rlist?rate=1">1점</a>
      </li>
    </ul>
    <table class="table table-sm table-hover">
      <thead class="thead-dark">
        <tr>
          <th>리뷰번호</th>
          <th>상품번호</th>
          <th>별점</th>
          <th>리뷰 사진</th>
          <th>리뷰 제목</th>
          <th>리뷰 내용</th>
          <th>작성자</th>
          <th>최종수정일</th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${rList ne null && rList.size() != 0}">
            <c:forEach items="${rList }" var="rvo">
              <tr>
                <td>${rvo.rno }</td>
                <td><a href="/product/detail?pno=${rvo.pno }&pSign=0&pageNum=${pgvo.cri.pageNum}&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">${rvo.pno }</a></td>
                <td>${rvo.rate }</td>
                <td>
                  <c:choose>
                     <c:when test="${rvo.img != '/images/NONE' }">
                       <img src="${rvo.img }" style="width: 130px">
                     </c:when>
                     <c:when test="${rvo.img == '/images/NONE' }">
                                           이미지 없음
                    </c:when>
                  </c:choose>
                </td>
                <td>${rvo.title }</td>
                <td>${rvo.content }</td>
                <td>${rvo.writer }</td>
                <td><fmt:formatDate value="${rvo.modd8 }" pattern="MM-dd hh:mm" /></td>
              </tr>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <tr><td class="text-center" colspan="12">등록된 리뷰가 없습니다!</td></tr>
          </c:otherwise>
        </c:choose>
      </tbody>
    </table>
    <div class="container">
      <ul class="pagination justify-content-center">
        <c:if test="${pgvo.prev }">
          <li class="page-item"><a class="page-link"
            href="/admin/rlist?pageNum=${pgvo.beginPagingNum - 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Prev</a>
          </li>
        </c:if>
        <c:forEach begin="${pgvo.beginPagingNum }"
          end="${pgvo.endPagingNum }" var="i">
          <li class="page-item ${pgvo.cri.pageNum == i ? 'active' : ''}">
            <a class="page-link"
            href="/admin/rlist?pageNum=${i }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">${i }</a>
          </li>
        </c:forEach>
        <c:if test="${pgvo.next }">
          <li class="page-item"><a class="page-link"
            href="/admin/rlist?pageNum=${pgvo.endPagingNum + 1 }&amount=${pgvo.cri.amount}&type=${pgvo.cri.type}&keyword=${pgvo.cri.keyword}">Next</a>
          </li>
        </c:if>
      </ul>
    </div>
  </div>
</div>
</main>

<jsp:include page="../admin/adminfooter.jsp"></jsp:include>