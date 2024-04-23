//페이지가 로드될 때
$(document).ready(function() {


/****************** work - 작업상세 및 수정 모달창 - 조회 수정 삭제 ****************************/
		
	/* 작업 상세 - Ajax로 해당 행의 내용 조회 */
	$('.workDetailModalBtn').on('click', function() {
		var workDetailModalWorkId = $(this).data('work-id');				// 작업상세 버튼에서 workDetailModalWorkId 값 가져오기
		var workDetailModalLotId = $(this).data('lot-id');					// 작업상세 버튼에서 workDetailModalLotId 값 가져오기
		var workDetailModalProcessId = $(this).data('pi-id');				// 작업상세 버튼에서 workDetailModalProcessId 값 가져오기
		console.log('선택된 workDetailModalWorkId: ', workDetailModalWorkId);
		console.log('선택된 workDetailModalLotId: ', workDetailModalLotId);
		console.log('선택된 workDetailModalProcessId: ', workDetailModalProcessId);
		
		$.ajax({
			url: '/workDetailModalAutoDataByWorkId',
			type: 'GET',
			data: { 
				workDetailModalWorkId: workDetailModalWorkId,
				workDetailModalLotId : workDetailModalLotId,
				workDetailModalProcessId : workDetailModalProcessId
			},
			success: function(data) {
				console.log("data.workDetailModalWorkId"+data.workDetailModalWorkId);
				console.log("작업시작시간 : "+data.workDetailModalWorkStartTime + " , 작업종료시간 : " + data.workDetailModalWorkEndTime);
				
				$('#workDetailModalWorkId').val(data.workDetailModalWorkId);
				$('#workDetailModalLotId').val(data.workDetailModalLotId);
				$('#workDetailModalProcessId').val(data.workDetailModalProcessId);
				$('#workDetailModalProcessName').val(data.workDetailModalProcessName);
				$('#workDetailModalWorkPosition').val(data.workDetailModalWorkPosition);
				$('#workDetailModalMachineId').val(data.workDetailModalMachineId);
				$('#workDetailModalMachineName').val(data.workDetailModalMachineName);
				$('#workDetailModalUnit').val(data.workDetailModalUnit);
				$('#workDetailModalItemId').val(data.workDetailModalItemId);
				$('#workDetailModalItemName').val(data.workDetailModalItemName);
				$('#workDetailModalItemStandard').val(data.workDetailModalItemStandard);
				$('#workDetailModalPlanQuantity').val(data.workDetailModalPlanQuantity);
				$('#workDetailModalProQuantity').val(data.workDetailModalProQuantity);
				$('#workDetailModalWorkStartTime').val(data.workDetailModalWorkStartTime);
				$('#workDetailModalWorkEndTime').val(data.workDetailModalWorkEndTime);
				$('#workDetailModalWorkTime').val(data.workDetailModalWorkTime);
				$('#workDetailModalWorkStatus').val(data.workDetailModalWorkStatus);
				$('#workDetailModalNote').val(data.workDetailModalNote);
				
				var currentTime = new Date();
	      currentTime.setHours(0, 0, 0, 0); // 현재 시간의 시, 분, 초, 밀리초를 0으로 설정합니다.
	
	      var startTime = new Date(data.workDetailModalWorkStartTime);
	      var endTime = new Date(data.workDetailModalWorkEndTime);
	      var startDate = new Date(startTime.getFullYear(), startTime.getMonth(), startTime.getDate());
	      var endDate = new Date(endTime.getFullYear(), endTime.getMonth(), endTime.getDate());
	
	      if (startDate < currentTime) {
	          $('#workDetailModalWorkStartTime').prop('readonly', true);
	      } else {
	          $('#workDetailModalWorkStartTime').prop('readonly', false);
	      }
	
	      if (endDate < currentTime) {
	          $('#workDetailModalWorkEndTime').prop('readonly', true);
	      } else {
	          $('#workDetailModalWorkEndTime').prop('readonly', false);
	      }
	
	      // 값을 설정한 후 readonly 상태를 조정합니다.
	      $('#workDetailModalWorkStartTime').val(data.workDetailModalWorkStartTime);
	      $('#workDetailModalWorkEndTime').val(data.workDetailModalWorkEndTime);
	
	      bindDateTimeChangeHandlers(); // 이벤트 핸들러를 다시 바인딩합니다.
			},
			error: function() {
				console.log("작업상세 모달창의 데이터 조회 실패 Error", error);
				alert('데이터를 불러오는데 실패했습니다.');
			}
		}); // /.workDetailModalAutoDataByWorkId ajax
		
	 	// 작업 시작/종료 시간 변경 이벤트 핸들러를 바인딩하는 함수를 호출
	  bindDateTimeChangeHandlers();
			
		// 작업 시작/종료 시간 변경 이벤트를 처리하는 함수
		function bindDateTimeChangeHandlers() {
		    $('#workDetailModalWorkStartTime, #workDetailModalWorkEndTime').on('change', function() {
		        var selectedTime = new Date($(this).val());
		        var currentTime = new Date();
		
		        if (this.id === 'workDetailModalWorkStartTime' && selectedTime < currentTime) {
		            alert('현재 시간 이전은 선택할 수 없습니다. 시간을 다시 선택해 주세요.');
		            $(this).val('').prop('readonly', true);
		        }
		
		        if (this.id === 'workDetailModalWorkEndTime') {
		            var startTime = new Date($('#workDetailModalWorkStartTime').val());
		            if (selectedTime < startTime) {
		                alert('작업 종료시간은 시작시간보다 빠를 수 없습니다.');
		                $(this).val('');
		            }
		        }
		
		        // 시작과 종료 시간의 변경이 모두 완료된 후에 소요시간을 다시 계산합니다.
		        calculateDuration();
		    }); // /.'#workDetailModalWorkStartTime, #workDetailModalWorkEndTime' change function
		} // /.bindDateTimeChangeHandlers
	
		// 소요시간 계산 함수
		function calculateDuration() {
		    var startTime = $('#workDetailModalWorkStartTime').val();
		    var endTime = $('#workDetailModalWorkEndTime').val();
		
		    if (startTime && endTime) {
		        var startDate = new Date(startTime);
		        var endDate = new Date(endTime);
		        var durationMinutes = (endDate - startDate) / 60000;
		
		        if (durationMinutes < 0) {
		            alert('소요시간은 음수가 될 수 없습니다.');
		            $('#workDetailModalWorkEndTime').val('');
		        } else {
		            $('#workDetailModalWorkTime').val(durationMinutes.toFixed(0));
		        }
		    }
		}  
	
	
		// 수정 - Ajax로 DB에 업데이트
		$('#workDetailSaveBtn').on('click', function() {
		  if (!confirm('수정하시겠습니까?')) {
		      return; // 사용자가 '아니오'를 선택하면 함수를 종료
		  }
		  
		  // Form에서 데이터 수집
		  var formData = {
		      workDetailModalWorkId: $('#workDetailModalWorkId').val(),
		      workDetailModalLotId: $('#workDetailModalLotId').val(),
		      workDetailModalProcessId: $('#workDetailModalProcessId').val(),
		      workDetailModalMachineId: $('#workDetailModalMachineId').val(),
		      workDetailModalPlanQuantity: $('#workDetailModalPlanQuantity').val(),
		      workDetailModalProQuantity: $('#workDetailModalProQuantity').val(),
		      workDetailModalWorkStartTime: $('#workDetailModalWorkStartTime').val().replace('T', ' '), // T를 공백으로 대체
		      workDetailModalWorkEndTime: $('#workDetailModalWorkEndTime').val().replace('T', ' '), // T를 공백으로 대체
		      workDetailModalWorkTime: $('#workDetailModalWorkTime').val(),
		      workDetailModalWorkStatus: $('#workDetailModalWorkStatus option:selected').val()
		  };
		
		  console.log(formData);
		
		  // Ajax 요청을 사용하여 서버에 수정 사항 전송
		  $.ajax({
		      url: 'workDetailModalUpdate',  // 수정 처리를 위한 서버 URL
		      type: 'POST',  // HTTP 요청 방식
		      contentType: 'application/json',  // 요청 컨텐츠 타입
		      data: JSON.stringify(formData),  // JSON 형식으로 데이터 전송
		      success: function(response) {
		          if(response.success) {
		              alert('수정이 완료되었습니다.');
		              window.location.href = '/M/process/work';  // 성공 후, '/work' 페이지로 리다이렉트
		          } else {
		              alert('수정 실패: ' + response.message);
		          }
		      },
		      error: function(xhr, status, error) {  // 요청 실패 시
		          alert('수정 중 에러가 발생했습니다. 에러: ' + error);
		      }
		  }); // ./workDetailUpdate 의 ajax
		}); // /. workDetailSaveBtn click

  //페이지가 로드될 때
$(document).ready(function() {


/****************** work - 작업상세 및 수정 모달창 - 조회 수정 삭제 ****************************/
		
	/* 작업 상세 - Ajax로 해당 행의 내용 조회 */
	$('.workDetailModalBtn').on('click', function() {
		var workDetailModalWorkId = $(this).data('work-id');				// 작업상세 버튼에서 workDetailModalWorkId 값 가져오기
		var workDetailModalLotId = $(this).data('lot-id');					// 작업상세 버튼에서 workDetailModalLotId 값 가져오기
		var workDetailModalProcessId = $(this).data('pi-id');				// 작업상세 버튼에서 workDetailModalProcessId 값 가져오기
		console.log('선택된 workDetailModalWorkId: ', workDetailModalWorkId);
		console.log('선택된 workDetailModalLotId: ', workDetailModalLotId);
		console.log('선택된 workDetailModalProcessId: ', workDetailModalProcessId);
		
		$.ajax({
			url: '/workDetailModalAutoDataByWorkId',
			type: 'GET',
			data: { 
				workDetailModalWorkId: workDetailModalWorkId,
				workDetailModalLotId : workDetailModalLotId,
				workDetailModalProcessId : workDetailModalProcessId
			},
			success: function(data) {
				console.log("data.workDetailModalWorkId"+data.workDetailModalWorkId);
				console.log("작업시작시간 : "+data.workDetailModalWorkStartTime + " , 작업종료시간 : " + data.workDetailModalWorkEndTime);
				
				$('#workDetailModalWorkId').val(data.workDetailModalWorkId);
				$('#workDetailModalLotId').val(data.workDetailModalLotId);
				$('#workDetailModalProcessId').val(data.workDetailModalProcessId);
				$('#workDetailModalProcessName').val(data.workDetailModalProcessName);
				$('#workDetailModalWorkPosition').val(data.workDetailModalWorkPosition);
				$('#workDetailModalMachineId').val(data.workDetailModalMachineId);
				$('#workDetailModalMachineName').val(data.workDetailModalMachineName);
				$('#workDetailModalUnit').val(data.workDetailModalUnit);
				$('#workDetailModalItemId').val(data.workDetailModalItemId);
				$('#workDetailModalItemName').val(data.workDetailModalItemName);
				$('#workDetailModalItemStandard').val(data.workDetailModalItemStandard);
				$('#workDetailModalPlanQuantity').val(data.workDetailModalPlanQuantity);
				$('#workDetailModalProQuantity').val(data.workDetailModalProQuantity);
				$('#workDetailModalWorkStartTime').val(data.workDetailModalWorkStartTime);
				$('#workDetailModalWorkEndTime').val(data.workDetailModalWorkEndTime);
				$('#workDetailModalWorkTime').val(data.workDetailModalWorkTime);
				$('#workDetailModalWorkStatus').val(data.workDetailModalWorkStatus);
				$('#workDetailModalNote').val(data.workDetailModalNote);
				
				var currentTime = new Date();
	      currentTime.setHours(0, 0, 0, 0); // 현재 시간의 시, 분, 초, 밀리초를 0으로 설정합니다.
	
	      var startTime = new Date(data.workDetailModalWorkStartTime);
	      var endTime = new Date(data.workDetailModalWorkEndTime);
	      var startDate = new Date(startTime.getFullYear(), startTime.getMonth(), startTime.getDate());
	      var endDate = new Date(endTime.getFullYear(), endTime.getMonth(), endTime.getDate());
	
	      if (startDate < currentTime) {
	          $('#workDetailModalWorkStartTime').prop('readonly', true);
	      } else {
	          $('#workDetailModalWorkStartTime').prop('readonly', false);
	      }
	
	      if (endDate < currentTime) {
	          $('#workDetailModalWorkEndTime').prop('readonly', true);
	      } else {
	          $('#workDetailModalWorkEndTime').prop('readonly', false);
	      }
	
	      // 값을 설정한 후 readonly 상태를 조정합니다.
	      $('#workDetailModalWorkStartTime').val(data.workDetailModalWorkStartTime);
	      $('#workDetailModalWorkEndTime').val(data.workDetailModalWorkEndTime);
	
	      bindDateTimeChangeHandlers(); // 이벤트 핸들러를 다시 바인딩합니다.
			},
			error: function() {
				console.log("작업상세 모달창의 데이터 조회 실패 Error", error);
				alert('데이터를 불러오는데 실패했습니다.');
			}
		}); // /.workDetailModalAutoDataByWorkId ajax
		
	 	// 작업 시작/종료 시간 변경 이벤트 핸들러를 바인딩하는 함수를 호출
	  bindDateTimeChangeHandlers();
			
		// 작업 시작/종료 시간 변경 이벤트를 처리하는 함수
		function bindDateTimeChangeHandlers() {
		    $('#workDetailModalWorkStartTime, #workDetailModalWorkEndTime').on('change', function() {
		        var selectedTime = new Date($(this).val());
		        var currentTime = new Date();
		
		        if (this.id === 'workDetailModalWorkStartTime' && selectedTime < currentTime) {
		            alert('현재 시간 이전은 선택할 수 없습니다. 시간을 다시 선택해 주세요.');
		            $(this).val('').prop('readonly', true);
		        }
		
		        if (this.id === 'workDetailModalWorkEndTime') {
		            var startTime = new Date($('#workDetailModalWorkStartTime').val());
		            if (selectedTime < startTime) {
		                alert('작업 종료시간은 시작시간보다 빠를 수 없습니다.');
		                $(this).val('');
		            }
		        }
		
		        // 시작과 종료 시간의 변경이 모두 완료된 후에 소요시간을 다시 계산합니다.
		        calculateDuration();
		    }); // /.'#workDetailModalWorkStartTime, #workDetailModalWorkEndTime' change function
		} // /.bindDateTimeChangeHandlers
	
		// 소요시간 계산 함수
		function calculateDuration() {
		    var startTime = $('#workDetailModalWorkStartTime').val();
		    var endTime = $('#workDetailModalWorkEndTime').val();
		
		    if (startTime && endTime) {
		        var startDate = new Date(startTime);
		        var endDate = new Date(endTime);
		        var durationMinutes = (endDate - startDate) / 60000;
		
		        if (durationMinutes < 0) {
		            alert('소요시간은 음수가 될 수 없습니다.');
		            $('#workDetailModalWorkEndTime').val('');
		        } else {
		            $('#workDetailModalWorkTime').val(durationMinutes.toFixed(0));
		        }
		    }
		}  
	
	
		// 수정 - Ajax로 DB에 업데이트
		$('#workDetailSaveBtn').on('click', function() {
		  if (!confirm('수정하시겠습니까?')) {
		      return; // 사용자가 '아니오'를 선택하면 함수를 종료
		  }
		  
		  // Form에서 데이터 수집
		  var formData = {
		      workDetailModalWorkId: $('#workDetailModalWorkId').val(),
		      workDetailModalLotId: $('#workDetailModalLotId').val(),
		      workDetailModalProcessId: $('#workDetailModalProcessId').val(),
		      workDetailModalMachineId: $('#workDetailModalMachineId').val(),
		      workDetailModalPlanQuantity: $('#workDetailModalPlanQuantity').val(),
		      workDetailModalProQuantity: $('#workDetailModalProQuantity').val(),
		      workDetailModalWorkStartTime: $('#workDetailModalWorkStartTime').val().replace('T', ' '), // T를 공백으로 대체
		      workDetailModalWorkEndTime: $('#workDetailModalWorkEndTime').val().replace('T', ' '), // T를 공백으로 대체
		      workDetailModalWorkTime: $('#workDetailModalWorkTime').val(),
		      workDetailModalWorkStatus: $('#workDetailModalWorkStatus option:selected').val()
		  };
		
		  console.log(formData);
		
		  // Ajax 요청을 사용하여 서버에 수정 사항 전송
		  $.ajax({
		      url: '/workDetailModalUpdate',  // 수정 처리를 위한 서버 URL
		      type: 'POST',  // HTTP 요청 방식
		      contentType: 'application/json',  // 요청 컨텐츠 타입
		      data: JSON.stringify(formData),  // JSON 형식으로 데이터 전송
		      success: function(response) {
		          if(response.success) {
		              alert('수정이 완료되었습니다.');
		              window.location.href = '/M/process/work';  // 성공 후, '/work' 페이지로 리다이렉트
		          } else {
		              alert('수정 실패: ' + response.message);
		          }
		      },
		      error: function(xhr, status, error) {  // 요청 실패 시
		          alert('수정 중 에러가 발생했습니다. 에러: ' + error);
		      }
		  }); // ./workDetailUpdate 의 ajax
		}); // /. workDetailSaveBtn click

  // 작업 삭제 이벤트 핸들러
  $('#workDetailDeleteBtn').click(function() {
    if (confirm('이 작업을 삭제하시겠습니까?')) {
      	$.ajax({
          url: 'workDetailDelete',  // 서버의 삭제 처리 경로
          type: 'POST',
          data: {
              workDetailModalWorkId: workDetailModalWorkId
          },
          success: function(response) {
              if (response.success) {
                  alert('작업이 성공적으로 삭제되었습니다.');
              } else {
                  alert('작업 삭제에 실패했습니다: ' + response.message);
              }
          }.bind(this),  // 현재 클릭한 버튼에 대한 참조를 유지
          error: function(xhr, status, error) {
              alert('삭제 과정에서 오류가 발생했습니다: ' + error);
          }
        }); // /. workDetailDelete ajax
	    } // /.confirm
		}); // /. workDetailDeleteBtn
		
	}); // /.workDetailModalBtn click function
}); // /. 페이지 로드
	
		
	}); // /.workDetailModalBtn click function
}); // /. 페이지 로드
	