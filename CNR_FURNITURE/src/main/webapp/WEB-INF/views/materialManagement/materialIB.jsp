<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- materialIB.css 연결 -->
<link rel="stylesheet" href="/resources/css/materialIB.css">
<!-- 날짜 검색 UI -->
<link href="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.css" rel="stylesheet" />
<!-- 날짜 검색 ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<!-- jQuery 연결 -->
<script defer src="/resources/js/materialIB.js"></script>

<%@ include file="../includes/header.jsp" %>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"><i class="far fa-clipboard"></i>자재입고현황</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main">Home</a></li>
              <li class="breadcrumb-item active">제목</li>
            </ol>
          </div><!-- /.col -->
          <div class="col-md-12">
            <div class="search-btn">
              <button type="button" class="btn btn-primary">조회</button>
            </div>
        	</div>
        </div><!-- /.row -->
        <!-- 검색 키워드 영역 -->
        <div class="row">
        	<!-- 검색창 -->
          <div class="col-md-12 searchBer">
          	<!-- 거래처명 -->
            <div class="col-sm-1 sb-name">거래처명</div>
            <div class="col-sm-2 sb-text">
            	<!-- <input type="text" class="col-sm-12" id="" name=""/> -->
            	<select class="col-sm-12" aria-label="Default select example">
            		<option selected>거래처명 선택</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
            	</select>
            </div><!-- /.거래처명 -->
            <!-- 계약번호 -->
            <div class="col-sm-1 sb-name">계약번호</div>
            <div class="col-sm-2 sb-text">
            	<!-- <input type="text" class="col-sm-12" id="" name=""/> -->
            	<select class="col-sm-12" aria-label="Default select example">
            		<option selected>거래처명 선택</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
            	</select>
            </div>
            <!-- 입고일자 -->
            <div class="col-sm-1 sb-name">입고일자</div>
            <div class="col-sm-2 sb-text">
            	<!-- <input type="text" class="col-sm-12" id="" name=""/> -->
            	<!-- 시작일 -->
            	<input class="form-control shDate" 
	         				type="text" 
	         				id="shDateStart" 
	         				name="shDateStart" 
	         				value="${vo.shDateStart}" 
	         				placeholder="입고일 선택" 
	         				autocomplete="off"
       				/>
       				<!-- 종료일 -->
							<%-- <input class="form-control shDate" 
									type="text" 
									id="shDateEnd" 
									name="shDateEnd" 
									value="${vo.shDateEnd}" 
									placeholder="종료일" 
									autocomplete="off"
							/> --%>
							<!-- <select class="form-select" name="shOptionDate">
								<option value="">::날짜::</option>
								<option value="1">등록일</option>
								<option value="2">수정일</option>
							</select> -->
            </div><!-- /.입고일자 -->
            <!-- 자재번호 -->
            <div class="col-sm-1 sb-name">자재번호</div>
            <div class="col-sm-2 sb-text">
            	<!-- <input type="text" class="col-sm-12" id="" name=""/> -->
            	<select class="col-sm-12" aria-label="Default select example">
            		<option selected>거래처명 선택</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
            	</select>
            </div>
          </div>
				</div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
        <div class="titleAndTable">
	      <div class="title">
	        <i class="fa fa-list"></i>
	        <span>자재입고현황</span>
	      </div>
			  <div class="table">
			    <table cellpadding="0" cellspacing="0" border="0">
			      <thead class="tbl-header">
			        <tr>
			          <th>No</th>
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
			          <th>양품수량(입고수량)</th>
			          <th>검사일자(입고일자)</th>
			          <th>비고</th>
			        </tr>
			      </thead>
			      <tbody class="tbl-content">
			        <tr>
			          <td>1열</td>
			          <td>2열</td>
			          <td>3열</td>
			          <td>4열</td>
			          <td>5열</td>
			          <td>6열</td>
			          <td>7열</td>
			          <td>8열</td>
			          <td>9열</td>
			          <td>10열</td>
			          <td>11열</td>
			          <td>12열</td>
			          <td>13열</td>
			          <td>14열</td>
			          <td>15열</td>
			          <td>16열</td>
			        </tr>
			        
			        <tr>
			          <td>1열</td>
			          <td>2열</td>
			          <td>3열</td>
			          <td>4열</td>
			          <td>5열</td>
			          <td>6열</td>
			          <td>7열</td>
			          <td>8열</td>
			          <td>9열</td>
			          <td>10열</td>
			          <td>11열</td>
			          <td>12열</td>
			          <td>13열</td>
			          <td>14열</td>
			          <td>15열</td>
			          <td>16열</td>
			        </tr>
			        
			        <tr>
			          <td>1열</td>
			          <td>2열</td>
			          <td>3열</td>
			          <td>4열</td>
			          <td>5열</td>
			          <td>6열</td>
			          <td>7열</td>
			          <td>8열</td>
			          <td>9열</td>
			          <td>10열</td>
			          <td>11열</td>
			          <td>12열</td>
			          <td>13열</td>
			          <td>14열</td>
			          <td>15열</td>
			          <td>16열</td>
			        </tr>
			        
			        <tr>
			          <td>1열</td>
			          <td>2열</td>
			          <td>3열</td>
			          <td>4열</td>
			          <td>5열</td>
			          <td>6열</td>
			          <td>7열</td>
			          <td>8열</td>
			          <td>9열</td>
			          <td>10열</td>
			          <td>11열</td>
			          <td>12열</td>
			          <td>13열</td>
			          <td>14열</td>
			          <td>15열</td>
			          <td>16열</td>
			        </tr>
			        
			        <tr>
			          <td>1열</td>
			          <td>2열</td>
			          <td>3열</td>
			          <td>4열</td>
			          <td>5열</td>
			          <td>6열</td>
			          <td>7열</td>
			          <td>8열</td>
			          <td>9열</td>
			          <td>10열</td>
			          <td>11열</td>
			          <td>12열</td>
			          <td>13열</td>
			          <td>14열</td>
			          <td>15열</td>
			          <td>16열</td>
			        </tr>
			        
			        <tr>
			          <td>1열</td>
			          <td>2열</td>
			          <td>3열</td>
			          <td>4열</td>
			          <td>5열</td>
			          <td>6열</td>
			          <td>7열</td>
			          <td>8열</td>
			          <td>9열</td>
			          <td>10열</td>
			          <td>11열</td>
			          <td>12열</td>
			          <td>13열</td>
			          <td>14열</td>
			          <td>15열</td>
			          <td>16열</td>
			        </tr>
			        
			        <tr>
			          <td>1열</td>
			          <td>2열</td>
			          <td>3열</td>
			          <td>4열</td>
			          <td>5열</td>
			          <td>6열</td>
			          <td>7열</td>
			          <td>8열</td>
			          <td>9열</td>
			          <td>10열</td>
			          <td>11열</td>
			          <td>12열</td>
			          <td>13열</td>
			          <td>14열</td>
			          <td>15열</td>
			          <td>16열</td>
			        </tr>
			      </tbody>
			    </table>
			    <!-- /.table -->
			  </div>
	      <!-- /.titleAndTable -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

<%@ include file="../includes/footer.jsp" %>
