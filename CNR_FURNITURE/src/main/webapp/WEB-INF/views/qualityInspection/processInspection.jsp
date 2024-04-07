<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- jQuery 연결 -->
<script defer src="/resources/js/itemMNG.js"></script>

<!-- 공통 header 연결 -->
<%@ include file="../includes/header.jsp" %>


<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-12">
          <ol class="breadcrumb float-sm-left">
            <h1 class="m-0"><i class="far fa-clipboard"></i>&nbsp;반제품출고현황</h1>
          </ol>
          <ol class="breadcrumb float-sm-right">
            <div class="reset">
              <img class="resetPng" alt="reset" src="/resources/img/reset.png" >
            </div>
            <div class="col-sm-1 ml-auto">
              <button type="submit" class="btn btn-primary search-btn" id="" onClick="javascript: search();">
                <i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색
              </button>
            </div>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
      <div class="row processInspection-search-row">
        <div class="col-sm-12 processInspection-searchBar">
          <!-- 제조LOT번호 -->
          <div class="col-sm-1 processInspection-search-title">제조LOT번호</div>
          <div class="col-sm-2 processInspection-search-content">
            <select class="col-sm-12" aria-label="Default select example">
              <option selected>제조LOT번호 선택</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
          </div><!-- /.제조LOT번호 -->
          <!-- 제품번호 -->
          <div class="col-sm-1 processInspection-search-title">제품번호</div>
          <div class="col-sm-2 processInspection-search-content">
            <select class="col-sm-12" aria-label="Default select example">
              <option selected>제품번호 선택</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
          </div><!-- /.제품번호 -->
          <!-- 제품명 -->
          <div class="col-sm-1 processInspection-search-title">제품명</div>
          <div class="col-sm-2 processInspection-search-content">
          	<input type="text" class="col-sm-12" id="" name=""/>
          </div><!-- /.제품명 -->
          <!-- 출고일자 -->
          <div class="col-sm-1 processInspection-search-title">출고일자</div>
          <div class="col-sm-2 processInspection-search-content">
            <input type="date" class="col-sm-12" id="" name=""/>
          </div><!-- /.출고일자 -->
        </div><!-- /.searchBar -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div><!-- /.content-header -->

	<!-- Main content -->
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12 processInspection-titleAndTable">
        	<!-- 테이블목록 title -->
        	<div class="row processInspection-titleAndBtn">
	          <div class="col-sm-9 processInspection-title">
	            <i class="fa fa-list"></i>
	            <span>반제품출고목록</span>
	          </div><!-- /.테이블목록 title -->
	          <!-- 반제품OB 등록 버튼 -->
	          <div class="col-sm-3 addProcessInspection-btn">
	          	<button type="button" id="" class="btn btn-default search-btn" data-toggle="modal" data-target="#registerProcessInspection">
	              <img class="add-circle-icon" alt="add" src="/resources/img/add-circle-outline.svg" >
	              반제품출고등록
	            </button>
	          </div><!-- /.반제품OB 등록 버튼 -->
          </div><!-- /.row -->
          <!-- 제품테이블 -->
          <div class="col-sm-12">
            <div class="register-processInspection-section">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="processInspection-table-header">
                  <tr class="processInspection-table-subHeader">
                  	<th rowspan="2">제품용도</th>
                    <th>No</th>
                    <th>제조LOT번호</th>
                    <th>제품번호</th>
                    <th>제품명</th>
                    <th>입고일자</th>
                    <th>불량등록일자</th>
                    <th>총생산수량</th>
                    <th>양품수량</th>
                    <th>불량수량</th>
                    <th>불량률(%)</th>
                  </tr>
                </thead>
                <tbody class="processInspection-table-content">
                	<!-- 반제품 title -->
                  <tr>
                    <th rowspan="4" class="processInspection-table-header processInspection-header">반제품</th>
                  </tr>
                  <tr>
                    <!-- 반제품 1행 -->
                    <td>1열</td>
										<td>2열</td>
										<td>3열</td>
										<td>4열</td>
										<td>5열</td>
										<td>6열</td>
										<td>7열</td>
										<td>8열</td>
										<td>9열</td>
										<td>10열</td>
                  </tr>
                  <tr>
                    <!-- 반제품 2행 -->
                    <td>1열</td>
										<td>2열</td>
										<td>3열</td>
										<td>4열</td>
										<td>5열</td>
										<td>6열</td>
										<td>7열</td>
										<td>8열</td>
										<td>9열</td>
										<td>10열</td>
                  </tr>
                  <tr>
                    <!-- 반제품 3행 -->
                    <td>1열</td>
										<td>2열</td>
										<td>3열</td>
										<td>4열</td>
										<td>5열</td>
										<td>6열</td>
										<td>7열</td>
										<td>8열</td>
										<td>9열</td>
										<td>10열</td>
                  </tr>
                  <!-- 추가적인 행들 -->
                </tbody>
              </table>
              <!-- /.table -->
            </div>
          </div><!-- /.col-sm-11 -->
        </div><!-- /.col-sm-12 -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div><!-- /.content -->
</div><!-- /.content-wrapper -->

