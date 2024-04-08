<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"><i class="far fa-clipboard"></i>설비관리체크기준관리</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main">Home</a></li>
              <li class="breadcrumb-item active">제목</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <div class="headerBar">
        <div class="machineSearch">
            <div class="machineName">
                <div class="onchangeMachine">설비관리유형</div>
                <select id="onchangeType" name="onchangeType" class="onchangeType" onchange="changeSelect();">
                    <option value="rownum">---</option>
                    <option value="">전기</option>
                    <option value="">부품</option>
                    <option value="">외관</option>
                    <option value="">온도</option>
                    <option value="">소음</option>
                    <option value="">진동</option>
                    <option value="">급유</option>
                </select>
            </div>
            <div class="machineType">
                <div class="onchangeMachine">점검방법</div>
                    <select id="onchangeMethod" name="onchangeMethod" class="onchangeMethod" onchange="changeSelect();">
                        <option value="rownum">---</option>
                        <option value="">육안</option>
                        <option value="">수평자</option>
                        <option value="">청음기</option>
                        <option value="">진동 측정기</option>
                    </select>
            </div>
            <div class="machinePosition">
                <div class="searchMachine">체크리스트 조건</div>
                <input type="search" name="search_machineCheck" id="search_machineCheck" class="machineBox" autocomplete="off">
            </div>
        </div>
        <div class="searchbtn">
            <button type="button" id="searchbtn" class="btn btn-block btn-primary">검색</button>
            <button type="button" id="addBtn" class="btn btn-block btn-default" data-toggle="modal" data-target="#AddModal">추가</button>
        </div>
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
        <!-- Main content -->
        <div class="content">
          <div class="container-fluid">
            <div class="row">
              <div class="table">
                <table cellpadding="0" cellspacing="0" border="0">
                  <thead class="tbl-header">
                    <tr>
                      <th>체크리스트 번호</th>
                      <th>유형</th>
                      <th>점검방법</th>
                      <th>체크리스트 조건</th>
                    </tr>
                  </thead>
                  <tbody class="tbl-content">
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
                <!-- /.table -->
              </div>
            <!-- /.row -->
          </div>
      <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- 등록 모달 -->
  <div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="myModalLabel">설비별 체크리스트 정보 추가</h4>
        </div>
       <div class="modal-body">
           <div class="ModalAddCheck">
             <div class="addMachineNumber">
                 <div class="addNumberMachine">설비번호</div>
                 <input type="text" name="modalAddNumber" id="modalAddNumber" class="modalAddNumber" autocomplete="off">
             </div>
             <div class="addMachineType">
                 <div class="addTypeMachine">설비관리유형</div>
                 <input type="text" name="modalAddTypeCheck" id="modalAddTypeCheck" class="modalAddTypeCheck" autocomplete="off">
             </div>
             <div class="addMachineMethod">
                 <div class="addMethodMachine">점검방법</div>
                 <input type="text" name="modalAddMethod" id="modalAddMethod" class="modalAddMethod" autocomplete="off">
             </div>
             <div class="addMachineCondition">
                 <div class="addConditionMachine">조건</div>
                 <input type="text" name="modalAddCondition" id="modalAddCondition" class="modalAddCondition" autocomplete="off">
             </div>
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
