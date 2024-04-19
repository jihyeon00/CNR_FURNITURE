<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<link rel="stylesheet" href="/resources/plugins/fullcalendar/main.css">
<link rel="stylesheet" href="/resources/css/workerManagement.css">

<!-- <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script> -->
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- jQuery 및 부트스트랩 CSS 및 JavaScript 로드 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

<style>
/* body 스타일 */
html, body {
	overflow: hidden;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}
/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}
</style>

<%@ include file="../includes/header.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header" id="wcontent-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-md-6">
					<h1 class="m-0">
						<i class="far fa-clipboard"></i> 작업자관리
					</h1>
				</div>
				<!-- /.col -->
				<div class="col-md-6">
					<div class="workerInsert-btn">
            <button type="button" class="btn btn-Default" style="height: 40px;"><a href="./workerInsert " style="color: #000;">
            작업자 등록
            </a></button>
       		</div>
					<div class="resetBtn">
						<a href="./workerManagement"><img class="resetPng" alt="reset"
							src="/resources/img/reset.png"></a>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->

	<!-- Main content -->
	<div class="content" style="padding-top: 11px;">
		<div class="container-fluid">
			<div class="row">

				<div class="col-md-4">
					<div class="workerTable">
						<div class="icon">
							<i class="fa fa-list"></i>
						</div>
						<div>사원 목록</div>
					</div>
					<div class="col-md-12">
						<form id='searchWorkerForm' action='./workerManagement'
							method='get' class="workerSearch">
							<div class="workMg">
								<select name='type'>
									<option value="">--선택--</option>
									<option value="DPName"
										<c:out value="${workerSearch.type == 'DPName' ? 'selected' : ''}" />>부서명</option>
									<option value="EId"
										<c:out value="${workerSearch.type == 'EId' ? 'selected' : ''}" />>사원번호</option>
									<option value="EName"
										<c:out value="${workerSearch.type == 'EName' ? 'selected' : ''}" />>사원명</option>
								</select>
							</div>
							<div class="workMg">
								<input type="text" name="keyword" />
							</div>
							<div class="workMg">
								<button type="button" class="btn btn-primary searchWorkerBtn"
									id="" name="">검색</button>
							</div>
						</form>
					</div>

					<div class="table" style="height: 700px;">
						<table cellpadding="0" cellspacing="0" border="0"
							style="height: 700px;">
							<thead class="worker-header">
								<tr>
									<th>사원번호</th>
									<th>사원명</th>
									<th>부서명</th>
								</tr>
							</thead>
							<tbody class="table-content">
								<c:forEach var="worker" items="${workerList}">
									<tr>
										<td onClick='showSchedule(<c:out value="${worker.e_id}"/>)' class="workerId"><c:out value="${worker.e_id}" /></td>
										<td><c:out value="${worker.name}" /></td>
										<td><c:out value="${worker.e_dp_name}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- /.table -->
					</div>
				</div>

				<!-- /.col -->
				<div class="col-md-8">
					<div class="card card-primary">
						<div class="card-body p-0">
							<!-- THE CALENDAR -->
							<div id="calendar"></div>
						</div>
						<!-- /.card-body -->
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content -->
	<!-- /.row -->
</div>
<!-- /.container-fluid -->
</div>
<!-- /.content -->



<%@ include file="../includes/footer.jsp"%>




<script>	



/*worker 검색*/
let searchWorkerForm = $("#searchWorkerForm");
	$("#searchWorkerForm button").on("click",
    function(e) {
        if (!searchWorkerForm.find("option:selected").val()) {
            alert("검색종류를 선택하세요");
            return false;
        }

        if (!searchWorkerForm.find("input[name='keyword']").val()) {
            alert("키워드를 입력하세요");
            return false;
        }

        e.preventDefault();

        searchWorkerForm.submit();
    });
	

/* 
	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      initialView: 'dayGridMonth'
	    });
	    calendar.render();
	  }); */
	 /*  jQuery(function($) {
		    $('#exampleModal').modal('show');
		});   */
  
	 (function(){
		    $(function(){
		      // calendar element 취득
		      var calendarEl = $('#calendar')[0];
		      // full-calendar 생성하기
		      var calendar = new FullCalendar.Calendar(calendarEl, {
		        height: '700px', // calendar 높이 설정
		        expandRows: true, // 화면에 맞게 높이 재설정
		        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
		        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
		        customButtons: {
		        	myCustomBotton:{
		        	/* 	text: "일정 추가",
		       		 click : function(){
		        				//부트스트랩 모달 열기
		        					$("#exampleModal").modal("show");
		        					console.log("일정 추가 버튼 클릭됨");
		        		}  */
		        	},
		        /* 	mySaveButton: {
		        		text:"저장"
		        	} */
		        },
		        // 해더에 표시할 툴바
		        headerToolbar: {
		          left: 'prev,next today',
		          center: 'title',
		          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
		        },
		        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		        //initialDate: '2024-04-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
		        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
		        selectable: true, // 달력 일자 드래그 설정가능
		        selectMirror: true,
		        nowIndicator: true, // 현재 시간 마크
		        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
		        locale: 'ko', // 한국어 설정
		        //데이터 가져오는 이벤트
		        events: function(fetchInfo, successCallback, failureCallback) {
		        	console.log("들어왔다");
		        	
	            // AJAX 요청
	            $.ajax({
	                type: "GET",
	                url: "/schedule",
	                contentType : "application/json; charset=utf-8",    // content-type지정
	                success: function(response) {
	                		console.log("success들어왔다");
	                    var events = [];
	                    if (response != null) {
	                        var result = response;
	                        // 서버에서 받은 데이터로 이벤트 배열 구성
	                        for (var i = 0; i < result.length; i++) {
	                            events.push({
	                            		/* id: String(result[i].name), */
	                                title: result[i].name,		//작업ID
	                                start: result[i].start,
	                                end: result[i].end
	                          
	                            });
	                        }
	                        // 이벤트 배열을 FullCalendar에 전달하여 캘린더에 표시
	                        successCallback(events);
	                    } else {
	                        // 서버 응답 오류 처리
	                        failureCallback('Invalid response from server');
	                    }
	                },
	                error: function(xhr, status, error) {
	                    // AJAX 오류 처리
	                    console.error('Error:', error);
	                    failureCallback('Failed to fetch events');
	                }
	            });
	        	}	      

	        });
		      // 캘린더 랜더링
		      calendar.render();
		    });
		  })();
		
		

</script>
