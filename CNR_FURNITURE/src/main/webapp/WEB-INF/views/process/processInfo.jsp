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
            <h1 class="m-0"><i class="far fa-clipboard"></i> 공정정보</h1>
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
                <input type="search" name="search_proType" id="search_proType" class="processBox" autocomplete="off">
            </div>
            <div class="proType">
                <div class="searchProbar">지시일자</div>
                <input type="search" name="search_proType" id="search_proType" class="processBox" autocomplete="off">
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
              <div class="employee">공정정보목록</div>
            </div>
            <div class="table ETable">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="tbl-headerPro">
                       <th>NO</th>
                       <th>공정번호</th>
                       <th>공정명번호</th>
                       <th>공정위치번호</th>
                       <th>설비번호</th>

                </thead>
                <tbody class="tbl-content ProTable">
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                      </tr>
                      <tr>
                         <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
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
  
  <%@ include file="../includes/footer.jsp" %>
  
<!-- 등록 모달 -->
<div class="modal fade" id="register-Process-Btn" tabindex="-1" role="dialog" aria-labelledby="registerProcessGridSystemModalLabel">
  <div class="modal-dialog register-Process-Modal-Dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div class="processModalTitle" id="registerProcessGridSystemModalLabel" style="font-size: 150%; font-weight:800;">공정정보등록</div>
      </div>
      <div class="modal-body1">
        <div class="row">
          <div class="col-md-12">
            <div class="processModal">
              <div class="processModalBody">
                <table class="processtablegubun">
                  <tr>
                    <th class ="proTh">공정번호</th>
                    <td class ="proTd"><input type="text" class="processInput"></td>
                    <th class ="proTh">공정명</th>
                    <td class ="proTd"><input type="text" class="processInput"></td>
                    <th class ="proTh">공정위치</th>
                    <td class ="proTd"><input type="text" class="processInput"></td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          
          <div class="InnputBody">
            <div class="inputmedle"><input type="text" class="processSearchInput"></div>
            <div class="inputmedle1"><button type="button" id="prosearchbtn" class="btn btn-primary sInput">조희</button></div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-5 maginPro">
            <!-- 설비목록 테이블 -->
            <div class="ETableTitle">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="employee">설비목록</div>
              <div class="procexxIcon"><button style="border-style: gray;"><i class="fa fa-fw fa-plus"></i></button></div>             
            </div>
            <div class="table DTable">
              <table cellpadding="0" cellspacing="0" border="0">
                <colgroup>
                  <col style="width: 5%" />
                  <col style="width: 10%" />
                  <col style="width: 10%" />
                  <col style="width: 10%" />
                </colgroup>
                <thead class="tbl-headerPro">
                  <tr>
                    <th></th>
                    <th>설비번호</th>
                    <th>설비명</th>
                    <th>설비유형</th>
                  </tr>
                </thead>
                <tbody class="tbl-content ProTable">
                  <!-- 설비목록 데이터 -->
                    <tr>
                        <td><input type="checkbox" name="check1"></td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name="check1"></td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name="check1"></td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name="check1"></td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                      <tr>
                      <tr>
                        <td><input type="checkbox" name="check1"></td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                      <tr>                      
                </tbody>
              </table>
            </div>
          </div>
          <div class="col-sm-1">
          </div>
          <div class="col-md-5 custom-margin">
            <!-- 추가된 설비목록 테이블 -->
            <div class="ETableTitle">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="employee">추가된 설비목록</div>
              <div class="procexxIcon1"><button><i class="fa fa-fw fa-minus"></i></button></div>  
            </div>
            <div class="table DTable">
              <table cellpadding="0" cellspacing="0" border="0">
                <colgroup>
                  <col style="width: 5%" />
                  <col style="width: 10%" />
                  <col style="width: 10%" />
                  <col style="width: 10%" />
                </colgroup>
                <thead class="tbl-headerPro">
                  <tr>
                    <th></th>
                    <th>설비번호</th>
                    <th>설비명</th>
                    <th>설비유형</th>
                  </tr>
                </thead>
                <tbody class="tbl-content ProTable">
                  <!-- 추가된 설비목록 데이터 -->
                      <tr>
                        <td><input type="checkbox" name="check1"></td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name="check1"></td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name="check1"></td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name="check1"></td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                      <tr>
                      <tr>
                        <td><input type="checkbox" name="check1"></td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                      <tr>                      
                </tbody>
              </table>
            </div>
          </div>
        </div><!-- /.row -->
      </div><!-- /.modal-body -->
      <!-- 모달 바닥글 -->
      <div class="modal-footer" style="margin-right: 3%;">
        <button type="button" class="btn btn-primary">등록</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div>
    </div><!-- /.modal-content -->
  </div>
</div>



  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

