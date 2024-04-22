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
         <form action="work" method="get" id="searchForm" class="col-md-12" >
	          <div class="col-sm-12" >
	          	<a href="work" style="color: black;">
		          	<ol class="breadcrumb float-sm-left">
		          		<h1 class="m-0"><i class="far fa-clipboard"></i>작업관리</h1>
		          	</ol>
	          	</a>
	            <ol class="breadcrumb float-sm-right">
		            <div class="reset">
			        		<img class="resetPng" alt="reset" src="/resources/img/reset.png" >
			        	</div>
			        	<form action="/work" method="get">
	              <div class="col-sm-1 ml-auto" style="margin-left: 10px;">
	              	<button type="submit" class="btn btn-primary search-btn"
	                id="" onClick="javascript: search();"><i class="fa-solid fa-magnifying-glass"></i>검색</button>
	            	</div>
	            </ol>
	          </div><!-- /.col -->
	          <br>
          	<!-- 검색창 1줄 -->
             <div class="searchBar">
               <div class="col-sm-1 sb-name">거래처번호</div>
               <div class="col-sm-2 sb-text">
	               	<input type="text" list="workCompanyList" class="col-sm-12 input-text"  id="find_work_company" name="find_work_company">
	                <datalist id="workCompanyList">
                       <c:forEach items="${companyList}" var="company">
                           <option value="${company.companyId}">${company.companyName} (${company.companyDiv})</option>
                       </c:forEach>
	                 </datalist>
               </div>
               <div class="col-sm-1 sb-name">제품번호</div>
               <div class="col-sm-2 sb-text">
               		<input type="text" list="workItemList" class="col-sm-12 input-text"  id="find_work_item" name="find_work_item">
	                <datalist id="workItemList">
                     <c:forEach items="${itemList}" var="item">
                         <option value="${item.itemId}">${item.itemName} (${item.itemUses})</option>
                     </c:forEach>
                 </datalist>
               </div>
               <div class="col-sm-1 sb-name">조회일자</div>
               <div class="col-sm-4 sb-text" style="margin-left: 8px;">
                 <input type="date" class="col-sm-6 input-text"  id="workStartDate" name="workStartDate"
                   value='' autocomplete="off" style="margin-right: 4px;"/>
                   ~
                 <input type="date" class="col-sm-6 input-text"  id="workEndDate" name="workEndDate"
                   value='' autocomplete="off" style="margin-left: 4px;"/>
               </div>
             </div>
             <!-- 검색창 2줄 -->
             <div class="searchBar" style="margin-top: -12px;">
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
               <div class="col-sm-1 sb-name">작업번호</div>
               <div class="col-sm-2 sb-text">
               		<input type="text" list="workList" class="col-sm-12 input-text" id="find_work_id" name="find_work_id">
	                <datalist id="workList">
                     <c:forEach items="${workList}" var="workList">
                         <option value="${workList.w_id}">로트번호:${workList.w_lot_id}(공정번호:${workList.w_pi_id})</option>
                     </c:forEach>
                 </datalist>
               </div>
             </div>
           </form>
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
	        <!-- 제조수행정보 Table -->
	        <div class="titleAndTable" id="selectManufacturingPerformInfo" >
	           <div class="workTableTitle">
	              <div class="icon"><i class="fa fa-list"></i></div>
	              <div class="workTableName">공정별 제조수행정보</div>
	            </div>
	          <div class="workTable">
	            <table cellpadding="0" cellspacing="0" border="0">
	              <thead class="work-tbl-header">
	                <tr>
	                  <th>No</th>
	                  <th>제조LOT번호</th>
	                  <th>공정번호</th>
	                  <th>공정명</th>
	                  <th>제품번호</th>
	                  <th>제품명</th>
	                  <th>수주업체</th>
	                  <th>생산시작일</th>
	                  <th>생산종료일</th>
	                  <th>진행상황</th>
	                  <th>계획수량</th>
	                  <th>단위</th>
	                  <th>누적생산수량</th>
	                  <th>누적불량수량</th>
	                </tr>
	              </thead>
	              <tbody class="work-tbl-content">
		              <c:if test="${fn:length(workProcessInfoList) == 0}">
	             	 		<tr>
											<td colspan="14">조회된 내용이 없습니다.</td>             	 		
	             	 		</tr>
	             	 </c:if>
	               <c:if test="${fn:length(workProcessInfoList) != 0}">
			              <c:forEach items="${workProcessInfoList}" var="workProcessInfoList">
			                <tr>
			                  <td>${workProcessInfoList.rn}</td>
			                  <td>${workProcessInfoList.p_lot_id}</td>
			                  <td>${workProcessInfoList.p_pi_id}</td>
			                  <td>${workProcessInfoList.pi_name}</td>
			                  <td>${workProcessInfoList.p_b_item_id}</td>
			                  <td>${workProcessInfoList.i_name}</td>
			                  <td>${workProcessInfoList.c_name}</td>
			                  <td>${workProcessInfoList.p_start_date}</td>
			                  <td>${workProcessInfoList.p_end_date}</td>
			                  <td>${workProcessInfoList.p_status}</td>
			                  <td>${workProcessInfoList.p_plan_quantity}</td>
			                  <td>${workProcessInfoList.ct_unit}</td>
			                  <td>${workProcessInfoList.p_item_quantity}</td>
			                  <td>${workProcessInfoList.p_defective_quantity}</td>
			                </tr>
		                </c:forEach>
	                </c:if>
	              </tbody>
	            </table><!-- /.table -->
          	</div><!-- /.workTable -->
        </div><!-- /.titleAndTable -->
        <br>
        <!-- 작업목록 Table -->
        <div class=divBorder></div>
        <!-- 자재투입, 작업자등록, 작업등록 모달창 버튼 -->
        <div class="col-sm-12 todayWorkInsertBtn" style="margin-top: -20px;">
	         <button type="button" id="" class="btn btn-default search-btn" onclick="location.href='workerInsert'"
	            style="margin-right: 10px;">
	            <img class="add-circle-icon" alt="add" src="/resources/img/add-circle-outline.svg">
	            작업자등록
           </button>
	         <button type="button" id="" data-toggle="modal" data-target="#workMaterialInsertModal"
	         		class="btn btn-default search-btn" style="margin-right: 10px;">
	            <img class="add-circle-icon" alt="add" src="/resources/img/add-circle-outline.svg">
	            자재투입
           </button>
           <button type="button" id="" class="btn btn-default search-btn" 
           		data-toggle="modal" data-target="#workInsertModal">
            <img class="add-circle-icon" alt="add" src="/resources/img/add-circle-outline.svg">
            작업등록
          </button>
        </div><!-- /.자재투입, 작업자등록, 작업등록 모달창 버튼 -->
        <div class="titleAndTable" id="selectWorkTable">
           <div class="workTableTitle">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="workTableName">작업목록</div>
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
             	 <c:if test="${fn:length(workList) == 0}">
             	 		<tr>
										<td colspan="18">조회된 내용이 없습니다.</td>             	 		
             	 		</tr>
             	 </c:if>
               <c:if test="${fn:length(workList) != 0}">
	              	<c:forEach items="${workList}" var="workList">   
		                <tr>
		                  <td>${workList.rn}</td>
		                  <td>${workList.w_id}</td>
		                  <td>${workList.w_lot_id}</td>
		                  <td>${workList.w_date}</td>
		                  <td>${workList.e_dp_name}</td>
		                  <td>${workList.w_pi_id}</td>
		                  <td>${workList.pi_name}</td>
		                  <td>${workList.mi_name}</td>
		                  <td>${workList.position}</td>
		                  <td>${workList.ins_item_id}</td>
		                  <td>${workList.i_name}</td>
		                  <td>${workList.w_status}</td>
		                  <td>${workList.i_standard}</td>
		                  <td>${workList.ct_unit}</td>
		                  <td>${workList.w_time}</td>
		                  <td>${workList.w_plan_quantity}</td>
		                  <td>${workList.w_item_quantity}</td>
		                  <td><button id="workDetailTd" data-toggle="modal" data-target="#workDetailModal">작업상세</button></td>
		                </tr>
	                </c:forEach>
                </c:if>
              </tbody>
            </table><!-- /.table -->
        </div><!-- /.workTable -->
        </div><!-- /.titleAndTable -->
        <div class=divBorder></div>
        <div class="workSelectBtn">
            <input type="button" class="workSelect" id="selectProductionBtn" value="생산실적"/>
            <input type="button" class="workSelect" id="selectMaterialInputBtn" value="자재투입내역"/>
            <input type="button" class="workSelect" id="selectWorkerBtn" value="작업자"/>
        </div>
        <div class=divBorder></div>
        <!-- 생산실적 Table -->
	        <div class="titleAndTable" id="selectProduction">
	           <div class="workTableTitle">
	              <div class="icon"><i class="fa fa-list"></i></div>
	              <div class="workTableName">생산실적</div>
	            </div>
	          <div class="workTable" style="max-height:300px; ">
	            <table cellpadding="0" cellspacing="0" border="0">
	              <thead class="work-tbl-header" style="height: 48px;">
	                <tr>
	                  <th>No</th>
	                  <th>작업번호</th>
	                  <th>제조LOT번호</th>
	                  <th>지시일자</th>
	                  <th>작업팀</th>
	                  <th>작업자</th>
	                  <th>공정번호</th>
	                  <th>공정명</th>
	                  <th>설비명</th>
	                  <th>작업위치</th>
	                  <th>제품번호</th>
	                  <th>제품명</th>
	                  <th>진행상황</th>
	                  <th>규격</th>
	                  <th>단위</th>
	                  <th>소요시간(분)</th>
	                  <th>계획수량</th>
	                  <th>생산수량</th>
	                  <th>불량수량</th>
	                </tr>
	              </thead>
	              <tbody class="work-tbl-content">
	              	<c:if test="${fn:length(productionPerformanceList) == 0}">
	             	 		<tr>
											<td colspan="10">조회된 내용이 없습니다.</td>             	 		
	             	 		</tr>
	             	 	</c:if>
	               	<c:if test="${fn:length(productionPerformanceList) != 0}">
		              	<c:forEach items="${productionPerformanceList}" var="productionPerformanceList">
			                <tr>
			                  <td>${productionPerformanceList.rn}</td>
			                  <td>${productionPerformanceList.w_id}</td>
			                  <td>${productionPerformanceList.w_lot_id}</td>
			                  <td>${productionPerformanceList.w_date}</td>
			                  <td>${productionPerformanceList.e_dp_name}</td>
			                  <td title="${productionPerformanceList.allemplist}">
												    ${productionPerformanceList.substrallemp}
												</td>
			                  <td>${productionPerformanceList.w_pi_id}</td>
			                  <td>${productionPerformanceList.pi_name}</td>
			                  <td>${productionPerformanceList.mi_name}</td>
			                  <td>${productionPerformanceList.position}</td>
			                  <td>${productionPerformanceList.ins_item_id}</td>
			                  <td>${productionPerformanceList.i_name}</td>
			                  <td>${productionPerformanceList.w_status}</td>
			                  <td>${productionPerformanceList.i_standard}</td>
			                  <td>${productionPerformanceList.ct_unit}</td>
			                  <td>${productionPerformanceList.w_time}</td>
			                  <td>${productionPerformanceList.w_plan_quantity}</td>
			                  <td>${productionPerformanceList.w_item_quantity}</td>
			                  <td>${productionPerformanceList.w_dft_quantity}</td>
			                </tr>
	                  </c:forEach>
                  </c:if>
	              </tbody>
	            </table><!-- /.table -->
          	</div><!-- /.workTable -->
					</div><!-- /.titleAndTable -->
					<div >
					
					</div>
	        <!-- 자재투입내역 Table -->
	        <div class="titleAndTable" id="selectMaterialInput">
	           <div class="workTableTitle">
	              <div class="icon"><i class="fa fa-list"></i></div>
	              <div class="workTableName">자재투입내역</div>
	            </div>
	          <div class="workTable" style="max-height:300px; overflow-x :hidden;">
	            <table cellpadding="0" cellspacing="0" border="0" id="selectMaterialInputTable">
	              <thead class="work-tbl-header">
	                <tr>
	                  <th>No</th>
	                  <th>제조LOT번호</th>
	                  <th>공정번호</th>
	                  <th>제품번호</th>
	                  <th>제품명</th>
	                  <th>수주업체</th>
	                  <th>투입일자</th>
	                  <th>자재번호</th>
	                  <th>자재명</th>
	                  <th>단위</th>
	                  <th>투입수량</th>
	                  <th>수정</th>
	                </tr>
	              </thead>
	              <tbody class="work-tbl-content">
	                <c:if test="${fn:length(insertMaterialList) == 0}">
	             	 		<tr>
											<td colspan="10">조회된 내용이 없습니다.</td>             	 		
	             	 		</tr>
	             	 	</c:if>
	               	<c:if test="${fn:length(insertMaterialList) != 0}">
		              	<c:forEach items="${insertMaterialList}" var="insertMaterialList">
			                <tr>
			                  <td>${insertMaterialList.rn}</td>
			                  <td>${insertMaterialList.inv_lot_id}</td>
			                  <td>${insertMaterialList.inv_pi_id}</td>
			                  <td>${insertMaterialList.ins_item_id}</td>
			                  <td>${insertMaterialList.i_name}</td>
			                  <td>${insertMaterialList.c_name}</td>
			                  <td>${insertMaterialList.inv_date}</td>
			                  <td>${insertMaterialList.inv_material_id}</td>
			                  <td>${insertMaterialList.m_name}</td>
			                  <td>${insertMaterialList.b_unit}</td>
			                  <td>${insertMaterialList.inv_quantity}</td>
			                  <td style="cursor:pointer; color:#17a2b8; text-align:center;" data-toggle="modal" class="insertMatEditBtn" id="insertMatEditBtn"
			                   data-lot-id="${insertMaterialList.inv_lot_id}" data-pi-id="${insertMaterialList.inv_pi_id}" 
			                   data-mat-id="${insertMaterialList.inv_material_id}" data-inv-quantity="${insertMaterialList.inv_quantity}"
			                   data-toggle="modal" data-target="#workMaterialInsertEditModal">
                  			수정
	                  	</td>
			                </tr>
	                  </c:forEach>
                  </c:if>
	              </tbody>
	            </table><!-- /.table -->
          	</div><!-- /.workTable -->
					</div><!-- /.titleAndTable -->
	        <!-- 작업자 Table -->
	        <div class="titleAndTable" id="selectWorker">
	           <div class="workTableTitle">
	              <div class="icon"><i class="fa fa-list"></i></div>
	              <div class="workTableName">작업자</div>
	            </div>
	          <div class="workTable" style=" max-height:300px; overflow-x :hidden;">
	            <table cellpadding="0" cellspacing="0" border="0">
	              <thead class="work-tbl-header">
	                <tr>
	                  <th>No</th>
	                  <th>사원번호</th>
	                  <th>작업팀</th>
	                  <th>작업자명</th>
	                  <th>직급</th>
	                  <th>제조LOT번호</th>
	                  <th>공정번호</th>
	                  <th>작업위치</th>
	                  <th>작업시작시간</th>
	                  <th>작업종료시간</th>
	                </tr>
	              </thead>
	              <tbody class="work-tbl-content">
	              	<c:if test="${fn:length(workerList) == 0}">
	             	 		<tr>
											<td colspan="10">조회된 내용이 없습니다.</td>             	 		
	             	 		</tr>
	             	 	</c:if>
	               	<c:if test="${fn:length(workerList) != 0}">
		              	<c:forEach items="${workerList}" var="workerList">
			                <tr>
			                  <td>${workerList.rn}</td>
			                  <td>${workerList.wr_emp_id}</td>
			                  <td>${workerList.e_dp_name}</td>
			                  <td>${workerList.e_name}</td>
			                  <td>${workerList.e_role}</td>
			                  <td>${workerList.w_lot_id}</td>
			                  <td>${workerList.w_pi_id}</td>
			                  <td>${workerList.position}</td>
			                  <td>${workerList.wr_start_time}</td>
			                  <td>${workerList.wr_end_time}</td>
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
  
 <!-- 자재투입등록 모달 -->
