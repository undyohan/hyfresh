<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>

<main>
  <div class="container-fluid">
    <h3 class="mt-4">급여현황</h3>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> 급여관리
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

<jsp:include page="../admin/adminfooter.jsp"></jsp:include>