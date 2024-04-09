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
                <h1 class="m-0"><i class="far fa-clipboard"></i>설비수리 이력 관리</h1>
              </ol>
              <ol class="breadcrumb float-sm-right">
                <div class="reset">
                  <a href="./machineRepair"><img class="resetPng" alt="reset" src="/resources/img/reset.png" ></a>
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
                        <input type="search" name="find_machine_name" id="find_machine_name" class="machineBox" value='<c:out value="${searchMachine.find_machine_name}" />' autocomplete="off">
                    </div>
                    <div class="machineType">
                        <div class="searchMachine">설비유형</div>
                        <input type="search" name="find_machine_type" id="find_machine_type" class="machineBox" value='<c:out value="${searchMachine.find_machine_type}" />' autocomplete="off">
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
                      <th>수리이력내용</th>
                      <th>수리날짜</th>
                    </tr>
                  </thead>
                  <tbody class="tbl-content">
                    <c:forEach items="${getMachineCheckAll}" var="getMachineCheckAll">
                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
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

</script>

<%@ include file="../includes/footer.jsp" %>
