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
         <form action="" id="searchForm" class="col-md-12" onSubmit="return false">
	          <div class="col-sm-12" >
	          	<ol class="breadcrumb float-sm-left">
	          		<h1 class="m-0"><i class="far fa-clipboard"></i>당일작업등록</h1>
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
                 <input type="text" list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
                 <datalist id="workCompanyNameList">
                   <c:forEach var="list" items = "${roleList}">
                     <option value='${list.e_ROLE}'
                       <c:if test="${find_Role eq list.e_ROLE}">selected='selected'</c:if> >${list.e_ROLE}
                     </option>
                   </c:forEach>
                  </datalist>
               </div>
               <div class="col-sm-1 sb-name">공정번호</div>
               <div class="col-sm-2 sb-text">
                 <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
                 <datalist id="workCompanyNameList">
                   <c:forEach var="list" items = "${roleList}">
                     <option value='${list.e_ROLE}'
                       <c:if test="${find_Role eq list.e_ROLE}">selected='selected'</c:if> >${list.e_ROLE}
                     </option>
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
	        <!-- 공정조회 Table -->
	        <div class="titleAndTable" id="selectManufacturingPerformInfo" >
	           <div class="workTableTitle">
	              <div class="icon"><i class="fa fa-list"></i></div>
	              <div class="workTableName">공정조회</div>
	            </div>
	          <div class="workTable" style="max-height: 174px">
	            <table cellpadding="0" cellspacing="0" border="0">
	              <thead class="work-tbl-header">
	                <tr>
	                  <th>No</th>
	                  <th>공정번호</th>
	                  <th>공정위치</th>
	                  <th>공정명</th>
	                  <th>설비명</th>
	                  <th>가동여부</th>
	                </tr>
	              </thead>
	              <tbody class="work-tbl-content">
	                <tr>
	                  <td>1</td>
	                  <td>300001</td>
	                  <td>10000001</td>
	                  <td>의자-A</td>
	                  <td>인테리어스케이프</td>
	                  <td>비가동</td>
	                </tr>
	              </tbody>
	            </table><!-- /.table -->
          	</div><!-- /.workTable -->
        </div><!-- /.titleAndTable -->
        <br>
        <!-- 당일작업목록 Table -->
        <div class=divBorder></div>
        <!-- 작업자등록,당일작업등록 버튼 -->
        <div class="col-sm-12 todayWorkInsertBtn" style="margin-top: -20px;">
           <button type="button" id="" class="btn btn-default search-btn" onclick="location.href='workerInsert'"
            style="margin-right: 10px;">
            <img class="add-circle-icon" alt="add" src="/resources/img/add-circle-outline.svg">
            작업자등록
          </button>
           <button type="button" id="" class="btn btn-default search-btn" 
           data-toggle="modal" data-target="#todayWorkInsertModal">
            <img class="add-circle-icon" alt="add" src="/resources/img/add-circle-outline.svg">
            당일작업등록
          </button>
        </div><!-- /.당일작업등록 버튼 -->
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
                  <th>지시일자</th>
                  <th>제조LOT번호</th>
                  <th>공정번호</th>
                  <th>공정위치</th>
                  <th>공정명</th>
                  <th>설비번호</th>
                  <th>설비명</th>
                  <th>제품번호</th>
                  <th>제품명</th>
                  <th>규격</th>
                  <th>기준단위</th>
                  <th>소요시간(분)</th>
                  <th>작업상태</th>
                  <th>계획수량</th>
                  <th>생산수량</th>
                  <th>자재투입</th>
                  <th>작업상세</th>
                  <th>삭제</th>
                </tr>
              </thead>
              <tbody class="work-tbl-content">
                <tr>
                  <td>1</td>
                  <td>2024-04-07</td>
                  <td>300001</td>
                  <td>3001</td>
                  <td>1-1</td>
                  <td>원자재준비</td>
                  <td>6000001</td>
                  <td>재단기1호</td>
                  <td>10000001</td>
                  <td>의자-A</td>
                  <td>?</td>
                  <td>EA</td>
                  <td>1000</td>
                  <td>생산대기</td>
                  <td>1000</td>
                  <td>1000</td>
                  <td><button id="materialInputTd" data-toggle="modal" data-target="#materialInputModal">자재투입</button></td>
                  <td><button id="workDetailTd" data-toggle="modal" data-target="#workDetailModal">작업상세</button></td>
                  <td><button id="todayWorkDeleteTd" data-toggle="modal" data-target="#todayWorkDeleteModal">삭제</button></td>
                </tr>
              </tbody>
            </table><!-- /.table -->
        </div><!-- /.workTable -->
       </div><!-- /.titleAndTable -->
       
      </div><!-- /.row -->
   	</div><!-- /.container-fluid -->
 	</div><!-- /.content -->
 </div><!-- /.content-wrapper -->
       
