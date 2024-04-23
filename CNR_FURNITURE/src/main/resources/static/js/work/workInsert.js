//페이지가 로드될 때
$(document).ready(function() {

/***************** work - 작업등록 모달창 - 등록 ****************************/
	
	/* 작업등록 모달창
	 * 1. [로트번호] 입력에 따른 [공정번호] 조회
	 * 2. [로트번호] 입력에 따른 [제품번호],[제품명],[생산단위] 조회 및 자동채우기
	 * 3. [공정번호] 입력에 따른 [공정명], [설비번호], [설비명], [작업위치] 조회 및 자동채우기
	 * 4. 남은생산수량 : 로트번호, 공정번호 같은 값 가진 애들의 생산수량을 파악하여 자동채우기
	 * 5. 추가버튼을 통해 배열 테이블 추가
	 */
	
	/* 모달창 - 처음에는 [작업등록목록]을 숨긴다. */
	$('.newWorkList').css('display', 'none');

	// input[type="datetime-local"]에 대해 30분 단위로 시간 조정하는 함수
  function adjustTimeToHalfHour(selector) {
    $(selector).on('change', function() {
      var value = $(this).val();  // 현재 입력된 값 가져오기
      var date = new Date(value); // 입력된 값을 Date 객체로 변환

      // 분이 0 또는 30이 아닌 경우 조정 필요
      if (date.getMinutes() !== 0 && date.getMinutes() !== 30) {
        // 현재 분이 30분보다 적으면 30으로, 아니면 다음 시간의 0분으로 설정
        var minutes = date.getMinutes() < 30 ? 30 : 60;
        date.setMinutes(minutes % 60);  // 분을 30 또는 0으로 설정
        if (minutes === 60) {
            date.setHours(date.getHours() + 1); // 분을 60으로 설정했다면 시간을 1시간 증가
        }

        // 시간대 오프셋을 고려하여 ISO 문자열을 잘라 입력 필드에 설정
        $(this).val(new Date(date.getTime() - (date.getTimezoneOffset() * 60000)).toISOString().slice(0, 16));
      }
    });
  }

  // 시작시간과 종료시간 필드에 30분 단위 조정 기능 적용
  adjustTimeToHalfHour('#workInsertModalWorkStartTime');
  adjustTimeToHalfHour('#workInsertModalWorkEndTime');
	
	
	// 제조로트번호의 값이 변경될 경우 실행될 ajax
	$('#workInsertModalLotId').change(function() {
		$('#workInsertModalProcessId').val(''),											
		$('#workInsertModalProcessName').val(''),								
		$('#workInsertModalMachineId').val(''),						
		$('#workInsertModalMachineName').val('');										
		$('#workInsertModalWorkPosition').val(''); 
		$('#workInsertModalItemId').val(''); 
		$('#workInsertModalItemName').val(''); 
		$('#workInsertModalUnit').val(''); 
		$('#workInsertModalLeftoverQuantity').val(''); 
		$('#workInsertModalPlanQuantity').val(''); 
		$('#workInsertModalWorkTime').val(''); 
		$('#workInsertModalWorkStartTime').val(''); 
		$('#workInsertModalWorkEndTime').val(''); 
		$('#workInsertModalNote').val(''); 
		
		var workInsertModalLotId = $(this).val();
		
		// [로트번호] 입력에 따른 [공정번호] 조회
		$.ajax({
			url: 'workInsertModalProIdByLotId',	// 이 URL은 Backend에서 처리할 경로
			type: 'GET',
			data: {workInsertModalLotId: workInsertModalLotId},
			success: function(data) {	// 성공 시
			console.log('workInsertModalLotId : '+ workInsertModalLotId);
        $('#workInsertModalProcessId').empty();
				let str = '<option value="">공정번호</option>';
        $.each(data , function(i){
            str += '<option value="' + data[i].workInsertModalProcessId + '">' + data[i].workInsertModalProcessId+'</option>'
        });
        $('#workInsertModalProcessId').append(str);
			},
				error: function(xhr, status, error) {	// 실패 시
					console.log("Error workInsertModal lotId proId : ", error);
			}
		}); // /.[로트번호] 입력에 따른 [공정번호] 조회
		
		// [로트번호] 입력에 따른 [제품번호],[제품명],[생산단위] 조회 및 자동채우기
		$.ajax({
			url: 'workInsertModalAutoDataByLotId',	// 이 URL은 Backend에서 처리할 경로
			type: 'GET',
			data: {workInsertModalLotId: workInsertModalLotId},
			
			success: function(data) {	// 성공 시
        $('#workInsertModalItemId').val(data.workInsertModalItemId);
        $('#workInsertModalItemName').val(data.workInsertModalItemName);
        $('#workInsertModalUnit').val(data.workInsertModalUnit);
			},
			
			error: function(xhr, status, error) {	// 실패 시
				console.log("Error workInsert lotId AutoData : ", error);
			}
		}); // /.[로트번호] 입력에 따른 [제품번호],[제품명],[생산단위] 자동채우기
		
		// [공정번호] 입력에 따른 [공정명], [설비번호], [설비명], [작업위치] 조회 및 자동채우기
		$('#workInsertModalProcessId').on('change', function() {
		  var workInsertModalProcessId = $(this).val();                // qsDiv1의 선택된 값 가져오기
		  $.ajax({
				url: 'workInsertModalAutoDataByProId',	// 이 URL은 Backend에서 처리할 경로
				type: 'GET',
				data: {
					workInsertModalLotId: workInsertModalLotId,
					workInsertModalProcessId : workInsertModalProcessId
				},
				success: function(data) {	// 성공 시
	        $('#workInsertModalProcessName').val(data.workInsertModalProcessName);
	        $('#workInsertModalMachineId').val(data.workInsertModalMachineId);
	        $('#workInsertModalMachineName').val(data.workInsertModalMachineName);
	        $('#workInsertModalWorkPosition').val(data.workInsertModalWorkPosition);
	        
	        if(data.workInsertModalLeftoverQuantity<=0){
						data.workInsertModalLeftoverQuantity = 0;
						$('#workInsertModalLeftoverQuantity').val(data.workInsertModalLeftoverQuantity) ;
					} else {
		        $('#workInsertModalLeftoverQuantity').val(data.workInsertModalLeftoverQuantity);
					}
				},
				error: function(xhr, status, error) {	// 실패 시
					console.log("Error workInsert lotId proId AutoData : ", error);
				}
			}); // /.[공정번호] 입력에 따른 [공정명], [설비번호], [설비명], [작업위치] 조회 및 자동채우기
			
			// [공정번호] 입력에 따른  [남은생산수량] 조회 및 자동채우기
			$.ajax({
				url: 'workInsertModalLeftoverQuantityByProId',	// 이 URL은 Backend에서 처리할 경로
				type: 'GET',
				data: {
					workInsertModalLotId: workInsertModalLotId,
					workInsertModalProcessId : workInsertModalProcessId
				},
				success: function(data) {	// 성공 시
					if(data.workInsertModalLeftoverQuantity<=0){
						data.workInsertModalLeftoverQuantity = 0;
						$('#workInsertModalLeftoverQuantity').val(data.workInsertModalLeftoverQuantity) ;
					} else {
		        $('#workInsertModalLeftoverQuantity').val(data.workInsertModalLeftoverQuantity);
					}
				},
				
				error: function(xhr, status, error) {	// 실패 시
					console.log("Error workInsert lotId proId LeftoverQuantity : ", error);
				}
			}); // /.[공정번호] 입력에 따른 [남은생산수량] 조회 및 자동채우기
		});/* ./ 작업등록 모달창의 [제조로트번호] 입력에 따른 ajax*/
	}); /* ./ workInsertModalLotId change function*/
	
	/*	
	 * 작업시작시간이 입력되고 작업종료시간이 입력되면
	 * 소요시간(분)에 작업종료시간 - 작업시작시간 - 60분을 계산하여 넣어준다.
	 * 작업종료시간 - 작업시작시간이 13시간 30분(810분)이상일 경우 : 작업종료시간 - 작업시작시간 - 90분
	 * 작업종료시간 - 작업시작시간이 4시간 이상 8시간 미만일 경우 : 작업종료시간 - 작업시작시간 - 30분
	 */
	
		// 작업시작시간이나 작업종료시간의 값이 변경되면 소요시간 계산
		// 또한, 작업시작시간과 작업종료시간 입력 필드에 대한 이벤트 핸들러 설정해준다.
    $('#workInsertModalWorkStartTime, #workInsertModalWorkEndTime').on('change', function() {
			
				// 작업시작시간과 작업종료시간을 현재시간보다 이전일 경우를 선택할 수 없도록 함.
				var selectedTime = new Date($(this).val()); // 사용자가 선택한 시간
        var currentTime = new Date(); // 현재 시간

        // 선택한 시간이 현재 시간보다 이전인 경우
        if (selectedTime < currentTime) {
            alert('현재 시간 이전을 선택할 수 없습니다. 시간을 다시 선택해 주세요.');
            $(this).val(''); // 입력 필드를 비웁니다.
        }
        
				// 소요시간 계산 : 작업종료시간 - 작업시작시간
        var startTime = $('#workInsertModalWorkStartTime').val();
        var endTime = $('#workInsertModalWorkEndTime').val();

        // 시작시간과 종료시간이 둘 다 입력된 경우에만 계산 수행
        if (startTime && endTime) {
						// ISO8601 포맷의 날짜 문자열을 Date 객체로 변환
			      var startDate = new Date(startTime);
			      var endDate = new Date(endTime);
			
			      // 두 시간의 차이를 밀리초 단위로 계산 후 분 단위로 변환
			      var durationMinutes = (endDate - startDate) / 60000;
						var id='';
						
			      // 작업시간 차이가 810분 (13시간 30분) 이상인 경우
			      if (durationMinutes >= 810) {
			          durationMinutes -= 90;
			      } else if (durationMinutes >= 240 && durationMinutes < 480) {
			          // 작업시간 차이가 4시간 이상 8시간 미만인 경우
			          durationMinutes -= 30;
			      } else if (durationMinutes < 240) {
			          // 작업시간 차이가 4시간 미만인 경우 - 추가적인 시간 감소 없이 순수한 차이만 적용
			          // 이 경우에는 durationMinutes가 변경되지 않으므로, 아무 조치를 취하지 않음
			      } else {
			          // 그 외의 경우 (작업시간 차이가 13시간 30분 미만이고 4시간 미만이 아닌 경우)
			          durationMinutes -= 60;
			      }

            // 결과를 소요시간 입력 필드에 설정
            $('#workInsertModalWorkTime').val(durationMinutes.toFixed(0));
        }
    });
    
    // 현재작업계획수량 입력 필드에 값이 입력되거나 변경될 때마다 검사
    $('#workInsertModalPlanQuantity').on('input', function() {
        var planQuantity = parseFloat($(this).val()); // 현재작업계획수량 값을 숫자로 변환
        var leftoverQuantity = parseFloat($('#workInsertModalLeftoverQuantity').val()); // 남은생산수량 값을 숫자로 변환

        // 남은생산수량이 0일 경우 입력을 막고 메시지를 표시합니다.
        if (leftoverQuantity === 0) {
            $(this).val(''); // 입력 필드를 비우고
            $(this).prop('disabled', true); // 입력 필드를 비활성화합니다.
            $('#addWorkInsertBtn').hide(); // 추가버튼을 숨깁니다.
            alert('남은생산수량이 0이므로, 현재작업계획수량을 입력할 수 없습니다.');
            return;
        } else {
            $(this).prop('disabled', false); // 입력 필드를 활성화합니다.
            $('#addWorkInsertBtn').show(); // 추가버튼을 다시 표시합니다.
        }

        // 남은생산수량의 1.1배를 계산
        var maxQuantity = leftoverQuantity * 1.1;

        // 입력된 계획수량이 계산된 최대값을 초과하는 경우
        if (planQuantity > maxQuantity) {
            alert('현재작업계획수량은 남은생산수량의 1.3배를 넘을 수 없습니다. 최대 허용 수량: ' + maxQuantity.toFixed(0));
            $(this).val(maxQuantity.toFixed(0)); // 입력 필드에 최대 허용 값을 설정
        }
    });
	
		// #workInsertModalLotId 또는 #workInsertModalProcessId 값이 바뀌면 현재작업계획수량 필드 활성화 후 초기화
    $('#workInsertModalLotId, #workInsertModalProcessId').on('change', function() {
        $('#workInsertModalPlanQuantity').prop('disabled', false); // 현재작업계획수량 입력 필드 활성화
        $('#workInsertModalPlanQuantity').val(''); // 입력 필드 값 초기화
        $('#addWorkInsertBtn').show(); // 비활성화 되면서 사라진 추가버튼 표시
    });
    
    
	
	/**********************  작업등록 모달창 - [추가] 버튼 클릭 이벤트 ************************/

  /* 작업등록 모달창 - [추가] 버튼 클릭 이벤트 */
	$('#addWorkInsertBtn').click(function() {
		console.log('추가 버튼 클릭');	// 디버깅을 위한 코드
		// 모달창에서 입력된 데이터 수집
		var data = collectDataFromModal();
		console.log('모달창에서 입력된 데이터: ', data);
		
		// 입력 필드 유효성 검사
		if(!validateFields(data)) {
			return;	// 유효성 검사 실패 시 추가 작업 중단
		}
		
		// 데이터 목록에 추가
		addToWorkInsertList(data);
		
		// 행 번호 업데이트
		updateRowNumbers(); 
		
		// [작업등록목록]을 보이게 한다.
		$('.newWorkList').css('display', 'block');
		console.log('display block');
		
	});/* /.작업등록 모달창 - [추가] 버튼 클릭 이벤트 */
	
	/* 목록(Table)의 행 번호를 업데이트하는 함수 */
    function updateRowNumbers() {
        $('.newWorkList tbody tr').each(function(index) {
            $(this).find('.listSeq').text(index + 1); // index는 0부터 시작하므로 1을 더합니다.
        });
    }
	
	/* 모달창에서 입력된 데이터 수집하는 함수 */
	function collectDataFromModal() {
		// 모달창에서 입력된 데이터 수집
		return {
			workInsertModalLotId: $('#workInsertModalLotId').val(),															// 제조LOT번호
			workInsertModalProcessId: $('#workInsertModalProcessId').val(),											// 공정번호
			workInsertModalProcessName: $('#workInsertModalProcessName').val(),									// 공정명
			workInsertModalMachineId: $('#workInsertModalMachineId').val(),											// 설비번호
			workInsertModalMachineName: $('#workInsertModalMachineName').val(),									// 설비명
			workInsertModalWorkPosition: $('#workInsertModalWorkPosition').val(),								// 작업위치
			workInsertModalItemId: $('#workInsertModalItemId').val(),														// 제품번호
			workInsertModalItemName: $('#workInsertModalItemName').val(),												// 제품명
			workInsertModalUnit: $('#workInsertModalUnit').val(),																// 생산단위
			workInsertModalLeftoverQuantity: $('#workInsertModalLeftoverQuantity').val(),				// 남은생산수량
			workInsertModalPlanQuantity: $('#workInsertModalPlanQuantity').val(), 							// 현재작업계획수량
			workInsertModalWorkTime: $('#workInsertModalWorkTime').val(), 											// 소요시간(분)
			workInsertModalWorkStartTime: $('#workInsertModalWorkStartTime').val().substr(0,10)	// 작업시작시간
																+' '+$('#workInsertModalWorkStartTime').val().substr(11),									
			workInsertModalWorkEndTime: $('#workInsertModalWorkEndTime').val().substr(0,10)			// 작업종료시간
																+' '+$('#workInsertModalWorkEndTime').val().substr(11),									
			workInsertModalNote: $('#workInsertModalNote').val() 																// 비고
		};
	} //  /.collectDataFromModal
	
	/* 입력 필드 유효성 검사 */
	function validateFields(data) {
		if(!$('#workInsertModalLotId').val() ||
			 !$('#workInsertModalProcessId').val() ||
			 !$('#workInsertModalProcessName').val() ||
			 !$('#workInsertModalPlanQuantity').val() ||
			 !$('#workInsertModalWorkStartTime').val() ||
			 !$('#workInsertModalWorkEndTime').val()) {
			// 유효성 검사 실패 시 알림 표시
			if (!$('#workInsertModalLotId').val()) {
				alert('[제조LOT번호]를 입력하세요. ');
				$('#workInsertModalLotId').focus();
			} else if(!$('#workInsertModalProcessId').val()) {
				alert('[공정번호]를 선택하세요.');
				$('#workInsertModalProcessId').focus();
			} else if(!$('#workInsertModalProcessName').val()) {
				alert('제조수행이 등록되지 않은 [제조LOT번호]입니다. 매니저에게 제조수행지시를 요청해주세요. ');
				$('#workInsertModalLotId').focus();
				$('#workInsertModalPlanQuantity').prop('disabled', true); // 현재작업계획수량 입력필드 비활성화
			} else if(!$('#workInsertModalPlanQuantity').val()) {
				alert('[현재작업계획수량]을 입력하세요.');
				$('#workInsertModalPlanQuantity').focus();
			} else if(!$('#workInsertModalWorkStartTime').val()) {
				alert('[작업시작시간]을 입력하세요. 30분 단위로만 입력 가능합니다.');
				$('#workInsertModalWorkStartTime').focus();
			} else if(!$('#workInsertModalWorkEndTime').val()) {
				alert('[작업종료시간]을 입력하세요. 30분 단위로만 입력 가능합니다.');
				$('#workInsertModalWorkEndTime').focus();
			} 
			return false;
	  }
	  var workInsertModalPlanQuantity = parseInt($('#workInsertModalPlanQuantity').val(), 10);	// '10'은 10진수를 의미함
	  
	  if(isNaN(workInsertModalPlanQuantity)) {
			alert('현재작업계획수량에 유효한 숫자를 입력해주세요.');
			$('#workInsertModalPlanQuantity').focus();
			return false;
		}
	  return true;
	} // /.function validateFields(data)
	
	/* 목록(Table)에 데이터(행) 추가하는 함수 */
  function addToWorkInsertList(data) {
		// 테이블
		var table = $('.newWorkList tbody');
		
		// 테이블 행 추가
		// [주의]: data.컬럼명의 '컬럼명'은 collectDataFromModal() 함수의 컬럼명과 일치시킬 것.
		var newRow = `<tr>
			<td class="listSeq"></td>																																	// 추가된 목록 번호
			<td class="LotId">${data.workInsertModalLotId}</td>												// LOT번호
			<td class="ProcessId">${data.workInsertModalProcessId}</td>								// 공정번호
			<td class="ProcessName">${data.workInsertModalProcessName}</td>						// 공정명
			<td class="MachineId">${data.workInsertModalMachineId}</td>								// 설비번호
      <td class="MachineName">${data.workInsertModalMachineName}</td>						// 설비명
      <td class="WorkPosition">${data.workInsertModalWorkPosition}</td>					// 작업위치
      <td class="ItemId">${data.workInsertModalItemId}</td>											// 제품번호
      <td class="ItemName">${data.workInsertModalItemName}</td>									// 제품명
      <td class="Unit">${data.workInsertModalUnit}</td>													// 단위
      <td class="LeftoverQuantity">${data.workInsertModalLeftoverQuantity}</td>	// 남은생산수량
      <td class="PlanQuantity">${data.workInsertModalPlanQuantity}</td>					// 현재작업계획수량
      <td class="WorkStartTime">${data.workInsertModalWorkStartTime}</td>				// 작업시작시간
      <td class="WorkEndTime">${data.workInsertModalWorkEndTime}</td>						// 작업종료시간
      <td class="WorkTime">${data.workInsertModalWorkTime}</td>									// 소요시간(분)
      <td class="Note">${data.workInsertModalNote}</td>													// 비고
      <td onclick="removeRow(this);" 
      	style="cursor:pointer; 
    		color:#c82333; 
    		text-align:center;">
	      	삭제
	    </td> 																																										// [삭제] 버튼
    </tr>`;
    table.append(newRow);
	}
	
	
	/* 행 삭제 및 번호 재정렬 */
  window.removeRow = function(button) {
      if(confirm('삭제하시겠습니까?')) {
          $(button).closest('tr').remove();
          updateRowNumbers();  // 행 번호 업데이트
      }
  };
	
	/* 모달창 - [등록] 버튼 클릭 이벤트 */
	$('#workInsertBtn').click(function() {
		var arrays = collectArrFromTable();	// 테이블에서 모든 항목 수집
		if(arrays.length === 0) {
			alert('등록할 내용이 없습니다.');
			return;
		}
		if(confirm('작업을 등록하시겠습니까?')) {
			workInsertArr(arrays);	// 수집된 데이터를 DB에 저장
		}
	});
	
	/* 등록 - 테이블에서 데이터 수집 */
	function collectArrFromTable() {
		var arrays = [];
		$('.newWorkList tbody tr').each(function() {
			var row = $(this);
			arrays.push({
				workInsertModalLotId: row.find('.LotId').text(),
				workInsertModalProcessId: row.find('.ProcessId').text(),
				workInsertModalWorkStartTime: row.find('.WorkStartTime').text(),
				workInsertModalWorkEndTime: row.find('.WorkEndTime').text(),
				workInsertModalWorkTime: row.find('.WorkTime').text(),
				workInsertModalPlanQuantity: row.find('.PlanQuantity').text(),
				workInsertModalNote: row.find('.Note').text()
			});
		});
		return arrays;
	}
	
	/* 등록 - 데이터베이스 저장 로직 */
	function workInsertArr(arrays) {
		$.ajax({
			url: 'workInsertArr',	// 데이터 저장을 처리하는 서버의 API 경로
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(arrays),
			success: function(response) {
				alert('등록이 완료되었습니다.');
				window.location.href = '/M/process/work';	// 저장 후, '/work'로 리다이렉트
			},
			error: function(xhr, status, error) {
				console.error('자재투입등록 Error', error);
			}
		});
	}

});/* ./페이지 로드 */