<div class="modal fade" id="workMaterialInsertModal" aria-labelledby="#workMaterialInsertModallLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="workMaterialInsertModal" id="workMaterialInsertModallLabel" style="font-size: 150%; font-weight:800;">자재투입등록</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body work-modal-body">
      	<form action="/workMaterialInsertModal" id=workMaterialInsertForm name="workMaterialInsertForm" class="col-md-12" >
      		<!-- 등록행 1 -->
		      <div class="work-modal-board">
		      	<!-- 제조LOT번호 -->
		        <div class="col-sm-2 work-modal-name">제조LOT번호</div>
		        <div class="col-sm-2 work-modal-text">
		           <input type="text" list="workInstructuionList" class="col-sm-12 input-text" id="insLotIdModal" name="insLotIdModal">
               <datalist id="workInstructuionList">
                   <c:forEach items="${instructionList}" var="instruction">
                       <option value="${instruction.insLotId}">생산제품번호: ${instruction.insItemId}</option>
                   </c:forEach>
               </datalist>
		        </div><!-- /.제조LOT번호 -->
		        <!-- 공정번호 -->
		        <div class="col-sm-2 work-modal-name">공정번호</div>
		        <div class="col-sm-2 work-modal-text">
		        	<select class="col-sm-12 modal-input"  id="processIdModal" name="processIdModal">
		        		<option value="">공정번호</option>
		        	</select>
		        </div><!-- /.공정번호 -->
		        <div class="col-sm-4 emptyModal"></div>
		      </div><!-- /.등록행 1 -->
		      <!-- 등록행 2 -->
		      <div class="work-modal-board">
		      	<!-- 제품번호 -->
		        <div class="col-sm-2 work-modal-name">제품번호</div>
		        <div class="col-sm-2 work-modal-text">
		          <input type="text" class="col-sm-12 modal-input" id="itemIdModal" name="itemIdModal"
		            value='<c:out value="${data.itemIdModal}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.제품번호 -->
		      	<!-- 제품명 -->
		        <div class="col-sm-2 work-modal-name">제품명</div>
		        <div class="col-sm-2 work-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="itemNameModal" name="itemNameModal"
	            	value='<c:out value="${data.itemNameModal}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.제품명 -->
		        <!-- 계획생산수량 -->
		        <div class="col-sm-2 work-modal-name">계획생산수량</div>
		        <div class="col-sm-2 work-modal-text">
		        	<input type="number" class="col-sm-12 modal-input" id="productionPlanQuantityModal" name="productionPlanQuantityModal" 
		          	value='<c:out value="${data.productionPlanQuantityModal}" />' readonly="readonly"/>
		        </div><!-- /.계획생산수량 -->
		      </div><!-- /.등록행 2 -->
		      <!-- 등록행 3 -->
		      <div class="work-modal-board">
		        <!-- 자재번호 -->
		        <div class="col-sm-2 work-modal-name">자재번호</div>
		        <div class="col-sm-2 work-modal-text">
			        <select class="col-sm-12 modal-input"  id="materialIdModal" name="materialIdModal">
			        	<option value="">자재번호</option>
			        </select>
		        </div><!-- /.자재번호 -->
		        <!-- 자재명 -->
		        <div class="col-sm-2 work-modal-name">자재명</div>
		        <div class="col-sm-2 work-modal-text">
		          <input type="text" class="col-sm-12 modal-input" id="materialNameModal" name="materialNameModal" 
		          value='<c:out value="${data.materialNameModal}" />' readonly="readonly" />
		        </div><!-- /.자재명 -->
		        <!-- 제품1EA별 투입수량 -->
		        <div class="col-sm-2 work-modal-name">제품1EA별<br>투입수량</div>
		        <div class="col-sm-2 work-modal-text">
		          <input type="number" class="col-sm-12 modal-input" id="item1EaMaterialModal" name="item1EaMaterialModal" 
		          	value='<c:out value="${data.item1EaMaterialModal}" />' readonly="readonly"/>
		        </div><!-- /.제품1EA별 투입수량 -->
		      </div><!-- /.등록행 3 -->
		      <!-- 등록행 4 -->
		      <div class="work-modal-board">
		        <!-- 최소투입수량 -->
		        <div class="col-sm-2 work-modal-name">최소투입수량</div>
		        <div class="col-sm-2 work-modal-text">
		          <input type="number" class="col-sm-12 modal-input" id="minInsertQuantityModal" name="minInsertQuantityModal" 
		          	value='<c:out value="${data.minInsertQuantityModal}" />' readonly="readonly"/>
		        </div><!-- /.최소투입수량 -->
		        <!-- 단위 -->
		        <div class="col-sm-2 work-modal-name">단위</div>
		        <div class="col-sm-2 work-modal-text">
		          <input type="text" class="col-sm-12 modal-input" id="unitMaterialModal" name="unitMaterialModal" 
		          	value='<c:out value="${data.unitMaterialModal}" />' readonly="readonly"/>
		        </div><!-- /.단위 -->
		        <!-- 투입수량 -->
		        <div class="col-sm-2 work-modal-name">투입수량</div>
		        <div class="col-sm-2 work-modal-text">
		          <input type="number" class="col-sm-12 modal-input" id="insertQuantityModal" name="insertQuantityModal" 
		          	value='<c:out value="${data.insertQuantityModal}"/>'/>
		        </div><!-- /.투입수량 -->
		      </div><!-- /.등록행 4 -->
		      <!-- 추가버튼 -->
		      <div class="row modal-add-btn">
		      	<div class="col-sm-12 add-insp-btn">
		         	<button type="button" id="addInsertMaterialBtn" class="btn btn-primary add-insert-mat-btn">
		            <svg class="add-circle-icon2" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 2c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm6 13h-5v5h-2v-5h-5v-2h5v-5h2v5h5v2z"/></svg>
		            추가
		          </button>
		        </div><!-- /.추가버튼 -->
	        </div><!-- /.row -->
	        <!-- 자재투입목록 -->
	        <div class="row newWorkMaterialList">
	        	<!-- Title -->
	        	<div class="col-sm-6 newWorkMaterialTitle">
	        		<i class="fa fa-list"></i>
	            <span>자재투입목록</span>
	        	</div><!-- /.Title -->
	        	<!-- Table -->
	        	<div class="col-sm-12">
		        	<div class="work-modal-table">
		        		<table cellpadding="0" cellspacing="0" border="0">
		            	<thead class="work-modal-table-header">
		            		<tr>
		            			<th>No</th>
		                  <th>투입일자</th>
		                  <th>제조LOT번호</th>
		                  <th>공정번호</th>
		                  <th>제품번호</th>
		                  <th>제품명</th>
		                  <th>계획생산수량</th>
		                  <th>자재번호</th>
		                  <th>자재명</th>
		                  <th>제품1EA별<br>투입수량</th>
		                  <th>최소투입수량</th>
		                  <th>단위</th>
		                  <th>투입수량</th>
		                  <th>삭제</th>
		            		</tr>
		              </thead>
		              <tbody class="work-modal-table-content">
		              	<!-- 추가된 목록 내용 -->
	                  
		              </tbody>
		            </table>  
		        	</div><!-- /.Table -->
	        	</div><!-- /.col -->
	        </div><!-- /.자재투입목록 -->
        </form><!-- 모달 form -->
      </div><!-- /.modal-body -->
      
      
      <!-- 구분선 -->
      <div class=divBorderModal></div>
      
      <div class="modal-footer">
           <button type="button" class="btn btn-primary" id="insertMatModalInsertBtn">등록</button>
           <button type="button" class="btn btn-danger" id="cancelBtn" data-dismiss="modal">취소</button>
      </div><!-- /.modal-footer -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal --> 

	<!-- 자재투입수정 모달 -->
	<div class="modal fade" id="workMaterialInsertEditModal" aria-labelledby="#workMaterialInsertEditModallLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
	  <div class="modal-dialog" role="document" style="min-width: 60%;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <div class="workMaterialInsertEditModal" id="workMaterialInsertEditModalLabel" style="font-size: 150%; font-weight:800;">자재투입수정</div>
	      </div>
	      <!-- modal-body -->
	      <div class="modal-body work-modal-body">
	      	<form action="/workMaterialInsertModal" id=workMaterialInsertForm name="workMaterialInsertForm" class="col-md-12" >
	      		<!-- 등록행 1 -->
			      <div class="work-modal-board">
			      	<!-- 제조LOT번호 -->
			        <div class="col-sm-2 work-modal-name">제조LOT번호</div>
			        <div class="col-sm-2 work-modal-text">
			           <input type="text" class="col-sm-12 input-text" id="inv_lot_id" name="inv_lot_id"
			            value='<c:out value="${data.ins_lot_id}" />' readonly="readonly"/>
			        </div><!-- /.제조LOT번호 -->
			        <!-- 공정번호 -->
			        <div class="col-sm-2 work-modal-name">공정번호</div>
			        <div class="col-sm-2 work-modal-text">
			        	<input type="text" class="col-sm-12 modal-input" id="inv_pi_id" name="inv_pi_id" 
			          value='<c:out value="${data.inv_pi_id}" />' readonly="readonly" />
			        </div><!-- /.공정번호 -->
			        <div class="col-sm-4 emptyModal"></div>
			      </div><!-- /.등록행 1 -->
			      <!-- 등록행 2 -->
			      <div class="work-modal-board">
			      	<!-- 제품번호 -->
			        <div class="col-sm-2 work-modal-name">제품번호</div>
			        <div class="col-sm-2 work-modal-text">
			          <input type="text" class="col-sm-12 modal-input" id="ins_item_id" name="ins_item_id"
			            value='<c:out value="${data.ins_item_id}"/>'  readonly="readonly"/>
			        </div><!-- /.제품번호 -->
			      	<!-- 제품명 -->
			        <div class="col-sm-2 work-modal-name">제품명</div>
			        <div class="col-sm-2 work-modal-text">
			        	<input type="text" class="col-sm-12 modal-input" id="i_name" name="i_name"
		            	value='<c:out value="${data.i_name}"/>'  readonly="readonly"/>
			        </div><!-- /.제품명 -->
			        <!-- 단위 -->
			        <div class="col-sm-2 work-modal-name">단위</div>
			        <div class="col-sm-2 work-modal-text">
			          <input type="text" class="col-sm-12 modal-input" id="b_unit" name="b_unit" 
			          	value='<c:out value="${data.b_unit}" />' readonly="readonly"/>
			        </div><!-- /.단위 -->
			      </div><!-- /.등록행 2 -->
			      <!-- 등록행 3 -->
			      <div class="work-modal-board">
			        <!-- 자재번호 -->
			        <div class="col-sm-2 work-modal-name">자재번호</div>
			        <div class="col-sm-2 work-modal-text">
			       	 	<input type="text" class="col-sm-12 modal-input" id="inv_material_id" name="inv_material_id" 
			          	value='<c:out value="${data.inv_material_id}" />' readonly="readonly"/>
				        </select>
			        </div><!-- /.자재번호 -->
			        <!-- 자재명 -->
			        <div class="col-sm-2 work-modal-name">자재명</div>
			        <div class="col-sm-2 work-modal-text">
			          <input type="text" class="col-sm-12 modal-input" id="m_name" name="m_name" 
			          value='<c:out value="${data.m_name}" />' readonly="readonly" />
			        </div><!-- /.자재명 -->
			        <!-- 투입수량 -->
			        <div class="col-sm-2 work-modal-name">투입수량</div>
			        <div class="col-sm-2 work-modal-text">
			          <input type="number" class="col-sm-12 modal-input" id="updateInvQuantity" name="updateInvQuantity" 
			          	value='<c:out value="${data.inv_quantity}"/>'/>
			          <input type="hidden" class="col-sm-12 modal-input" id="inv_quantity" name="inv_quantity" 
			          	value='<c:out value="${data.inv_quantity}"/>'/>
			        </div><!-- /.투입수량 -->
			      </div><!-- /.등록행 3 -->
		        </form><!-- 모달 form -->
	        </div><!-- /.modal-body -->
      
      
      <!-- 구분선 -->
      <div class=divBorderModal></div>
      
      <div class="modal-footer">
           <button type="button" class="btn btn-primary" id="insertMatModalUpdateBtn">수정</button>
           <button type="button" class="btn btn-danger" id="cancelBtn" data-dismiss="modal">취소</button>
      </div><!-- /.modal-footer -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal --> 
       
  
