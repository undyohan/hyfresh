<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<main>
<div class="container-fluid">
  <h1 class="mt-4">쇼핑몰 현황</h1>
  <div class="row mt-4">
    <div class="col-xl-3 col-md-6">
      <div class="card bg-primary text-white mb-4">
        <div class="card-body">Primary Card</div>
        <div
          class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-white stretched-link" href="#">View
            Details</a>
          <div class="small text-white">
            <i class="fas fa-angle-right"></i>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6">
      <div class="card bg-warning text-white mb-4">
        <div class="card-body">Warning Card</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-white stretched-link" href="#">View
            Details</a>
          <div class="small text-white">
            <i class="fas fa-angle-right"></i>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6">
      <div class="card bg-success text-white mb-4">
        <div class="card-body">Success Card</div>
        <div
          class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-white stretched-link" href="#">View
            Details</a>
          <div class="small text-white">
            <i class="fas fa-angle-right"></i>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6">
      <div class="card bg-danger text-white mb-4">
        <div class="card-body">Danger Card</div>
        <div
          class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-white stretched-link" href="#">View
            Details</a>
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
          <i class="fas fa-chart-area mr-1"></i> Area Chart Example
        </div>
        <div class="card-body">
          <canvas id="myAreaChart" width="100%" height="40"></canvas>
        </div>
      </div>
    </div>
    <div class="col-xl-6">
      <div class="card mb-4">
        <div class="card-header">
          <i class="fas fa-chart-bar mr-1"></i> Bar Chart Example
        </div>
        <div class="card-body">
          <canvas id="myBarChart" width="100%" height="40"></canvas>
        </div>
      </div>
    </div>
  </div>
  <div class="card mb-4">
    <div class="card-header">
      <i class="fas fa-table mr-1"></i> DataTable Example
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
              <td>Tiger Nixon</td>
              <td>System Architect</td>
              <td>Edinburgh</td>
              <td>61</td>
              <td>2011/04/25</td>
              <td>$320,800</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</main>
  
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>