<!-- 자재투입등록 모달 -->
<div class="modal fade" id="materialInputModal" aria-labelledby="#materialInputModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog materialInput-Modal-Dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="materialInputModalTitle" id="materialInputModalLabel" style="font-size: 150%; font-weight:800;">자재투입등록</div>
      </div>
      <!-- modal-body -->
      <div class="row modal-body work-modal-body">
      	<!-- 데이터 바 -->
      	<div class="materialInputInfoBar">
      		 <div class="col-sm-2 sb-name">제조<br>LOT번호</div>
              <div class="col-sm-2 sb-text">
                <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
                  value='<c:out value="${search.find_DP_name}"/>' readonly="readonly" />
              </div>
              <div class="col-sm-2 sb-name">제품번호</div>
              <div class="col-sm-2 sb-text">
                <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
                  value='<c:out value="${search.find_DP_name}"/>' readonly="readonly" />
              </div>
              <div class="col-sm-2 sb-name">제품명</div>
              <div class="col-sm-2 sb-text">
                <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
                  value='<c:out value="${search.find_DP_name}"/>' readonly="readonly" />
              </div>
            </div><!-- /.materialInputInfoBar -->
            <!-- materialInputInfoBar -->
      	 <div class="materialInputInfoBar" >
	   		 <div class="col-sm-2 sb-name">작업번호</div>
           <div class="col-sm-2 sb-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' readonly="readonly" />
           </div>
           <div class="col-sm-2 sb-name">생산수량</div>
           <div class="col-sm-2 sb-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' readonly="readonly" />
           </div>
           <div class="col-sm-2 sb-name" style="background-color: #fff"></div>
           <div class="col-sm-2 sb-text" >
             <input type="text" class="col-sm-12 workHiddenInput" readonly="readonly" style="cursor: inherit;" />
           </div>
         </div><!-- /.materialInputInfoBar -->
	        <!-- BOM Table -->
	        <div class="titleAndTable" id="workBomSelectTable">
	           <div class="workTableTitle">
	              <div class="icon"><i class="fa fa-list"></i></div>
	              <div class="workTableName">BOM</div>
	              <!-- 자재투입 버튼 -->
				         <button type="button" id="" class="btn btn-default workMaterialInputBtn" onclick="">
				          <img class="add-circle-icon" alt="add" src="/resources/img/add-circle-outline.svg">
				          투입수량입력
				        </button><!-- /.자재투입 버튼 -->
	            </div>
	          <div class="workTable materialInputModalTable">
	            <table cellpadding="0" cellspacing="0" border="0">
	              <thead class="work-tbl-header">
	                <tr>
	                  <th style="width:50px;"><input type='checkbox' name='workBom' value='workBomSelectAll' onclick="workBomSelectAll(this)"/></th>
	                  <th style="width:70px;">No</th>
	                  <th>자재번호</th>
	                  <th>자재명</th>
	                  <th>기준단위</th>
	                  <th>제품 1EA별 투입수량</th>
	                </tr>
	              </thead>
	              <tbody class="work-tbl-content">
	                <tr>
	                  <td><input type='checkbox' name='workBom' value='자재번호'/></td>
	                  <td>1</td>
	                  <td>20000001</td>
	                  <td>소나무 판</td>
	                  <td>EA</td>
	                  <td>20</td>
	                </tr>
	              </tbody>
	            </table><!-- /.table -->
          	</div><!-- /.workTable -->
       	 	</div><!-- /.titleAndTable -->
        
	        <!-- 자재재고현황 Table -->
	        <div class="titleAndTable" id="workMaterialInvSelectTable">
	           <div class="workTableTitle">
	              <div class="icon"><i class="fa fa-list"></i></div>
	              <div class="workTableName">자재재고현황</div>
                <!-- 자재투입 버튼 -->
				         <button type="button" id="" class="btn btn-default workMaterialInputBtn" onclick="">
				          <img class="add-circle-icon" alt="add" src="/resources/img/add-circle-outline.svg">
				          자재투입
				        </button><!-- /.자재투입 버튼 -->
	            </div>
	          <div class="workTable materialInputModalTable">
	            <table cellpadding="0" cellspacing="0" border="0">
	              <thead class="work-tbl-header">
	                <tr>
	                  <th style="width:70px;">No</th>
	                  <th>자재번호</th>
	                  <th>자재명</th>
	                  <th>투입단위</th>
	                  <th>현재고</th>
	                  <th>투입수량</th>
	                </tr>
	              </thead>
	              <tbody class="work-tbl-content">
	                <tr>
	                  <td>11111</td>
	                  <td>20000001</td>
	                  <td>소나무 판</td>
	                  <td>EA</td>
	                  <td>2000</td>
	                  <td id="materialInputModalInputTd"><input type="text" id="materialInputModalInputId"/></td>
	                </tr>
	              </tbody>
	            </table><!-- /.table -->
          	</div><!-- /.workTable -->
        </div><!-- /.titleAndTable -->
      	 <!-- 자재출고현황 Table -->
	        <div class="titleAndTable" id="workMaterialOBSelectTable">
	           <div class="workTableTitle">
	              <div class="icon"><i class="fa fa-list"></i></div>
	              <div class="workTableName">자재출고현황</div>
	            </div>
	          <div class="workTable materialInputModalTable">
	            <table cellpadding="0" cellspacing="0" border="0">
	              <thead class="work-tbl-header">
	                <tr>
	                  <th style="width:70px;">No</th>
	                  <th>자재번호</th>
	                  <th>자재명</th>
	                  <th>투입단위</th>
	                  <th>투입수량</th>
	                  <th>삭제</th>
	                </tr>
	              </thead>
	              <tbody class="work-tbl-content">
	                <tr>
	                  <td>1</td>
	                  <td>20000001</td>
	                  <td>소나무 판</td>
	                  <td>EA</td>
	                  <td>20</td>
	                  <td><button id="workMaterialInputDeleteTd">삭제</button></td>
	                </tr>
	              </tbody>
	            </table><!-- /.table -->
          	</div><!-- /.workTable -->
       	 	</div><!-- /.titleAndTable -->
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
       
  
<!-- 당일작업등록 모달 -->
<div class="modal fade" id="todayWorkInsertModal" aria-labelledby="#todayWorkInsertModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog todayWorkInsert-Modal-Dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="todayWorkInsertModalTitle" id="workDetailModalLabel" style="font-size: 150%; font-weight:800;">당일작업등록</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body work-modal-body">
     		<!-- 등록행 1 -->
      	<div class="work-modal-input">
           <div class="col-sm-2 workModal-name">제조LOT번호</div>
           <div class="col-sm-2 workModal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
           </div>
           <div class="col-sm-2 workModal-name">공정번호</div>
           <div class="col-sm-2 workModal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
           <div class="col-sm-2 workModal-name">설비번호</div>
           <div class="col-sm-2 workModal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
         </div><!-- /.등록행 1 -->
     		<!-- 등록행 2 -->
      	<div class="work-modal-input">
           <div class="col-sm-2 workModal-name">제품번호</div>
           <div class="col-sm-2 workModal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
           </div>
           <div class="col-sm-2 workModal-name">계획수량</div>
           <div class="col-sm-2 workModal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
           <div class="col-sm-2 workModal-name">예상<br>소요시간(분)</div>
           <div class="col-sm-2 workModal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
         </div><!-- /.등록행 2 -->
     		<!-- 등록행 3 -->
      	<div class="work-modal-input">
           <div class="col-sm-2 workModal-name">기준단위</div>
           <div class="col-sm-2 workModal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
           </div>
           <div class="col-sm-8 emptyModal"></div>
         </div><!-- /.등록행 3 -->
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
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
           </div>
           <div class="col-sm-2 workModal-name">공정번호</div>
           <div class="col-sm-2 workModal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
           <div class="col-sm-2 workModal-name">설비번호</div>
           <div class="col-sm-2 workModal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
         </div><!-- /.등록행 1 -->
     		<!-- 등록행 2 -->
      	<div class="work-modal-input">
           <div class="col-sm-2 workModal-name">제품번호</div>
           <div class="col-sm-2 workModal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
           </div>
           <div class="col-sm-2 workModal-name">계획수량</div>
           <div class="col-sm-2 workModal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
           <div class="col-sm-2 workModal-name">예상<br>소요시간(분)</div>
           <div class="col-sm-2 workModal-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
         </div><!-- /.등록행 2 -->
     		<!-- 등록행 3 -->
      	<div class="work-modal-input">
           <div class="col-sm-2 workModal-name">기준단위</div>
           <div class="col-sm-2 workModal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
           </div>
           <div class="col-sm-2 workModal-name">생산수량</div>
           <div class="col-sm-2 workModal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
           </div>
           <div class="col-sm-2 workModal-name">진행상황</div>
           <div class="col-sm-2 workModal-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
           </div>
         </div><!-- /.등록행 3 -->
      </div><!-- /.modal-body -->
      
      <!-- 구분선 -->
      <div class=divBorderModal></div>
      
      
      <div class="modal-footer">
           <button type="button" class="btn btn-primary">저장</button>
           <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div><!-- /.modal-footer -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- 삭제 Modal -->
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