<!-- 작업등록 모달 -->
<div class="modal fade" id="workInsertModal" aria-labelledby="#workInsertModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog workInsert-Modal-Dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="workInsertModalTitle" id="workInsertModalLabel" style="font-size: 150%; font-weight:800;">작업등록</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body work-modal-body">
     		<!-- 등록행 1 -->
      	<div class="work-modal-input">
          <!-- 제조LOT번호 -->
	        <div class="col-sm-2 work-modal-name">제조LOT번호</div>
	        <div class="col-sm-2 work-modal-text">
	           <input type="text" list="workInstructuionList" class="col-sm-12 input-text" id="workInsertModalLotId" name="workInsertModalLotId">
              <datalist id="workInstructuionList">
                  <c:forEach items="${instructionList}" var="instruction">
                      <option value="${instruction.insLotId}">생산제품번호: ${instruction.insItemId}</option>
                  </c:forEach>
              </datalist>
	        </div><!-- /.제조LOT번호 -->
	        <!-- 공정번호 -->
	        <div class="col-sm-2 work-modal-name">공정번호</div>
	        <div class="col-sm-2 work-modal-text">
	        	<select class="col-sm-12 modal-input"  id="workInsertModalProcessId" name="workInsertModalProcessId">
	        		<option value="">공정번호</option>
	        	</select>
	        </div><!-- /.공정번호 -->
	        <!-- 공정명 -->
	        <div class="col-sm-2 work-modal-name">공정명</div>
	        <div class="col-sm-2 work-modal-text">
	         	<input type="text" class="col-sm-12 modal-input" id="workInsertModalProcessName" name="workInsertModalProcessName"
              value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
	        </div><!-- /.공정명 -->
        </div><!-- /.등록행 1 -->
     		<!-- 등록행 2 -->
     		<div class="work-modal-input">
     			<!-- 설비번호 -->
          <div class="col-sm-2 work-modal-name">설비번호</div>
          <div class="col-sm-2 work-modal-text">
            <input type="text" class="col-sm-12 modal-input" id="workInsertModalMachineId" name="workInsertModalMachineId"
              value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
          </div><!-- /.설비번호 -->
          <!-- 설비명 -->
          <div class="col-sm-2 work-modal-name">설비명</div>
          <div class="col-sm-2 work-modal-text">
            <input type="text" class="col-sm-12 modal-input" id="workInsertModalMachineName" name="workInsertModalMachineName"
              value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
          </div><!-- /.설비명 -->
          <!-- 작업위치 -->
          <div class="col-sm-2 work-modal-name">작업위치</div>
          <div class="col-sm-2 work-modal-text">
            <input type="text" class="col-sm-12 modal-input" id="workInsertModalWorkPosition" name="workInsertModalWorkPosition"
              value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
          </div><!-- /.작업위치 -->
        </div><!-- /.등록행 2 -->
     		<!-- 등록행 3 -->
     		<div class="work-modal-input">
     			<!-- 제품번호 -->
           <div class="col-sm-2 work-modal-name">제품번호</div>
           <div class="col-sm-2 work-modal-text">
           		<input type="text" class="col-sm-12 modal-input" id="workInsertModalItemId" name="workInsertModalItemId"
              	value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
           </div><!-- /.제품번호 -->
           <!-- 제품명 -->
           <div class="col-sm-2 work-modal-name">제품명</div>
           <div class="col-sm-2 work-modal-text">
             <input type="text" class="col-sm-12 modal-input" id="workInsertModalItemName" name="workInsertModalItemName"
              	value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
           </div><!-- /.제품명 -->
           <!-- 단위 -->
           <div class="col-sm-2 work-modal-name">생산단위</div>
           <div class="col-sm-2 work-modal-text">
             <input type="text" class="col-sm-12 modal-input" id="workInsertModalUnit" name="workInsertModalUnit"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
           </div><!-- /.단위 -->
        </div><!-- /.등록행 3 --> 
     		<!-- 등록행 4 -->
     		<div class="work-modal-input">
     			 <!-- 남은생산수량 -->
           <div class="col-sm-2 work-modal-name">남은생산수량</div>
           <div class="col-sm-2 work-modal-text">
           		<input type="text" class="col-sm-12 modal-input" id="workInsertModalLeftoverQuantity" name="workInsertModalLeftoverQuantity"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
           </div><!-- /.남은생산수량 -->
           <!-- 계획수량 -->
           <div class="col-sm-2 work-modal-name">현재작업계획수량</div>
           <div class="col-sm-2 work-modal-text">
             <input type="text" class="col-sm-12 modal-input" id="workInsertModalPlanQuantity" name="workInsertModalPlanQuantity"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div><!-- /.계획수량 -->
           <!-- 소요시간 -->
           <div class="col-sm-2 work-modal-name">소요시간(분)</div>
           <div class="col-sm-2 work-modal-text">
             <input type="text" class="col-sm-12 modal-input" id=workInsertModalWorkTime name="workInsertModalWorkTime"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" readonly="readonly"/>
           </div><!-- /.소요시간 -->
        </div> <!-- /.등록행 4 -->
        <!-- 등록행 5 -->
      	<div class="work-modal-input">
      			<!-- 작업시작시간 -->
		        <div class="col-sm-2 work-modal-name">작업시작시간</div>
		        <div class="col-sm-4 work-modal-text">
		          <input type="datetime-local" class="col-sm-12 modal-input" id="workInsertModalWorkStartTime" name="workInsertModalWorkStartTime" 
		          value='<c:out value="${data.edit_w_start_time}" />' />
		        </div><!-- /.작업시작시간 -->
		        <!-- 작업종료시간 -->
		        <div class="col-sm-2 work-modal-name">작업종료시간</div>
		        <div class="col-sm-4 work-modal-text">
		          <input type="datetime-local" class="col-sm-12 modal-input" id="workInsertModalWorkEndTime" name="workInsertModalWorkEndTime" 
		          	value='<c:out value="${data.edit_w_end_time}" />' />
		        </div><!-- /.작업종료시간 -->
         </div><!-- /.등록행 5 -->
         <!-- 등록행 6 -->
      	<div class="work-modal-input">
     			<!-- 비고 -->
	        <div class="col-sm-2 work-modal-name">비고</div>
	        <div class="col-sm-10 work-modal-text">
	          <input type="text" class="col-sm-12 modal-input" id="workInsertModalNote" name="workInsertModalNote" 
	          value='<c:out value="${data.edit_pi_machine_id}" />' />
	        </div><!-- /.비고 -->
        </div><!-- /.등록행 6 -->
        <!-- 추가버튼 -->
	      <div class="row modal-add-btn">
	      	<div class="col-sm-12 add-insp-btn">
	         	<button type="button" id="addWorkInsertBtn" class="btn btn-primary add-insert-mat-btn">
	            <svg class="add-circle-icon2" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 2c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm6 13h-5v5h-2v-5h-5v-2h5v-5h2v5h5v2z"/></svg>
	            추가
	          </button>
	        </div><!-- /.추가버튼 -->
        </div><!-- /.row -->
      	<!-- 작업등록목록 -->
        <div class="row newWorkMaterialList">
        	<!-- Title -->
        	<div class="col-sm-6 newWorkMaterialTitle">
        		<i class="fa fa-list"></i>
            <span>작업등록목록</span>
        	</div><!-- /.Title -->
        	<!-- Table -->
        	<div class="col-sm-12">
	        	<div class="work-modal-table">
	        		<table cellpadding="0" cellspacing="0" border="0">
	            	<thead class="work-modal-table-header">
	            		<tr>
	            			<th>No</th>
	                  <th>투입일자</th>
	                  <th>제조LOT번호</th>
	                  <th>공정번호</th>
	                  <th>제품번호</th>
	                  <th>제품명</th>
	                  <th>계획생산수량</th>
	                  <th>자재번호</th>
	                  <th>자재명</th>
	                  <th>제품1EA별<br>투입수량</th>
	                  <th>최소투입수량</th>
	                  <th>단위</th>
	                  <th>투입수량</th>
	                  <th>삭제</th>
	            		</tr>
	              </thead>
	              <tbody class="work-modal-table-content">
	              	<!-- 추가된 목록 내용 -->
                  
	              </tbody>
	            </table>  
	        	</div><!-- /.Table -->
        	</div><!-- /.col -->
        </div><!-- /.작업등록목록 -->
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

