<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includes/header.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
         <div id="searchForm" class="col-md-12">
	          <div class="col-sm-12" >
	          	<ol class="breadcrumb float-sm-left">
	          		<h1 class="m-0"><i class="far fa-clipboard"></i>당일작업조회</h1>
	          	</ol>
	            <ol class="breadcrumb float-sm-right">
		            <div class="reset">
			        		<img class="resetPng" alt="reset" src="/resources/img/reset.png" >
			        	</div>
			        	<form action="todayWorkInsert" method="get">
	              <div class="col-sm-1 ml-auto" style="margin-left: 10px;">
	              	<button type="submit" class="btn btn-primary search-btn"
	                id="" onClick="javascript: search();"><i class="fa-solid fa-magnifying-glass"></i>검색</button>
	            	</div>
	            </ol>
	          </div><!-- /.col -->
	          <br>
          	<!-- 검색창 1줄 -->
             <div class="searchBar">
               <div class="col-sm-1 sb-name">제조<br>LOT번호</div>
	             <div class="col-sm-2 sb-text">
                 <input type="text" list="workInstructuionList" class="col-sm-12 input-text" id="find_work_instruction" name="find_work_instruction">
	                <datalist id="workInstructuionList">
                     <c:forEach items="${instructionList}" var="instruction">
                         <option value="${instruction.insLotId}">생산제품번호: ${instruction.insItemId}</option>
                     </c:forEach>
                 </datalist>
               </div>
               <div class="col-sm-1 sb-name">공정번호</div>
               <div class="col-sm-2 sb-text">
               		<input type="text" list="workProcessInfoList" class="col-sm-12 input-text" id="find_work_processInfo" name="find_work_processInfo">
	                <datalist id="workProcessInfoList">
                     <c:forEach items="${processInfoList}" var="processInfo">
                         <option value="${processInfo.pi_id}">${processInfo.pi_name} | ${processInfo.mi_name}(${processInfo.pi_machine_id}, ${processInfo.position}) </option>
                     </c:forEach>
                 </datalist>
               </div>
             </div>
           </form>
          </div>
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
	        <!-- 공정별 설비상태 Table -->
	        <div class="titleAndTable" id="selectManufacturingPerformInfo" >
	           <div class="workTableTitle">
	              <div class="icon"><i class="fa fa-list"></i></div>
	              <div class="workTableName">공정별 설비상태</div>
	            </div>
	          <div class="workTable" style="">
	            <table cellpadding="0" cellspacing="0" border="0">
	              <thead class="work-tbl-header">
	                <tr>
	                  <th>No</th>
	                  <th>공정번호</th>
	                  <th>공정명</th>
	                  <th>설비번호</th>
	                  <th>설비명</th>
	                  <th>설비위치</th>
	                  <th>가동여부</th>
	                  <th>설비상태</th>
	                </tr>
	              </thead>
	              <tbody class="work-tbl-content">
		              <c:if test="${fn:length(processMachineList) == 0}">
		             	 		<tr>
												<td colspan="8">조회된 내용이 없습니다.</td>             	 		
		             	 		</tr>
		             	 </c:if>
		               <c:if test="${fn:length(processMachineList) != 0}">
			              <c:forEach items="${processMachineList}" var="processMachineList">
			                <tr>
			                  <td>${processMachineList.rn}</td>
			                  <td>${processMachineList.pi_id}</td>
			                  <td>${processMachineList.pi_name}</td>
			                  <td>${processMachineList.pi_machine_id}</td>
			                  <td>${processMachineList.mi_name}</td>
			                  <td>${processMachineList.position}</td>
			                  <td>${processMachineList.mw_status}</td>
			                  <td>${processMachineList.mw_condition}</td>
			                </tr>
		                </c:forEach>
	                </c:if>
	              </tbody>
	            </table><!-- /.table -->
          	</div><!-- /.workTable -->
        </div><!-- /.titleAndTable -->
        <br>
        <div class=divBorder></div>
        <!-- 당일작업목록 Table -->
        <div class="titleAndTable" id="selectWorkTable">
           <div class="workTableTitle">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="workTableName">당일작업목록</div>
            </div>
          <div class="workTable">
            <table cellpadding="0" cellspacing="0" border="0">
              <thead class="work-tbl-header">
                <tr>
                  <th>No</th>
                  <th>작업번호</th>
                  <th>제조LOT번호</th>
                  <th>지시일자</th>
                  <th>작업팀</th>
                  <th>공정번호</th>
                  <th>공정명</th>
                  <th>설비명</th>
                  <th>작업위치</th>
                  <th>제품번호</th>
                  <th>제품명</th>
                  <th>규격</th>
                  <th>단위</th>
                  <th>소요시간(분)</th>
                  <th>진행상황</th>
                  <th>계획수량</th>
                  <th>생산수량</th>
                  <th>작업상세</th>
                </tr>
              </thead>
             <tbody class="work-tbl-content">
             	 <c:if test="${fn:length(todayWorkList) == 0}">
             	 		<tr>
										<td colspan="20">조회된 내용이 없습니다.</td>             	 		
             	 		</tr>
             	 </c:if>
               <c:if test="${fn:length(todayWorkList) != 0}">
	              	<c:forEach items="${todayWorkList}" var="todayWorkList">   
		                <tr>
		                  <td>${todayWorkList.rn}</td>
		                  <td>${todayWorkList.w_id}</td>
		                  <td>${todayWorkList.w_lot_id}</td>
		                  <td>${todayWorkList.w_date}</td>
		                  <td>${todayWorkList.e_dp_name}</td>
		                  <td>${todayWorkList.w_pi_id}</td>
		                  <td>${todayWorkList.pi_name}</td>
		                  <td>${todayWorkList.mi_name}</td>
		                  <td>${todayWorkList.position}</td>
		                  <td>${todayWorkList.ins_item_id}</td>
		                  <td>${todayWorkList.i_name}</td>
		                  <td>${todayWorkList.w_status}</td>
		                  <td>${todayWorkList.i_standard}</td>
		                  <td>${todayWorkList.ct_unit}</td>
		                  <td>${todayWorkList.w_time}</td>
		                  <td>${todayWorkList.w_plan_quantity}</td>
		                  <td>${todayWorkList.w_item_quantity}</td>
			                <td><button id="workDetailTd" data-toggle="modal" data-target="#workDetailModal">작업상세</button></td>
		                </tr>
	                </c:forEach>
                </c:if>
              </tbody>
            </table><!-- /.table -->
        </div><!-- /.workTable -->
       </div><!-- /.titleAndTable -->
       
      </div><!-- /.row -->
   	</div><!-- /.container-fluid -->
 	</div><!-- /.content -->
 </div><!-- /.content-wrapper -->
       




