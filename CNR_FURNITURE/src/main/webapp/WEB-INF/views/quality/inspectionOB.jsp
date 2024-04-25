<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- jQuery 연결 -->
<script defer src="/resources/js/quality/inspectionOB.js"></script>

<!-- 공통 header 연결 -->
<%@ include file="../includes/header.jsp" %>



<div class="content-wrapper">


	<!-- 검색 Form -->
	<form action="/M/quality/inspectionOB" id="searchInspOB" name="searchInspOB" class="col-md-12" method="get">
	  <div class="content-header">
	    <div class="container-fluid">
	      <div class="row mb-2">
	        <div class="col-sm-12">
	          <ol class="breadcrumb float-sm-left">
	            <h1 class="m-0"><i class="far fa-clipboard"></i>&nbsp;출하검사관리</h1>
	          </ol>
	          <ol class="breadcrumb float-sm-right">
	            <div class="reset">
	            	<a href="/M/quality/inspectionOB">
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
	         <!-- 제품번호 -->
	         <div class="col-sm-1 inspection-name">제품번호</div>
	         <div class="col-sm-2 inspection-text">
	         	<input type="search" list="productIDList" class="col-sm-12" id="productID" name="productID" value="${cri.productID}">
	         	<datalist id="prodIDList">
	         		<c:forEach items="${prodIDList}" var="prod">
								<option value='${prod.productID}'
                	<c:if test="${cri.productID == prod.productID}">selected</c:if> >${prod.productID}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.제품번호 -->
	         <!-- 제품명 -->
	         <div class="col-sm-1 inspection-name">제품명</div>
	         <div class="col-sm-2 inspection-text">
	         	<input type="search" list="productNmList" class="col-sm-12" id="productName" name="productName" value="${cri.productName}">
	         	<datalist id="prodNameList">
	         		<c:forEach items="${prodNameList}" var="prod">
								<option value='${prod.productName}'
                	<c:if test="${cri.productName == prod.productName}">selected</c:if> >${prod.productName}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.제품명 -->
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
	         	<datalist id="prodIDList">
	         		<c:forEach items="${workIDList}" var="work">
								<option value='${work.workID}'
                	<c:if test="${cri.workID == work.workID}">selected</c:if> >${work.workID}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.작업번호 -->
	         <!-- 공정번호 -->
	         <div class="col-sm-1 inspection-name">공정번호</div>
	         <div class="col-sm-2 inspection-text">
	         	<input type="search" list="processIDList" class="col-sm-12" id="processID" name="processID" value="${cri.processID}">
	         	<datalist id="prodNameList">
	         		<c:forEach items="${processIDList}" var="proc">
								<option value='${proc.processID}'
                	<c:if test="${cri.processID == proc.processID}">selected</c:if> >${proc.processID}
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.공정번호 -->
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
	            <span>출하검사현황</span>
	          </div><!-- /.테이블목록 title -->
	          <!-- 제품불량 등록 버튼 -->
	          <div class="col-sm-3 addInspBtn">
	          	<button type="button" id="" class="btn btn-default search-btn" data-toggle="modal" data-target="#registerOBInspection">
	              <img class="add-circle-icon" alt="add" src="/resources/img/add-circle-outline.svg" >
	              제품불량등록
	            </button>
	          </div><!-- /.제품불량 등록 버튼 -->
          </div><!-- /.inspection-titleAndBtn -->
          <!-- 제품테이블 -->
          <div class="col-sm-12">
            <div class="inspection-table">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="inspection-table-header">
                  <tr>
                    <th>No</th>
                    <th>제품번호</th>
                    <th>제조LOT번호</th>
                    <th>공정번호</th>
                    <th>작업번호</th>
                    <th>제품명</th>
                    <th>제품색상</th>
                    <th>제품규격</th>
                    <th>단위</th>
                    <th>일일총작업수량</th>
                    <th>검사수량</th>
                    <th>불량수량</th>
                    <th>불량률(%)</th>
                    <th>양품수량</th>
                    <th>불량유형1</th>
                    <th>불량유형2</th>
                    <th>불량등록일자</th>
                    <th>비고</th>
                    <th>수정</th>
                  </tr>
                </thead>
                <tbody class="inspection-table-content">
                	<c:forEach var="insp" items="${inspOBList}">
	                  <tr>
	                    <td><fmt:formatNumber value="${insp.listSeq}" pattern="#,##0" /></td>
											<td><fmt:formatNumber value="${insp.productID}" pattern="#,##0" /></td>
											<td><fmt:formatNumber value="${insp.lotID}" pattern="#,##0" /></td>
											<td><fmt:formatNumber value="${insp.processID}" pattern="#,##0" /></td>
											<td><fmt:formatNumber value="${insp.workID}" pattern="#,##0" /></td>
											<td><c:out value="${insp.productName}" /></td>
											<td><c:out value="${insp.productColor}" /></td>
											<td><c:out value="${insp.productStandard}" /></td>
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
											<td style="cursor:pointer; color:#17a2b8; text-align:center;" data-toggle="modal" class="editBtn" id="editBtn" data-qi-id="${insp.qiID}" data-toggle="modal" data-target="#editModal">
												수정
											</td>
											<!-- <td class="remove-processInsp-row" onclick="removeProcessInspRow(this);" style="color:#c82333;">
												삭제
											</td> -->
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


