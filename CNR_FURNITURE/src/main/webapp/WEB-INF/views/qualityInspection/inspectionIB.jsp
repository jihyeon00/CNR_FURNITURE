<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- stickyOnTable.css 연결 -->
<link rel="stylesheet" href="/resources/css/quality/stickyOnTable.css">
<!-- jQuery 연결 -->
<script defer src="/resources/js/quality.js"></script>
<script defer src="/resources/js//quality/stickyOnTable.js"></script>

<!-- 공통 header 연결 -->
<%@ include file="../includes/header.jsp" %>

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-12">
          <ol class="breadcrumb float-sm-left">
            <h1 class="m-0"><i class="far fa-clipboard"></i>&nbsp;수입검사관리</h1>
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
      <!-- 검색창 -->
      <form action="" id="inspectionSearchForm" class="col-md-12" onSubmit="return false">
      	<!-- 검색행1 -->
        <div class="inspection-searchBar">
        	<!-- 자재번호 -->
          <div class="col-sm-1 inspection-name">자재번호</div>
          <div class="col-sm-2 inspection-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.자재번호 -->
          <!-- 계약번호 -->
          <div class="col-sm-1 inspection-name">계약번호</div>
          <div class="col-sm-2 inspection-text">
          	<!-- <input type="date" class="col-sm-12" id="" name=""> -->
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.계약번호 -->
          <!-- 제조LOT번호 -->
          <div class="col-sm-1 inspection-name">제조LOT번호</div>
          <div class="col-sm-2 inspection-text">
          	<input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
          </div><!-- /.제조LOT번호 -->
        </div><!-- /.검색행1 -->
        <!-- 검색행2 -->
        <div class="inspection-searchBar" style="margin-top: -7px;">
        	<!-- 불량유형 -->
          <div class="col-sm-1 inspection-name">불량유형</div>
          <div class="col-sm-2 inspection-text">
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
          <!-- 검사일자 -->
          <div class="col-sm-1 inspection-name">검사일자<br>(입고일자)</div>
          <div class="col-sm-2 inspection-text">
          	<input type="date" class="col-sm-6" id="" name="" />
          	&nbsp;
          	<input type="date" class="col-sm-6" id="" name="" />
          </div><!-- /.검사일자 -->
        </div><!-- /.검색행2 -->
      </form><!-- /.검색창 -->
    </div><!-- /.container-fluid -->
  </div><!-- /.content-header -->

	<!-- Main content -->
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12 inspIB-titleAndTable">
        	<!-- 테이블목록 title -->
        	<div class="row inspIB-titleAndBtn">
	          <div class="col-sm-9 inspIB-title">
	            <i class="fa fa-list"></i>
	            <span>수입검사현황</span>
	          </div><!-- /.테이블목록 title -->
	          <!-- 자재불량 등록 버튼 -->
	          <div class="col-sm-3 addIBinspIBBtn">
	          	<button type="button" id="" class="btn btn-default search-btn" data-toggle="modal" data-target="#registerIBInspection">
	              <img class="add-circle-icon" alt="add" src="/resources/img/add-circle-outline.svg" >
	              자재불량등록
	            </button>
	          </div><!-- /.자재불량 등록 버튼 -->
          </div><!-- /.row -->
          <!-- 제품테이블 -->
          <div class="col-sm-12">
            <div class="inspIB-table">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="inspIB-table-header">
                  <tr>
                    <th id="index">No</th>
                    <th>자재번호</th>
                    <th>자재명</th>
                    <th>자재용도</th>
                    <th>계약번호</th>
                    <th>거래처명</th>
                    <th>단위</th>
                    <th>계약입고수량</th>
                    <th>검사수량</th>
                    <th>불량유형1</th>
                    <th>불량유형2</th>
                    <th>불량수량</th>
                    <th>불량률(%)</th>
                    <th>양품수량<br>(입고수량)</th>
                    <th>검사일자<br>(입고일자)</th>
                    <th>비고</th>
                    <th>수정</th>
                  </tr>
                </thead>
                <tbody class="inspIB-table-content">
                  <tr>
                    <td id="index">1열</td>
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
										<td>16열</td>
										<td class="edit-FinishedOB-row" onclick="editFinishedOBRow(this);">
											수정
										</td>
                  </tr>
                  <tr>
                    <td id="index">1열</td>
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
										<td>16열</td>
										<td class="edit-FinishedOB-row" onclick="editFinishedOBRow(this);">
											수정
										</td>
                  </tr>
                  <tr>
                    <td id="index">1열</td>
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
										<td>16열</td>
										<td class="edit-FinishedOB-row" onclick="editFinishedOBRow(this);">
											수정
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