<!-- 당일작업 상세 및 수정 모달 -->
<div class="modal fade" id="workDetailModal" aria-labelledby="#workDetailModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog workDetail-Modal-Dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="workDetailModalTitle" id="workDetailModalLabel" style="font-size: 150%; font-weight:800;">당일작업 상세 및 수정</div>
      </div>
			<!-- modal-body -->
      <div class="modal-body work-modal-body">
     		<!-- 등록행 1 -->
      	<div class="work-modal-input">
           <div class="col-sm-2 workModal-name">제조LOT번호</div>
           <div class="col-sm-2 workModal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName" readonly="readonly">
           </div>
           <div class="col-sm-2 workModal-name">공정번호</div>
           <div class="col-sm-2 workModal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
           </div>
           <div class="col-sm-2 workModal-name">설비번호</div>
           <div class="col-sm-2 workModal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
           </div>
         </div><!-- /.등록행 1 -->
     		<!-- 등록행 2 -->
      	<div class="work-modal-input">
           <div class="col-sm-2 workModal-name">제품번호</div>
           <div class="col-sm-2 workModal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName" readonly="readonly">
           </div>
           <div class="col-sm-2 workModal-name">계획수량</div>
           <div class="col-sm-2 workModal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
           </div>
           <div class="col-sm-2 workModal-name">예상<br>소요시간(분)</div>
           <div class="col-sm-2 workModal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
           </div>
         </div><!-- /.등록행 2 -->
     		<!-- 등록행 3 -->
      	<div class="work-modal-input">
           <div class="col-sm-2 workModal-name">기준단위</div>
           <div class="col-sm-2 workModal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName" readonly="readonly"> 
           </div>
           <div class="col-sm-2 workModal-name">생산수량</div>
           <div class="col-sm-2 workModal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName" readonly="readonly">
           </div>
           <div class="col-sm-2 workModal-name">진행상황</div>
           <div class="col-sm-2 workModal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName" readonly="readonly">
           </div>
         </div><!-- /.등록행 3 -->
      </div><!-- /.modal-body -->
      
      <!-- 구분선 -->
      <div class=divBorderModal></div>
      
      
      <div class="modal-footer">
           <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
      </div><!-- /.modal-footer -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

  
<script type="text/javascript">
//검색창
function search() {
 	// 검색 로직 실행
	document.getElementById('searchForm').submit();
}
//자재투입등록의 BOM 체크박스 전체 선택
function workBomSelectAll(workBomSelectAll)  {
  const workBomCheckboxes 
       = document.getElementsByName('workBom');
  
  workBomCheckboxes.forEach((workBomCheckbox) => {
	  workBomCheckbox.checked = workBomSelectAll.checked;
  })
}
	
</script>
<script defer src="/resources/js/work.js"></script>
<%@ include file="../includes/footer.jsp" %>
