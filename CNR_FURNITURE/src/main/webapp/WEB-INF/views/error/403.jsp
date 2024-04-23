<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>C&R Furniture</title>
  <!-- favicon -->
  <link rel="icon" href="/resources/img/favicon.ico" type="image/x-icon">
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- IonIcons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/css/adminlte.min.css">
  <!-- Main Font -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
  <!-- style -->
  <link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="/resources/css/table.css">
  <link rel="stylesheet" href="/resources/css/bom.css">
  <link rel="stylesheet" href="/resources/css/materialInfo.css">
  <link rel="stylesheet" href="/resources/css/itemInfo.css">
  <link rel="stylesheet" href="/resources/css/materialMNG.css">
  <link rel="stylesheet" href="/resources/css/itemMNG.css">
  <link rel="stylesheet" href="/resources/css/machine.css">
  <link rel="stylesheet" href="/resources/css/member.css">
  <link rel="stylesheet" href="/resources/css/process.css">
  <link rel="stylesheet" href="/resources/css/production.css">
  <link rel="stylesheet" href="/resources/css/work.css">
	<link rel="stylesheet" href="/resources/css/quality/quality.css">
  <link rel="stylesheet" href="/resources/css/quality/defectiveItem.css">
  <link rel="stylesheet" href="/resources/css/quality/defectiveProcess.css">
  <!-- stickyOnTable.css 연결 -->
  <link rel="stylesheet" href="/resources/css/quality/stickyOnTable.css">

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO.name" var="e_name" />
    <sec:authentication property="principal.memberVO.dp_name" var="dp_name" />
    <sec:authentication property="principal.memberVO.role" var="e_role"/>
</sec:authorize>

  <!-- jQuery -->
  <script defer src="/resources/js/jquery-3.7.1.min.js"></script>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="http://localhost:8085/main" class="nav-link">Home</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600">
                  <sec:authentication property="principal.memberVO.dp_name" />
                  <c:out value="${e_name}"/> 님
                </span>
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="userDropdown">
                <!--
                <a class="dropdown-item" href="/member">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    Profile
                </a>
                -->
                <a class="dropdown-item" href="" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    Logout
                </a>
            </div>
        </li>
    </ul>
  </nav>
  <!-- /.navbar -->
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="http://localhost:8085/main" class="brand-link">
      <img src="/resources/img/C&RLogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .9">
      <span class="brand-text font-weight-light">C&R Furniture</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item">
            <a href="#" class="nav-link">
              <p style="font-size: 18px;">
                기준정보
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item sideBarSub">
                <a href="http://localhost:8085/standardInfo/memberInfo" class="nav-link">
                  <p>사원정보조회</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="bom" class="nav-link">
                  <p>BOM관리</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="itemInfo" class="nav-link">
                  <p>제품정보관리</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="materialInfo" class="nav-link">
                  <p>자재정보관리</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="http://localhost:8085/standardInfo/companyInfo" class="nav-link">
                  <p>거래처관리</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="http://localhost:8085/standardInfo/contractInfo" class="nav-link">
                  <p>계약관리</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item ">
            <a href="#" class="nav-link">
              <p style="font-size: 18px;">
                생산관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item sideBarSub">
                <a href="productionStatus" class="nav-link">
                  <p>생산현황</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="machineOperationStatusByProcess" class="nav-link">
                  <p>공정별 설비가동현황</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <p style="font-size: 18px;">
                재고관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item sideBarSub">
                <a href="materialIB" class="nav-link">
                  <p>자재재고조회</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="materialOB" class="nav-link">
                  <p>제품재고조</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <p style="font-size: 18px;">
                공정관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item sideBarSub">
                <a href="manufacturingInstruction" class="nav-link">
                  <p>제조지시</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="manufacturingPerform" class="nav-link">
                  <p>제조수행지시</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="processInfo" class="nav-link">
                  <p>공정정보관리</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="workerManagement" class="nav-link">
                  <p>작업자스케줄조회</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="workerManagement" class="nav-link">
                  <p>작업자관리</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="work" class="nav-link">
                  <p>작업관리</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="todayWorkInsert" class="nav-link">
                  <p>당일작업조회</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <p style="font-size: 18px;">
                품질관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item sideBarSub">
                <a href="inspectionIB" class="nav-link">
                  <p>수입검사관리</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="inspectionProcess" class="nav-link">
                  <p>공정검사관리</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="inspectionOB" class="nav-link">
                  <p>출하검사관리</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="defectiveProcess" class="nav-link">
                  <p>공정불량실적</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="defectiveItem" class="nav-link">
                  <p>제품불량실적</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <p style="font-size: 18px;">
                설비관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item sideBarSub">
                <a href="machineInfo" class="nav-link">
                  <p>설비정보관리</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="machineCheckInfo" class="nav-link">
                  <p>설비체크기준관리</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="machineCheck" class="nav-link">
                  <p>설비 체크리스트 작성</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="machineManagement" class="nav-link">
                  <p>설비관리</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="machineRepair" class="nav-link">
                  <p>설비수리이력관리</p>
                </a>
              </li>
              <li class="nav-item sideBarSub">
                <a href="machineOperationStatus" class="nav-link">
                  <p>설비가동현황</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <p style="font-size: 18px;">
                시스템관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item sideBarSub">
                <a href="http://localhost:8085/M/member/memberRole" class="nav-link">
                  <p>사용자별 권한관리</p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        403 에러페이지
      </h1>
    </section>
    <section class="content">
      <div class="error-page">
        <h2 class="headline text-yellow"> 403</h2>
        <div class="error-content">
          <h3><i class="fa fa-warning text-yellow"></i> 이런! 페이지에 접근할 수 없습니다.</h3>
          <p>
            <c:out value="${dp_name}"/> <c:out value="${e_name}"/>님의 권한(<c:out value="${e_role}"/>)으로
            해당 페이지로 접근할 수 없습니다.
            <a href="http://localhost:8085/main">메인화면으로</a> 이동하시겠습니까?
          </p>
        </div>
      </div>
    </section>
  </div>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->


      <!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Cozy&Rest Furniture</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
					</button>
				</div>
				<div class="modal-body">
				  정말로 로그아웃을 하시겠습니까?
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
					<a class="btn btn-primary" href="/logout">로그아웃</a>
				</div>
			</div>
		</div>
	</div>
</body>

<!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE -->
<script src="/resources/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="/resources/plugins/chart.js/Chart.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/resources/js/pages/dashboard3.js"></script>
</body>
</html>