<!-- 수입검사-자재불량 및 입고등록 모달 -->
<div class="modal fade" id="registerIBInspection" aria-labelledby="#register-IBInspection-ModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog register-FinishedItemOB-Modal-Dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="inspIBModalTitle" id="register-IBInspection-ModalLabel" style="font-size: 150%; font-weight:800;">수입검사 - 자재불량 및 입고등록</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body inspection-modal-body">
	      <!-- 등록행 1 -->
	      <div class="inspection-modal-board">
	      	<!-- 자재번호 -->
	        <div class="col-sm-2 inspection-modal-name">자재번호</div>
	        <div class="col-sm-2 inspection-modal-text">
	          <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
	        </div><!-- /.자재번호 -->
	        <!-- 자재명 -->
	        <div class="col-sm-2 inspection-modal-name">자재명</div>
	        <div class="col-sm-2 inspection-modal-text">
	          <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
	            value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
	        </div><!-- /.자재명 -->
	        <!-- 단위 -->
	        <div class="col-sm-2 inspection-modal-name">단위</div>
	        <div class="col-sm-2 inspection-modal-text">
	          <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
	            value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
	        </div><!-- /.단위 -->
	      </div><!-- /.등록행 1 -->
	      <!-- 등록행 2 -->
	      <div class="inspection-modal-board">
	      	<!-- 계약번호 -->
	        <div class="col-sm-2 inspection-modal-name">계약번호</div>
	        <div class="col-sm-2 inspection-modal-text">
	          <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
	        </div><!-- /.계약번호 -->
	        <!-- 거래처명 -->
	        <div class="col-sm-2 inspection-modal-name">거래처명</div>
	        <div class="col-sm-2 inspection-modal-text">
	          <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
	            value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
	        </div><!-- /.거래처명 -->
	         <!-- 자재용도 -->
	        <div class="col-sm-2 inspection-modal-name">자재용도</div>
	        <div class="col-sm-2 inspection-modal-text">
	        	<select class="col-sm-12">
	        		<option selected="selected">자재용도 선택</option>
	        		<option>1</option>
	        		<option>2</option>
	        		<option>3</option>
	        	</select>
	        </div><!-- /.자재용도 -->
	      </div><!-- /.등록행 2 -->
	      <!-- 등록행 3 -->
	      <div class="inspection-modal-board">
	      	<!-- 검사일자 -->
	        <div class="col-sm-2 inspection-modal-name">검사일자</div>
	        <div class="col-sm-2 inspection-modal-text">
	          <input type="date" class="col-sm-12" id="" name="" />
	        </div><!-- /.검사일자 -->
	        <!-- 계약입고수량 -->
	        <div class="col-sm-2 inspection-modal-name">계약입고수량</div>
	        <div class="col-sm-2 inspection-modal-text">
	          <input type="number" class="col-sm-12" id="" name="" readonly="readonly"/>
	        </div><!-- /.계약입고수량 -->
	        <!-- 검사수량 -->
	        <div class="col-sm-2 inspection-modal-name">검사수량<br>(입고수량)</div>
	        <div class="col-sm-2 inspection-modal-text">
	          <input type="number" class="col-sm-12" id="" name="" />
	        </div><!-- /.검사수량 -->
	      </div><!-- /.등록행 3 -->
	      <!-- 등록행 4 -->
	      <div class="inspection-modal-board">
	      	<!-- 불량유형1 -->
	        <div class="col-sm-2 inspection-modal-name">불량유형1</div>
	        <div class="col-sm-2 inspection-modal-text">
	        	<select class="col-sm-12">
	        		<option selected="selected">불량유형1 선택</option>
	        		<option>1</option>
	        		<option>2</option>
	        		<option>3</option>
	        	</select>
	        </div><!-- /.불량유형1 -->
	        <!-- 불량유형2 -->
	        <div class="col-sm-2 inspection-modal-name">불량유형2</div>
	        <div class="col-sm-2 inspection-modal-text">
	        	<select class="col-sm-12">
	        		<option selected="selected">불량유형2 선택</option>
	        		<option>1</option>
	        		<option>2</option>
	        		<option>3</option>
	        	</select>
	        </div><!-- /.불량유형2 -->
	        <!-- 불량수량 -->
	        <div class="col-sm-2 inspection-modal-name">불량수량</div>
	        <div class="col-sm-2 inspection-modal-text">
	          <input type="number" class="col-sm-12" id="" name="" />
	        </div><!-- /.불량수량 -->
	      </div><!-- /.등록행 4 -->
	      <!-- 등록행 5 -->
	      <div class="inspection-modal-board">
	      	<!-- 비고 -->
	      	<div class="col-sm-2 inspection-modal-name">비고</div>
	      	<div class="col-sm-10 inspection-modal-text">
	      		<input type="text" class="col-sm-12" id="" name=""/>
	      	</div><!-- /.비고 -->
	      </div><!-- /.등록행 5 -->
      </div><!-- /.modal-body -->
      
      <!-- 구분선 -->
      <div class=divBorderModal></div>
      
      <div class="modal-footer">
           <button type="button" class="btn btn-primary">등록</button>
           <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div><!-- /.modal-body -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal --> 

<!-- 공통 footer 연결 -->
<%@ include file="../includes/footer.jsp" %>
