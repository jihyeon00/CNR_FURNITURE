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
            <h1 class="m-0"><i class="far fa-clipboard"></i> 제조수행지시</h1>
          </div><!-- /.col -->
          <div class="col-md-6 ml-auto">
            <div class="pro-btn">
              <button type="button" id="prosearchbtn" class="btn btn-primary">조희</button>
	            <button type="button" id= proaddBtn class="btn btn-default" data-toggle="modal" data-target="#register-Process-Btn">등록</button>
            </div>
          </div><!-- /.col -->
      </div><!-- /.container-fluid -->
    </div>
      <div class="proheaderBar">
        <div class="process1Search">
            <div class="proName">
                <div class="searchProbar">제조LOT번호</div>     
                 <select name="search_process" id="search_process" class="processBox" autocomplete="off">
                    <option selected></option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
              	 </select>
            </div>
            <div class="proType">
                <div class="searchProbar">지시일자</div>
                <input type="date" name="search_proType" id="search_proType" class="processBox" autocomplete="off">
                 <p class="textPro"> ~ </p>
                <input type="date" name="search_proType" id="search_proType" class="processBox" autocomplete="off">
            </div>
            <div class="proPosition">
                <div class="searchProbar">공정번호</div>
				  <select name="search_process" id="search_process" class="processBox" autocomplete="off">
                    <option selected></option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
              	  </select>
            </div>
        </div>
    </div>
    
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <!-- 제조수행테이블 -->
            <div class="ETableName">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="employee">제조수행지시목록</div>
            </div>
            <div class="table ETable">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="tbl-header">
                       <th>NO</th>
                       <th>제조LOT번호</th>
                       <th>공정번호</th>
                       <th>제품번호</th>
                       <th>계획수량</th>
                       <th>생산시작날짜</th>
                       <th>진행사항</th>
                       <th>비고</th>
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
                        <td>8</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                      </tr>
                      <tr>
                         <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
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
  
  
<!-- 등록 모달 -->
<div class="modal fade" id="register-Process-Btn" tabindex="-1" role="dialog" aria-labelledby="registerProcessGridSystemModalLabel">
  <div class="modal-dialog register-Process-Modal-Dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div class="processModalTitle" id="registerProcessGridSystemModalLabel" style="font-size: 150%; font-weight:800;">제조수행지시등록</div>
      </div>
      <div class="modal-body">
					<table class="processtable">
					  <tr>
					    <th scope="col" class="process-highlight">제조LOT번호</th>
					    <th scope="col"  class="process-highlight2">
					        <select name="search_pro" id="process_search_pro1" class="process-select" autocomplete="off">
					          <option selected></option>
					          <option value="1">One</option>
					          <option value="2">Two</option>
					          <option value="3">Three</option>
					        </select>
					    </th>
					    <th scope="col" class="process-highlight">공정번호</th>
					    <th scope="col" class="process-highlight2">
					        <select name="search_machine" id="process_search_machine2" class="process-select" autocomplete="off">
					          <option selected></option>
					          <option value="1">One</option>
					          <option value="2">Two</option>
					          <option value="3">Three</option>
					        </select>
					    </th>
					    <th scope="col" class="process-highlight">제품번호</th>
					    <th scope="col" class="process-highlight2">
					        <select name="search_machine" id="process_search_machine3" class="process-select" autocomplete="off">
					          <option selected></option>
					          <option value="1">One</option>
					          <option value="2">Two</option>
					          <option value="3">Three</option>
					        </select>
					    </th>
					  </tr>
					  <tr>
					  <th scope="col" class="process-highlight">생산시작날짜</th>
					    <td class="process-highlight2"><input type="date" name="search_machineType" id="process_search_machineType" class="process-input-date" autocomplete="off"></td>
					    <th scope="col" class="process-highlight">진행상태</th>
					    <td class="process-highlight2">
					        <select name="search_machine" id="process_search_machine4" class="process-select" autocomplete="off">
					          <option selected></option>
					          <option value="1">One</option>
					          <option value="2">Two</option>
					          <option value="3">Three</option>
					        </select>
					    </td>
					    <th class="process-highlight">계획수량</th>
					    <td class="process-highlight2"><input type="text" name="my_name" size="5" class="process-input-text"></td>
					  </tr>
					  <tr>
					    <th scope="col" class="process-highlight">비고</th>
					    <td colspan="5" class="process-highlight2">><textarea rows="3" cols="83" class="process-textarea"></textarea></td>
					  </tr>
					</table>
      </div>
      <div class="modal-footer">
	        <button type="button" class="btn btn-primary">등록</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


  <!-- 삭제 모달 -->
  <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="myModalLabel">데이터 삭제</h4>
        </div>
        <div class="modal-body">
          <div class="madalUpdate">
            <div class="updateName">정말로 삭제하시겠습니까?</div>
          </div>
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