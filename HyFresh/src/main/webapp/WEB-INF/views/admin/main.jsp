<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>

<main>
<div class="container-fluid">
  <h3 class="mt-4">쇼핑몰 현황</h3>
  <div class="row mt-4">
    <div class="col-xl-3 col-md-6">
      <div class="card bg-primary text-white mb-4">
        <div class="card-body">주문 현황 <span class="badge badge-pill badge-light">${orderCount }</span></div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-white stretched-link" href="/admin/orderListTotal?status=9">View
            Details</a>
          <div class="small text-white">
            <i class="fas fa-angle-right"></i>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6">
      <div class="card bg-warning text-white mb-4">
        <div class="card-body">공지사항 등록</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-white stretched-link" href="/admin/noticewrite">View
            Details</a>
          <div class="small text-white">
            <i class="fas fa-angle-right"></i>
           </div>
        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6">
      <div class="card bg-success text-white mb-4">
        <div class="card-body">상품 문의</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-white stretched-link" href="/admin/pquestionlist">View
            Details</a>
          <div class="small text-white">
            <i class="fas fa-angle-right"></i>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6">
      <div class="card bg-danger text-white mb-4">
        <div class="card-body">개인 문의</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-white stretched-link" href="/admin/questionlist">View Details</a>
          <div class="small text-white">
            <i class="fas fa-angle-right"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xl-6">
      <div class="card mb-4">
        <div class="card-header">
          <i class="fas fa-chart-area mr-1"></i> 2주간 판매현황
        </div>
        <div class="card-body">
          <canvas id="myAreaChart" width="100%" height="40"></canvas>
        </div>
      </div>
    </div>
    <div class="col-xl-6">
      <div class="card mb-4">
        <div class="card-header">
          <i class="fas fa-chart-bar mr-1"></i> 월별 판매현황
        </div>
        <div class="card-body">
          <canvas id="myBarChart" width="100%" height="40"></canvas>
        </div>
      </div>
    </div>
  </div>
  <div class="card mb-4">
    <div class="card-header">
      <i class="fas fa-table mr-1"></i> 급여현황
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%"
          cellspacing="0">
          <thead>
            <tr>
              <th>Name</th>
              <th>Position</th>
              <th>Office</th>
              <th>Age</th>
              <th>Start date</th>
              <th>Salary</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Name</th>
              <th>Position</th>
              <th>Office</th>
              <th>Age</th>
              <th>Start date</th>
              <th>Salary</th>
            </tr>
          </tfoot>
          <tbody>
              <tr>
                <td>김희수</td>
                <td>백엔드 개발자</td>
                <td>서울 본사</td>
                <td>25</td>
                <td>2020/08/01</td>
                <td>$320,800</td>
              </tr>
              <tr>
                <td>송민영</td>
                <td>백엔드 개발자</td>
                <td>서울 본사</td>
                <td>25</td>
                <td>2020/08/01</td>
                <td>$320,800</td>
              </tr>
              <tr>
                <td>안요한</td>
                <td>백엔드 개발자</td>
                <td>서울 본사</td>
                <td>25</td>
                <td>2020/08/01</td>
                <td>$320,800</td>
              </tr>
              <tr>
                <td>윤희국</td>
                <td>백엔드 개발자</td>
                <td>서울 본사</td>
                <td>25</td>
                <td>2020/08/01</td>
                <td>$320,800</td>
              </tr>
              <tr>
                <td>이준우</td>
                <td>백엔드 개발자</td>
                <td>서울 본사</td>
                <td>25</td>
                <td>2020/08/01</td>
                <td>$320,800</td>
              </tr>
            </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</main>
<script>
let today = new Date();
let year = today.getFullYear();
let month = today.getMonth() + 1;
let monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
let engMonth = new Date();
let thisMonth = monthNames[engMonth.getMonth()];

let date = today.getDate();
let day = today.getDay();

</script>

<jsp:include page="../admin/adminfooter.jsp"></jsp:include>