<!-- 출하검사-제품불량등록 모달 -->
<div class="modal fade" id="registerOBInspection" aria-labelledby="#register-OBInspection-ModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="inspectionModalTitle" id="register-OBInspection-ModalLabel" style="font-size: 150%; font-weight:800;">출하검사 - 제품불량등록</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body inspection-modal-body">
      	<form action="/inspectionOB" id="inspOBInsert" name="inspOBInsert" class="col-md-12">
		      <!-- 등록행 1 -->
		      <div class="inspection-modal-board">
		      	<!-- 작업번호 -->
		        <div class="col-sm-2 inspection-modal-name">작업번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input list="contractIDModalList" class="col-sm-12 modal-input" id="workIDForInsertModal" name="workID" value="${cri.workID}">
             	<datalist id="workIDModalList">
               	<c:forEach items="${workIDModalList}" var="workList">
									<option value='${workList.workID}'
									<c:if test="${cri.workID == workList.workID}">selected</c:if> >${workList.workID}
									</option>
						  	</c:forEach>
              </datalist>
		        </div><!-- /.작업번호 -->
		        <div class="col-sm-8 emptyModal"></div>
		      </div><!-- /.등록행 1 -->
		      <!-- 등록행 2 -->
		      <div class="inspection-modal-board">
		      	<!-- 제조LOT번호 -->
		        <div class="col-sm-2 inspection-modal-name">제조LOT번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="lotIDForInsertModal" name="lotID"
              	value='<c:out value="${data.processID}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.제조LOT번호 -->
		        <!-- 공정번호 -->
		        <div class="col-sm-2 inspection-modal-name">공정번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="processIDForInsertModal" name="processID"
              	value='<c:out value="${data.processID}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.공정번호 -->
		        <!-- 제품번호 -->
		        <div class="col-sm-2 inspection-modal-name">제품번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="prodIDForInsertModal" name="productID"
              	value='<c:out value="${data.productID}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.제품번호 -->
		      </div><!-- /.등록행 2 -->
		      <!-- 등록행 3 -->
		      <div class="inspection-modal-board">
		        <!-- 제품명 -->
		        <div class="col-sm-2 inspection-modal-name">제품명</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="prodNameForInsertModal" name="productName"
              	value='<c:out value="${data.productName}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.제품명 -->
		        <!-- 제품색상 -->
		        <div class="col-sm-2 inspection-modal-name">제품색상</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="prodColorForInsertModal" name="productColor"
              	value='<c:out value="${data.productColor}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.제품색상 -->
		        <!-- 제품규격 -->
		        <div class="col-sm-2 inspection-modal-name">제품규격</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="prodStandardForInsertModal" name="productStandard"
              	value='<c:out value="${data.productStandard}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.제품규격 -->
		      </div><!-- /.등록행 3 -->
		      <!-- 등록행 4 -->
		      <div class="inspection-modal-board">
		      	<!-- 단위 -->
		        <div class="col-sm-2 inspection-modal-name">단위</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="unitForInsertModal" name="unit"
              	value='<c:out value="${data.unit}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.단위 -->
		        <!-- 일일총생산수량 -->
		        <div class="col-sm-2 inspection-modal-name">일일총작업수량</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="number" class="col-sm-12 modal-input" id="dailyWorkQuantityForInsertModal" name="dailyWorkQuantity" 
              	value='<c:out value="${data.dailyWorkQuantity}" />' readonly="readonly"/>
		        </div><!-- /.일일총생산수량 -->
		        <!-- 검사수량 -->
		        <div class="col-sm-2 inspection-modal-name">검사수량</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="number" class="col-sm-12" id="inspQuantityForInsertModal" name="inspectionQuantity" />
		        </div><!-- /.검사수량 -->
		      </div><!-- /.등록행 4 -->
		      <!-- 등록행 5 -->
		      <div class="inspection-modal-board">
		      	<!-- 불량유형1 -->
		      	<div class="col-sm-2 inspection-modal-name">불량유형1</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <select class="col-sm-12 modal-input"  id="qsDiv1ForInsertModal" name="qsDiv1">
               	<option value="">불량유형1 선택</option>
             		<c:forEach items="${qsDiv1ModalList}" var="div1List">
                 	<option value='${div1List.qsDiv1}'
                  	<c:if test="${cri.qsDiv1 == div1List.qsDiv1}">selected</c:if> >${div1List.qsDiv1}
                 	</option>
              	</c:forEach>
              </select>
		        </div><!-- /.불량유형1 -->
		        <!-- 불량유형2 -->
		      	<div class="col-sm-2 inspection-modal-name">불량유형2</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <select class="col-sm-12 modal-input"  id="qsDiv2ForInsertModal" name="qsDiv2">
               	<option value="">불량유형1 선택</option>
             		<c:forEach items="${qsDiv2ModalList}" var="div2List">
                 	<option value='${div2List.qsDiv2}'
                  	<c:if test="${cri.qsDiv2 == div2List.qsDiv2}">selected</c:if> >${div2List.qsDiv2}
                 	</option>
              	</c:forEach>
              </select>
		        </div><!-- /.불량유형2 -->
		      	<!-- 불량수량 -->
		        <div class="col-sm-2 inspection-modal-name">불량수량</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="number" class="col-sm-12" id="dftQuantityForInsertModal" name="defectQuantity" />
		        </div><!-- /.불량수량 -->
		      </div><!-- /.등록행 5 -->
		      <!-- 등록행 6 -->
		      <div class="inspection-modal-board">
		      	<!-- 비고 -->
		      	<div class="col-sm-2 inspection-modal-name">비고</div>
		      	<div class="col-sm-10 inspection-modal-text">
		      		<input type="text" class="col-sm-12" id="noteForInsertModal" name="note"/>
		      	</div><!-- /.비고 -->
		      </div><!-- /.등록행 6 -->
		      <!-- 추가버튼 -->
		      <div class="row modal-add-btn">
		      	<div class="col-sm-12 add-insp-btn">
		         	<button type="button" id="addInspectionBtn" class="btn btn-primary add-insp-btn">
		            <svg class="add-circle-icon2" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 2c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm6 13h-5v5h-2v-5h-5v-2h5v-5h2v5h5v2z"/></svg>
		            추가
		          </button>
		        </div><!-- /.추가버튼 -->
	        </div><!-- /.row -->
	        <!-- 제품불량 목록 -->
	        <div class="row newInspList">
	        	<!-- Title -->
	        	<div class="col-sm-6 newInspTitle">
	        		<i class="fa fa-list"></i>
	            <span>제품불량목록</span>
	        	</div><!-- /.Title -->
	        	<!-- Table -->
	        	<div class="col-sm-12">
		        	<div class="inspection-table inspection-modal-table">
		        		<table cellpadding="0" cellspacing="0" border="0">
		            	<thead class="inspection-table-header">
		            		<tr>
		            			<th>No</th>
	                    <th>제품번호</th>
	                    <th>제조LOT번호</th>
	                    <th>공정번호</th>
	                    <th>작업번호</th>
	                    <th>제품명</th>
	                    <th>제품색상</th>
	                    <th>제품규격</th>
	                    <th>단위</th>
	                    <th>일일총작업수량</th>
	                    <th>검사수량</th>
	                    <th>불량수량</th>
	                    <th>불량률(%)</th>
	                    <th>양품수량</th>
	                    <th>불량유형1</th>
	                    <th>불량유형2</th>
	                    <th>불량등록일자</th>
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
	        </div><!-- /.제품불량 목록 -->
        </form><!-- 모달 form -->
      </div><!-- /.modal-body -->
      
      <!-- 구분선 -->
      <div class=divBorderModal></div>
      <div class="modal-footer">
	      <button type="button" class="btn btn-primary" id="registerBtn">등록</button>
	      <button type="button" class="btn btn-danger" id="cancelBtn" data-dismiss="modal">취소</button>
      </div><!-- /.modal-footer -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal --> 



