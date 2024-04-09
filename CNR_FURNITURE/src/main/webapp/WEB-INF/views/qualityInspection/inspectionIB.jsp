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
      <!-- 검색행 1 -->
      <div class="row inspIB-search-row first-search-row">
        <div class="col-sm-12 inspIB-searchBar">
          <!-- 자재번호 -->
          <div class="col-sm-2 inspIB-search-title first-search-col">자재번호</div>
          <div class="col-sm-3 select-form inspIB-search-content first-search-col">
            <select class="col-sm-12" aria-label="Default select example">
              <option selected>자재번호 선택</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
          </div><!-- /.자재번호 -->
          <!-- 계약번호 -->
          <div class="col-sm-2 inspIB-search-title second-search-col">계약번호</div>
          <div class="col-sm-3 select-form inspIB-search-content second-search-col">
            <select class="col-sm-12" aria-label="Default select example">
              <option selected>계약번호 선택</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
          </div><!-- /.자재번호 -->
          <div class="col-sm-5"></div>
        </div><!-- /.searchBar -->
      </div><!-- /.row -->
      <!-- 검색행 2 -->
      <div class="row inspIB-search-row second-search-row">
        <div class="col-sm-12 inspIB-searchBar">
          <!-- 불량유형 -->
          <div class="col-sm-2 inspIB-search-title first-search-col">불량유형</div>
          <div class="col-sm-3 inspIB-search-content first-search-col">
            <select class="col-sm-5" aria-label="Default select example">
              <option selected>불량유형1 선택</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
            &nbsp;
            <select class="col-sm-5" aria-label="Default select example">
              <option selected>불량유형2 선택</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
          </div><!-- /.검사일자 -->
          <!-- 검사일자 -->
          <div class="col-sm-2 inspIB-search-title second-search-col">검사일자<br>(입고일자) </div>
          <div class="col-sm-3 inspIB-search-content second-search-col">
          	<input type="date" class="col-sm-5" id="" name="" />
          	&nbsp;
          	<input type="date" class="col-sm-5" id="" name="" />
          </div><!-- /.검사일자 -->
          <div class="col-sm-5"></div>
        </div><!-- /.searchBar -->
      </div><!-- /.row -->
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


<!-- 완제품출고등록 모달 -->
<div class="modal fade" id="registerIBInspection" aria-labelledby="#register-IBInspection-ModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog register-FinishedItemOB-Modal-Dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="inspIBModalTitle" id="register-IBInspection-ModalLabel" style="font-size: 150%; font-weight:800;">완제품출고등록</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body inspIB-modal-body">
	      <!-- 등록행 1 -->
	      <div class="inspIB-board">
	      	<!-- 계약번호 -->
	        <div class="col-sm-2 inspIB-name">계약번호</div>
	        <div class="col-sm-2 inspIB-text">
	          <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
	        </div><!-- /.계약번호 -->
	        <!-- 거래처명 -->
	        <div class="col-sm-2 inspIB-name">거래처명</div>
	        <div class="col-sm-2 inspIB-text">
	          <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
	            value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
	        </div><!-- /.거래처명 -->
	        <div class="col-sm-4 emptyModal"></div>
	      </div><!-- /.등록행 1 -->
	      <!-- 등록행 2 -->
	      <div class="inspIB-board">
	      	<!-- 제품명 -->
	        <div class="col-sm-2 inspIB-name">제품명</div>
	        <div class="col-sm-2 inspIB-text">
	          <input type="text" class="col-sm-12"  id="workCompanyName" name="workCompanyName" readonly="readonly" />
	        </div><!-- /.제품명 -->
	        <!-- 제품규격 -->
	        <div class="col-sm-2 inspIB-name">제품규격</div>
	        <div class="col-sm-2 inspIB-text">
	          <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
	            value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
	        </div><!-- /.제품규격 -->
	        <div class="col-sm-4 emptyModal"></div>
	      </div><!-- /.등록행 2 -->
	      <!-- 등록행 3 -->
	      <div class="inspIB-board">
	      	<!-- 출고일자 -->
	        <div class="col-sm-2 inspIB-name">출고일자</div>
	        <div class="col-sm-2 inspIB-text">
	          <!-- <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName"> -->
	          <input type="date" class="col-sm-12" id="" name="" />
	        </div><!-- /.출고일자 -->
	        <!-- 출고단위 -->
	        <div class="col-sm-2 inspIB-name">출고단위</div>
	        <div class="col-sm-2 inspIB-text">
	          <input type="text" class="col-sm-12" id="" name="" />
	        </div><!-- /.출고단위 -->
	        <!-- 출고수량 -->
	        <div class="col-sm-2 inspIB-name">출고수량</div>
	        <div class="col-sm-2 inspIB-text">
	          <input type="number" class="col-sm-12" id="" name="" />
	        </div><!-- /.출고수량 -->
	      </div><!-- /.등록행 3 -->
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
