<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../admin/adminheader.jsp"></jsp:include>
<jsp:include page="../admin/admincommon.jsp"></jsp:include>
<main>
<div class="container-fluid">
  <h3 class="mt-4">상품등록</h3>
  <div>
    <!-- 여기 안에 내용 작성 -->  
	  <div class="btn-toolbar mb-2 mb-md-0 mt-3">
	    <form action="/admin/pregister" method="post">
        <label for="img">이미지파일</label>
			  <div class="input-group mb-3">
			    <div class="input-group-prepend">
			      <span class="input-group-text">Upload</span>
			    </div>
			    <div class="custom-file">
			      <label class="custom-file-label" for="img">Choose file</label>
			      <input type="file" class="custom-file-input" id="img">
			    </div>
			  </div>
			  <div class="form-label-group">
			    <div class="mb-3 form-inline form-group">
			      <label for="category">카테고리</label>
			      <select class="custom-select d-block w-100" id="category" required>
			        <option value="">카테고리 선택</option>
			        <option value="1001">건강식품 / 홍삼</option>
			        <option value="1002">건강식품 / 비타민&미네랄</option>
			        <option value="1003">건강식품 / 프로바이오틱스</option>
			        <option value="1004">건강식품 / 헬스푸드</option>
			        <option value="2001">밀키트 / 한식</option>
			        <option value="2002">밀키트 / 중식</option>
			        <option value="2003">밀키트 / 양식</option>
			        <option value="2004">밀키트 / 일식,동남아</option>
			        <option value="2005">밀키트 / 1인용</option>
			        <option value="2006">밀키트 / 셰프의 요리</option>
			        <option value="3001">국,반찬,채소 / 반찬</option>
			        <option value="3002">국,반찬,채소 / 국,탕,찌개</option>
			        <option value="3003">국,반찬,채소 / 김치</option>
			        <option value="3004">국,반찬,채소 / 젓갈,고추장,된장</option>
			        <option value="3005">국,반찬,채소 / 죽,장조림</option>
			        <option value="3006">국,반찬,채소 / 채소</option>
			        <option value="4001">정육,수산,달걀 / 소고기</option>
			        <option value="4002">정육,수산,달걀 / 돼지고기</option>
			        <option value="4003">정육,수산,달걀 / 닭고기</option>
			        <option value="4004">정육,수산,달걀 / 달걀,수산</option>
			        <option value="5001">커피,음료,생수 / 커피</option>
			        <option value="5002">커피,음료,생수 / 과채주스</option>
			        <option value="5003">커피,음료,생수 / 음료</option>
			        <option value="5004">커피,음료,생수 / 생수</option>
			        <option value="6001">샐러드,선식,콩류 / 샐러드</option>
			        <option value="6002">샐러드,선식,콩류 / 빵,샌드위치</option>
			        <option value="6003">샐러드,선식,콩류 / 죽,스프,선식</option>
			        <option value="6004">샐러드,선식,콩류 / 세트</option>
			      </select>
			    </div>
			    <div class="mb-3">
			      <label for="pname">상품명</label>
			      <input type="text" id="pname" class="form-control" placeholder="상품명" name="pname" required autofocus>
			    </div>
			    <div class="row">
			      <div class="col-md-6 mb-3 input-group">
			        <label for="price">상품가격</label>
			        <input type="number" id="price" class="form-control" placeholder="가격" name="price" required>
			         <div class="input-group-append">
			           <span class="input-group-text">원</span>
		           </div>
			      </div>
			      <div class="col-md-6 mb-3 input-group">
			        <label for="price">할인률</label>
			        <input type="number" id="discount" class="form-control" placeholder="할인률" name="discount">
			        <div class="input-group-append">
                 <span class="input-group-text">%</span>
               </div>
			      </div>
			    </div>
			    <div class="form-group">
			      <label for="content">상세설명</label>
			      <textarea class="form-control" rows="5" id="content" name="content"></textarea>
			    </div>
			    <div class="mb-3">
			      <label for="stock">재고수량</label>
			      <input type="text" id="stock" class="form-control" placeholder="재고수량" name="stock">
			    </div>
			    <div class="d-block my-3">
			      <label for="dfee">배송비</label>
			      <div class="custom-control custom-radio">
			        <input id="freedelivery" value="0" name="dfee" type="radio" class="custom-control-input" checked required>
			        <label class="custom-control-label" for="freedelivery">무료배송</label>
			      </div>
			      <div class="custom-control custom-radio">
			        <input id="basicdelivery" value="2500" name="dfee" type="radio" class="custom-control-input" required>
			        <label class="custom-control-label" for="basicdelivery">유료배송(기본 2,500원)</label>
			      </div>
			      <div class="custom-control custom-radio">
			        <input id="chargedelivery" name="dfee" type="radio" class="custom-control-input" required>
			        <label class="custom-control-label" for="chargedelivery">유료배송(직접입력)</label>
							<div class="input-group">
								<input type="number" class="form-control" name="dfee">
								<div class="input-group-append">
									<span class="input-group-text">원</span>
								</div>
							</div>
			      </div>
			    </div>
			  </div>
			  <hr class="my-4">
			  <button class="btn btn-lg btn-primary" type="submit">상품등록</button>
			</form>
	  </div>
  </div>
</div>
</main>
  
<jsp:include page="../admin/adminfooter.jsp"></jsp:include>