<!-- 작업상세 및 수정, 삭제 모달 -->
<div class="modal fade" id="workDetailModal" aria-labelledby="#workDetailModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog workDetail-Modal-Dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="workDetailModalTitle" id="workDetailModalLabel" style="font-size: 150%; font-weight:800;">작업상세 및 수정</div>
      </div>
			<!-- modal-body -->
      <div class="modal-body work-modal-body">
     		<!-- 등록행 1 -->
      	<div class="work-modal-input">
           <div class="col-sm-2 work-modal-name">제조LOT번호</div>
           <div class="col-sm-2 work-modal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
           </div>
           <div class="col-sm-2 work-modal-name">공정번호</div>
           <div class="col-sm-2 work-modal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
           <div class="col-sm-2 work-modal-name">설비번호</div>
           <div class="col-sm-2 work-modal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
         </div><!-- /.등록행 1 -->
     		<!-- 등록행 2 -->
      	<div class="work-modal-input">
           <div class="col-sm-2 work-modal-name">제품번호</div>
           <div class="col-sm-2 work-modal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
           </div>
           <div class="col-sm-2 work-modal-name">계획수량</div>
           <div class="col-sm-2 work-modal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
           <div class="col-sm-2 work-modal-name">예상<br>소요시간(분)</div>
           <div class="col-sm-2 work-modal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
         </div><!-- /.등록행 2 -->
     		<!-- 등록행 3 -->
      	<div class="work-modal-input">
           <div class="col-sm-2 work-modal-name">기준단위</div>
           <div class="col-sm-2 work-modal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
           </div>
           <div class="col-sm-2 work-modal-name">생산수량</div>
           <div class="col-sm-2 work-modal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
           </div>
           <div class="col-sm-2 work-modal-name">진행상황</div>
           <div class="col-sm-2 work-modal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
           </div>
         </div><!-- /.등록행 3 -->
      </div><!-- /.modal-body -->
      
      <!-- 구분선 -->
      <div class=divBorderModal></div>
      
      <div class="modal-footer">
           <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#todayWorkDeleteModal">삭제</button>
           <button type="button" class="btn btn-primary">저장</button>
           <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div><!-- /.modal-footer -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 작업상세의 삭제 Modal -->
<div class="modal fade" id="todayWorkDeleteModal" tabindex="-1" role="dialog" aria-labelledby="#todayWorkDeleteModalLabel" data-backdrop="static" data-keyboard="false"  aria-hidden="true">
  <div class="modal-dialog todayWorkDelete-Modal-Dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="todayWorkDeleteModalLabel">작업삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!-- modal-body -->
      <div class="modal-body">
        정말 삭제하시겠습니까?
      </div>
      <!-- modal-footer -->
      <div class="modal-footer">
      	<button type="button" class="btn btn-danger">삭제</button>
       	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div><!-- /.modal-footer -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
  
  <script type="text/javascript">
		//검색창
		function search() {
	    // 검색 로직 실행
			document.getElementById('searchForm').submit();
		}
  </script>
  <script defer src="/resources/js/work.js"></script>
<%@ include file="../includes/footer.jsp" %>