<!-- 등록 모달 -->
<div class="modal fade" id="registerProcessInspection" aria-labelledby="register-processInspection-ModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog register-processInspection-Modal-Dialog" role="document" style="min-width:50%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="processInspectionModalTitle" id="register-processInspection-ModalLabel" style="font-size: 150%; font-weight:800;">반제품출고등록</div>
      </div>
      <!-- modal-body -->
      <div class="col-sm-12 modal-body">
      	<!-- 등록 행1 -->
      	<div class="row register-processInspection-modal-body">
      		<!-- 제조LOT번호 -->
      		<div class="processInspection-modal-subTitle processInspection-modal-1st-colTitle">제조LOT번호</div>
      		<div class="select-form processInspection-modal-subContent processInspection-modal-1st-colContent">
      			<select 
      				class="col-sm-12"
      				name=""
      				id=""
     				>
	              <option selected>제조LOT번호 선택</option>
	              <option value="1">One</option>
	              <option value="2">Two</option>
	              <option value="3">Three</option>
            </select>
      		</div><!-- /.제조LOT번호 -->
      		<!-- 공정번호 -->
      		<div class="col-sm-1 processInspection-modal-subTitle processInspection-modal-2nd-colTitle">공정번호</div>
      		<div class="col-sm-2 processInspection-modal-subContent processInspection-modal-2nd-colContent">
      			<select 
      				class="col-sm-12"
      				name=""
      				id=""
     				>
	              <option selected>공정번호 선택</option>
	              <option value="1">One</option>
	              <option value="2">Two</option>
	              <option value="3">Three</option>
            </select>
      		</div><!-- /.공정번호 -->
      		<!-- 작업번호 -->
      		<div class="col-sm-1 processInspection-modal-subTitle processInspection-modal-3rd-colTitle">작업번호</div>
      		<div class="col-sm-2 processInspection-modal-subContent processInspection-modal-3rd-colContent">
      			<select 
      				class="col-sm-12"
      				name=""
      				id=""
     				>
	              <option selected>작업번호 선택</option>
	              <option value="1">One</option>
	              <option value="2">Two</option>
	              <option value="3">Three</option>
            </select>
      		</div><!-- /.작업번호 -->
      	</div><!-- /.등록 행1 -->
      	
      	<!-- 등록 행2 -->
      	<div class="row register-processInspection-modal-body">
      		<!-- 단위 -->
      		<div class="col-sm-1 processInspection-modal-subTitle processInspection-modal-1st-colTitle">단위</div>
      		<div class="col-sm-2 processInspection-modal-subContent processInspection-modal-1st-colContent">
      			<select 
      				class="col-sm-12"
      				name=""
      				id=""
     				>
	              <option selected>단위 선택</option>
	              <option value="1">One</option>
	              <option value="2">Two</option>
	              <option value="3">Three</option>
            </select>
      		</div><!-- /.단위 -->
      		<!-- 일일총생산수량 -->
      		<div class="processInspection-modal-subTitle processInspection-modal-2nd-colTitle">일일총생산수량</div>
      		<div class="col-sm-2 processInspection-modal-subContent processInspection-modal-2nd-colContent">
      			<select 
      				class="col-sm-12"
      				name=""
      				id=""
     				>
	              <option selected>일일총생산수량 선택</option>
	              <option value="1">One</option>
	              <option value="2">Two</option>
	              <option value="3">Three</option>
            </select>
      		</div><!-- /.일일총생산수량 -->
      		<!-- 불량수량 -->
      		<div class="col-sm-1 processInspection-modal-subTitle processInspection-modal-3rd-colTitle">불량수량</div>
      		<div class="col-sm-2 processInspection-modal-subContent processInspection-modal-3rd-colContent">
      			<input type="number" class="col-sm-12" id="" name=""/>
      		</div><!-- /.일일총생산수량 -->
      	</div><!-- /.등록 행2 -->
      	
      	<!-- 등록행3 -->
      	<div class="row register-processInspection-modal-body">
      		<!-- 불량유형1 -->
      		<div class="processInspection-modal-subTitle">불량유형1</div> 
      		<div class="col-sm-2 processInspection-modal-subContent">
      			<select 
      				class="col-sm-12"
      				name=""
      				id=""
     				>
	              <option selected>불량유형1 선택</option>
	              <option value="1">One</option>
	              <option value="2">Two</option>
	              <option value="3">Three</option>
            </select>
      		</div><!-- /.불량유형1 -->
      		<!-- 불량유형2 -->
      		<div class="processInspection-modal-subTitle">불량유형2</div> 
      		<div class="col-sm-2 processInspection-modal-subContent">
      			<select 
      				class="col-sm-12"
      				name=""
      				id=""
     				>
	              <option selected>불량유형2 선택</option>
	              <option value="1">One</option>
	              <option value="2">Two</option>
	              <option value="3">Three</option>
            </select>
      		</div><!-- /.불량유형2 -->
      	</div><!-- /.등록행3 -->
      	
      	<!-- 등록행4 -->
      	<div class="row register-processInspection-modal-body">
      		<!-- 비고 -->
      		<div class="col-sm-1 processInspection-modal-subTitle">비고</div>
      		<div class="col-sm-10 semiItemOB-modal-subContent">
      			<input type="text" class="col-sm-12" id="" name=""/>
      		</div>
      	</div><!-- /.등록행4 -->
      	
      </div><!-- /.modal-body -->
      <div class="modal-footer">
	        <button type="button" class="btn btn-primary">등록</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div><!-- /.modal-body -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 공통 footer 연결 -->
<%@ include file="../includes/footer.jsp" %>
