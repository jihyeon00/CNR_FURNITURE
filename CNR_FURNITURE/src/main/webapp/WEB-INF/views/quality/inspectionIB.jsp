<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- 포맷팅 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jQuery 연결 -->
<script defer src="/resources/js/quality/inspectionIB.js"></script>

<!-- 공통 header 연결 -->
<%@ include file="../includes/header.jsp" %>

<div class="content-wrapper">
	<!-- 검색 Form -->
	<form action="/quality/inspectionIB" id="searchInspIB" name="searchInspIB" class="col-md-12" method="get">
	  <div class="content-header">
	    <div class="container-fluid">
	      <div class="row mb-2">
	        <div class="col-sm-12">
	          <ol class="breadcrumb float-sm-left">
	            <h1 class="m-0"><i class="far fa-clipboard"></i>&nbsp;수입검사관리</h1>
	          </ol>
	          <ol class="breadcrumb float-sm-right">
	            <div class="reset">
	            	<a href="/inspectionIB">
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
	       	<!-- 자재번호 -->
	         <div class="col-sm-1 inspection-name">자재번호</div>
	         <div class="col-sm-3 inspection-text">
	         	<input type="search" list="matIDList" class="col-sm-12"  id="matID" name="matID" value="${cri.matID}">
	         	<datalist id="matIDList">
	         		<c:forEach items="${matIDList}" var="mat">
								<option value='${mat.matID}'
                	<c:if test="${cri.matID == mat.matID}">selected</c:if> >${mat.matID}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.자재번호 -->
	         <!-- 계약번호 -->
	         <div class="col-sm-2 inspection-name">계약번호</div>
	         <div class="col-sm-3 inspection-text">
	         	<input type="search" list="contractIDList" class="col-sm-12" id="contractID" name="contractID" value="${cri.contractID}">
	         	<datalist id="contractIDList">
	         		<c:forEach items="${contractIDList}" var="contract">
								<option value='${contract.contractID}'
                	<c:if test="${cri.contractID == contract.contractID}">selected</c:if> >${contract.contractID}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.계약번호 -->
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
	         <!-- 검사일자 -->
	         <div class="col-sm-2 inspection-name">검사일자<br>(입고일자)</div>
	         <div class="col-sm-3 inspection-text">
	         	<input type="date" class="col-sm-6" id="inspectionDate1" name="inspectionDate1" value='${cri.inspectionDate1}' />
	         	&nbsp;
	         	<input type="date" class="col-sm-6" id="inspectionDate2" name="inspectionDate2" value='${cri.inspectionDate2}' />
	         </div><!-- /.검사일자 -->
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
	            <span>수입검사현황</span>
	          </div><!-- /.테이블목록 title -->
	          <!-- 자재불량 등록 버튼 -->
	          <div class="col-sm-3 addInspBtn">
	          	<button type="button" id="" class="btn btn-default search-btn" data-toggle="modal" data-target="#registerIBInspection">
	              <img class="add-circle-icon" alt="add" src="/resources/img/add-circle-outline.svg" >
	              자재불량등록
	            </button>
	          </div><!-- /.자재불량 등록 버튼 -->
          </div><!-- /.inspection-titleAndBtn -->
          <!-- 제품테이블 -->
          <div class="row"></div>
          <div class="col-sm-12">
            <div class="inspection-table">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="inspection-table-header">
                  <tr>
                    <th>No</th>
                    <!-- <th>검사번호</th> -->
                    <th>자재번호</th>
                    <th>자재명</th>
                    <th>자재용도</th>
                    <th>계약번호</th>
                    <th>거래처명</th>
                    <th>단위</th>
                    <th>계약입고수량</th>
                    <th>검사수량<br>(입고수량)</th>
                    <th>불량유형1</th>
                    <th>불량유형2</th>
                    <th>불량수량</th>
                    <th>불량률(%)</th>
                    <th>양품수량</th>
                    <th>검사일자<br>(입고일자)</th>
                    <th>비고</th>
                    <th>수정</th>
                  </tr>
                </thead>
                <tbody class="inspection-table-content">
                	<c:forEach var="inspIB" items="${inspIBList}">
	                  <tr>
	                  	<td class="id"><fmt:formatNumber value="${inspIB.listSeq}" pattern="#,##0" /></td>
	                  	<td><fmt:formatNumber value="${inspIB.matID}" pattern="#,##0" /></td>
	                  	<td><c:out value="${inspIB.matName}" /></td>
	                  	<td><c:out value="${inspIB.matUses}" /></td>
	                  	<td><fmt:formatNumber value="${inspIB.contractID}" pattern="#,##0" /></td>
	                  	<td><c:out value="${inspIB.companyName}" /></td>
	                  	<td><c:out value="${inspIB.units}" /></td>
	                  	<td><fmt:formatNumber value="${inspIB.contractQuantity}" pattern="#,##0" /></td>
	                  	<td><fmt:formatNumber value="${inspIB.inspectionQuantity}" pattern="#,##0" /></td>
	                  	<td><c:out value="${inspIB.qsDiv1}" /></td>
	                  	<td><c:out value="${inspIB.qsDiv2}" /></td>
	                  	<td><fmt:formatNumber value="${inspIB.poorQuantity}" pattern="#,##0" /></td>
	                  	<td><fmt:formatNumber value="${inspIB.defectRate}" pattern="#,###0.000"/></td>
	                  	<td><fmt:formatNumber value="${inspIB.goodQuantity}" pattern="#,##0" /></td>
	                  	<td><c:out value="${inspIB.formattedInspectionDate}" /></td>
	                  	<td><c:out value="${inspIB.notes}" /></td>
	                  	<td style="cursor:pointer; color:#17a2b8; text-align:center;" data-toggle="modal" class="editBtn" id="editBtn" data-qi-id="${inspIB.qiID}" data-toggle="modal" data-target="#editModal">
                  			수정
	                  	</td>
	                  </tr>
                  </c:forEach>
                  <!-- 추가적인 행들 -->
                </tbody>
              </table>
            </div><!-- /.table -->
          </div><!-- /.col-sm-12 -->
        </div><!-- /.col-sm-12 -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div><!-- /.content -->
