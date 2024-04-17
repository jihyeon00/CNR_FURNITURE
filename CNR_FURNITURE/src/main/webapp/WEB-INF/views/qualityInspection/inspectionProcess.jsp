<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- 포맷팅 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- jQuery 연결 -->
<script defer src="/resources/js/quality/inspectionProcess.js"></script>

<!-- 공통 header 연결 -->
<%@ include file="../includes/header.jsp" %>



<div class="content-wrapper">
	<!-- 검색 Form -->
	<form action="/inspectionProcess" id="searchInspProcess" name="searchInspProcess" class="col-md-12" method="get">
	  <div class="content-header">
	    <div class="container-fluid">
	      <div class="row mb-2">
	        <div class="col-sm-12">
	          <ol class="breadcrumb float-sm-left">
	            <h1 class="m-0"><i class="far fa-clipboard"></i>&nbsp;공정검사관리</h1>
	          </ol>
	          <ol class="breadcrumb float-sm-right">
	            <div class="reset">
	            	<a href="/inspectionProcess">
	              	<img class="resetPng" alt="reset" src="/resources/img/reset.png" >
	              </a>
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
	     	<!-- 검색행1 -->
	       <div class="inspection-searchBar">
	       	<!-- 제조LOT번호 -->
	         <div class="col-sm-2 inspection-name">제조LOT번호</div>
	         <div class="col-sm-2 inspection-text">
	         	<input type="search" list="lotIDList" class="col-sm-12"  id="lotID" name="lotID" value="${cri.lotID}">
	         	<datalist id="lotIDList">
	         		<c:forEach items="${lotIDList}" var="lot">
								<option value='${lot.lotID}'
                	<c:if test="${cri.lotID == lot.lotID}">selected</c:if> >${lot.lotID}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.제조LOT번호 -->
	         <!-- 공정번호 -->
	         <div class="col-sm-1 inspection-name">공정번호</div>
	         <div class="col-sm-2 inspection-text">
	         	<input type="search" list="procIDList" class="col-sm-12" id="processID" name="processID" value="${cri.processID}">
	         	<datalist id="procIDList">
	         		<c:forEach items="${procIDList}" var="proc">
								<option value='${proc.processID}'
                	<c:if test="${cri.processID == proc.processID}">selected</c:if> >${proc.processID}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.공정번호 -->
	         <!-- 공정명 -->
	         <div class="col-sm-1 inspection-name">공정명</div>
	         <div class="col-sm-2 inspection-text">
	         	<input type="search" list="procNameList" class="col-sm-12" id="processName" name="processName" value="${cri.processName}">
	         	<datalist id="procNameList">
	         		<c:forEach items="${procNameList}" var="proc">
								<option value='${proc.processName}'
                	<c:if test="${cri.processName == proc.processName}">selected</c:if> >${proc.processName}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.공정명 -->
	       </div><!-- /.검색행1 -->
	       <!-- 검색행2 -->
	       <div class="inspection-searchBar" style="margin-top: -7px;">
	       	<!-- 불량유형 -->
	         <div class="col-sm-1 inspection-name">불량유형</div>
	         <div class="col-sm-3 inspection-text">
	         	<!-- 불량유형1 -->
	         	<select class="col-sm-6"  id="qsDiv1" name="qsDiv1">
	         		<option value="">불량유형1 선택</option>
	            <c:forEach items="${qsDiv1List}" var="qsDiv1s">
	            	<option value='${qsDiv1s.qsDiv1}'
                	<c:if test="${cri.qsDiv1 == qsDiv1s.qsDiv1}">selected</c:if> >${qsDiv1s.qsDiv1}
								</option>
							</c:forEach>
	          </select><!-- /.불량유형1 -->
	          &nbsp;
	          <!-- 불량유형2 -->
	          <select class="col-sm-6"  id="qsDiv2" name="qsDiv2">
	            <option value="">불량유형2 선택</option>
	            <c:forEach items="${qsDiv2List}" var="qsDiv2s">
								<option value='${qsDiv2s.qsDiv2}'
                	<c:if test="${cri.qsDiv2 == qsDiv2s.qsDiv2}">selected</c:if> >${qsDiv2s.qsDiv2}
								</option>
							</c:forEach>
	          </select><!-- /.불량유형2 -->
	         </div><!-- /.불량유형 -->
	         <!-- 작업번호 -->
	         <div class="col-sm-1 inspection-name">작업번호</div>
	         <div class="col-sm-2 inspection-text">
	         	<input type="search" list="workIDList" class="col-sm-12" id="workID" name="workID" value="${cri.workID}">
	         	<datalist id="workIDList">
	         		<c:forEach items="${workIDList}" var="work">
								<option value='${work.workID}'
                	<c:if test="${cri.workID == work.workID}">selected</c:if> >${work.workID}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.작업번호 -->
	         <!-- 설비번호 -->
	         <div class="col-sm-1 inspection-name">설비번호</div>
	         <div class="col-sm-2 inspection-text">
	         	<input type="search" list="machineIDList" class="col-sm-12" id="machineID" name="machineID" value="${cri.machineID}">
	         	<datalist id="machineIDList">
	         		<c:forEach items="${machineIDList}" var="machineList">
								<option value='${machineList.machineID}'
                	<c:if test="${cri.machineID == machineList.machineID}">selected</c:if> >${machineList.machineID}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.설비번호 -->
	       </div><!-- /.검색행2 -->
	     
	    </div><!-- /.container-fluid -->
	  </div><!-- /.content-header -->
	</form><!-- 검색 Form -->


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
	          <div class="col-sm-3 addInspBtn">
	          	<button type="button" id="" class="btn btn-default search-btn" data-toggle="modal" data-target="#registerProcessInspection">
	              <img class="add-circle-icon" alt="add" src="/resources/img/add-circle-outline.svg" >
	              공정불량등록
	            </button>
	          </div><!-- /.공정불량 등록 버튼 -->
          </div><!-- /.row -->
          <!-- 공정테이블 -->
          <div class="col-sm-12">
            <div class="inspection-table inspOB-table">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="inspection-table-header">
                  <tr>
                    <th>No</th>
                    <th>작업번호</th>
                    <th>제조LOT번호</th>
                    <th>설비번호</th>
                    <th>공정번호</th>
                    <th>공정명</th>
                    <th>단위</th>
                    <th>일일총작업수량</th>
                    <th>검사수량</th>
                    <th>불량수량</th>
                    <th>불량률(%)</th>
                    <th>양품수량</th>
                    <th>불량유형1</th>
                    <th>불량유형2</th>
                    <th>검사일자</th>
                    <th>비고</th>
                    <th>수정</th>
                  </tr>
                </thead>
                <tbody class="inspection-table-content">
                	<!-- 조회 목록 -->
                	<c:forEach var="insp" items="${inspProcessList}">
                		<tr>
                			<td><fmt:formatNumber value="${insp.listSeq}" pattern="#,##0" /></td>
                			<td><fmt:formatNumber value="${insp.workID}" pattern="#,##0" /></td>
                			<td><fmt:formatNumber value="${insp.lotID}" pattern="#,##0" /></td>
                			<td><fmt:formatNumber value="${insp.machineID}" pattern="#,##0" /></td>
                			<td><fmt:formatNumber value="${insp.processID}" pattern="#,##0" /></td>
                			<td><c:out value="${insp.processName}" /></td>
                			<td><c:out value="${insp.unit}" /></td>
                			<td><fmt:formatNumber value="${insp.dailyWorkQuantity}" pattern="#,##0" /></td>
                			<td><fmt:formatNumber value="${insp.inspectionQuantity}" pattern="#,##0" /></td>
                			<td><fmt:formatNumber value="${insp.defectQuantity}" pattern="#,##0" /></td>
                			<td><fmt:formatNumber value="${insp.defectRate}" pattern="#,###0.000"/></td>
                			<td><fmt:formatNumber value="${insp.goodQuantity}" pattern="#,##0" /></td>
                			<td><c:out value="${insp.qsDiv1}" /></td>
                			<td><c:out value="${insp.qsDiv2}" /></td>
                			<td><c:out value="${insp.inspectionDate}" /></td>
                			<td><c:out value="${insp.note}" /></td>
                			<td style="cursor:pointer; color:#17a2b8; text-align:center;" 
                				data-toggle="modal" class="editBtn" id="editBtn" 
               					data-qi-id="${insp.qiID}" data-toggle="modal" data-target="#editModal">
                  			수정
	                  	</td>
                		</tr>
                	</c:forEach>
                	
                	
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



