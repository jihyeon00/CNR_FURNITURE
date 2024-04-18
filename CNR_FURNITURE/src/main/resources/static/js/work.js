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
	
	/* 자재투입 모달창
	 * 1. [로트번호] 입력에 따른 [공정번호] 조회
	 * 2. [로트번호] 입력에 따른 [제품번호],[제품명],[계획생산수량] 조회
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
		});
		
		// [로트번호] 입력에 따른 [제품번호],[제품명],[계획생산수량] 자동채우기
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
		});
		// [로트번호] 입력에 따른 [자재번호] 조회
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
		});
		
		/* 자재투입 모달창 - [자재번호] 선택에 따른 [자재명],[제품1EA별 투입수량],[최소투입수량],[단위] 자동채우기  */
		$('#materialIdModal').on('change', function() {
		  var materialId = $(this).val();                // qsDiv1의 선택된 값 가져오기
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
	        $('#insertQuantityModal').val(''); 
				},
				
				error: function(xhr, status, error) {	// 실패 시
					console.log("Error insertMaterial lotId MatId AutoData : ", error);
				}
			});
		});/* ./ 자재투입 모달창의 [자재번호] 선택 따른 ajax*/
		
		
	}); /* ./ 자재투입 모달창의 [로트번호] 입력에 따른 ajax*/
	
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
		console.log('유효성 검사 데이터: ', data);	// 유효성 검사 data 디버깅
		
		// 데이터 목록에 추가
		addToInsertMaterialList(data);
		
		// [자재투입목록]을 보이게 한다.
		$('.newWorkMaterialList').css('display', 'block');
		console.log('display block');
		
	});
	
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
	}
	
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
	}
	
	/* 목록(Table)에 데이터(행) 추가하는 함수 */
  function addToInsertMaterialList(data) {
		// 테이블
		var table = $('.newWorkMaterialList tbody');
		
		// 테이블 행 추가
		// [주의]: data.컬럼명의 '컬럼명'은 collectDataFromModal() 함수의 컬럼명과 일치시킬 것.
		var newRow = `<tr>
			<td class="listSeq">${table.children().length + 1}</td>										// 추가된 목록 번호
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
	}
	
	/* 입력 필드 초기화 함수 */
	function clearInputFields() {
    $('#workMaterialInsertModal input').val('');
	}
	
	/* 행 삭제 */
	window.removeRow = function(button) {
		if(confirm('삭제하시겠습니까?')) {
			$(button).closest('tr').remove();
		}
	}
	
	/* 모달창 - [등록] 버튼 클릭 이벤트 */
	$('#insertBtn').click(function() {
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
	$(document).on('click', '.editBtn', function() {
		var qiID = $(this).data('qi-id');	// 수정 버튼에서 qiID 값 가져오기
		console.log('선택된 qiID: ', qiID);
		
		$.ajax({
			url: '/inspectionIB/edit',
			type: 'GET',
			data: { qiID: qiID },
			success: function(data) {
				$('#qiID').val(qiID);	// 모달의 hidden input 필드에 qiID 설정(수정을 위해 필요함.)
				$('#editContractID').val(data.contractID);
				$('#editCompanyName').val(data.companyName);
				$('#editUnits').val(data.units);
				$('#editMatID').val(data.matID);
				$('#editMatName').val(data.matName);
				$('#editMatUses').val(data.matUses);
				$('#editContractQuantity').val(data.contractQuantity);
				$('#editInspectionQuantity').val(data.inspectionQuantity);
				$('#editPoorQuantity').val(data.poorQuantity);
				$('#editQsDiv1').val(data.qsDiv1);
				$('#editQsDiv2').val(data.qsDiv2);
      	$('#editNotes').val(data.notes);
      	
      	updateQsDiv2Options(data.qsDiv1, data.qsDiv2);	// 불량유형2 option 업데이트
      	
      	$('#editModal').modal('show');	// 모달창 보여주기
			},
			error: function() {
				console.log("수정 모달창의 데이터 조회 실패 Error", error);
				alert('데이터를 불러오는데 실패했습니다.');
			}
		});
	});
	
	
	
	
	
	
	
});/* ./페이지 로드 */