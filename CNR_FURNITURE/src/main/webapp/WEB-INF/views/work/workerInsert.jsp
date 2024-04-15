<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	          		<h1 class="m-0"><i class="far fa-clipboard"></i>작업자등록</h1>
	          	</ol>
	            <ol class="breadcrumb float-sm-right">
		            <div class="reset">
			        		<img class="resetPng" alt="reset" src="/resources/img/reset.png" >
			        	</div>
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
                         <option value="${processInfo.pi_id}">공정명: ${processInfo.pi_name} | ${processInfo.mi_name}(${processInfo.pi_machine_id}, 위치:${processInfo.position}) </option>
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
				<!-- 당일작업목록 Table -->
	        <div class="titleAndTable" id="selectWorkTable" style="max-height:600px;" >
	           <div class="workTableTitle">
	              <div class="icon"><i class="fa fa-list"></i></div>
	              <div class="workTableName">작업자배치</div>
	            </div>
	          <div class="workSelectTable">
	            <table cellpadding="0" cellspacing="0" border="0">
	              <thead class="work-tbl-header">
	                <tr>
	                  <th>No</th>
	                  <th>작업번호</th>
	                  <th>제조LOT번호</th>
	                  <th>공정번호</th>
	                  <th>작업위치</th>
	                  <th>설비번호</th>
	                  <th>설비명</th>
	                  <th>작업상태</th>
	                  <th>작업자</th>
	                  <th>작업자등록</th>
	                </tr>
	              </thead>
	              <tbody class="work-tbl-content">
	                <tr>
	                  <td>1</td>
	                  <td>1</td>
	                  <td>300001</td>
	                  <td>3001</td>
	                  <td>1-1</td>
	                  <td>6000001</td>
	                  <td>재단기1호</td>
	                  <td>생산대기</td>
	                  <td>100001(ㅁㅁㅁ), 100001(000), 100001(ㄱㄱㄱ)</td>
	                  <td><button id="workerInsertTd" data-toggle="modal" data-target="#workerInsertModal">등록</button></td>
	                </tr>
	              </tbody>
	            </table><!-- /.table -->
	        	</div><!-- /.workTable -->
	       	</div><!-- /.titleAndTable -->
	       	
       		
     	</div><!-- /.row -->
   	</div><!-- /.container-fluid -->
 	</div><!-- /.content -->
 </div><!-- /.content-wrapper -->        
        
