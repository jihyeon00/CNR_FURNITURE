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
               <div class="col-sm-1 sb-name">제조LOT번호</div>
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
               <div class="col-sm-1 sb-name">공정번호</div>
               <div class="col-sm-2 sb-text">
                 <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
                   value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
               </div>
               <div class="col-sm-1 sb-name">공정명</div>
               <div class="col-sm-2 sb-text">
                 <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
                   value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
               </div>
               <div class="col-sm-1 sb-name">공정위치</div>
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
        <!-- 당일작업등록 버튼 -->
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
                  <td><button id="todatWorkDeleteTd" data-toggle="modal" data-target="#registerFinishedItemOB">삭제</button></td>
                </tr>
              </tbody>
            </table><!-- /.table -->
        </div><!-- /.workTable -->
       </div><!-- /.titleAndTable -->
       
      </div><!-- /.row -->
   	</div><!-- /.container-fluid -->
 	</div><!-- /.content -->
 </div><!-- /.content-wrapper -->
       
  
<!-- 당일작업등록 모달 -->
<div class="modal fade" id="todayWorkInsertModal" aria-labelledby="#todayWorkInsertModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog todayWorkInsert-Modal-Dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="todayWorkInsertModalTitle" id="workDetailModalLabel" style="font-size: 150%; font-weight:800;">당일작업등록</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body todayWorkInsert-modal-body">
     		<!-- 등록행 1 -->
      	<div class="todayWorkInsert-modal-input">
           <div class="col-sm-2 todayWorkInsert-name">제조LOT번호</div>
           <div class="col-sm-2 todayWorkInsert-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
           </div>
           <div class="col-sm-2 todayWorkInsert-name">공정번호</div>
           <div class="col-sm-2 todayWorkInsert-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
           <div class="col-sm-2 todayWorkInsert-name">공정명</div>
           <div class="col-sm-2 todayWorkInsert-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
         </div><!-- /.등록행 1 -->
     		<!-- 등록행 2 -->
      	<div class="todayWorkInsert-modal-input">
           <div class="col-sm-2 todayWorkInsert-name">제조LOT번호</div>
           <div class="col-sm-2 todayWorkInsert-text">
             <input list="workCompanyNameList" class="col-sm-12"  id="workCompanyName" name="workCompanyName">
           </div>
           <div class="col-sm-2 todayWorkInsert-name">공정번호</div>
           <div class="col-sm-2 todayWorkInsert-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
           <div class="col-sm-2 todayWorkInsert-name">공정명</div>
           <div class="col-sm-2 todayWorkInsert-text">
             <input type="text" class="col-sm-12 input-text" id="find_DP_name" name="find_DP_name"
               value='<c:out value="${search.find_DP_name}"/>' autocomplete="off" />
           </div>
         </div><!-- /.등록행 2 -->
     		<!-- 등록행 3 -->
      	<div class="todayWorkInsert-modal-input">
           <div class="col-sm-2 todayWorkInsert-name">제조LOT번호</div>
           <div class="col-sm-2 todayWorkInsert-text">
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
      </div><!-- /.modal-body -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

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

	
</script>
<script defer src="/resources/js/work.js"></script>
<%@ include file="../includes/footer.jsp" %>
