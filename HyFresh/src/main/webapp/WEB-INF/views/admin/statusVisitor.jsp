<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>

<main>
  <div class="container-fluid">
    <h3 class="mt-4">방문현황</h3>
    
    <div class="card mb-4">
      <div class="card-header">
        <i class="fas fa-chart-bar mr-1"></i> Bar Chart Example
      </div>
      <div class="card-body">
        <canvas id="myBarChart" width="100%" height="50"></canvas>
      </div>
      <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
    </div>
    <div class="card mb-4">
      <div class="card-header">
        <i class="fas fa-chart-pie mr-1"></i> Pie Chart Example
      </div>
      <div class="card-body">
        <canvas id="myPieChart" width="100%" height="50"></canvas>
      </div>
      <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
    </div>
  </div>
</main>

<jsp:include page="../admin/adminfooter.jsp"></jsp:include>