<!-- 작업자등록 모달 -->
<div class="modal fade" id="workerInsertModal" aria-labelledby="#workerInsertModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog todayWorkInsert-Modal-Dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="workerInsertModalTitle" id="workerInsertModalLabel" style="font-size: 150%; font-weight:800;">작업자등록</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body workerInsert-modal-body">
     		<!-- 등록행 1 -->
      	<div class="workerInsert-modal-input">
	      	<div class="searchBar">
      			<div class="col-sm-2 sb-name">부서명</div>
            <div class="col-sm-3 sb-text">
              <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
                value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
            </div>
            <div class="col-sm-2 sb-name">사원번호</div>
            <div class="col-sm-3 sb-text">
              <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
                value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
            </div>
            <div class="col-sm-2 sb-text">
							<button type="submit" class="btn btn-primary search-btn"
	                id="" onClick="javascript: search();"><i class="fa-solid fa-magnifying-glass"></i>검색</button>
						</div>
           </div>
         </div><!-- /.등록행 1 -->
     		<!-- 등록행 2 -->
      	<div class="row workerInsert-modal-input">
         <!-- 공정조회 Table -->
         <div class="col-sm-6">
		        <div class="titleAndTable">
		           <div class="workTableTitle">
		              <div class="icon"><i class="fa fa-list"></i></div>
		              <div class="workTableName" >사원목록</div>
		              <i class="far fa-plus-square" id="plus-square"></i>
		            </div>
		          <div class="table" style="max-height: 300px;">
		            <table cellpadding="0" cellspacing="0" border="0">
		              <thead class="tbl-header">
		                <tr>
		                  <th><input type='checkbox' name='member' value='memberSelectAll' onclick="memberSelectAll(this)"/></th>
		                  <th>부서명</th>
		                  <th>사원번호</th>
		                  <th>사원명</th>
		                </tr>
		              </thead>
		              <tbody class="tbl-content" style="height: 42px;">
		                <tr>
		                  <td><input type='checkbox' name='member' value='사원번호'/></td>
		                  <td>생산1팀</td>
		                  <td>10000001</td>
		                  <td>ㅇㅇㅇ</td>
		                </tr>
		                <tr>
		                  <td><input type='checkbox' name='member' value='사원번호'/></td>
		                  <td>생산1팀</td>
		                  <td>10000001</td>
		                  <td>ㅇㅇㅇ</td>
		                </tr>
		              </tbody>
		            </table><!-- /.table -->
	          	</div><!-- /.workTable -->
	        	</div><!-- /.titleAndTable -->
        	</div>
         <div class="col-sm-6" >
		        <div class="titleAndTable">
		           <div class="workTableTitle">
		              <div class="icon"><i class="fa fa-list"></i></div>
		              <div class="workTableName" >작업자목록</div>
		              <i class="fa-regular fa-square-minus" id="minus-spuare"></i>
		            </div>
		          <div class="table" style="max-height: 300px;">
		            <table cellpadding="0" cellspacing="0" border="0">
		              <thead class="tbl-header">
		                <tr>
		                  <th><input type='checkbox' name='worker' value='workerSelectAll' onclick="workerSelectAll(this)"/></th>
		                  <th>부서명</th>
		                  <th>사원번호</th>
		                  <th>사원명</th>
		                </tr>
		              </thead>
		              <tbody class="tbl-content" style="height: 42px;">
		                <tr>
		                  <td><input type='checkbox' name='worker' value='사원번호'/></td>
		                  <td>생산1팀</td>
		                  <td>10000001</td>
		                  <td>ㅇㅇㅇ</td>
		                </tr>
		              </tbody>
		            </table><!-- /.table -->
	          	</div><!-- /.workTable -->
	        	</div><!-- /.titleAndTable -->
        	</div>
        
        </div><!-- /.등록행 2 -->
     		<!-- 등록행 3 -->
      	<div class="workerInsert-modal-input">
		         
		         
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
</div>

<!-- 자재투입 모달 -->
<div class="modal fade" id="materialInputModal" aria-labelledby="#materialInputModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog materialInput-Modal-Dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="materialInputModalTitle" id="materialInputModalLabel" style="font-size: 150%; font-weight:800;">자재투입등록</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body materialInput-modal-body">
         <!-- 등록행 1 -->
         <ul class="materialInput-board">
            <!-- 계약번호 -->
            <li class="modal-subTitle">계약번호</li>
            <li class="col-sm-3 modal-subContent">
               <select class="col-sm-12" name="" id="">
                  <option selected>계약번호 선택</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
               </select>
            </li><!-- /.계약번호 -->
            <!-- 거래처명 -->
            <li class="modal-subTitle">거래처명</li>
            <li class="col-sm-3 modal-subContent">
               <input type="text" class="col-sm-12" id="" name="" readonly="readonly"/>
            </li><!-- /.거래처명 -->
         </ul><!-- /.등록행 1 -->
         <!-- 등록행 2 -->
         <ul class="materialInput-board">
            <!-- 제품명 -->
            <li class="modal-subTitle first-col">제품명</li>
            <li class="col-sm-3 modal-subContent">
               <input type="text" class="col-sm-12" id="" name="" readonly="readonly"/>
            </li><!-- /.제품명 -->
            <!-- 제품규격 -->
            <li class="modal-subTitle">제품규격</li>
            <li class="col-sm-3 modal-subContent">
               <input type="text" class="col-sm-12" id="" name="" readonly="readonly"/>
            </li><!-- /.제품규격 -->
         </ul><!-- /.등록행 2 -->
         <!-- 등록행 3 -->
         <ul class="materialInput-board">
            <!-- 출고일자 -->
            <li class="modal-subTitle">출고일자</li>
            <li class="col-sm-3 modal-subContent">
               <input type="date" class="col-sm-12" id="" name=""/>
              </li><!-- /.출고일자 -->
              <!-- 출고단위 -->
              <li class="modal-subTitle">출고단위</li>
              <li class="col-sm-3 modal-subContent">
                 <input type="text" class="col-sm-12" id="" name=""/>
              </li><!-- /.출고단위 -->
              <!-- 출고수량 -->
              <li class="modal-subTitle">출고수량</li>
              <li class="col-sm-2 modal-subContent">
                 <input type="number" class="col-sm-12" id="" name=""/>
              </li><!-- /.출고수량 -->
         </ul><!-- /.등록행 3 -->
      </div><!-- /.modal-body -->
      <div class="modal-footer">
           <button type="button" class="btn btn-primary">등록</button>
           <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div><!-- /.modal-body -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 당일작업상세 모달 -->
