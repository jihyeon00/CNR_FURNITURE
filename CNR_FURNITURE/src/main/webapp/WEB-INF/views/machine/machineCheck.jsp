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
                <h1 class="m-0"><i class="far fa-clipboard"></i>설비 체크리스트 작성</h1>
              </ol>
              <ol class="breadcrumb float-sm-right">
                <div class="reset">
                  <a href="./machineCheck"><img class="resetPng" alt="reset" src="/resources/img/reset.png"></a>
                </div>
              </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <div class="headerBar">
        <form action="machineCheck" method="get">
        <div class="machineSearch">
            <div class="machineName">
                <div class="onchangeMachine">설비명</div>
                <select class="onchangeMachineName"  id="find_machine_id" name="find_machine_id">
                  <option value="설비선택">설비선택</option>
                  <c:forEach var="list" items = "${getMachineInfo}">
                    <option value='${list.mi_id}'>${list.mi_name}
                    </option>
                  </c:forEach>
                </select>
            </div>
            <div class="machineCheckWriter">
                <div class="searchMachine">작성자</div>
                <input type="search" name="machineCheckWriter" id="machineCheckWriter" class="machineBox" value="" autocomplete="off">
            </div>
            <div class="machineCheckDate">
                <div class="searchMachine">작성일</div>
                <input type="date" name="machineCheckDate" id="machineCheckDate" class="machineBox" autocomplete="off">
            </div>
            <div class="machineCheckSave">
                <button type="submit" id="searchbtn" class="btn btn-block btn-primary"><i class="fa-solid fa-magnifying-glass"></i>&nbsp;검색</button>
                <button type="button" id="machineCheckSave" class="btn btn-block btn-default">저장</button>
            </div>
        </div>
        </form>
    </div>
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
                      <th>설비관리유형</th>
                      <th>점검방법</th>
                      <th>체크리스트 조건</th>
                      <th>Y / N</th>
                      <th>비고</th>
                    </tr>
                  </thead>
                  <tbody class="tbl-content">
                    <c:forEach items="${getMachineCheckAll}" var="getMachineCheckAll">
                        <tr>
                          <td id=""><c:out value="${getMachineCheckAll.rownum}" /></td>
                          <td id=""><c:out value="${getMachineCheckAll.mci_div}" /></td>
                          <td id=""><c:out value="${getMachineCheckAll.mci_method}" /></td>
                          <td id=""><c:out value="${getMachineCheckAll.mci_condition}" /></td>
                          <td id=""> <div class="">
                                <input type="radio" id="" name="YorN">
                                <input type="radio" id="" name="YorN">
                          </div></td>
                          <td id=""><input type="text" name="" id="" class="machineCheckText" autocomplete="off"></td>
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
