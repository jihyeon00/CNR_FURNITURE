<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- jQuery 연결 -->
<script defer src="/resources/js/quality.js"></script>

<!-- 공통 header 연결 -->
<%@ include file="../includes/header.jsp" %>



<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-12">
          <ol class="breadcrumb float-sm-left">
            <h1 class="m-0"><i class="far fa-clipboard"></i>&nbsp;공정검사관리</h1>
          </ol>
          <ol class="breadcrumb float-sm-right">
            <div class="reset">
              <img class="resetPng" alt="reset" src="/resources/img/reset.png" >
            </div>
            <div class="col-sm-1 ml-auto">
              <button type="submit" class="btn btn-primary processInspSearchBtn" id="" onClick="javascript: search();">
                <i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색
              </button>
            </div>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
      <!-- 검색창 -->
      <form action="" id="searchForm" class="col-md-12" onSubmit="return false">
      	<!-- 검색행1 -->
        <div class="col-md-12 insp-searchBar">
        	<!-- 제조LOT번호 -->
          <div class="col-sm-2 insp-name" style="margin-left: -1%;">제조LOT번호</div>
          <div class="col-sm-2 insp-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.제조LOT번호 -->
          <!-- 제품번호 -->
          <div class="col-sm-1 insp-name">자재번호</div>
          <div class="col-sm-2 insp-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.제품번호 -->
          <!-- 제품명 -->
          <div class="col-sm-1 insp-name">자재명</div>
          <div class="col-sm-2 insp-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.제품명 -->
        </div><!-- /.검색행1 -->
        <!-- 검색행2 -->
        <div class="col-md-12 searchBar" style="margin-top: -7px;">
        	<!-- 불량유형 -->
          <div class="col-sm-1 insp-name" style="margin-left: -1%;">불량유형</div>
          <div class="col-sm-3 insp-text">
          	<!-- 불량유형1 -->
          	<select class="col-sm-6"  id="find_Role" name="find_Role">
              <option value="">불량유형1 선택</option>
              <c:forEach var="list" items = "${roleList}">
                <option value='${list.e_ROLE}'
                  <c:if test="${find_Role eq list.e_ROLE}">selected='selected'</c:if> >${list.e_ROLE}
                </option>
              </c:forEach>
            </select><!-- /.불량유형1 -->
            &nbsp;
            <!-- 불량유형2 -->
            <select class="col-sm-6"  id="find_Role" name="find_Role">
              <option value="">불량유형2 선택</option>
              <c:forEach var="list" items = "${roleList}">
                <option value='${list.e_ROLE}'
                  <c:if test="${find_Role eq list.e_ROLE}">selected='selected'</c:if> >${list.e_ROLE}
                </option>
              </c:forEach>
            </select><!-- /.불량유형2 -->
          </div><!-- /.불량유형 -->
        	<!-- 공정번호 -->
          <div class="col-sm-1 insp-name">공정번호</div>
          <div class="col-sm-2 insp-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.공정번호 -->
          <!-- 설비번호 -->
          <div class="col-sm-1 insp-name">설비번호</div>
          <div class="col-sm-2 insp-text">
            <input type="text" class="col-sm-12" id="find_emp_name" name="find_emp_name"
              value='<c:out value="${search.find_emp_name}"/>' autocomplete="off" />
          </div><!-- /.설비번호 -->
        </div><!-- /.검색행2 -->
      </form>
    </div><!-- /.container-fluid -->
  </div><!-- /.content-header -->

	<!-- Main content -->
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12 inspection-titleAndTable">
        	<!-- 테이블목록 title -->
        	<div class="row inspection-titleAndBtn">
	          <div class="col-sm-9 inspection-title">
	            <i class="fa fa-list"></i>
	            <span>공정검사현황</span>
	          </div><!-- /.테이블목록 title -->
	          <!-- 공정불량 등록 버튼 -->
	          <div class="col-sm-3 addIBinspectionBtn">
	          	<button type="button" id="" class="btn btn-default search-btn" data-toggle="modal" data-target="#registerIBInspection">
	              <img class="add-circle-icon" alt="add" src="/resources/img/add-circle-outline.svg" >
	              공정불량등록
	            </button>
	          </div><!-- /.공정불량 등록 버튼 -->
          </div><!-- /.row -->
          <!-- 제품테이블 -->
          <div class="col-sm-12">
            <div class="inspection-table">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="inspection-table-header">
                  <tr>
                    <th>No</th>
                    <th>자재번호</th>
                    <th>제조LOT번호</th>
                    <th>공정번호</th>
                    <th>설비번호</th>
                    <th>작업번호</th>
                    <th>자재명</th>
                    <th>단위</th>
                    <th>일일총작업수량</th>
                    <th>양품수량</th>
                    <th>불량수량</th>
                    <th>불량유형1</th>
                    <th>불량유형2</th>
                    <th>불량등록일자</th>
                    <th>비고</th>
                    <th>수정</th>
                    <th>삭제</th>
                  </tr>
                </thead>
                <tbody class="inspection-table-content">
                  <tr>
                    <td>1열</td>
										<td>2열</td>
										<td>3열</td>
										<td>4열</td>
										<td>5열</td>
										<td>6열ddddddddddddddddddddddddddddddddd</td>
										<td>7열</td>
										<td>8열</td>
										<td>9열</td>
										<td>10열dddddddddddddddddddddddddddddddddddddddddddd</td>
										<td>11열</td>
										<td>12열</td>
										<td>13열</td>
										<td>14열</td>
										<td>15열</td>
										<td class="edit-processInsp-row" onclick="editProcessInspRow(this);" style="color:#17a2b8;">
											수정
										</td>
										<td class="remove-processInsp-row" onclick="removeProcessInspRow(this);" style="color:#c82333;">
											삭제
										</td>
                  </tr>
                  <tr>
                    <td>1열</td>
										<td>2열</td>
										<td>3열</td>
										<td>4열</td>
										<td>5열</td>
										<td>6열ddddddddddddddddddddddddddddddddd</td>
										<td>7열</td>
										<td>8열</td>
										<td>9열</td>
										<td>10열dddddddddddddddddddddddddddddddddddddddddddd</td>
										<td>11열</td>
										<td>12열</td>
										<td>13열</td>
										<td>14열</td>
										<td>15열</td>
										<td class="edit-processInsp-row" onclick="editProcessInspRow(this);" style="color:#17a2b8;">
											수정
										</td>
										<td class="remove-processInsp-row" onclick="removeProcessInspRow(this);" style="color:#c82333;">
											삭제
										</td>
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