<div class="modal fade" id="workDetailModal" aria-labelledby="#workDetailModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog workDetail-Modal-Dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="workDetailModalTitle" id="workDetailModalLabel" style="font-size: 150%; font-weight:800;">당일작업상세</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body workDetail-modal-body">
         <!-- 등록행 1 -->
         <ul class="workDetail-board">
            <!-- 계약번호 -->
            <li class="modal-subTitle">계약번호</li>
            <li class="col-sm-3 modal-subContent">
               <select class="col-sm-12" name="" id="">
                  <option selected>계약번호 선택</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
               </select>
            </li><!-- /.계약번호 -->
            <!-- 거래처명 -->
            <li class="modal-subTitle">거래처명</li>
            <li class="col-sm-3 modal-subContent">
               <input type="text" class="col-sm-12" id="" name="" readonly="readonly"/>
            </li><!-- /.거래처명 -->
         </ul><!-- /.등록행 1 -->
         <!-- 등록행 2 -->
         <ul class="workDetail-board">
            <!-- 제품명 -->
            <li class="modal-subTitle first-col">제품명</li>
            <li class="col-sm-3 modal-subContent">
               <input type="text" class="col-sm-12" id="" name="" readonly="readonly"/>
            </li><!-- /.제품명 -->
            <!-- 제품규격 -->
            <li class="modal-subTitle">제품규격</li>
            <li class="col-sm-3 modal-subContent">
               <input type="text" class="col-sm-12" id="" name="" readonly="readonly"/>
            </li><!-- /.제품규격 -->
         </ul><!-- /.등록행 2 -->
         <!-- 등록행 3 -->
         <ul class="workDetail-board">
            <!-- 출고일자 -->
            <li class="modal-subTitle">출고일자</li>
            <li class="col-sm-3 modal-subContent">
               <input type="date" class="col-sm-12" id="" name=""/>
              </li><!-- /.출고일자 -->
              <!-- 출고단위 -->
              <li class="modal-subTitle">출고단위</li>
              <li class="col-sm-3 modal-subContent">
                 <input type="text" class="col-sm-12" id="" name=""/>
              </li><!-- /.출고단위 -->
              <!-- 출고수량 -->
              <li class="modal-subTitle">출고수량</li>
              <li class="col-sm-2 modal-subContent">
                 <input type="number" class="col-sm-12" id="" name=""/>
              </li><!-- /.출고수량 -->
         </ul><!-- /.등록행 3 -->
      </div><!-- /.modal-body -->
      <div class="modal-footer">
           <button type="button" class="btn btn-primary">등록</button>
           <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div><!-- /.modal-body -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

  
<script type="text/javascript">
//검색창
function search() {
 	// 검색 로직 실행
	document.getElementById('searchForm').submit();
}
// 작업자 등록의 사원목록 체크박스 전체 선택
function memberSelectAll(memberSelectAll)  {
  const memberCheckboxes 
       = document.getElementsByName('member');
  
  memberCheckboxes.forEach((memberCheckbox) => {
    memberCheckbox.checked = memberSelectAll.checked;
  })
}
// 작업자 등록의 작업자목록 체크박스 전체 선택
function workerSelectAll(workerSelectAll)  {
  const workerCheckboxes 
       = document.getElementsByName('worker');
  
  workerCheckboxes.forEach((workerCheckbox) => {
    workerCheckbox.checked = workerSelectAll.checked;
  })
}
	
</script>
<script defer src="/resources/js/work.js"></script>
<%@ include file="../includes/footer.jsp" %>