</div><!-- /.content-wrapper -->


<!-- 수입검사-자재불량 및 입고등록 모달 -->
<div class="modal fade" id="registerIBInspection" aria-labelledby="#register-IBInspection-ModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="inspIBModalTitle" id="register-IBInspection-ModalLabel" style="font-size: 150%; font-weight:800;">수입검사 - 자재불량 및 입고등록</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body inspection-modal-body">
      	<form action="/inspectionIB" id="inspIBInsert" name="inspIBInsert" class="col-md-12" >
      		<!-- 등록행 1 -->
		      <div class="inspection-modal-board">
		      	<!-- 계약번호 -->
		        <div class="col-sm-2 inspection-modal-name">계약번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input list="contractIDModalList" class="col-sm-12 modal-input" id="contractIDModal" name="contractIDModal" value="${data.contractIDModal}">
		         	<datalist id="contractIDModalList">
		         		<c:forEach items="${contractIDModalList}" var="ctModalList">
									<option value='${ctModalList.contractIDModal}'
                		<c:if test="${data.contractIDModal == ctModalList.contractIDModal}">selected</c:if> >${ctModalList.contractIDModal}
									</option>
								</c:forEach>
		         	</datalist>
		        </div><!-- /.계약번호 -->
		        <!-- 거래처명 -->
		        <div class="col-sm-2 inspection-modal-name">거래처명</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="text" class="col-sm-12 modal-input" id="companyNameModal" name="companyNameModal"
		            value='<c:out value="${data.companyNameModal}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.거래처명 -->
		        <!-- 단위 -->
		        <div class="col-sm-2 inspection-modal-name">단위</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="text" class="col-sm-12 modal-input" id="unitModal" name="unitModal"
		            value='<c:out value="${data.unitModal}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.단위 -->
		      </div><!-- /.등록행 1 -->
		      <!-- 등록행 2 -->
		      <div class="inspection-modal-board">
		      	<!-- 자재번호 -->
		        <div class="col-sm-2 inspection-modal-name">자재번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="matIDModal" name="matIDModal"
	            	value='<c:out value="${data.matIDModal}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.자재번호 -->
		        <!-- 자재명 -->
		        <div class="col-sm-2 inspection-modal-name">자재명</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="text" class="col-sm-12 modal-input" id="matNameModal" name="matNameModal"
		            value='<c:out value="${data.matNameModal}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.자재명 -->
		        <!-- 자재용도 -->
		        <div class="col-sm-2 inspection-modal-name">자재용도</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="matUsesModal" name="matUsesModal" readonly="readonly" />
		        </div><!-- /.자재용도 -->
		      </div><!-- /.등록행 2 -->
		      <!-- 등록행 3 -->
		      <div class="inspection-modal-board">
		        <!-- 계약입고수량 -->
		        <div class="col-sm-2 inspection-modal-name">계약입고수량</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="number" class="col-sm-12 modal-input" id="contractQuantityModal" name="contractQuantityModal" 
		          	value='<c:out value="${data.contractQuantityModal}" />' readonly="readonly"/>
		        </div><!-- /.계약입고수량 -->
		        <!-- 검사수량 -->
		        <div class="col-sm-2 inspection-modal-name">검사수량<br>(입고수량)</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="number" class="col-sm-12 modal-input" id="inspectionQuantityModal" name="inspectionQuantityModal" />
		        </div><!-- /.검사수량 -->
		        <!-- 불량수량 -->
		        <div class="col-sm-2 inspection-modal-name">불량수량</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="number" class="col-sm-12 modal-input" id="poorQuantityModal" name="poorQuantityModal" />
		        </div><!-- /.불량수량 -->
		      </div><!-- /.등록행 3 -->
		      <!-- 등록행 4 -->
		      <div class="inspection-modal-board">
		      	<!-- 불량유형1 -->
		        <div class="col-sm-2 inspection-modal-name">불량유형1</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<select class="col-sm-12 modal-input"  id="qsDiv1Modal" name="qsDiv1Modal">
		         		<option value="">불량유형1 선택</option>
		         		<c:forEach items="${qsDiv1ModalList}" var="qsDiv1Modals">
							    <option value='${qsDiv1Modals.qsDiv1Modal}'
			            	<c:if test="${cri.qsDiv1Modal == qsDiv1Modals.qsDiv1Modal}">selected</c:if> >${qsDiv1Modals.qsDiv1Modal}
							    </option>
							  </c:forEach>
		          </select>
		        </div><!-- /.불량유형1 -->
		        <!-- 불량유형2 -->
		        <div class="col-sm-2 inspection-modal-name">불량유형2</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<select class="col-sm-12 modal-input"  id="qsDiv2Modal" name="qsDiv2Modal">
		            <option value="">불량유형2 선택</option>
		            <c:forEach items="${qsDiv2ModalList}" var="qsDiv2Modals">
							    <option value='${qsDiv2Modals.qsDiv2Modal}'
							    	<c:if test="${cri.qsDiv2Modal == qsDiv2Modals.qsDiv2Modal}">selected</c:if> >${qsDiv2Modals.qsDiv2Modal}
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
		      		<input type="text" class="col-sm-12 modal-input" id="notesModal" name="notesModal"/>
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
	        <!-- 자재불량 및 입고 목록 -->
	        <div class="row newInspList">
	        	<!-- Title -->
	        	<div class="col-sm-6 newInspTitle">
	        		<i class="fa fa-list"></i>
	            <span>자재불량목록</span>
	        	</div><!-- /.Title -->
	        	<!-- Table -->
	        	<div class="col-sm-12">
		        	<div class="inspection-table inspection-modal-table">
		        		<table cellpadding="0" cellspacing="0" border="0">
		            	<thead class="inspection-table-header">
		            		<tr>
		            			<th>No</th>
		                  <th>자재번호</th>
		                  <th>자재명</th>
		                  <th>자재용도</th>
		                  <th>계약번호</th>
		                  <th>거래처명</th>
		                  <th>단위</th>
		                  <th>계약입고수량</th>
		                  <th>검사수량<br>(입고수량)</th>
		                  <th>불량유형1</th>
		                  <th>불량유형2</th>
		                  <th>불량수량</th>
		                  <th>불량률(%)</th>
		                  <th>양품수량</th>
		                  <th>검사일자<br>(입고일자)</th>
		                  <th>비고</th>
		                  <th>삭제</th>
		            		</tr>
		              </thead>
		              <tbody class="inspection-table-content">
		              	<!-- 추가된 목록 내용 -->
	                  
		              </tbody>
		            </table>  
		        	</div><!-- /.Table -->
	        	</div><!-- /.col -->
	        </div><!-- /.자재불량 및 입고 목록 -->
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