<!-- 출하검사-제품불량수정 모달 -->
<div class="modal fade" id="editModal" aria-labelledby="#update-OBInspection-ModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="inspectionModalTitle" id="update-OBInspection-ModalLabel" style="font-size: 150%; font-weight:800;">출하검사 - 제품불량수정</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body inspection-modal-body">
      	<form action="/inspectionOB" id="updateInspOBForm" name="updateInspOBForm" class="col-md-12">
      		<input type="hidden" id="qiID" name="qiID" value='<c:out value="${data.qiID}"/>' />
		      <!-- 수정행 1 -->
		      <div class="inspection-modal-board">
		      	<!-- 작업번호 -->
		        <div class="col-sm-2 inspection-modal-name">작업번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="editWorkID" name="workID"
              	  value='<c:out value="${data.workID}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.작업번호 -->
		        <div class="col-sm-8 emptyModal"></div>
		      </div><!-- /.수정행 1 -->
		      <!-- 수정행 2 -->
		      <div class="inspection-modal-board">
		      	<!-- 제조LOT번호 -->
		        <div class="col-sm-2 inspection-modal-name">제조LOT번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="editLotID" name="lotID"
              	value='<c:out value="${data.processID}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.제조LOT번호 -->
		        <!-- 공정번호 -->
		        <div class="col-sm-2 inspection-modal-name">공정번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="editProcessID" name="processID"
              	value='<c:out value="${data.processID}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.공정번호 -->
		        <!-- 제품번호 -->
		        <div class="col-sm-2 inspection-modal-name">제품번호</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="editProductID" name="productID"
              	value='<c:out value="${data.productID}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.제품번호 -->
		      </div><!-- /.수정행 2 -->
		      <!-- 수정행 3 -->
		      <div class="inspection-modal-board">
		        <!-- 제품명 -->
		        <div class="col-sm-2 inspection-modal-name">제품명</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="editProductName" name="productName"
              	value='<c:out value="${data.productName}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.제품명 -->
		        <!-- 제품색상 -->
		        <div class="col-sm-2 inspection-modal-name">제품색상</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="editProductColor" name="productColor"
              	value='<c:out value="${data.productColor}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.제품색상 -->
		        <!-- 제품규격 -->
		        <div class="col-sm-2 inspection-modal-name">제품규격</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="editProductStandard" name="productStandard"
              	value='<c:out value="${data.productStandard}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.제품규격 -->
		      </div><!-- /.수정행 3 -->
		      <!-- 수정행 4 -->
		      <div class="inspection-modal-board">
		      	<!-- 단위 -->
		        <div class="col-sm-2 inspection-modal-name">단위</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="editUnit" name="unit"
              	value='<c:out value="${data.unit}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.단위 -->
		        <!-- 일일총생산수량 -->
		        <div class="col-sm-2 inspection-modal-name">일일총작업수량</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="number" class="col-sm-12 modal-input" id="editDailyWorkQuantity" name="dailyWorkQuantity" 
              	value='<c:out value="${data.dailyWorkQuantity}" />' readonly="readonly"/>
		        </div><!-- /.일일총생산수량 -->
		        <!-- 검사수량 -->
		        <div class="col-sm-2 inspection-modal-name">검사수량</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="number" class="col-sm-12 modal-input" id="editInspectionQuantity" name="inspectionQuantity"
               	value='<c:out value="${data.inspectionQuantity}" />' readonly="readonly"/>
		        </div><!-- /.검사수량 -->
		      </div><!-- /.수정행 4 -->
		      <!-- 수정행 5 -->
		      <div class="inspection-modal-board">
		      	<!-- 불량유형1 -->
		      	<div class="col-sm-2 inspection-modal-name">불량유형1</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <select class="col-sm-12 modal-input"  id="editQsDiv1" name="qsDiv1" onchange="updateQsDiv2Options();">
               	<option value="">불량유형1 선택</option>
		            <c:forEach items="${qsDiv1ForEditList}" var="type">
		            	<option value="${type.qsDiv1}"
		            		<c:if test="${type.qsDiv1 == data.qsDiv1}">selected</c:if> />${type.qsDiv1}
	            		</option>
		            </c:forEach>
              </select>
		        </div><!-- /.불량유형1 -->
		        <!-- 불량유형2 -->
		      	<div class="col-sm-2 inspection-modal-name">불량유형2</div>
		        <div class="col-sm-2 inspection-modal-text">
		          <select class="col-sm-12 modal-input"  id="editQsDiv2" name="qsDiv2">
               	<option value="">불량유형2 선택</option>
             		<c:forEach items="${qsDiv2ForEditList}" var="type">
                 	<option value='${type.qsDiv2}'
                  	<c:if test="${type.qsDiv2 == data.qsDiv2}">selected</c:if> />${type.qsDiv2}
                 	</option>
              	</c:forEach>
              </select>
		        </div><!-- /.불량유형2 -->
		      	<!-- 불량수량 -->
		        <div class="col-sm-2 inspection-modal-name">불량수량</div>
		        <div class="col-sm-2 inspection-modal-text">
		        	<input type="number" class="col-sm-12 modal-input" id="editDftQuantity" name="defectQuantity"
               	value='<c:out value="${data.defectQuantity}" />' readonly="readonly"/>
		        </div><!-- /.불량수량 -->
		      </div><!-- /.수정행 5 -->
		      <!-- 수정행 6 -->
		      <div class="inspection-modal-board">
		      	<!-- 비고 -->
		      	<div class="col-sm-2 inspection-modal-name">비고</div>
		      	<div class="col-sm-10 inspection-modal-text">
		      		<input type="text" class="col-sm-12 modal-input" id="editNote" name="note"
           			value='<c:out value="${data.note}" />' />
		      	</div><!-- /.비고 -->
		      </div><!-- /.수정행 6 -->
        </form><!-- 모달 form -->
      </div><!-- /.modal-body -->
      
      <!-- 구분선 -->
      <div class=divBorderModal></div>
      <div class="modal-footer">
	      <button type="button" class="btn btn-primary" id="updateBtn">등록</button>
	      <button type="button" class="btn btn-danger" id="cancelBtn" data-dismiss="modal">취소</button>
      </div><!-- /.modal-footer -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 공통 footer 연결 -->
<%@ include file="../includes/footer.jsp" %>
