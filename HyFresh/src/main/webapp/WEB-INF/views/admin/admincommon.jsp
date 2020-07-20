<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="sesInfo" value="${mInfo }" scope="session" />
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<a class="navbar-brand" href="/admin/main">관리자 페이지</a>
	<button class="btn btn-link btn-sm order-1 order-lg-0"
		id="sidebarToggle" href="#">
		<i class="fas fa-bars"></i>
	</button>
	<!-- Navbar Search-->
	<form
		class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
		<div class="input-group">
			<input class="form-control" type="text" placeholder="Search for..."
				aria-label="Search" aria-describedby="basic-addon2" />
			<div class="input-group-append">
				<button class="btn btn-primary" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</div>
	</form>
	<!-- Navbar-->
	<ul class="navbar-nav ml-auto ml-md-0">
	  <li class="nav-item">
      <a class="nav-link" href="/">쇼핑몰가기</a>
    </li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			id="userDropdown" href="#" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"><i
				class="fas fa-user fa-fw"></i></a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="#">Settings</a> <a
					class="dropdown-item" href="#">Activity Log</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="/member/logout">Logout</a>
			</div>
		</li>
		<li class="nav-item">
  		<a class="nav-link" href="/member/logout">Logout</a>
 		</li>
		
	</ul>
</nav>
<div id="layoutSidenav">
	<div id="layoutSidenav_nav">
		<nav class="sb-sidenav accordion sb-sidenav-dark"
			id="sidenavAccordion">
			<div class="sb-sidenav-menu">
				<div class="nav">
					<div class="sb-sidenav-menu-heading">Member</div>
					<a class="nav-link collapsed" href="#" data-toggle="collapse"
						data-target="#collapseMember" aria-expanded="false"
						aria-controls="collapseMember">
						<div class="sb-nav-link-icon">
							<i class="fas fa-user-edit"></i>
						</div> 회원관리
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseMember"
						aria-labelledby="headingOne" data-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="/admin/mlist">회원리스트</a>
							<a class="nav-link" href="/admin/resignlist">탈퇴 회원리스트</a>
						</nav>
					</div>
					
					<div class="sb-sidenav-menu-heading">Sale</div>
					<a class="nav-link collapsed" href="#" data-toggle="collapse"
            data-target="#collapseLayouts" aria-expanded="false"
            aria-controls="collapseLayouts">
            <div class="sb-nav-link-icon">
              <i class="fas fa-box-open"></i>
            </div> 상품관리
            <div class="sb-sidenav-collapse-arrow">
              <i class="fas fa-angle-down"></i>
            </div>
          </a>
          <div class="collapse" id="collapseLayouts"
            aria-labelledby="headingOne" data-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav">
              <a class="nav-link" href="/admin/plist">상품리스트</a>
              <a class="nav-link" href="/admin/pregister">상품등록</a>
              <a class="nav-link" href="/admin/preview">상품후기</a>
              <a class="nav-link" href="/admin/">상품문의</a>
            </nav>
          </div>
          
					<a class="nav-link collapsed" href="#" data-toggle="collapse"
            data-target="#collapseOrder" aria-expanded="false"
            aria-controls="collapseOrder">
            <div class="sb-nav-link-icon">
              <i class="fas fa-truck"></i>
            </div> 주문/배송관리
            <div class="sb-sidenav-collapse-arrow">
              <i class="fas fa-angle-down"></i>
            </div>
          </a>
          <div class="collapse" id="collapseOrder"
            aria-labelledby="headingOne" data-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav">
              <a class="nav-link" href="/admin/">주문 통합 리스트</a>
              <a class="nav-link" href="/admin/">배송중 리스트</a>
              <a class="nav-link" href="/admin/">배송완료 리스트</a>
              <a class="nav-link" href="/admin/">구매확정 리스트</a>
            </nav>
          </div>
          
					<a class="nav-link collapsed" href="#" data-toggle="collapse"
            data-target="#collapseRequest" aria-expanded="false"
            aria-controls="collapseRequest">
            <div class="sb-nav-link-icon">
              <i class="fas fa-comment-dots"></i>
            </div> 취소/반품/교환 관리
            <div class="sb-sidenav-collapse-arrow">
              <i class="fas fa-angle-down"></i>
            </div>
          </a>
          <div class="collapse" id="collapseRequest"
            aria-labelledby="headingOne" data-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav">
              <a class="nav-link" href="/admin/cancellist">취소 리스트</a>
              <a class="nav-link" href="/admin/returnlist">반품 리스트</a>
              <a class="nav-link" href="/admin/exchangelist">교환 리스트</a>
            </nav>
          </div>
          
					<a class="nav-link collapsed" href="#" data-toggle="collapse"
            data-target="#collapseSort" aria-expanded="false"
            aria-controls="collapseSort">
            <div class="sb-nav-link-icon">
              <i class="fas fa-layer-group"></i>
            </div> 상품 분류 관리
            <div class="sb-sidenav-collapse-arrow">
              <i class="fas fa-angle-down"></i>
            </div>
          </a>
          <div class="collapse" id="collapseSort"
            aria-labelledby="headingOne" data-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav">
              <a class="nav-link" href="/admin/pgroup">상품그룹 관리</a>
              <a class="nav-link" href="/admin/category">카테고리 관리</a>
            </nav>
          </div>
					
					<div class="sb-sidenav-menu-heading">Board</div>
          <a class="nav-link collapsed" href="#" data-toggle="collapse"
            data-target="#collapseBoard" aria-expanded="false"
            aria-controls="collapseBoard">
            <div class="sb-nav-link-icon">
              <i class="fas fa-clipboard"></i>
            </div> 게시판 관리
            <div class="sb-sidenav-collapse-arrow">
              <i class="fas fa-angle-down"></i>
            </div>
          </a>
          <div class="collapse" id="collapseBoard"
            aria-labelledby="headingOne" data-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav">
              <a class="nav-link" href="/admin/blist">게시판 리스트</a>
              <a class="nav-link" href="/admin/">게시글 관리</a>
            </nav>
          </div>
					
					<div class="sb-sidenav-menu-heading">Addons</div>
          <a class="nav-link collapsed" href="#" data-toggle="collapse"
            data-target="#collapseState" aria-expanded="false"
            aria-controls="collapseState">
            <div class="sb-nav-link-icon">
              <i class="fas fa-chart-bar"></i>
            </div> 통계
            <div class="sb-sidenav-collapse-arrow">
              <i class="fas fa-angle-down"></i>
            </div>
          </a>
          <div class="collapse" id="collapseState"
            aria-labelledby="headingOne" data-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav">
              <a class="nav-link" href="/admin/stateProduct">판매현황</a>
              <a class="nav-link" href="/admin/stateVisitor">방문자현황</a>
            </nav>
          </div>
          
          <a class="nav-link collapsed" href="#" data-toggle="collapse"
            data-target="#collapseSetting" aria-expanded="false"
            aria-controls="collapseSetting">
            <div class="sb-nav-link-icon">
              <i class="fas fa-cog"></i>
            </div> 관리설정
            <div class="sb-sidenav-collapse-arrow">
              <i class="fas fa-angle-down"></i>
            </div>
          </a>
          <div class="collapse" id="collapseSetting"
            aria-labelledby="headingOne" data-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav">
              <a class="nav-link" href="/admin/setting">기본설정</a>
              <a class="nav-link" href="/admin/manager">운영자관리</a>
              <a class="nav-link" href="/admin/authority">권한그룹 관리</a>
            </nav>
          </div>
          
					<a class="nav-link collapsed" href="#" data-toggle="collapse"
						data-target="#collapsePages" aria-expanded="false"
						aria-controls="collapsePages">
						<div class="sb-nav-link-icon">
							<i class="fas fa-book-open"></i>
						</div> Pages
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapsePages"
						aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav accordion"
							id="sidenavAccordionPages">
							<a class="nav-link collapsed" href="#" data-toggle="collapse"
								data-target="#pagesCollapseAuth" aria-expanded="false"
								aria-controls="pagesCollapseAuth"> Authentication
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="pagesCollapseAuth"
								aria-labelledby="headingOne"
								data-parent="#sidenavAccordionPages">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="/admin/c">Login</a> <a
										class="nav-link" href="/admin/">Register</a> <a
										class="nav-link" href="/admin/">Forgot Password</a>
								</nav>
							</div>
							<a class="nav-link collapsed" href="#" data-toggle="collapse"
								data-target="#pagesCollapseError" aria-expanded="false"
								aria-controls="pagesCollapseError"> Error
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="pagesCollapseError"
								aria-labelledby="headingOne"
								data-parent="#sidenavAccordionPages">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="/admin/">401 Page</a> <a
										class="nav-link" href="/admin/">404 Page</a> <a
										class="nav-link" href="/admin/">500 Page</a>
								</nav>
							</div>
						</nav>
					</div>
					<a class="nav-link" href="/admin/">
						<div class="sb-nav-link-icon">
							<i class="fas fa-chart-area"></i>
						</div> Charts
					</a>
					<a class="nav-link" href="/admin/admindummy">
						<div class="sb-nav-link-icon">
							<i class="fas fa-chart-area"></i>
						</div> Dummy Page
					</a>
				</div>
			</div>
		</nav>
	</div>
	<div id="layoutSidenav_content">
		