<!-- 공정검사-공정불량등록 모달 -->
<div class="modal fade" id="registerIBInspection" aria-labelledby="#register-IBInspection-ModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog register-FinishedItemOB-Modal-Dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="inspectionModalTitle" id="register-IBInspection-ModalLabel" style="font-size: 150%; font-weight:800;">공정검사-공정불량등록</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body inspection-modal-body">
      	<!-- 등록행 1 -->
	      <div class="inspection-board">
	      	<!-- 자재번호 -->
	        <div class="col-sm-2 inspection-name">자재번호</div>
	        <div class="col-sm-2 inspection-text">
	          <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
	        </div><!-- /.자재번호-->
	        <!-- 자재명 -->
	        <div class="col-sm-2 inspection-name">자재명</div>
	        <div class="col-sm-2 inspection-text">
	        	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
	        </div><!-- /.자재명 -->
	        <!-- 제조LOT번호 -->
	        <div class="col-sm-2 inspection-name">제조LOT번호</div>
	        <div class="col-sm-2 inspection-text">
	        	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
	        </div><!-- /.제조LOT번호 -->
	      </div><!-- /.등록행 1 -->
	      <!-- 등록행 2 -->
	      <div class="inspection-board">
	      	<!-- 공정번호 -->
	        <div class="col-sm-2 inspection-name">공정번호</div>
	        <div class="col-sm-2 inspection-text">
	          <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
	        </div><!-- /.공정번호-->
	        <!-- 설비번호 -->
	        <div class="col-sm-2 inspection-name">설비번호</div>
	        <div class="col-sm-2 inspection-text">
	        	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
	        </div><!-- /.설비번호 -->
	        <!-- 단위 -->
	        <div class="col-sm-2 inspection-name">단위</div>
	        <div class="col-sm-2 inspection-text">
	        	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
	        </div><!-- /.단위 -->
	      </div><!-- /.등록행 2 -->
	      <!-- 등록행 3 -->
	      <div class="inspection-board">
	      	<!-- 일일총작업수량 -->
	        <div class="col-sm-2 inspection-name">일일총작업수량</div>
	        <div class="col-sm-2 inspection-text">
	        	<input type="number" class="col-sm-12" id="" name=" /">
	        </div><!-- /.일일총작업수량-->
	        <!-- 양품수량 -->
	        <div class="col-sm-2 inspection-name">양품수량</div>
	        <div class="col-sm-2 inspection-text">
	        	<input type="number" class="col-sm-12" id="" name=" /">
	        </div><!-- /.양품수량 -->
	        <!-- 불량수량 -->
	        <div class="col-sm-2 inspection-name">불량수량</div>
	        <div class="col-sm-2 inspection-text">
	        	<input type="number" class="col-sm-12" id="" name=" /">
	        </div><!-- /.불량수량 -->
	      </div><!-- /.등록행 3 -->
	      <!-- 등록행 4 -->
	      <div class="inspection-board">
	      	<!-- 불량유형1 -->
	      	<div class="col-sm-2 inspection-name">불량유형1</div>
	        <div class="col-sm-2 inspection-text">
	          <select class="col-sm-12" id="" name="">
	        		<option selected="selected">불량유형1 선택</option>
	        		<option >1</option>
	        		<option >2</option>
	        	</select>
	        </div><!-- /.불량유형1 -->
	        <!-- 불량유형2 -->
	      	<div class="col-sm-2 inspection-name">불량유형2</div>
	        <div class="col-sm-2 inspection-text">
	          <select class="col-sm-12" id="" name="">
	        		<option selected="selected">불량유형2 선택</option>
	        		<option >1</option>
	        		<option >2</option>
	        	</select>
	        </div><!-- /.불량유형2 -->
	      	<div class="col-sm-4 emptyModal"></div>
	      </div><!-- /.등록행 4 -->
	      <!-- 등록행 5 -->
	      <div class="inspection-board">
	      	<!-- 비고 -->
	      	<div class="col-sm-2 inspection-name">비고</div>
	      	<div class="col-sm-10 inspection-text">
	      		<input type="text" class="col-sm-12" id="" name=""/>
	      	</div><!-- /.비고 -->
	      </div><!-- /.등록행 5 -->
	      <!-- 추가버튼 -->
	      <div class="row modal-add-btn">
	      	<div class="col-sm-12 addInspection-btn">
	         	<button type="button" id="" class="btn btn-primary search-btn">
	            <svg class="add-circle-icon2" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 2c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm6 13h-5v5h-2v-5h-5v-2h5v-5h2v5h5v2z"/></svg>
	            추가
	          </button>
	        </div><!-- /.추가버튼 -->
        </div><!-- /.row -->
        <!-- 자재불량 및 입고 목록 -->
        <div class="row newInspList">
        	<!-- Title -->
        	<div class="col-sm-6 newInspTitle">
        		<i class="fa fa-list"></i>
            <span>공정불량목록</span>
        	</div><!-- /.Title -->
        	<!-- Table -->
        	<div class="col-sm-12">
	        	<div class="newInspTable">
	        		<table cellpadding="0" cellspacing="0" border="0">
	            	<thead class="newInspTable-header">
	            		<tr>
	            			<th>No</th>
	                  <th>자재번호</th>
	                  <th>제조LOT번호</th>
	                  <th>공정번호</th>
	                  <th>설비번호</th>
	                  <th>자재명</th>
	                  <th>단위</th>
	                  <th>일일총작업수량</th>
	                  <th>양품수량</th>
	                  <th>불량수량</th>
	                  <th>불량유형1</th>
	                  <th>불량유형2</th>
	                  <th>불량등록일자</th>
	                  <th>비고</th>
	                  <th>삭제</th>
	            		</tr>
	              </thead>
	              <tbody class="newInspTable-content">
		              <tr>
                    <td>1열</td>
										<td>2열</td>
										<td>3열</td>
										<td>4열</td>
										<td>5열</td>
										<td>6열ddddddddddddddddddddddddddddddddd</td>
										<td>7열</td>
										<td>8열</td>
										<td>9열</td>
										<td>10열dddddddddddddddddddddddddddddddddddddddddddd</td>
										<td>11열</td>
										<td>12열</td>
										<td>13열</td>
										<td>14열</td>
										<td class="remove-newProcessInsp-row" onclick="removeNewProcessInspRow(this);" style="color:#c82333;">
											삭제
										</td>
                  </tr>
                  <tr>
                    <td>1열</td>
										<td>2열</td>
										<td>3열</td>
										<td>4열</td>
										<td>5열</td>
										<td>6열ddddddddddddddddddddddddddddddddd</td>
										<td>7열</td>
										<td>8열</td>
										<td>9열</td>
										<td>10열dddddddddddddddddddddddddddddddddddddddddddd</td>
										<td>11열</td>
										<td>12열</td>
										<td>13열</td>
										<td>14열</td>
										<td class="remove-newProcessInsp-row" onclick="removeNewProcessInspRow(this);" style="color:#c82333;">
											삭제
										</td>
                  </tr>
                  
	              </tbody>
	            </table>  
	        	</div><!-- /.Table -->
        	</div><!-- /.col -->
        </div><!-- /.자재불량 및 입고 목록 -->
      </div><!-- /.modal-body -->
      
      <!-- 구분선 -->
      <div class=divBorderModal></div>
      
      <div class="modal-footer">
           <button type="button" class="btn btn-primary">등록</button>
           <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div><!-- /.modal-footer -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal --> 

<!-- 공통 footer 연결 -->
<%@ include file="../includes/footer.jsp" %>
