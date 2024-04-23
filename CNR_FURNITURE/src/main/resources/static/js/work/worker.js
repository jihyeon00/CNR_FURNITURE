//페이지가 로드될 때
$(document).ready(function() {
	
		/***************** workerInsert - 작업자 관리 - 조회 등록 수정 삭제 ****************************/
	
	/* 작업자 관리 모달창 - Ajax로 해당 행의 내용 조회 */
	$('.workerInsertBtn').click(function() {
		
		var edit_w_id = $(this).data('work-id');							// 등록 버튼에서 w_id 값 가져오기
		var edit_w_lot_id = $(this).data('lot-id');						// 등록 버튼에서 w_lot_id 값 가져오기
		var edit_w_pi_id = $(this).data('pi-id');							// 등록 버튼에서 w_pi_id 값 가져오기
		var edit_pi_machine_id = $(this).data('mi-id');				// 등록 버튼에서 pi_machine_id 값 가져오기
		var edit_w_start_time = $(this).data('start-time');		// 등록 버튼에서 w_start_time 값 가져오기
		var edit_w_end_time = $(this).data('end-time');				// 등록 버튼에서 w_end_time 값 가져오기
		
		console.log('선택된 edit_w_id: ', edit_w_id);
		console.log('선택된 edit_w_lot_id: ', edit_w_lot_id);
		console.log('선택된 edit_w_pi_id: ', edit_w_pi_id);
		console.log('선택된 edit_pi_machine_id: ', edit_pi_machine_id);
		console.log('선택된 edit_w_start_time: ', edit_w_start_time);
		console.log('선택된 edit_w_end_time: ', edit_w_end_time);
		
		/* [작업번호]에 따른 [제조LOT번호], [공정번호], [설비번호], [작업시작시간], [작업종료시간] 조회 */
		$.ajax({
			url: '/workerInsertModalSelectData?w_id='+edit_w_id,
			type: 'GET',
			data: { 
				edit_w_id: edit_w_id,
				edit_w_lot_id : edit_w_lot_id,
				edit_w_pi_id : edit_w_pi_id,
				edit_pi_machine_id : edit_pi_machine_id,
				edit_w_start_time : edit_w_start_time,
				edit_w_end_time : edit_w_end_time
				 },
			success: function(data) {
				$('#edit_w_id').val(data.edit_w_id);
				$('#edit_w_lot_id').val(data.edit_w_lot_id);
				$('#edit_w_pi_id').val(data.edit_w_pi_id);
				$('#edit_pi_machine_id').val(data.edit_pi_machine_id);
				$('#edit_w_start_time').val(data.edit_w_start_time);
				$('#edit_w_end_time').val(data.edit_w_end_time);
			},
			error: function() {
				console.log("작업자관리 모달창의 데이터 조회 실패 Error", error);
				alert('데이터를 불러오는데 실패했습니다.');
			}
		}); // ./workerInsertModalSelectData 의 ajax
		
		/* 부서명 선택에 따른 사원번호 조회 */
		$("select[name=edit_dp_name]").change(function() {
			var edit_dp_name = $(this).val();
			
			console.log('edit_dp_name : '+edit_dp_name);
			$.ajax({
				url: '/workerInsertModalEmpInfoByDpName',	// 이 URL은 Backend에서 처리할 경로
				type: 'GET',
				data: {edit_dp_name: edit_dp_name},
				success: function(data) {
			    console.log('edit_dp_name : ' + data.edit_dp_name);
			    $('#workerInsertEmpInfoList').empty();
			    let str = '<datalist id="workerInsertEmpInfoList">';
			    $.each(data, function(i) {
			        str += '<option value="' + data[i].edit_emp_id + '">' + data[i].edit_dp_name + ' ' 
			                + data[i].edit_e_name + '(' + data[i].edit_e_role + ')' + '</option>';
			    });
			    str += '</datalist>';
			    $('#edit_emp_id').after(str);
				},
					error: function(xhr, status, error) {	// 실패 시
						console.log("Error workerInsert DpName EmpId : ", error);
				}
			}); // ./ 부서명 선택에 따른 사원번호 조회 ajax
		}); // ./ select[name=edit_dp_name] change function
		
		/* 작업번호에 따른 작업자 정보 조회 */
			$.ajax({
				url: '/workerInsertModalWorkerInfoByWorkId',	// 이 URL은 Backend에서 처리할 경로
				type: 'GET',
				data: {edit_w_id: edit_w_id},
				success: function(data) {	// 성공 시
					console.log('edit_w_id : ' + data.edit_w_id);
					// 테이블
					var table = $('.workerInsertModalWorkerInfoByWorkIdList tbody');
					table.empty();
					var tbody ='';
					 if(data.length > 0){
		        $.each(data , function(i){
		           	tbody += '<tr class="'+data[i].workerInfoEmpId+'">'
								tbody +=	'<td>'+ data[i].workerInfoDpName+'</td>';					// 부서명
								tbody +=	'<td>'+ data[i].workerInfoEmpId+'</td>';					// 사원번호
								tbody +=	'<td>'+ data[i].workerInfoEmpName+'</td>';				// 사원명
								tbody +=	'<td>'+ data[i].workerInfoEmpRole+'</td>';				// 직급
								tbody += '<td class="delete-button" data-emp-id="' + data[i].workerInfoEmpId + 
													'" data-work-id="' + edit_w_id + 
													'" style="cursor:pointer; color:#c82333; text-align:center;">삭제</td>';
								tbody +=	'</tr>';
		        });
		        
		       } else {
						 tbody += '<tr><td colspan="5">조회된 내용이 없습니다.</td><tr>';
					 }
					 table.append(tbody);
				},
					error: function(xhr, status, error) {	// 실패 시
						console.log("Error workerInsert WorkId WorkerInfo : ", error);
				}
			}); // ./ 작업번호에 따른 작업자 정보 조회 ajax
		
		
		
		/* 작업자관리 모달창 - [추가] 버튼 클릭 이벤트 */
			$('#addInsertWorkerBtn').click(function() {
				console.log('작업자관리 추가 버튼 클릭');	// 디버깅을 위한 코드
				// 모달창에서 입력된 데이터 수집
				var data = collectDataFromModal();
				console.log('작업자관리 모달창에서 입력된 데이터: ', data);
				
				// 입력 필드 유효성 검사
				if(!validateFields(data)) {
					return;	// 유효성 검사 실패 시 추가 작업 중단
				}
				
				// 중복 데이터 검사
		    if (isDuplicateData(data)) {
		        alert('이미 목록에 존재하는 데이터입니다.');
		        return; // 중복 데이터 존재 시 추가 작업 중단
		    }
				
				console.log('유효성 검사 데이터: ', data);	// 유효성 검사 data 디버깅
				
				// 데이터 목록에 추가
				addToInserWorkerList(data);
				
				clearInputFields();
				
			}); // /.작업자관리 모달창 - [추가] 버튼 클릭 이벤트
			
			/* 중복 데이터 검사 */
			function isDuplicateData(data) {
			    var isDuplicate = false;
					var existingEmpIds = [];
					
					    // 이미 등록된 작업자 목록 검사
					    $('.workerInsertModalWorkerInfoByWorkIdList tbody tr').each(function() {
					        var empId = $(this).find('td:nth-child(2)').text();  // 사원번호 칼럼
					        existingEmpIds.push(empId);
					    });
					
					    // 추가된 작업자 목록 검사
					   $('.workerInsertModalWorkerInsertList tbody tr').each(function() {
					        var empId = $(this).find('td').first().text();  // 첫 번째 <td>에 있는 사원번호
					        existingEmpIds.push(empId);
					    });
					
					    // 입력된 데이터의 사원번호가 기존 목록에 있는지 확인
					    if (existingEmpIds.indexOf(data.empIdModal) !== -1) {
					        isDuplicate = true;
					    }
					
					    return isDuplicate;
					}
			
			/* 모달창에서 입력된 데이터 수집하는 함수 */
			function collectDataFromModal() {
				// 모달창에서 입력된 데이터 수집
				return {
					wIdModal: $('#edit_w_id').val(),																// 작업번호
					wStartTimeModal: $('#edit_w_start_time').val().substr(0,10)+
													' '+$('#edit_w_start_time').val().substr(11),		// 작업시작시간
					wEndTimeModal: $('#edit_w_end_time').val().substr(0,10)+
													' '+$('#edit_w_end_time').val().substr(11),			// 작업종료시간
					empIdModal: $('#edit_emp_id').val()															// 사원번호
				};
			}
			
			/* 입력 필드 유효성 검사 */
			function validateFields(data) {
				if(!$('#edit_w_id').val() ||
					 !$('#edit_emp_id').val()) {
					// 유효성 검사 실패 시 알림 표시
					if (!$('#edit_emp_id').val()) {
						alert('[사원번호]를 입력하세요. ');
						$('#edit_emp_id').focus();
					} 
					return false;
			  }
			  return true;
			}
			/* 목록(Table)에 데이터(행) 추가하는 함수 */
		  function addToInserWorkerList(data) {
				// 테이블
				var table = $('.workerInsertModalWorkerInsertList tbody');
				
				/* 테이블 행 추가 */
				// [주의]: data.컬럼명의 '컬럼명'은 collectDataFromModal() 함수의 컬럼명과 일치시킬 것.
				var newRow = `<tr>
		    	<input type="hidden" class="wIdModal" value="${data.wIdModal}">											// 작업번호
		    	<input type="hidden" class="wStartTimeModal" value="${data.wStartTimeModal}">				// 작업시작시간
		    	<input type="hidden" class="wEndTimeModal" value="${data.wEndTimeModal}">						// 작업종료시간
        	<td class="empIdModal">${data.empIdModal}</td>																			// 사원번호
		      <td onclick="removeRow(this);" 
		      	style="cursor:pointer; 
		    		color:#c82333; 
		    		text-align:center;">
			      	삭제
			    </td> 																																							// [삭제] 버튼
		    </tr>`;
		    
		    table.append(newRow);
			}
			
			/* 입력 필드 초기화 함수 */
			function clearInputFields() {
		    $('#edit_emp_id').val('');
		    var table = $('.workerInsertModalWorkerInsertList tbody');
			}
			
			/* 행 삭제 */
			window.removeRow = function(button) {
				if(confirm('삭제하시겠습니까?')) {
					$(button).closest('tr').remove();
					var table = $('.workerInsertModalWorkerInsertList tbody');
				}
			}
			
			
			/* 모달창 - [등록] 버튼 클릭 이벤트 */
			$('#WorkerInsertModalInsertBtn').click(function() {
				var arrays = collectArrFromTable();	// 테이블에서 모든 항목 수집
				if(arrays.length === 0) {
					alert('등록할 내용이 없습니다.');
					return;
				}
				if(confirm('작업자를 등록하시겠습니까?')) {
					workerInsertArr(arrays);	// 수집된 데이터를 DB에 저장
				}
			});
			
			/* 등록 - 테이블에서 데이터 수집 */
			function collectArrFromTable() {
				var arrays = [];
				$('.workerInsertModalWorkerInsertList tbody tr').each(function() {
					var row = $(this);
					console.log('wIdModal : '+row.find('.wIdModal').val());
					console.log('wStartTimeModal : '+row.find('.wStartTimeModal').val());
					console.log('wEndTimeModal : '+row.find('.wEndTimeModal').val());
					console.log('empIdModal : '+row.find('.empIdModal').text());
					arrays.push({
						edit_w_id: row.find('.wIdModal').val(),
						edit_w_start_time: row.find('.wStartTimeModal').val(),
						edit_w_end_time: row.find('.wEndTimeModal').val(),
						edit_w_emp_id: row.find('.empIdModal').text()
					});
				});
				return arrays;
			}
			
			/* 등록 - 데이터베이스 저장 로직 */
			function workerInsertArr(arrays) {
				$.ajax({
					url: '/workerInsertArr',	// 데이터 저장을 처리하는 서버의 API 경로
					type: 'POST',
					contentType: 'application/json',
					data: JSON.stringify(arrays),
					success: function(response) {
						alert('등록이 완료되었습니다.');
						window.location.href = '/M/process/workerInsert';	// 저장 후, '/work'로 리다이렉트
					},
					error: function(xhr, status, error) {
						console.error('작업자등록 Error', error);
					}
				});
			}
		
		/* 작업자 삭제를 위한 ajax 코드 */
		$(document).on('click', '.delete-button', function() {
    var empId = $(this).data('emp-id');
    var workId = $(this).data('work-id');
    
    if (confirm('이 작업자를 삭제하시겠습니까?')) {
        $.ajax({
            url: '/deleteWorker',  // 서버의 삭제 처리 경로
            type: 'POST',
            data: {
                emp_id: empId,
                work_id: workId
            },
            success: function(response) {
                if (response.success) {
                    alert('작업자가 성공적으로 삭제되었습니다.');
                    $(this).closest('tr').remove(); // 테이블에서 해당 행 삭제
                } else {
                    alert('작업자 삭제에 실패했습니다: ' + response.message);
                }
            }.bind(this),  // 현재 클릭한 버튼에 대한 참조를 유지
            error: function(xhr, status, error) {
                alert('삭제 과정에서 오류가 발생했습니다: ' + error);
            }
        }); // /. deleteWorker ajax
	    }
		}); // /.delete-button
		
	}); // /.workerInsertBtn click function
	
	
});/* ./페이지 로드 */
