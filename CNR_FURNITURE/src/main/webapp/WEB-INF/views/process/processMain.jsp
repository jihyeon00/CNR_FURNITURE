<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link rel="stylesheet" href="/resources/css/process.css">
<%@ include file="../includes/header.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-md-6">
            <h1 class="m-0"><i class="far fa-clipboard"></i> 제조지시</h1>
          </div><!-- /.col -->
          <div class="col-md-6 ml-auto">
            <div class="pro-btn">
              <button type="button" id="prosearchbtn" class="btn btn-primary">조희</button>
	            <button type="button" id="proaddBtn" class="btn btn-default" data-toggle="modal" data-target="#myModal" >등록</button>
            </div>
          </div><!-- /.col -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- 검색창 -->
          <div class="col-md-12 prosearchBer">
            <div class="col-sm-1 prosb-name">계획일자</div>
            <div class="col-sm-2 prosb-text">
                <input type="date" class="col-sm-12 sb-text1" id="" name=""/> 
                <p class="textPro"> ~ </p>
                <input type="date" class="col-sm-12 sb-text1" id="" name=""/> 
            </div>
            <div class="col-sm-1 prosb-name">제품번호</div>
              <select class="col-sm-2 prosb-text" aria-label=".form-select-sm example">
                    <option selected></option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
              </select>
            </div>
          <div class="col-md-12">
            <!--제조지시 테이블 -->
            <div class="ETableName">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="process">제조지시목록</div>
            </div>
            <div class="table ETable">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="tbl-header">
                       <th>NO</th>
                       <th>제조LOT번호</th>
                       <th>계약번호</th>
                       <th>계획착수일</th>
                       <th>계획완수일</th>
                       <th>제품번호</th>
                       <th>계획수량</th>
                </thead>
                <tbody class="tbl-content ETable">
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>

                      </tr>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                      </tr>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                      </tr>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                      </tr>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                      </tr>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                      </tr>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                      </tr>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                      </tr>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                      </tr>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                      </tr>
                      <tr>
                        <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                      </tr>
                      <tr>
                          <td>1</td>
                             <td>2</td>
                             <td>3</td>
                             <td>4</td>
                             <td>5</td>
                             <td>6</td>
                             <td>7</td>
                      </tr>
              		 </tbody>
              	</table>
               <!-- /.table -->
	           </div>
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
  
  
  <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">제조지시 등록</h4>
      </div>
      <div class="modal-body">
        <form id="manufacture-form">
 <!--  등록 -->
             <div class="pporBox">                
                    <div class="row pporBox1">
                           <div class="col-md-6">
                         담당자(사원번호)
                         <input type="text" name="" id="" class="form-control1" autocomplete="off">
                      </div>
                      <div class="col-md-6">
                         제품번호
                         <input type="text" name="" id="" class="form-control1" autocomplete="off">
                      </div>      
                    </div>   
                        <div class="row pporBox1">
                           <div class="col-md-6">
                         계약번호
                         <input type="text" name="" id="" class="form-control1" autocomplete="off">
                      </div>
                      <div class="col-md-6">
                          계획수량
                         <input type="text" name="" id="" class="form-control1" autocomplete="off">
                      </div>      
                   </div>
                        <div class="row pporBox2">
                           <div class="col-md-6">
                         계획착수일
                         <input type="date" name="" id="" class="form-control1" autocomplete="off">
                      </div>
                      <div class="col-md-6">
                          계획완수일
                         <input type="date" name="" id="" class="form-control1" autocomplete="off">
                      </div>      
                   </div>                                    
              </div>       
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">등록</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

  

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

<%@ include file="../includes/footer.jsp" %>