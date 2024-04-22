//페이지가 로드될 때
$(document).ready(function() {
	// 입력 필드 초기화
		clearInputFields();
		console.log('입력필드 초기화');
		
	// 해당 표가 보이지 않도록 한다.
  $('#selectMaterialInput').css('display', 'none');
  $('#selectWorker').css('display', 'none');
  
  // 생산실적 버튼을 누를 경우
	$('#selectProductionBtn').click(function(){
		$('#selectProduction').css('display', 'block');
	  $('#selectMaterialInput').css('display', 'none');
	  $('#selectWorker').css('display', 'none');
	  
	  $('#selectProductionBtn').css('background', '#374056');
	  $('#selectProductionBtn').css('color', '#fff');
	  
	  $('#selectMaterialInputBtn').css('color', 'inherit');
	  $('#selectMaterialInputBtn').css('background', 'inherit');
	  $('#selectWorkerBtn').css('color', 'inherit');
	  $('#selectWorkerBtn').css('background', 'inherit');
	  
	});
  
	 // 자재투입내역 버튼을 누를 경우
	$('#selectMaterialInputBtn').click(function(){
		$('#selectProduction').css('display', 'none');
	  $('#selectMaterialInput').css('display', 'block');
	  $('#selectWorker').css('display', 'none');
	  
	  $('#selectMaterialInputBtn').css('background', '#374056');
	  $('#selectMaterialInputBtn').css('color', '#fff');
	  
	  $('#selectProductionBtn').css('color', 'inherit');
	  $('#selectProductionBtn').css('background', 'inherit');
	  $('#selectWorkerBtn').css('color', 'inherit');
	  $('#selectWorkerBtn').css('background', 'inherit');
	});
	 
	// 작업자 버튼을 누를 경우
	$('#selectWorkerBtn').click(function(){
	  $('#selectProduction').css('display', 'none');
	  $('#selectMaterialInput').css('display', 'none');
	  $('#selectWorker').css('display', 'block');
	  
	  $('#selectWorkerBtn').css('background', '#374056');
	  $('#selectWorkerBtn').css('color', '#fff');
	  
	  $('#selectProductionBtn').css('color', 'inherit');
	  $('#selectProductionBtn').css('background', 'inherit');
	  $('#selectMaterialInputBtn').css('color', 'inherit');
	  $('#selectMaterialInputBtn').css('background', 'inherit');
	});
	
	// reset 이미지가 담긴 박스를 클릭할 경우 검색바의 input 값 초기화
	$('.reset').click(function() {
  	$('#find_work_company').val("");
  	$('#find_work_item').val("");
  	$('#workStartDate').val("");
  	$('#workEndDate').val("");
  	$('#find_work_instruction').val("");
  	$('#find_work_processInfo').val("");
  	$('#find_work_id').val("");
	});
	
	/***************** work - 자재투입 모달창 - 조회 등록 수정 ****************************/
	
	/* 자재투입 모달창
	 * 1. [로트번호] 입력에 따른 [공정번호] 조회
	 * 2. [로트번호] 입력에 따른 [제품번호],[제품명],[계획생산수량] 조회 및 자동채우기
	 * 3. [로트번호] 입력에 따른 [제품번호]를 통한 [자재번호] 조회
	 * 4. [자재번호] 선택에 따른 [자재명],[제품1EA별 투입수량],[최소투입수량],[단위] 조회 및 자동채우기
	 */
	$('#insLotIdModal').change(function() {
		$('#materialNameModal').val(''),											
		$('#item1EaMaterialModal').val(''),								
		$('#minInsertQuantityModal').val(''),						
		$('#unitMaterialModal').val('');										
		$('#insertQuantityModal').val(''); 
		var insLotId = $(this).val();
		
		// [로트번호] 입력에 따른 [공정번호] 조회
		$.ajax({
			url: '/insertMaterialModalInsProId',	// 이 URL은 Backend에서 처리할 경로
			type: 'GET',
			data: {insLotIdModal: insLotId},
			success: function(data) {	// 성공 시
        $('#processIdModal').empty();
				let str = '<option value="">공정번호</option>';
        $.each(data , function(i){
            str += '<option value="' + data[i].processIdModal + '">' + data[i].processIdModal+'</option>'
        });
        $('#processIdModal').append(str);
			},
				error: function(xhr, status, error) {	// 실패 시
					console.log("Error insertMaterial lotId proId : ", error);
			}
		}); // /.[로트번호] 입력에 따른 [공정번호] 조회
		
		// [로트번호] 입력에 따른 [제품번호],[제품명],[계획생산수량] 조회 및 자동채우기
		$.ajax({
			url: '/insertMaterialModalInsProIdAutoData',	// 이 URL은 Backend에서 처리할 경로
			type: 'GET',
			data: {insLotIdModal: insLotId},
			
			success: function(data) {	// 성공 시
        $('#itemIdModal').val(data.itemIdModal);
        $('#itemNameModal').val(data.itemNameModal);
        $('#productionPlanQuantityModal').val(data.productionPlanQuantityModal);
			},
			
			error: function(xhr, status, error) {	// 실패 시
				console.log("Error insertMaterial lotId AutoData : ", error);
			}
		}); // /.[로트번호] 입력에 따른 [제품번호],[제품명],[계획생산수량] 자동채우기
		
		// [로트번호] 입력에 따른 [제품번호]를 통한 [자재번호] 조회
		$.ajax({
			url: '/insertMaterialModalLoadMatId',	// 이 URL은 Backend에서 처리할 경로
			type: 'GET',
			data: {insLotIdModal: insLotId},
			success: function(data) {	// 성공 시
				$('#materialIdModal').empty();
				let str = '<option value="">자재번호</option>';
        $.each(data , function(i){
            str += '<option value="' + data[i].materialIdModal + '">' + data[i].materialIdModal+'</option>'
        });
        $('#materialIdModal').append(str);
			},
				error: function(xhr, status, error) {	// 실패 시
					console.log("Error insertMaterial lotId proId : ", error);
			}
		}); // /.[로트번호] 입력에 따른 [제품번호]를 통한 [자재번호] 조회
		
		/* 자재투입 모달창 - [자재번호] 선택에 따른 [자재명],[제품1EA별 투입수량],[최소투입수량],[단위] 조회 및 자동채우기  */
		$('#materialIdModal').on('change', function() {
		  var materialId = $(this).val();                // 자재번호의 선택된 값 가져오기
		  $.ajax({
				url: '/insertMaterialModalMatIdAutoData',	// 이 URL은 Backend에서 처리할 경로
				type: 'GET',
				data: {
					insLotIdModal: insLotId,
					materialIdModal : materialId
				},
				success: function(data) {	// 성공 시
	        $('#materialNameModal').val(data.materialNameModal);
	        $('#item1EaMaterialModal').val(data.item1EaMaterialModal);
	        $('#minInsertQuantityModal').val(data.minInsertQuantityModal);
	        $('#unitMaterialModal').val(data.unitMaterialModal);
	        
	        // 최소투입수량을 설정
          var minInsertQuantity = parseFloat(data.minInsertQuantityModal);
          var maxInsertQuantity = minInsertQuantity * 1.1; // 최소투입수량의 1.1배를 최대치로 설정

          // 투입수량 자동 설정 및 범위 제한 로직
          $('#insertQuantityModal').val(minInsertQuantity); // 초기 값 설정
          $('#insertQuantityModal').off('input').on('input', function() {
            var currentVal = parseFloat($(this).val());
            if (currentVal < minInsertQuantity) {
              $(this).val(minInsertQuantity);  // 최소값보다 작을 때 최소값으로 설정
            } else if (currentVal > maxInsertQuantity) {
              $(this).val(maxInsertQuantity);  // 최대값을 초과할 때 최대값으로 설정
            }
          });
				},
				error: function(xhr, status, error) {	// 실패 시
					console.log("Error insertMaterial lotId MatId AutoData : ", error);
				}
			});
		});/* ./ 자재투입 모달창의 [자재번호] 선택 따른 ajax*/
	}); /* ./ insLotIdModal change function*/
	
	/* 모달창 - 처음에는 [자재투입목록]을 숨긴다. */
	$('.newWorkMaterialList').css('display', 'none');
		
	
	/* 자재투입 모달창 - [추가] 버튼 클릭 이벤트 */
	$('#addInsertMaterialBtn').click(function() {
		console.log('추가 버튼 클릭');	// 디버깅을 위한 코드
		// 모달창에서 입력된 데이터 수집
		var data = collectDataFromModal();
		console.log('모달창에서 입력된 데이터: ', data);
		
		// 입력 필드 유효성 검사
		if(!validateFields(data)) {
			return;	// 유효성 검사 실패 시 추가 작업 중단
		}
		
		// 자재투입내역에서 중복 데이터 확인
    if (checkForDuplicateInTable(data)) {
      return;
    }
		
		// 데이터 중복 검사
    if (insertMaterialisDuplicate(data)) {
        alert('동일한 데이터가 이미 목록에 존재합니다.');
        return; // 중복 데이터 존재 시 추가 작업 중단
    }
		
		// 데이터 목록에 추가
		addToInsertMaterialList(data);
		
		// 행 번호 업데이트
		updateRowNumbers(); 
		
		// [자재투입목록]을 보이게 한다.
		$('.newWorkMaterialList').css('display', 'block');
		console.log('display block');
		
	});/* /.자재투입 모달창 - [추가] 버튼 클릭 이벤트 */
	
	// 자재투입내역과 비교하여 데이터가 존재할 경우 추가되지 않도록 한다.
	function checkForDuplicateInTable(data) {
    var isDuplicate = false;
    $('#selectMaterialInputTable tbody tr').each(function() {
      var lotId = $(this).children('td:eq(1)').text();  // 제조LOT번호
      var processId = $(this).children('td:eq(2)').text();  // 공정번호
      var materialId = $(this).children('td:eq(7)').text();  // 자재번호
      var existingQuantity = parseFloat($(this).children('td:eq(10)').text());  // 기존 투입수량

      if (data.insLotId === lotId && data.processId === processId && data.materialId === materialId) {
          alert('동일한 데이터가 이미 자재투입내역에 존재합니다.');
          isDuplicate = true;
          return false;  // 반복 중지
      }
    });
    return isDuplicate;
	}
	
	// 중복 데이터가 있는지 확인하는 함수
    function insertMaterialisDuplicate(data) {
      var isDup = false;
      $('.newWorkMaterialList tbody tr').each(function() {
        var insLotId = $(this).find('.insLotId').text();
        var processId = $(this).find('.processId').text();
        var materialId = $(this).find('.materialId').text();

        // 중복 체크 조건 설정
        if (insLotId === data.insLotId && processId === data.processId && materialId === data.materialId) {
            isDup = true;
            return false; // 중복 발견 시 반복 종료
        }
      });
      return isDup;
    }
	
	/* 모달창에서 입력된 데이터 수집하는 함수 */
	function collectDataFromModal() {
		// 모달창에서 입력된 데이터 수집
		return {
			invDate: new Date().toISOString().split('T')[0],  								// 투입날짜 : 오늘 날짜를 YYYY-MM-DD 형식으로
			insLotId: $('#insLotIdModal').val(),															// LOT번호
			processId: $('#processIdModal').val(),														// 공정번호
			itemId: $('#itemIdModal').val(),																	// 제품번호
			itemName: $('#itemNameModal').val(),															// 제품명
			productionPlanQuantity: $('#productionPlanQuantityModal').val(),	// 계획생산수량
			materialId: $('#materialIdModal').val(),													// 자재번호
			materialName: $('#materialNameModal').val(),											// 자재명
			item1EaMaterial: $('#item1EaMaterialModal').val(),								// 제품1EA별 투입수량
			minInsertQuantity: $('#minInsertQuantityModal').val(),						// 최소투입수량
			unitMaterial: $('#unitMaterialModal').val(),											// 단위
			insertQuantity: $('#insertQuantityModal').val() 									// 투입수량
		};
	} //  /.collectDataFromModal
	
	/* 입력 필드 유효성 검사 */
	function validateFields(data) {
		if(!$('#insLotIdModal').val() ||
			 !$('#processIdModal').val() ||
			 !$('#itemIdModal').val() ||
			 !$('#itemNameModal').val() ||
			 !$('#productionPlanQuantityModal').val() ||
			 !$('#materialIdModal').val() ||
			 !$('#materialNameModal').val() ||
			 !$('#item1EaMaterialModal').val() ||
			 !$('#minInsertQuantityModal').val() ||
			 !$('#unitMaterialModal').val() ||
			 !$('#insertQuantityModal').val()) {
			// 유효성 검사 실패 시 알림 표시
			if (!$('#insLotIdModal').val()) {
				alert('[제조LOT번호]를 입력하세요. ');
				$('#insLotIdModal').focus();
			} else if(!$('#processIdModal').val()) {
				alert('[공정번호]를 입력하세요.');
				$('#processIdModal').focus();
			} else if(!$('#materialIdModal').val()) {
				alert('[자재번호]를 선택하세요.');
				$('#materialIdModal').focus();
			} else if(!$('#insertQuantityModal').val()) {
				alert('[투입수량]을 입력하세요. 숫자만 입력 가능합니다.');
				$('#insertQuantityModal').focus();
			} 
			return false;
	  }
	  var insertQuantity = parseInt($('#insertQuantityModal').val(), 10);	// '10'은 10진수를 의미함
	  
	  if(isNaN(insertQuantity)) {
			alert('투입수량에 유효한 숫자를 입력해주세요.');
			$('#insertQuantityModal').focus();
			return false;
		}
	  return true;
	} // /.function validateFields(data)
	
	/* 목록(Table)의 행 번호를 업데이트하는 함수 */
    function updateRowNumbers() {
        $('.newWorkMaterialList tbody tr').each(function(index) {
            $(this).find('.listSeq').text(index + 1); // index는 0부터 시작하므로 1을 더합니다.
        });
    }
	/* 목록(Table)에 데이터(행) 추가하는 함수 */
  function addToInsertMaterialList(data) {
		// 테이블
		var table = $('.newWorkMaterialList tbody');
		
		// 테이블 행 추가
		// [주의]: data.컬럼명의 '컬럼명'은 collectDataFromModal() 함수의 컬럼명과 일치시킬 것.
		var newRow = `<tr>
			<td class="listSeq"></td>																									// 추가된 목록 번호
			<td class="invDate">${data.invDate}</td>																	// 투입날짜
			<td class="insLotId">${data.insLotId}</td>																// LOT번호
			<td class="processId">${data.processId}</td>															// 공정번호
			<td class="itemId">${data.itemId}</td>																		// 제품번호
      <td class="itemName">${data.itemName}</td>																// 제품명
      <td class="productionPlanQuantity">${data.productionPlanQuantity}</td>		// 계획생산수량
      <td class="materialId">${data.materialId}</td>														// 자재번호
      <td class="materialName">${data.materialName}</td>												// 자재명
      <td class="item1EaMaterial">${data.item1EaMaterial}</td>									// 제품1EA별 투입수량
      <td class="minInsertQuantity">${data.minInsertQuantity}</td>							// 최소투입수량
      <td class="unitMaterial">${data.unitMaterial}</td>												// 단위
      <td class="insertQuantity">${data.insertQuantity}</td>										// 투입수량
      <td onclick="removeRow(this);" 
      	style="cursor:pointer; 
    		color:#c82333; 
    		text-align:center;">
	      	삭제
	    </td> 																																		// [삭제] 버튼
    </tr>`;
    table.append(newRow);
    updateRowNumbers();
	}
	
	/* 입력 필드 초기화 함수 */
	function clearInputFields() {
    $('#workMaterialInsertModal input').val('');
	}
	
	/* 행 삭제 및 번호 재정렬 */
  window.removeRow = function(button) {
      if(confirm('삭제하시겠습니까?')) {
          $(button).closest('tr').remove();
          updateRowNumbers();  // 행 번호 업데이트
      }
  };
	
	/* 모달창 - [등록] 버튼 클릭 이벤트 */
	$('#insertMatModalInsertBtn').click(function() {
		var arrays = collectArrFromTable();	// 테이블에서 모든 항목 수집
		if(arrays.length === 0) {
			alert('등록할 내용이 없습니다.');
			return;
		}
		if(confirm('자재투입을 등록하시겠습니까?')) {
			insertMaterialArr(arrays);	// 수집된 데이터를 DB에 저장
		}
	});
	
	/* 등록 - 테이블에서 데이터 수집 */
	function collectArrFromTable() {
		var arrays = [];
		$('.newWorkMaterialList tbody tr').each(function() {
			var row = $(this);
			arrays.push({
				invDateModal: row.find('.invDate').text(),
				insLotIdModal: row.find('.insLotId').text(),
				processIdModal: row.find('.processId').text(),
				itemIdModal: row.find('.itemId').text(),
				itemNameModal: row.find('.itemName').text(),
				productionPlanQuantityModal: row.find('.productionPlanQuantity').text(),
				materialIdModal: row.find('.materialId').text(),
				materialNameModal: row.find('.materialName').text(),
				item1EaMaterialModal: row.find('.item1EaMaterial').text(),
				minInsertQuantityModal: row.find('.minInsertQuantity').text(),
				unitMaterialModal: row.find('.unitMaterial').text(),
				insertQuantityModal: row.find('.insertQuantity').text(),
			});
		});
		return arrays;
	}
	
	/* 등록 - 데이터베이스 저장 로직 */
	function insertMaterialArr(arrays) {
		$.ajax({
			url: '/insertMaterialArr',	// 데이터 저장을 처리하는 서버의 API 경로
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(arrays),
			success: function(response) {
				alert('등록이 완료되었습니다.');
				window.location.href = '/work';	// 저장 후, '/work'로 리다이렉트
			},
			error: function(xhr, status, error) {
				console.error('자재투입등록 Error', error);
			}
		});
	}
	
	/* 수정 - Ajax로 해당 행의 내용 조회 */
	$(document).on('click', '.insertMatEditBtn', function() {
		var inv_lot_id = $(this).data('lot-id');					// 수정 버튼에서 inv_lot_id 값 가져오기
		var inv_pi_id = $(this).data('pi-id');						// 수정 버튼에서 inv_pi_id 값 가져오기
		var inv_material_id = $(this).data('mat-id');			// 수정 버튼에서 inv_material_id 값 가져오기
		var inv_quantity = $(this).data('inv-quantity');	// 수정 버튼에서 inv_quantity 값 가져오기
		console.log('선택된 inv_lot_id: ', inv_lot_id);
		console.log('선택된 inv_pi_id: ', inv_pi_id);
		console.log('선택된 inv_material_id: ', inv_material_id);
		console.log('선택된 inv_quantity: ', inv_quantity);
		
		$.ajax({
			url: '/insertMaterialForUpdateModal?inv_lot_id='+inv_lot_id+'&inv_pi_id='+inv_pi_id+'&inv_material_id='
							+inv_material_id+'&inv_quantity='+inv_quantity,
			type: 'GET',
			data: { 
				inv_lot_id: inv_lot_id,
				inv_pi_id : inv_pi_id,
				inv_material_id : inv_material_id,
				inv_quantity : inv_quantity
				 },
			success: function(data) {
				$('#inv_lot_id').val(data.inv_lot_id);
				$('#inv_pi_id').val(data.inv_pi_id);
				$('#ins_item_id').val(data.ins_item_id);
				$('#i_name').val(data.i_name);
				$('#b_unit').val(data.b_unit);
				$('#inv_material_id').val(data.inv_material_id);
				$('#m_name').val(data.m_name);
				$('#inv_quantity').val(data.inv_quantity);
				$('#updateInvQuantity').val(data.inv_quantity);
      	
      	$('#workMaterialInsertEditModal').modal('show');	// 모달창 보여주기
			},
			error: function() {
				console.log("수정 모달창의 데이터 조회 실패 Error", error);
				alert('데이터를 불러오는데 실패했습니다.');
			}
		});
	});
	
	/* 수정 - Ajax로 DB에 업데이트 */
	$('#insertMatModalUpdateBtn').on('click', function() {
		if(!confirm('수정하시겠습니까?')) {
			return;	// 사용자가 '아니오'를 선택하면 함수를 종료
		}
		
		// Form에서 데이터 수집
		var formData = {
			inv_lot_id: $('#inv_lot_id').val(),
			inv_pi_id: $('#inv_pi_id').val(),
			inv_material_id: $('#inv_material_id').val(),
			inv_quantity: $('#inv_quantity').val(),
			updateInvQuantity: $('#updateInvQuantity').val()
		};
		
		console.log(formData);
		
		// Ajax 요청을 사용하여 서버에 수정 사항 전송
		$.ajax({
			url: '/insertMaterialUpdate',	// 수정 처리를 위한 서버 URL
			type: 'POST',	// HTTP 요청 방식
			contentType: 'application/json',	// 요청 컨텐츠 타입
			data: JSON.stringify(formData),		// JSON 형식으로 데이터 전송
			success: function(response) {
				if(response.success) {
					alert('수정이 완료되었습니다.');
					window.location.href = '/work';	// 성공 후, '/work' 페이지로 리다이렉트
				} else {
					alert('수정 실패: ' + response.message);
				}
			},
			error: function(xhr, status, error) {	// 요청 실패 시
				alert('수정 중 에러가 발생했습니다. 에러: ' + error);
			}
		}); // ./insertMaterialUpdate 의 ajax
		
	}); // /.insertMatModalUpdateBtn click function
	
	
	
	/***************** work - 작업등록 모달창 - 등록 ****************************/
	
	/* 작업등록 모달창
	 * 1. [로트번호] 입력에 따른 [공정번호] 조회
	 * 2. [로트번호] 입력에 따른 [제품번호],[제품명],[생산단위] 조회 및 자동채우기
	 * 3. [공정번호] 입력에 따른 [공정명], [설비번호], [설비명], [작업위치] 조회 및 자동채우기
	 * 4. 남은생산수량 : 로트번호, 공정번호 같은 값 가진 애들의 생산수량을 파악하여 자동채우기
	 * 5. 추가버튼을 통해 배열 테이블 추가
	 */
	
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
			url: '/workInsertModalProIdByLotId',	// 이 URL은 Backend에서 처리할 경로
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
			url: '/workInsertModalAutoDataByLotId',	// 이 URL은 Backend에서 처리할 경로
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
				url: '/workInsertModalAutoDataByProId',	// 이 URL은 Backend에서 처리할 경로
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
				url: '/workInsertModalLeftoverQuantityByProId',	// 이 URL은 Backend에서 처리할 경로
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
        
				// 작업종료시간 - 작업시작시간
        var startTime = $('#workInsertModalWorkStartTime').val();
        var endTime = $('#workInsertModalWorkEndTime').val();

        // 시작시간과 종료시간이 둘 다 입력된 경우에만 계산 수행
        if (startTime && endTime) {
            // ISO8601 포맷의 날짜 문자열을 Date 객체로 변환
            var startDate = new Date(startTime);
            var endDate = new Date(endTime);

            // 두 시간의 차이를 밀리초 단위로 계산 후 분 단위로 변환
            var durationMinutes = (endDate - startDate) / 60000;

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
    
    
  /* 모달창 - 처음에는 [작업등록목록]을 숨긴다. */
	$('.newWorkList').css('display', 'none');
		
	
	/**********************  작업등록 모달창 - [추가] 버튼 클릭 이벤트 ************************/
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
		
	});/* /.자재투입 모달창 - [추가] 버튼 클릭 이벤트 */
	
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
			url: '/workInsertArr',	// 데이터 저장을 처리하는 서버의 API 경로
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(arrays),
			success: function(response) {
				alert('등록이 완료되었습니다.');
				window.location.href = '/work';	// 저장 후, '/work'로 리다이렉트
			},
			error: function(xhr, status, error) {
				console.error('자재투입등록 Error', error);
			}
		});
	}
    
	
	/***************** workerInsert - 작업자 관리 - 조회 등록 수정 삭제 ****************************/
	
	/* 작업자 관리 모달창 - Ajax로 해당 행의 내용 조회 */
	$('.workerInsertBtn').click(function() {
		
		var edit_w_id = $(this).data('work-id');							// 등록 버튼에서 w_id 값 가져오기
		var edit_w_lot_id = $(this).data('lot-id');						// 등록 버튼에서 w_lot_id 값 가져오기
		var edit_w_pi_id = $(this).data('pi-id');							// 등록 버튼에서 w_pi_id 값 가져오기
		var edit_pi_machine_id = $(this).data('mi-id');				// 등록 버튼에서 pi_machine_id 값 가져오기
		var edit_w_start_time = $(this).data('start-time');		// 등록 버튼에서 w_start_time 값 가져오기
		var edit_w_end_time = $(this).data('end-time');				// 등록 버튼에서 w_end_time 값 가져오기
		var allemplist = $(this).data('emp-list');						// 등록 버튼에서 allemplist 값 가져오기
		
		var allempLength = allemplist.length;									// 작업자 목록 조회 시 데이터 존재여부 판별을 위함
		
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
      	
      	$('#workerInsertModal').modal('show');	// 모달창 보여주기
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
				success: function(data) {	// 성공 시
				console.log('edit_dp_name : ' + data.edit_dp_name);
	        $('#workerInsertEmpInfoList').empty();
					let str = '<datalist id="workerInsertEmpInfoList">';
	        $.each(data , function(i){
	            str += '<option value="' + data[i].edit_emp_id + '">' + data[i].edit_dp_name + ' ' 
	            				+ data[i].edit_e_name + '(' + data[i].edit_e_role +')'+'</option>';
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
					if(allempLength!=0){
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
		        $('#edit_emp_id').val('');
		        return; // 중복 데이터 존재 시 추가 작업 중단
		    }
				
				console.log('유효성 검사 데이터: ', data);	// 유효성 검사 data 디버깅
				
				// 데이터 목록에 추가
				addToInserWorkerList(data);
				
				clearInputFields()
				
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
					        var empId = $(this).find('td:nth-child(1)').text();  // 사원번호 칼럼
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
				// 테이블 행 추가
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
			}
			
			/* 행 삭제 */
			window.removeRow = function(button) {
				if(confirm('삭제하시겠습니까?')) {
					$(button).closest('tr').remove();
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
						window.location.href = '/workerInsert';	// 저장 후, '/work'로 리다이렉트
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