<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="sesInfo" value="${mInfo }" scope="session" />
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<nav
	class="navbar navbar-expand-lg navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
	<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="/admin/main">ADMIN
		PAGE</a>
	<button class="navbar-toggler position-absolute d-md-none collapsed"
		type="button" data-toggle="collapse" data-target="#sidebarMenu"
		aria-controls="sidebarMenu" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<!-- Topbar Search -->
	<form
		class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		<div class="input-group">
			<input type="text" class="form-control bg-light border-0 small"
				placeholder="Search for..." aria-label="Search"
				aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-primary" type="button">
					<i class="fas fa-search fa-sm"></i>
				</button>
			</div>
		</div>
	</form>

	<ul class="navbar-nav px-3 ml-auto">
		<c:if test="${sesInfo ne null }">
			<li class="nav-item"><a class="nav-link" href="#">${sesInfo.name }
					<c:choose>
						<c:when test="${sesInfo.grade >= 90 }">(관리자)</c:when>
						<c:when test="${sesInfo.grade >= 80 }">(매니저)</c:when>
					</c:choose>
			</a></li>
		</c:if>

		<li class="nav-item dropdown">
		  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
		  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">설정 </a>
			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				<a class="dropdown-item small" href="/">쇼핑몰가기</a> 
				<a class="dropdown-item small" href="">비밀번호 변경</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item small" href="/member/logout">로그아웃</a>
			</div>
			
		</li>
		<li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a></li>
	</ul>
</nav>

<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu"
			class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
			<div class="sidebar-sticky pt-3">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link active"
						href="/admin/main"> <span data-feather="home">관리자메인 </span> <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#collapseProduct"> <span
							data-feather="file">상품관리</span>
					</a>
						<div class="collapse" id="collapseProduct">
							<div class="card card-body p-2">
								<a class="nav-link" href="#"> <span data-feather="users">
										상품 리스트</span>
								</a> <a class="nav-link" href="#"> <span data-feather="users">
										상품등록</span>
								</a> <a class="nav-link" href="#"> <span data-feather="users">
										상품후기</span>
								</a> <a class="nav-link" href="#"> <span data-feather="users">
										상품문의</span>
								</a>
							</div>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#collapseOrder"> <span
							data-feather="shopping-cart"> 주문/배송관리</span>
					</a>
						<div class="collapse" id="collapseOrder">
							<div class="card card-body p-2">
								<a class="nav-link" href="#"> <span data-feather="users">
										주문 통합 리스트</span>
								</a> <a class="nav-link" href="#"> <span data-feather="users">
										배송중 리스트</span>
								</a> <a class="nav-link" href="#"> <span data-feather="users">
										배송완료 리스트</span>
								</a> <a class="nav-link" href="#"> <span data-feather="users">구매확정
										리스트</span>

								</a>
							</div>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#collapseRequest"> <span
							data-feather="users">취소/반품/교환 관리</span>
					</a>
						<div class="collapse" id="collapseRequest">
							<div class="card card-body p-2">
								<a class="nav-link" href="#"> <span data-feather="users">취소
										리스트</span>
								</a> <a class="nav-link" href="#"> <span data-feather="users">반품
										리스트</span>
								</a> <a class="nav-link" href="#"> <span data-feather="users">교환
										리스트</span>

								</a>
							</div>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#collapseMember"> <span
							data-feather="bar-chart-2">회원관리</span>
					</a>
						<div class="collapse" id="collapseMember">
							<div class="card card-body p-2">
								<a class="nav-link" href="/admin/mlist"> <span
									data-feather="users">회원리스트</span>
								</a> <a class="nav-link" href="/admin/resignlist"> <span
									data-feather="users">탈퇴 회원리스트</span>
								</a>
							</div>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#collapseSort"> <span
							data-feather="layers">상품 분류 관리</span>
					</a>
						<div class="collapse" id="collapseSort">
							<div class="card card-body p-2">
								<a class="nav-link" href="#"> <span data-feather="users">
										상품그룹 관리</span>
								</a> <a class="nav-link" href="/admin/catelist"> <span data-feather="users">
										카테고리 관리</span>
								</a>
							</div>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#"> <span
							data-feather="layers">게시판 관리</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <span
							data-feather="layers"> 판매통계</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#collapseSetting"> <span
							data-feather="layers">설정</span>
					</a>
						<div class="collapse" id="collapseSetting">
							<div class="card card-body">
								<a class="nav-link" href="#"> <span data-feather="users">기본설정</span>
								</a> <a class="nav-link" href="#"> <span data-feather="users">운영자관리</span>

								</a> <a class="nav-link" href="#"> <span data-feather="users">권한그룹
										관리</span>

								</a>
							</div>
						</div></li>
				</ul>

				<h6
					class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
					<span>Saved reports</span> <a
						class="d-flex align-items-center text-muted" href="#"
						aria-label="Add a new report"> <span
						data-feather="plus-circle"></span>
					</a>
				</h6>
				<ul class="nav flex-column mb-2">
					<li class="nav-item"><a class="nav-link" href="#"> <span
							data-feather="file-text">Current month</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <span
							data-feather="file-text">Last quarter</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <span
							data-feather="file-text">Social engagement</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <span
							data-feather="file-text"> Year-end sale</span>
					</a></li>
				</ul>
			</div>
		</nav>


		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">