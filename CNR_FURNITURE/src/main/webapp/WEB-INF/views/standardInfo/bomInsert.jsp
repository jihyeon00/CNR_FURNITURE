<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="/resources/css/bom.css">
<%@ include file="../includes/header.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-md-6">
            <h1 class="m-0"><i class="far fa-clipboard"></i> BOM 등록</h1>
          </div><!-- /.col -->
          <div class="col-md-6">         
            <div class="resetBtn2">
               <a href="./bomInsert"><img class="resetPng" alt="reset" src="/resources/img/reset.png" ></a>
            </div>
          </div>
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6">
            <!-- BOM 등록 테이블 -->
            <div class="ITableName"></div>
             <!-- BOM 등록 -->
             <div class="bomInsertBox">
               <form id="bomInsert-form">		        	
			        	<div class="row modal-content1">
									<div class="col-md-6">
					          제품 번호
					          <input type="text" name="" id="" class="form-control" autocomplete="off">
			          	</div>
			          	<div class="col-md-6">
					          제품명
					          <input type="text" name="" id="" class="form-control" autocomplete="off">
				          </div>		
			          </div>	
							
								<div class="row modal-content2">
									<div class="col-md-6">
					          자재 번호
					          <input type="text" name="" id="" class="form-control" autocomplete="off">
			          	</div>
			          	<div class="col-md-6">
					          자재명
				          	<input type="text" name="" id="" class="form-control" autocomplete="off">
			          	</div>		
			          </div>
		          	<div class="row modal-content3">
									<div class="col-md-6">
					         자재 단위
					          <input type="text" name="" id="" class="form-control" autocomplete="off">
		          		</div>
			          	<div class="col-md-6">
					          자재 수량
					          <input type="text" name="" id="" class="form-control" autocomplete="off">
				          </div>		
		          	</div>		          				          
	        		</form>
		        		<div class="col-sm-1 ml-auto addLine">
	              	<button type="button" class="btn btn-Primary bomBtn" id="" name="">추가</button>
	           	  </div>
           	</div>

            <div class="table">
            <table cellpadding="0" cellspacing="0" border="0" class="bomInsertTable">
              <thead class="tbl-header">
                <tr>
                  <th>NO</th>
                  <th>제품 번호</th>
                  <th>자재 번호</th>
                  <th>단위</th>
                  <th>수량</th>
                </tr>
              </thead>
              <tbody class="tbl-content">
                <tr>
                  <td>1</td>
                  <td>10000001</td>
                  <td>20000001</td>
                  <td>m</td>
                  <td>1</td>
                </tr>
                 <tr>
                  <td>1</td>
                  <td>10000001</td>
                  <td>20000001</td>
                  <td>m</td>
                  <td>1</td>
                </tr>
                 <tr>
                  <td>1</td>
                  <td>10000001</td>
                  <td>20000001</td>
                  <td>m</td>
                  <td>1</td>
                </tr>           
              </tbody>
            </table>
            <!-- /.table -->
         </div>
	         <div class="insertBom-btn">
		          <button type="button" class="btn btn-primary bomBtn" id="" name="">등록</button>
		          <div style="width: 10px;"></div>    
		          <button type="button" class="btn btn-danger bomBtn" id="" name="">취소</button>
			    </div>
        </div>

          <div class="col-md-6">
            <!-- 제품 목록 테이블 -->
            <div class="ITableName">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div>제품 목록</div>
              <form id='itemSearch' action='./bomInsert' method='get' class="bomSearchBtn"> 
	             	<div class="col-sm-1">
		            	<select>
		            		<option value="">--선택--</option>
						    		<option>제품번호</option>
						    		<option>제품명</option>
		            	</select>
	            	</div>
                <div class="col-sm-1">
	        	      <input type="text" id="" name="" />
	          	  </div> 
		            <div class="col-sm-1">
		              <button type="button" class="btn btn-primary searchItem" id="" name="" >검색</button>
		            </div>
	            </form>
            </div>
            <div class="table" style="height: auto;">
              <table cellpadding="0" cellspacing="0" border="0" class="bomInsertTable">
                <thead class="tbl-header">
                  <tr>
                    <th>NO</th>
                    <th>제품번호</th>
                    <th>제품명</th>
                  </tr>
                </thead>
                <tbody class="tbl-content">
                  <tr>
                    <td>1</td>
                    <td>10000001</td>
                    <td>의자-A</td>
                  </tr>
                </tbody>
              </table>
              <!-- /.table -->
            </div>

            <!-- 매니저 테이블 -->
            <div class="ITableName">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div>자재 목록</div>
              <form id='' action='./bomInsert' method='get' class="bomSearchBtn"> 
	              <div class="col-sm-1">
		            	<select>
		            		<option value="">--선택--</option>
						    		<option>자재번호</option>
						    		<option>자재명</option>
		            	</select>
		            </div>
                <div class="col-sm-1">
	        	      <input type="text" id="" name="" />
	          	  </div>
		            <div class="col-sm-1">
		              <button type="button" class="btn btn-primary searchItem" id="" name="" >검색</button>
		            </div>
	            </form>
            </div>
            <div class="table">
              <table cellpadding="0" cellspacing="0" border="0" class="bomInsertTable">
                <thead class="tbl-header">
                  <tr>
                    <th>NO</th>
                    <th>자재번호</th>
                    <th>자재명</th>
                  </tr>
                </thead>
                <tbody class="tbl-content">
                  <tr>
                    <td>1</td>
                    <td>20000001</td>
                    <td>소나무</td>
                  </tr>
                </tbody>
              </table>
              <!-- /.table -->
            </div>
          </div>
         </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 </div>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

	
<%@ include file="../includes/footer.jsp" %>
