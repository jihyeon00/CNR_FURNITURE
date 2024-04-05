<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!-- jQuery 연결 -->
<script defer src="/resources/js/materialMNG.js"></script>

<!-- 공통 header 연결 -->
<%@ include file="../includes/header.jsp" %>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"><i class="far fa-clipboard"></i>자재출고현황</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main">Home</a></li>
              <li class="breadcrumb-item active">제목</li>
            </ol>
          </div><!-- /.col -->
          <div class="col-md-12">
            <div class="matOB-search-btn">
              <button type="button" class="btn btn-primary">조회</button>
            </div>
        	</div>
        </div><!-- /.row -->
        <!-- 검색 키워드 영역 -->
        <div class="row">
        	<!-- 검색창 -->
          <div class="col-md-12 matOB-searchBar">
          	<!-- 자재번호 -->
            <div class="col-sm-1 matOB-search-title">자재번호</div>
            <div class="col-sm-2 matOB-search-content">
            	<!-- <input type="text" class="col-sm-12" id="" name=""/> -->
            	<select class="col-sm-12" aria-label="Default select example">
            		<option selected>자재번호 선택</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
            	</select>
            </div><!-- /.자재번호 -->
            <!-- 출고일자 -->
            <div class="col-sm-1 matOB-search-title">출고일자</div>
            <div class="col-sm-2 matOB-search-content">
            	<input type="date" class="col-sm-12" id="" name=""/>
            </div><!-- /.출고일자 -->
            <!-- 제조LOT번호 -->
            <!-- <div class="col-sm-1 matOB-search-title">제조LOT번호</div> -->
            <div class="matOB-search-title matOB-LOT-ID">제조LOT번호</div>
            <div class="form-select matOB-search-content matOB-LOT-ID">
            	<!-- <input type="text" class="col-sm-12" id="" name=""/> -->
            	<select class="col-sm-12" aria-label="Default select example">
            		<option selected>제조LOT번호 선택</option>
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
					<div class="matOB-titleAndTable">
						<div class="matOB-title">
							<i class="fa fa-list"></i>
							<span>자재출고현황</span>
						</div>
						<!-- 자재테이블 -->
						<div class="col-sm-9">
							<div class="matOB-table">
								<table cellpadding="0" cellspacing="0" border="0">
									<thead class="matOB-table-header">
										<tr>
											<th>No</th>
											<th>제조LOT번호</th>
											<th>자재번호</th>
											<th>자재명</th>
											<th>출고일자</th>
											<th>출고단위</th>
											<th>출고수량</th>
										</tr>
									</thead>
									<tbody class="matOB-table-content">
										<tr>
											<td>1열</td>
											<td>2열</td>
											<td>3열</td>
											<td>4열</td>
											<td>5열</td>
											<td>6열</td>
											<td>7열</td>
										</tr>
										<tr>
											<td>1열</td>
											<td>2열</td>
											<td>3열</td>
											<td>4열</td>
											<td>5열</td>
											<td>6열</td>
											<td>7열</td>
										</tr>
										<tr>
											<td>1열</td>
											<td>2열</td>
											<td>3열</td>
											<td>4열</td>
											<td>5열</td>
											<td>6열</td>
											<td>7열</td>
										</tr>
										<tr>
											<td>1열</td>
											<td>2열</td>
											<td>3열</td>
											<td>4열</td>
											<td>5열</td>
											<td>6열</td>
											<td>7열</td>
										</tr>
									</tbody>
								</table>
								<!-- /.table -->
							</div>
						</div>
						<!-- /.col-sm-9 -->
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
  
<!-- 공통 footer 연결 -->
<%@ include file="../includes/footer.jsp" %>


