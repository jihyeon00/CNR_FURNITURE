<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="/resources/plugins/fullcalendar/main.css">
<link rel="stylesheet" href="/resources/css/workerManagement.css">

<!-- <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script> -->
<!-- jquery CDN -->  
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
<!-- fullcalendar CDN -->  
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />  
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>  
<!-- fullcalendar 언어 CDN -->  
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- jQuery 및 부트스트랩 CSS 및 JavaScript 로드 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

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

<%@ include file="../includes/header.jsp" %>
	
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header" id="wcontent-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-md-6">
                    <h1 class="m-0"><i class="far fa-clipboard"></i> 작업자관리</h1>
                </div><!-- /.col -->
                <div class="col-md-6">
	                <div class="resetBtn">
	              		<a href="./workerManagement"><img class="resetPng" alt="reset" src="/resources/img/reset.png" ></a>
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
              <div class="icon"><i class="fa fa-list"></i></div>
              <div>사원 목록</div>
              </div>
   						<div class="col-md-12">
	   						<form id='searchWorkerForm' action='./workerManagement' method='get' class="workerSearch"> 
			             	<div class="workMg">
				            	<select name='type'>
				            		<option value="">--선택--</option>
								    		<option value="DPName"<c:out value="${workerSearch.type == 'DPName' ? 'selected' : ''}" />>부서명</option>
						    				<option value="EId"<c:out value="${workerSearch.type == 'EId' ? 'selected' : ''}" />>사원번호</option>
						    				<option value="EName"<c:out value="${workerSearch.type == 'EName' ? 'selected' : ''}" />>사원명</option>
				            	</select>
			            	</div>
		                <div class="workMg">
			        	      <input type="text" name="keyword" />
			          	  </div> 
				            <div class="workMg">
				              <button type="button" class="btn btn-primary searchWorkerBtn" id="" name="" >검색</button>
				            </div>
			            </form>
		            </div>
		            
            <div class="table" style="height: 700px;">
              <table cellpadding="0" cellspacing="0" border="0" style="height: 700px;">
                <thead class="worker-header">
                  <tr>
                    <th>NO</th>
                    <th>부서명</th>
                    <th>사원번호</th>
                    <th>사원명</th>
                  </tr>
                </thead>
                <tbody class="table-content">
                	<c:forEach var="worker" items="${workerList}">
	                  <tr>
	                    <td><c:out value="${worker.rn}" /></td>
	                    <td><c:out value="${worker.e_dp_name}" /></td>
	                    <td><c:out value="${worker.e_id}" /></td>
	                    <td><c:out value="${worker.e_name}" /></td>            
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
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
      <!-- /.row -->
      </div>
<!-- /.container-fluid -->
</div>
    <!-- /.content -->


<!-- 모달창 등록  -->
<!-- <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
	  <div class="modal-content">
	    <div class="modal-header">
       	<h4 class="mt-modal-title" id="exampleModalLabel">일정추가</h4>
      	 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <label for="modalUpdateName" class="form-label">자재명</label>
          <input type="text" name="m_name" id="m_name" class="form-control" autocomplete="off">

          <label for="modalProductAmount" class="form-label">자재 용도</label>
          <input type="text" name="m_uses" id="m_uses" class="form-control" autocomplete="off">     
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" onClick="insertMTBox()">등록</button>
       	<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div> -->
<!--============================================================== -->
 


<%@ include file="../includes/footer.jsp" %>

	

	
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
		        editable: true, // 수정 가능?
		        selectable: true, // 달력 일자 드래그 설정가능
		        nowIndicator: true, // 현재 시간 마크
		        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
		        locale: 'ko', // 한국어 설정
		        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
		          console.log(obj);
		        },
		        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
		          console.log(obj);
		        },
		        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
		          console.log(obj);
		        },
		        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
		          var title = prompt('Event Title:');
		          if (title) {
		            calendar.addEvent({
		              title: title,
		              start: arg.start,
		              end: arg.end,
		              allDay: arg.allDay
		            })
		          }
		          calendar.unselect()
		        },
		        // 이벤트 
		        events: [
		          {
		            title: 'All Day Event',
		            start: '2024-04-01',
		          },
		          {
		            title: 'Long Event',
		            start: '2024-04-04',
		            end: '2024-04-10'
		          },
		          {
		            groupId: 999,
		            title: 'Repeating Event',
		            start: '2024-04-09T16:00:00'
		          },
		          {
		            groupId: 999,
		            title: 'Repeating Event',
		            start: '2024-04-16T16:00:00'
		          },
		          {
		            title: 'Conference',
		            start: '2024-04-11',
		            end: '2024-04-13'
		          },
		          {
		            title: 'Meeting',
		            start: '2024-04-12T10:30:00',
		            end: '2024-04-12T12:30:00'
		          },
		          {
		            title: 'Lunch',
		            start: '2024-04-12T12:00:00'
		          },
		          {
		            title: 'Meeting',
		            start: '2024-04-12T14:30:00'
		          },
		          {
		            title: 'Happy Hour',
		            start: '2024-04-12T17:30:00'
		          },
		          {
		            title: 'Dinner',
		            start: '2024-04-12T20:00:00'
		          },
		          {
		            title: 'Birthday Party',
		            start: '2024-04-13T04:00:00'
		          },
		          {
		            title: 'Click for Google',
		            url: 'http://google.com/', // 클릭시 해당 url로 이동
		            start: '2024-04-28'
		          }
		        ]
		      });
		      // 캘린더 랜더링
		      calendar.render();
		    });
		  })();

</script>