<!-- 공정불량등록 모달 -->
<div class="modal fade" id="registerProcessInspection" aria-labelledby="#register-ProcessInspection-ModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="inspProcessModalTitle" id="register-ProcessInspection-ModalLabel" style="font-size: 150%; font-weight:800;">공정검사 - 공정불량등록</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body inspection-modal-body">
      	<form action="/inspectionProcess" id="inspProcessInsert" name="inspProcessInsert" class="col-md-12" >
      		<!-- 등록행 1 -->
		      <div class="inspection-modal-board">
		      	<!-- 작업번호 -->
		        <div class="col-sm-2 inspection-modal-name">작업번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input list="contractIDModalList" class="col-sm-12 modal-input" id="workIDForInsertModal" name="workID" value="${data.workID}">
		         	<datalist id="workIDModalList">
		         		<c:forEach items="${workIDModalList}" var="workList">
									<option value='${workList.workID}'
                		<c:if test="${data.workID == workList.workID}">selected</c:if> >${workList.workID}
									</option>
								</c:forEach>
		         	</datalist>
		        </div><!-- /.작업번호 -->
		        <!-- 공정번호 -->
		        <div class="col-sm-2 inspection-modal-name">공정번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="text" class="col-sm-12 modal-input" id="processIDForInsertModal" name="processID"
		            value='<c:out value="${data.processID}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.공정번호 -->
		        <!-- 공정명 -->
		        <div class="col-sm-2 inspection-modal-name">공정명</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="text" class="col-sm-12 modal-input" id="processNameForInsertModal" name="processName"
		            value='<c:out value="${data.processName}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.공정명 -->
		      </div><!-- /.등록행 1 -->
		      <!-- 등록행 2 -->
		      <div class="inspection-modal-board">
		      	<!-- 제조LOT번호 -->
		        <div class="col-sm-2 inspection-modal-name">제조LOT번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="text" class="col-sm-12 modal-input" id="lotIDForInsertModal" name="lotID"
		            value='<c:out value="${data.lotID}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.제조LOT번호 -->
		        <!-- 설비번호 -->
		        <div class="col-sm-2 inspection-modal-name">설비번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="machineIDForInsertModal" name="machineID"
		        		value='<c:out value="${data.machineID}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.설비번호 -->
		        <!-- 단위 -->
		        <div class="col-sm-2 inspection-modal-name">단위</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="unitForInsertModal" name="unit"
		        		value='<c:out value="${data.unit}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.단위 -->
		      </div><!-- /.등록행 2 -->
		      <!-- 등록행 3 -->
		      <div class="inspection-modal-board">
		        <!-- 일일총작업수량 -->
		        <div class="col-sm-2 inspection-modal-name">일일총작업수량</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="number" class="col-sm-12 modal-input" id="dailyWorkQuantityForInsertModal" name="dailyWorkQuantity" 
		          	value='<c:out value="${data.dailyWorkQuantity}" />' readonly="readonly"/>
		        </div><!-- /.일일총작업수량 -->
		        <!-- 검사수량 -->
		        <div class="col-sm-2 inspection-modal-name">검사수량</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="number" class="col-sm-12 modal-input" id="inspQuantityForInsertModal" name="inspectionQuantity" />
		        </div><!-- /.검사수량 -->
		        <!-- 불량수량 -->
		        <div class="col-sm-2 inspection-modal-name">불량수량</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="number" class="col-sm-12 modal-input" id="dftQuantityForInsertModal" name="defectQuantity" />
		        </div><!-- /.불량수량 -->
		      </div><!-- /.등록행 3 -->
		      <!-- 등록행 4 -->
		      <div class="inspection-modal-board">
		      	<!-- 불량유형1 -->
		        <div class="col-sm-2 inspection-modal-name">불량유형1</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<select class="col-sm-12 modal-input"  id="qsDiv1ForInsertModal" name="qsDiv1">
		         		<option value="">불량유형1 선택</option>
		         		<c:forEach items="${qsDiv1ModalList}" var="list">
							    <option value='${list.qsDiv1}'
			            	<c:if test="${cri.qsDiv1 == list.qsDiv1}">selected</c:if> >${list.qsDiv1}
							    </option>
							  </c:forEach>
		          </select>
		        </div><!-- /.불량유형1 -->
		        <!-- 불량유형2 -->
		        <div class="col-sm-2 inspection-modal-name">불량유형2</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<select class="col-sm-12 modal-input"  id="qsDiv2ForInsertModal" name="qsDiv2">
		            <option value="">불량유형2 선택</option>
		            <c:forEach items="${qsDiv2ModalList}" var="list">
							    <option value='${list.qsDiv2}'
							    	<c:if test="${cri.qsDiv2 == list.qsDiv2}">selected</c:if> >${list.qsDiv2}
							    </option>
							  </c:forEach>
		          </select>
		        </div><!-- /.불량유형2 -->
		        <div class="col-sm-4 emptyModal"></div>
		      </div><!-- /.등록행 4 -->
		      <!-- 등록행 5 -->
		      <div class="inspection-modal-board">
		      	<!-- 비고 -->
		      	<div class="col-sm-2 inspection-modal-name">비고</div>
		      	<div class="col-sm-10 inspection-modal-text">
		      		<input type="text" class="col-sm-12 modal-input" id="noteForInsertModal" name="note"/>
		      	</div><!-- /.비고 -->
		      </div><!-- /.등록행 5 -->
		      <!-- 추가버튼 -->
		      <div class="row modal-add-btn">
		      	<div class="col-sm-12 add-insp-btn">
		         	<button type="button" id="addInspectionBtn" class="btn btn-primary add-insp-btn">
		            <svg class="add-circle-icon2" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 2c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm6 13h-5v5h-2v-5h-5v-2h5v-5h2v5h5v2z"/></svg>
		            추가
		          </button>
		        </div><!-- /.추가버튼 -->
	        </div><!-- /.row -->
	        <!-- 공정불량 및 입고 목록 -->
	        <div class="row newInspList">
	        	<!-- Title -->
	        	<div class="col-sm-6 newInspTitle">
	        		<i class="fa fa-list"></i>
	            <span>공정불량목록</span>
	        	</div><!-- /.Title -->
	        	<!-- Table -->
	        	<div class="col-sm-12">
		        	<div class="inspection-table inspection-modal-table">
		        		<table cellpadding="0" cellspacing="0" border="0">
		            	<thead class="inspection-table-header">
		            		<tr>
                      <th>No</th>
                      <th>작업번호</th>
                      <th>제조LOT번호</th>
                      <th>설비번호</th>
                      <th>공정번호</th>
                      <th>공정명</th>
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
		              	<!-- 추가된 목록 내용 -->
	                  
		              </tbody>
		            </table>  
		        	</div><!-- /.Table -->
	        	</div><!-- /.col -->
	        </div><!-- /.공정불량 및 입고 목록 -->
        </form><!-- 모달 form -->
      </div><!-- /.modal-body -->
      
      
      <!-- 구분선 -->
      <div class=divBorderModal></div>
      
      <div class="modal-footer">
           <button type="button" class="btn btn-primary" id="registerBtn">등록</button>
           <!-- <button type="button" class="btn btn-danger" id="cancelBtn">취소</button> -->
           <button type="button" class="btn btn-danger" id="cancelBtn" data-dismiss="modal">취소</button>
      </div><!-- /.modal-footer -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal --> 


<!-- 공통 footer 연결 -->
<%@ include file="../includes/footer.jsp" %>
