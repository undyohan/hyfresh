<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<div class="d-flex" id="wrapper">
	<!-- Sidebar -->
	<div class="bg-light border-right" id="sidebar-wrapper">
		<div class="list-group list-group-flush">
		  <div class="list-group-item list-group-item-action bg-dark">마이페이지</div>  
			<a href="#" class="list-group-item list-group-item-action bg-light">주문배송조회</a>
			<a href="#" class="list-group-item list-group-item-action bg-light">상담 및 내글관리</a>
			<a href="#" class="list-group-item list-group-item-action bg-light">내 정보 관리</a>
		</div>
	</div>
	<div id="page-content-wrapper">
		<div class="container-fluid">
			<h1 class="mt-4">Simple Sidebar</h1>
			<p>The starting state of the menu will appear collapsed on
				smaller screens, and will appear non-collapsed on larger screens.
				When toggled using the button below, the menu will change.</p>
			<p>
				Make sure to keep all page content within the
				<code>#page-content-wrapper</code>
				. The top navbar is optional, and just for demonstration. Just
				create an element with the
				<code>#menu-toggle</code>
				ID which will toggle the menu when clicked.
			</p>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>