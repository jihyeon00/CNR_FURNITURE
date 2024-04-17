/* 페이지가 준비되면 바로 실행되는 함수 */
$(document).ready(function() {
	/* 검색 기능 */
	function search() {
		// 불량유형1의 option을 선택했다가, 
		// 다시 "불량유형1 선택" option을 선택하면, qsDiv1 필드를 제출(검색 submit) 데이터에서 제외
		if($('#qsDiv1').val() === '') {
			$('#qsDiv1').removeAttr('name');	// qsDiv1 필드를 제출 데이터에서 제외
		}
		// 검색 로직 실행
		$('#searchInspProcess').submit();
	}
	
	/* 검색용 - [불량유형1]에 따른 [불량유형2] option 조회 */
	$('#qsDiv1').on('change', function() {
		var qsDiv1 = $(this).val();				// qsDiv1의 선택된 값 가져오기
		var qsDiv2Select = $('#qsDiv2');	// qsDiv2 셀렉트 박스 선택
		qsDiv2Select.empty();	// 기존의 옵션들을 비우기

		if (qsDiv1) {
			$.ajax({
				url: '/qsDiv2ListProcess?qsDiv1=' + qsDiv1,
				type: 'GET',
				dataType: 'json',
				success: function(data) {

					console.log('response data', data);

					// 데이터가 비어있지 않으면 옵션 추가
					if (data.length > 0) {
						$.each(data, function(index, item) {
							qsDiv2Select.append($('<option>', {
								value: item.qsDiv2,
								text: item.qsDiv2
							}));
						});
					} else {
						qsDiv2Select.append('<option value="">No Options Available</option>');	// 옵션이 없는 경우
					}
				},
				error: function(xhr, status, error) {
					console.error("Error loading qsDiv2 options: ", error);
				}
			});
		} else {
			qsDiv2Select.append('<option value="">[불량유형1]을 선택하세요.</option>');	// qsDiv1이 선택되지 않았을 경우
		}
	});
	
	/* 모달창 - 처음에는 [공정불량목록]을 숨긴다. */
	$('.newInspList').hide();
	
	/* 모달창 - [불량유형1]에 따른 [불량유형2] option 값 변경 */
	/* 모달창 - 불량유형1 option 선택에 따른 불량유형2 option값 변경 */
	$('#qsDiv1ForInsertModal').on('change', function() {
	  var qsDiv1 = $(this).val();                // qsDiv1의 선택된 값 가져오기
	  var qsDiv2Select = $('#qsDiv2ForInsertModal');      // qsDiv2 셀렉트 박스 선택
	  qsDiv2Select.empty();                     // 기존의 옵션들을 비우기
	
	  if (qsDiv1) {
	    $.ajax({
	      url: '/qsDiv2ProcessModalList?qsDiv1=' + qsDiv1,
	      type: 'GET',
	      dataType: 'json',
	      success: function(data) {
	        if (data.length > 0) {
	          $.each(data, function(index, item) {
	            qsDiv2Select.append($('<option>', {
	              value: item.qsDiv2 || '',
	              text: item.qsDiv2 || 'No Valid Option'
	            }));
	          });
	        } else {
	          qsDiv2Select.append('<option value="">No Options Available</option>');	// 옵션이 없는 경우
	        }
	      },
	      error: function(xhr, status, error) {
	        console.error("Error loading qsDiv2 options: ", error);
	        qsDiv2Select.append('<option value="">Failed to Load Options</option>');
	      }
	    });
	  } else {
	    qsDiv2Select.append('<option value="">[불량유형1]을 선택하세요.</option>');	// qsDiv1이 선택되지 않았을 경우
	  }
	});
	
	
	/** [등록] 모달창 
	 * - [작업번호] 입력에 따른 [공정번호], [공정명], [제조LOT번호]
	 * [설비번호], [단위], [일일총생산수량] 자동 채우기
	 */
	$('#workIDForInsertModal').change(function() {
		var workID = $(this).val();
		
		$.ajax({
			url: '/workDetailsModal',
			type: 'GET',
			data: {workID: workID},
			
			success: function(data) {	// 성공 시
				$('#processIDForInsertModal').val(data.processID);									// 공정번호(INSERT 모달용)
				$('#processNameForInsertModal').val(data.processName);							// 공정명
				$('#lotIDForInsertModal').val(data.lotID);													// 제조LOT번호
				$('#machineIDForInsertModal').val(data.machineID);									// 설비번호
				$('#unitForInsertModal').val(data.unit);														// 단위
				$('#dailyWorkQuantityForInsertModal').val(data.dailyWorkQuantity);	// 일일총작업수량
			},
			
			error: function(xhr, status, error) {	// 실패 시
				console.log("Error work details: ", error);
			}
		});
	});
	
	/** [등록] 모달창 
	 * - [추가] 버튼 클릭 시,
	 * 입력한 내용이 목록에 표시됨
	 */
	$('#addInspectionBtn').click(function() {
		console.log('공정불량등록 [추가] 버튼 클릭');
		// 모달창에서 입력된 데이터 수집
		var data = collectDataFromModal();	// 공정불량데이터
		console.log('모달창에서 입력된 데이터: ', data);
		
		// 입력 필드 유효성 검사
		if(!validateFields(data)) {
			return;	// 유효성 검사 실패 시, 추가 작업 중단
		}
		console.log('유효성 검사 데이터: ', data);	// 유효성 검사 data 디버깅
		
		// 데이터 목록에 추가
		addToInspectionList(data);
		
		// [자재불량목록]을 보이게 한다.
		$('.newInspList').css('display', 'block');
		console.log('display = block');
		
		// 입력 필드 초기화
		clearInputFields();
		console.log('입력필드 초기화');
	});
	
	/** [등록] 모달창 
	 * - 모달창에서 입력된 데이터 수집하는 함수
	 */
	function collectDataFromModal() {
		// 모달창에서 입력된 데이터 수집
		return {
			// 1행: 작업번호, 공정번호, 공정명
			workID: $('#workIDForInsertModal').val(),
			processID: $('#processIDForInsertModal').val(),
			processName: $('#processNameForInsertModal').val(),
			// 2행: 제조LOT번호, 설비번호, 단위
			lotID: $('#lotIDForInsertModal').val(),
			machineID: $('#machineIDForInsertModal').val(),
			unit: $('#unitForInsertModal').val(),
			// 3행: 일일총작업수량, 검사수량, 불량수량
			dailyWorkQuantity: $('#dailyWorkQuantityForInsertModal').val(),
			inspectionQuantity: $('#inspQuantityForInsertModal').val(),
			defectQuantity: $('#dftQuantityForInsertModal').val(),
			// 나머지: 불량유형1, 불량유형2, 비고, 입력날짜(검사일자)
			qsDiv1: $('#qsDiv1ForInsertModal').val(),
			qsDiv2: $('#qsDiv2ForInsertModal').val() || '',
			note: $('#noteForInsertModal').val() || '',
			
			inspectionDate: new Date().toISOString().split('T')[0]  	// 오늘 날짜를 YYYY-MM-DD 형식으로
		};
	}
	
	/** [등록] 모달창 
	 * - 입력 필드 유효성 검사
	 * => 불량수량: 0 가능
	 * => 불량유형2: null 가능
	 * => 비고: null 가능
	 */
	function validateFields(data) {
		if(
			// 1행: 작업번호, 공정번호, 공정명
			!$('#workIDForInsertModal').val() ||
			!$('#processIDForInsertModal').val() ||
			!$('#processNameForInsertModal').val() ||
			// 2행: 제조LOT번호, 설비번호, 단위
			!$('#lotIDForInsertModal').val() ||
			!$('#machineIDForInsertModal').val() ||
			!$('#unitForInsertModal').val() ||
			// 3행: 일일총작업수량, 검사수량, 불량수량
			!$('#dailyWorkQuantityForInsertModal').val() ||
			!$('#inspQuantityForInsertModal').val() ||
			!$('#dftQuantityForInsertModal').val() ||
			// 4행: 불량유형1
			!$('#qsDiv1ForInsertModal').val()
		) { // 유효성 검사 실패 시, 알림 표시
			if(!$('#workIDForInsertModal').val()) {
			 	alert('[작업번호]를 입력하세요. 숫자만 가능합니다.');
				$('#workIDForInsertModal').focus();
			} else if(!$('#inspQuantityForInsertModal').val()) {
				alert('[검사수량]를 입력하세요. 숫자만 가능합니다.');
				$('#inspQuantityForInsertModal').focus();
			} else if(!$('#dftQuantityForInsertModal').val()) {
				alert('[불량수량]를 입력하세요. 숫자만 가능합니다.');
				$('#dftQuantityForInsertModal').focus();
			} else if(!$('#qsDiv1ForInsertModal').val()) {
				alert('[불량유형1]를 입력하세요.');
				$('#qsDiv1ForInsertModal').focus();
			}
			return false;
		}
		
		// [일일총작업수량] >= [검사수량] >= [불량수량]
		var dailyWorkQuantity = parseInt($('#dailyWorkQuantityForInsertModal').val(), 10);	// '10'은 10진수를 의미
		var inspectionQuantity = parseInt($('#inspQuantityForInsertModal').val(), 10);
		var defectQuantity = parseInt($('#dftQuantityForInsertModal').val(), 10);
		
		if(isNaN(dailyWorkQuantity) || isNaN(inspectionQuantity) || isNaN(defectQuantity)) {
			alert('일일총작업수량/검사수량/불량수량에 유효한 숫자를 입력해주세요.');
			$('#dftQuantityForInsertModal').focus();
			return false;
		}
		if(dailyWorkQuantity > inspectionQuantity) {
			alert('[검사수량]은 [일일총작업수량]보다 많을 수 없습니다.');
			$('#inspQuantityForInsertModal').focus();
			return false;
		}
		if(inspectionQuantity > defectQuantity) {
			alert('[불량수량]은 [검사수량]보다 많을 수 없습니다.');
			$('#dftQuantityForInsertModal').focus();
			return false;
		}
		return false;
	}
	
	/** [등록] 모달창 
	 * - 목록(Table)에 데이터(행) 추가하는 함수
	 */
	function addToInspectionList(data) {
		// 테이블
		var table = $('.newInspList tbody');
		// 불량률 계산
		var defectRate = calculateDefectRate(data.defectQuantity, data.inspectionQuantity);
		
		// 테이블 행 추가
		// [주의]: data.컬럼명의 '컬럼명'은 collectDataFromModal() 함수의 컬럼명과 일치시킬 것.
		var newRow = `<tr>
			<td class="listSeq">${table.children().length + 1}</td>						// 추가된 목록 번호
			<td class="workID">${data.workID}</td>
			<td class="lotID">${data.lotID}</td>
			<td class="machineID">${data.machineID}</td>
			
			<td class="processID">${data.processID}</td>
			<td class="processName">${data.processName}</td>
			<td class="unit">${data.unit}</td>
      
      <td class="dailyWorkQuantity">${data.dailyWorkQuantity}</td>
      <td class="inspectionQuantity">${data.inspectionQuantity}</td>
      
      <td class="defectQuantity">${data.defectQuantity}</td>
      <td class="defectRate">${data.defectRate}</td>
      <td class="goodQuantity">${data.goodQuantity}</td>
      
      <td class="qsDiv1">${data.qsDiv1}</td>
      <td class="qsDiv2">${data.qsDiv2 || ''}</td>
      <td class="inspectionDate">${data.inspectionDate}</td>						// 검사일자(입고일자)
      
      <td class="note">${data.note || ''}</td>
      
      <td onclick="removeRow(this);" 
      	style="cursor:pointer; 
    		color:#c82333; 
    		text-align:center;">
	      	삭제
	    </td> 																																// [삭제] 버튼
    </tr>`;
    table.append(newRow);
    updateGoodQuantities();	// 양품수량 전체 업데이트
	}
	
	/**
	 * [등록] 모달창 
	 * - [양품수량] 계산 및 테이블 목록에 업데이트하는 함수
	 * - 동일한 [공정품]이지만, 다른 종류의 불량인 경우를 위해,
	 *   계산이 필요함.
	 */
	function updateGoodQuantities() {
		$('.newInspList tbody tr').each(function() {
			var row = $(this);
			var inspectionQuantity = parseInt(row.find('.inspectionQuantity').text(), 10);	// 검사수량
			var totalDefects = totalDefectQuantity({
				workID: row.find('.workID').text()
			});
			var goodQuantity = Math.max(inspectionQuantity - totalDefects, 0);	// 음수 방지
			row.find('.goodQuantity').text(goodQuantity);		// 목록의 양품수량 Update
		});
	}
	
	/**
	 * [등록] 모달창
	 * - 불량률 계산 함수
	 */
	function calculateDefectRate(defectQuantity, inspectionQuantity) {	// [불량수량], [검사수량]을 받아 계산
		// 숫자로 변환
		defectQuantity = parseFloat(defectQuantity, 10);											// '10'은 10진수를 의미
		inspectionQuantity = parseFloat(inspectionQuantity, 10);
		if(inspectionQuantity > 0) {
			return ((defectQuantity / inspectionQuantity) * 100).toFixed(2);	// 소수점 2번째 자리까지
		}
	  return "0.00"; // 검사수량이 0일 경우 불량률도 0으로 처리
	}
	
	/**
	 * [등록] 모달창
	 * - 누적 불량수량 계산 함수
	 * - 동일한 [공정품]이지만, 다른 종류의 불량인 경우를 위해,
	 *   계산이 필요함.
	 */
	function totalDefectQuantity(data) {
		var total = 0;
		$('.newInspList tbody tr').each(function() {
			if($(this).find('.workID').text() === data.workID) {
				total += parseInt($(this).find('.defectQuantity').text(), 10);
			}
		});
		return total;
	}
	
	/**
	 * [등록] 모달창
	 * - 입력 필드 초기화 함수
	 */
	function clearInputFields() {
    $('#registerProcessInspection input, #registerProcessInspection select').val('');
	}
	
	/**
	 * [등록] 모달창
	 * - 행 삭제 및 양품수량 업데이트
	 */
	window.removeRow = function(data) {
		if(confirm('삭제하시겠습니까?')) {
			$(button).closest('tr').remove();
			updateGoodQuantities();
		}
	}
	
	/**
	 * [등록] 모달창
	 * - [등록] 버튼 클릭 이벤트
	 */
	$('#registerBtn').click(function() {
		var items = collectItemsFromTable();	// 테이블에서 모든 항목 수집
		if(items.length === 0) {
			alert('등록할 내용이 없습니다.');
			return;
		}
		if(confirm('공정불량정보를 등록하시겠습니까?')) {
			registerInspectionProcess(items);	// 수집된 데이터를 DB에 저장
		}
	});
	
	/**
	 * [등록] 모달창
	 * - 테이블에서 데이터 수집
	 */
	function collectItemsFromTable() {
		var items = [];
		$('.newInspList tbody tr').each(function() {
			var row = $(this);
			items.push({
				workID: row.find('.workID').text(),
				lotID: row.find('.lotID').text(),
				machineID: row.find('.machineID').text(),
				
				processID: row.find('.processID').text(),
				processName: row.find('.processName').text(),
				unit: row.find('.unit').text(),
				
				dailyWorkQuantity: row.find('.dailyWorkQuantity').text(),
				inspectionQuantity: row.find('.inspectionQuantity').text(),
				
				defectQuantity: row.find('.defectQuantity').text(),
				defectRate: row.find('.defectRate').text(),
				goodQuantity: row.find('.goodQuantity').text(),
				
				qsDiv1: row.find('.qsDiv1').text(),
				qsDiv2: row.find('.qsDiv2').text() || '',
				inspectionDate: row.find('.inspectionDate').text(),
				
				note: row.find('.note').text() || '',
				
			});
		});
		return items;
	}
	
	/**
	 * [등록] 모달창
	 * - 데이터베이스 저장 로직
	 */
	function registerInspectionProcess(items) {
		$.ajax({
			url: '/inspectionProcess/register',	// 데이터 저장을 처리하는 서버의 API 경로
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(items),
			success: function(response) {
				alert('등록이 완료되었습니다.');
				/*window.location.reload();					// 저장 후, 페이지 새로고침*/
				window.location.href = '/inspectionProcess';	// 저장 후, '/inspectionProcess'로 리다이렉트
			},
			error: function(xhr, status, error) {
				console.error('공정불량등록 Error', error);
			}
		});
	}
	
	
	
	
	
	
	
	
	
});