<!-- 수입검사- 수정 모달 -->
<div class="modal fade" id="editModal" aria-labelledby="#update-IBInspection-ModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="inspIBModalTitle" id="update-IBInspection-ModalLabel" style="font-size: 150%; font-weight:800;">수입검사 - 자재불량 및 입고 수정</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body inspection-modal-body">
      	<form action="/inspectionIB/update" id="updateInspIBForm" name="updateInspIBForm" class="col-md-12" method="post" >
      		<input type="hidden" id="qiID" name="qiID" value='<c:out value="${data.qiID}"/>' />
      		<!-- 수정행 1 -->
		      <div class="inspection-modal-board">
		      	<!-- 계약번호 -->
		        <div class="col-sm-2 inspection-modal-name">계약번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="editContractID" name="contractID"
		        		value='<c:out value="${data.editContractID}"/>' readonly="readonly"/>
		        </div><!-- /.계약번호 -->
		        <!-- 거래처명 -->
		        <div class="col-sm-2 inspection-modal-name">거래처명</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="text" class="col-sm-12 modal-input" id="editCompanyName" name="companyName"
		            value='<c:out value="${data.editCompanyName}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.거래처명 -->
		        <!-- 단위 -->
		        <div class="col-sm-2 inspection-modal-name">단위</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="text" class="col-sm-12 modal-input" id="editUnits" name="units"
		            value='<c:out value="${data.editUnit}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.단위 -->
		      </div><!-- /.등록행 1 -->
		      <!-- 수정행 2 -->
		      <div class="inspection-modal-board">
		      	<!-- 자재번호 -->
		        <div class="col-sm-2 inspection-modal-name">자재번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="editMatID" name="matID"
	            	value='<c:out value="${data.editMatID}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.자재번호 -->
		        <!-- 자재명 -->
		        <div class="col-sm-2 inspection-modal-name">자재명</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="text" class="col-sm-12 modal-input" id="editMatName" name="matName"
		            value='<c:out value="${data.editMatName}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.자재명 -->
		        <!-- 자재용도 -->
		        <div class="col-sm-2 inspection-modal-name">자재용도</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="editMatUses" name="matUses" readonly="readonly" />
		        </div><!-- /.자재용도 -->
		      </div><!-- /.등록행 2 -->
		      <!-- 수정행 3 -->
		      <div class="inspection-modal-board">
		        <!-- 계약입고수량 -->
		        <div class="col-sm-2 inspection-modal-name">계약입고수량</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="number" class="col-sm-12 modal-input" id="editContractQuantity" name="contractQuantity" 
		          	value='<c:out value="${data.editContractQuantity}" />' readonly="readonly"/>
		        </div><!-- /.계약입고수량 -->
		        <!-- 검사수량 -->
		        <div class="col-sm-2 inspection-modal-name">검사수량<br>(입고수량)</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="number" class="col-sm-12 modal-input" id="editInspectionQuantity" name="inspectionQuantity" readonly="readonly"/>
		        </div><!-- /.검사수량 -->
		        <!-- 불량수량 -->
		        <div class="col-sm-2 inspection-modal-name">불량수량</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <input type="number" class="col-sm-12 modal-input" id="editPoorQuantity" name="poorQuantity" readonly="readonly" />
		        </div><!-- /.불량수량 -->
		      </div><!-- /.등록행 3 -->
		      <!-- 수정행 4 -->
		      <div class="inspection-modal-board">
		      	<!-- 불량유형1 -->
		        <div class="col-sm-2 inspection-modal-name">불량유형1</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<!-- <input type="text" class="col-sm-12 modal-input" id="editQsDiv1" name="editQsDiv1" readonly="readonly" /> -->
		        	<select class="col-sm-12 modal-input"  id="editQsDiv1" name="qsDiv1" onchange="updateQsDiv2Options();">
		            <option value="">불량유형1 선택</option>
		            <c:forEach items="${qsDiv1List}" var="type">
		            	<option value="${type.qsDiv1}"
		            		<c:if test="${type.qsDiv1 == data.qsDiv1}">selected</c:if> />${type.qsDiv1}
	            		</option>
		            </c:forEach>
		          </select>
		        </div><!-- /.불량유형1 -->
		        <!-- 불량유형2 -->
		        <div class="col-sm-2 inspection-modal-name">불량유형2</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<!-- <input type="text" class="col-sm-12 modal-input" id="editQsDiv2" name="editQsDiv2" readonly="readonly" /> -->
		        	<select class="col-sm-12 modal-input"  id="editQsDiv2" name="qsDiv2">
		        		<option value="">불량유형2 선택</option>
		        		<c:forEach items="${qsDiv2List}" var="type">
		            	<option value="${type.qsDiv2}"
		            		<c:if test="${type.qsDiv2 == data.qsDiv2}">selected</c:if> />${type.qsDiv2}
	            		</option>
		            </c:forEach>
		          </select>
		        </div><!-- /.불량유형2 -->
		        <div class="col-sm-4 emptyModal"></div>
		      </div><!-- /.등록행 4 -->
		      <!-- 수정행 5 -->
		      <div class="inspection-modal-board">
		      	<!-- 비고 -->
		      	<div class="col-sm-2 inspection-modal-name">비고</div>
		      	<div class="col-sm-10 inspection-modal-text">
		      		<input type="text" class="col-sm-12 modal-input" id="editNotes" name="notes"/>
		      	</div><!-- /.비고 -->
		      </div><!-- /.등록행 5 -->
	      </div><!-- /.modal-body -->
      </form><!-- 모달 form -->
      
      <!-- 구분선 -->
      <div class=divBorderModal></div>
      
      <div class="modal-footer">
           <button type="button" class="btn btn-primary updateBtn" id="updateBtn">등록</button>
           <!-- <button type="button" class="btn btn-danger" id="cancelBtn">취소</button> -->
           <button type="button" class="btn btn-danger" id="cancelBtn" data-dismiss="modal">취소</button>
      </div><!-- /.modal-footer -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.수정 modal --> 

<!-- 공통 footer 연결 -->
<%@ include file="../includes/footer.jsp" %>
