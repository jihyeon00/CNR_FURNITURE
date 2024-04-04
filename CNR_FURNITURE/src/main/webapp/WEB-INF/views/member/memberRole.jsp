<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link rel="stylesheet" href="/resources/css/memberRole.css">
<%@ include file="../includes/header.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-md-6">
            <h1 class="m-0"><i class="far fa-clipboard"></i> 사용자별 권한 관리</h1>
          </div><!-- /.col -->
          <div class="col-md-6 ml-auto">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main">Home</a></li>
              <li class="breadcrumb-item active">제목</li>
            </ol>
          </div><!-- /.col -->
        <div class="col-md-12">
            <div class="member-btn">
              <button type="button" class="btn btn-info">권한추가</button>
              <button type="button" class="btn btn-Default">사원등록</button>
            </div>
        </div>
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- 검색창 -->
          <div class="col-md-12 searchBer">
            <div class="col-sm-1 sb-name">부서</div>
            <div class="col-sm-2 sb-text"><input type="text" class="col-sm-12" id="" name=""/></div>
            <div class="col-sm-1 sb-name">사원명</div>
            <div class="col-sm-2 sb-text"><input type="text" class="col-sm-12" id="" name=""/></div>
            <div class="col-sm-1 ml-auto">
              <button type="button" class="btn btn-Primary search" id="" name="">검색</button>
            </div>
          </div>

          <div class="col-md-6">
            <!-- 사원테이블 -->
            <div class="ETableName">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="employee">사원</div>
            </div>
            <div class="table ETable">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="tbl-header">
                  <tr>
                    <th>사원번호</th>
                    <th>사원명</th>
                    <th>부서</th>
                    <th>연락처</th>
                    <th>이메일</th>
                  </tr>
                </thead>
                <tbody class="tbl-content ETable">
                  <tr>
                    <td>AAC</td>
                    <td>김다은</td>
                    <td>$1.38</td>
                    <td>+2.01</td>
                    <td>-0.36%</td>
                  </tr>
                  <tr>
                    <td>AAC</td>
                    <td>김다은</td>
                    <td>$1.38</td>
                    <td>+2.01</td>
                    <td>-0.36%</td>
                  </tr>
                  <tr>
                    <td>AAC</td>
                    <td>김다은</td>
                    <td>$1.38</td>
                    <td>+2.01</td>
                    <td>-0.36%</td>
                  </tr>
                  <tr>
                    <td>AAC</td>
                    <td>김다은</td>
                    <td>$1.38</td>
                    <td>+2.01</td>
                    <td>-0.36%</td>
                  </tr>
                  <tr>
                    <td>AAC</td>
                    <td>김다은</td>
                    <td>$1.38</td>
                    <td>+2.01</td>
                    <td>-0.36%</td>
                  </tr>
                  <tr>
                    <td>AAC</td>
                    <td>김다은</td>
                    <td>$1.38</td>
                    <td>+2.01</td>
                    <td>-0.36%</td>
                  </tr>
                  <tr>
                    <td>AAC</td>
                    <td>김다은</td>
                    <td>$1.38</td>
                    <td>+2.01</td>
                    <td>-0.36%</td>
                  </tr>
                  <tr>
                    <td>AAC</td>
                    <td>김다은</td>
                    <td>$1.38</td>
                    <td>+2.01</td>
                    <td>-0.36%</td>
                  </tr>
                  <tr>
                    <td>AAC</td>
                    <td>김다은</td>
                    <td>$1.38</td>
                    <td>+2.01</td>
                    <td>-0.36%</td>
                  </tr>
                  <tr>
                    <td>AAC</td>
                    <td>김다은</td>
                    <td>$1.38</td>
                    <td>+2.01</td>
                    <td>-0.36%</td>
                  </tr>
                  <tr>
                    <td>AAC</td>
                    <td>김다은</td>
                    <td>$1.38</td>
                    <td>+2.01</td>
                    <td>-0.36%</td>
                  </tr>
                  <tr>
                    <td>AAC</td>
                    <td>김다은</td>
                    <td>$1.38</td>
                    <td>+2.01</td>
                    <td>-0.36%</td>
                  </tr>
                  <tr>
                    <td>AAC</td>
                    <td>김다은</td>
                    <td>$1.38</td>
                    <td>+2.01</td>
                    <td>-0.36%</td>
                  </tr>
                </tbody>
              </table>
              <!-- /.table -->
	          </div>
          </div>

          <div class="col-md-6">
            <!-- 디렉터 테이블 -->
            <div class="ETableName">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="employee">디렉터</div>
            </div>
            <div class="table">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="tbl-header">
                  <tr>
                    <th>사원번호</th>
                    <th>사원명</th>
                    <th>부서</th>
                    <th>연락처</th>
                    <th>이메일</th>
                  </tr>
                </thead>
                <tbody class="tbl-content">
                  <tr>
                  </tr>
                </tbody>
              </table>
              <!-- /.table -->
            </div>

            <!-- 매니저 테이블 -->
            <div class="ETableName">
              <div class="icon"><i class="fa fa-list"></i></div>
              <div class="employee">매니저</div>
            </div>
            <div class="table">
              <table cellpadding="0" cellspacing="0" border="0">
                <thead class="tbl-header">
                  <tr>
                    <th>사원번호</th>
                    <th>사원명</th>
                    <th>부서</th>
                    <th>연락처</th>
                    <th>이메일</th>
                  </tr>
                </thead>
                <tbody class="tbl-content">
                  <tr>
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

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

<%@ include file="../includes/footer.jsp" %>
