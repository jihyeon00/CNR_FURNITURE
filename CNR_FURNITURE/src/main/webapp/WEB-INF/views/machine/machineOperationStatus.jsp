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
          <div class="col-sm-12">
              <ol class="breadcrumb float-sm-left">
                <h1 class="m-0"><i class="far fa-clipboard"></i>설비가동 현황</h1>
              </ol>
              <ol class="breadcrumb float-sm-right">
                <div class="reset">
                  <a href="./machineOperationStatus"><img class="resetPng" alt="reset" src="/resources/img/reset.png" ></a>
                </div>
              </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- 검색창 -->
    <form action="" id="searchForm" onSubmit="return false">
            <div class="headerBar">
                <div class="machineSearch">
                    <div class="machineName">
                        <div class="searchMachine">설비명</div>
                        <input type="search" name="find_machine_name" id="find_machine_name" class="machineBox" value='<c:out value="${searchMachineVO.find_machine_name}" />' autocomplete="off">
                    </div>
                    <div class="machineType">
                        <div class="searchMachine">설비유형</div>
                        <input type="search" name="find_machine_type" id="find_machine_type" class="machineBox" value='<c:out value="${searchMachineVO.find_machine_type}" />' autocomplete="off">
                    </div>
                    <div class="machineStatus">
                        <div class="searchMachine">가동현황</div>
                        <input type="search" name="find_machine_status" id="find_machine_status" class="machineBox" value='<c:out value="${searchMachineVO.find_machine_status}" />' autocomplete="off">
                    </div>
                </div>
                <div class="searchbtn">
                    <button type="button" id="searchbtn" class="btn btn-block btn-primary" onClick="javascript: searchMachine();"><i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색</button>
                </div>
            </div>
        </form>
    <!-- /.content-header -->

    <!-- Main content -->
        <!-- Main content -->
        <div class="content">
          <div class="container-fluid">
            <div class="row">
              <div class="table" style="height:550px; overflow-y: auto;">
                <table cellpadding="0" cellspacing="0" border="0">
                  <thead class="tbl-header">
                    <tr>
                      <th>No</th>
                      <th>설비번호</th>
                      <th>설비명</th>
                      <th>설비유형</th>
                      <th>설비위치</th>
                      <th>작동시작시간</th>
                      <th>작동종료시간</th>
                      <th>설비상태</th>
                      <th>설비가동현황</th>
                    </tr>
                  </thead>
                  <tbody class="tbl-content">
                    <c:forEach items="${mcWorkList}" var="list">
                        <tr>
                          <td><c:out value="${list.rownum}" /></td>
                          <td><c:out value="${list.mw_mi_id}" /></td>
                          <td><c:out value="${list.mi_name}" /></td>
                          <td><c:out value="${list.mi_type}" /></td>
                          <td><c:out value="${list.pi_seq}" /> <c:out value="${list.mi_position}" /></td>
                          <td><c:out value="${list.w_start_time}" /></td>
                          <td><c:out value="${list.w_end_time}" /></td>
                          <td><c:out value="${list.mw_condition}" /></td>
                          <td><c:out value="${list.mw_status}" /></td>
                        </tr>
                    </c:forEach>
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


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

<script>
    // 검색
    function searchMachine() {
       document.getElementById('searchForm').submit();
    }
</script>

<%@ include file="../includes/footer.jsp" %>
