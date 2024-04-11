<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!--날짜 포맷팅-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jQuery 연결 -->
<script defer src="/resources/js/inspectionIB.js"></script>

<!-- 공통 header 연결 -->
<%@ include file="../includes/header.jsp" %>

<div class="content-wrapper">
	<!-- 검색 Form -->
	<form action="/inspectionIB" id="searchInspIB" name="searchInspIB" class="col-md-12" method="get">
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
	     	<!-- 검색행1 -->
	       <div class="inspection-searchBar">
	       	<!-- 자재번호 -->
	         <div class="col-sm-1 inspection-name">자재번호</div>
	         <div class="col-sm-3 inspection-text">
	         	<input type="search" list="matIDList" class="col-sm-12"  id="matID" name="matID" value="${cri.matID}">
	         	<datalist id="matIDList">
	         		<c:forEach items="${matIDList}" var="mat">
								<option value="<c:out value='${mat.matID}' />" 
											<c:if test="${param.matID != null && param.matID == mat.matID}">selected</c:if> >
									<c:out value='${mat.matID}' />
								</option>
							</c:forEach>
	         	</datalist>
	         </div><!-- /.자재번호 -->
	         <!-- 계약번호 -->
	         <div class="col-sm-2 inspection-name">계약번호</div>
	         <div class="col-sm-3 inspection-text">
	         	<input type="search" list="contractIDList" class="col-sm-12" id="contractID" name="contractID" value="${cri.contractID}">
	         	<datalist id="contractIDList">
	         		<c:forEach items="${contractIDList}" var="contractIDs">
								<option value="<c:out value='${contractIDs.contractID}' />" 
											<c:if test="${param.contractID != null && param.contractID == contractIDs.contractID}">selected</c:if> >
									<c:out value='${contractIDs.contractID}' />
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
	         		<option>불량유형1 선택</option>
	            <c:forEach items="${qsDiv1List}" var="qsDiv1s">
	            	<option value="${qsDiv1s.qsDiv1}" ${qsDiv1s.qsDiv1 == cri.qsDiv1 ? 'selected' : ''}>${qsDiv1s.qsDiv1}</option>
							</c:forEach>
	          </select><!-- /.불량유형1 -->
	          &nbsp;
	          <!-- 불량유형2 -->
	          <select class="col-sm-6"  id="qsDiv2" name="qsDiv2">
	            <option value="">불량유형2 선택</option>
	            <c:forEach var="qsDiv2List" items = "${qsDiv2s}">
	            	<option value="${qsDiv2s.qsDiv2}" ${qsDiv2s.qsDiv2 == cri.qsDiv2 ? 'selected' : ''}>${qsDiv2s.qsDiv2}</option>
	            </c:forEach>
	          </select><!-- /.불량유형2 -->
	         </div><!-- /.불량유형 -->
	         <!-- 검사일자 -->
	         <div class="col-sm-2 inspection-name">검사일자<br>(입고일자)</div>
	         <div class="col-sm-3 inspection-text">
	         	<input type="date" class="col-sm-6" id="inspectionDate1" name="inspectionDate1" value="<fmt:formatDate value="${cri.inspectionDate1}" pattern="yyyy-MM-dd" />" />
	         	&nbsp;
	         	<input type="date" class="col-sm-6" id="inspectionDate2" name="inspectionDate2" value="<fmt:formatDate value="${cri.inspectionDate2}" pattern="yyyy-MM-dd" />" />
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
	          <div class="col-sm-3 addIBinspIBBtn">
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
	                  	<td><c:out value="${inspIB.listSeq}" /></td>
	                  	<td><c:out value="${inspIB.matID}" /></td>
	                  	<td><c:out value="${inspIB.matName}" /></td>
	                  	<td><c:out value="${inspIB.matUses}" /></td>
	                  	<td><c:out value="${inspIB.contractID}" /></td>
	                  	<td><c:out value="${inspIB.companyName}" /></td>
	                  	<td><c:out value="${inspIB.units}" /></td>
	                  	<td><c:out value="${inspIB.contractQuantity}" /></td>
	                  	<td><c:out value="${inspIB.inspectionQuantity}" /></td>
	                  	<td><c:out value="${inspIB.qsDiv1}" /></td>
	                  	<td><c:out value="${inspIB.qsDiv2}" /></td>
	                  	<td><c:out value="${inspIB.poorQuantity}" /></td>
	                  	<td><c:out value="${inspIB.defectRate}" /></td>
	                  	<td><c:out value="${inspIB.goodQuantity}" /></td>
	                  	<td><c:out value="${inspIB.inspectionDate}" /></td>
	                  	<td><c:out value="${inspIB.notes}" /></td>
	                  	<td>
	                  		<button type="button" onclick="editRow(${inspIB.listSeq})" style="color:#17a2b8;">
	                  			수정
	                  		</button>
	                  	</td>
	                  	<td>
	                  		<button type="button" onclick="removeRow(${inspIB.listSeq})" style="color:#c82333;">
	                  			삭제
	                  		</button>
	                  	</td>
	                  </tr>
                  </c:forEach>
                  <!-- 추가적인 행들 -->
                </tbody>
              </table>
              <!-- /.table -->
            </div>
          </div><!-- /.col-sm-12 -->
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
