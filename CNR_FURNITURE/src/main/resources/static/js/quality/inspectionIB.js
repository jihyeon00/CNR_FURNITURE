/* 페이지가 준비되면 바로 실행되는 함수 */
$(document).ready(function() {
	/* 검색 기능 */
	function search() {
		// 불량유형1의 option을 선택했다가, 다시 "불량유형1 선택" option을 선택하면, qsDiv1 필드를 제출(검색 submit) 데이터에서 제외
		if ($('#qsDiv1').val() === '') {
			$('#qsDiv1').removeAttr('name');	// qsDiv1 필드를 제출 데이터에서 제외
		}

		// 검색 로직 실행
		document.getElementById('searchInspIB').submit();
	}

	/* 검색용 - 불량유형1 option 선택에 따른 불량유형2 option값 변경 */
	// 참고: https://blog.naver.com/dlrhkdgh3333/222676208750
	$('#qsDiv1').on('change', function() {
		var qsDiv1 = $(this).val();				// qsDiv1의 선택된 값 가져오기
		var qsDiv2Select = $('#qsDiv2');	// qsDiv2 셀렉트 박스 선택
		qsDiv2Select.empty();	// 기존의 옵션들을 비우기

		if (qsDiv1) {
			$.ajax({
				url: '/qsDiv2List?qsDiv1=' + qsDiv1,
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
	
	/* 모달창 - 처음에는 [자재불량목록]을 숨긴다. */
	document.querySelector('.newInspList').style.display = 'none';
	
	
	/* 모달창 - 불량유형1 option 선택에 따른 불량유형2 option값 변경 */
	$('#qsDiv1Modal').on('change', function() {
		var qsDiv1 = $(this).val();				// qsDiv1의 선택된 값 가져오기
		var qsDiv2Select = $('#qsDiv2Modal');	// qsDiv2 셀렉트 박스 선택
		qsDiv2Select.empty();	// 기존의 옵션들을 비우기

		if (qsDiv1) {
			$.ajax({
				url: '/qsDiv2ModalList?qsDiv1Modal=' + qsDiv1,
				type: 'GET',
				dataType: 'json',
				success: function(data) {

					console.log('response data', data);

					// 데이터가 비어있지 않으면 옵션 추가
					if (data.length > 0) {
						$.each(data, function(index, item) {
							qsDiv2Select.append($('<option>', {
								value: item.qsDiv2Modal,
								text: item.qsDiv2Modal
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

	/* 모달창 - [계약번호] 입력에 따른 [거래처명], [계약입고수량], [단위], [자재번호], [자재명], [자재용도] 자동 채우기 */
	$('#contractIDModal').change(function() {
		var contractID = $(this).val();
		
		$.ajax({
			url: '/contractDetailsModal',	// 이 URL은 Backend에서 처리할 경로
			type: 'GET',
			data: {contractIDModal: contractID},
			
			success: function(data) {	// 성공 시
				$('#companyNameModal').val(data.companyNameModal);
        $('#contractQuantityModal').val(data.contractQuantityModal);
        $('#unitModal').val(data.unitModal);
        $('#matIDModal').val(data.matIDModal);
        $('#matNameModal').val(data.matNameModal);
        $('#matUsesModal').val(data.matUsesModal);
			},
			
			error: function(xhr, status, error) {	// 실패 시
				console.log("Error contract details: ", error);
			}
		});
	});
	
	/* 모달창 - [추가] 버튼 클릭 이벤트 */
	$('#addInspection').click(function() {
		// 모달창에서 입력된 데이터 수집
		var data = {
			materialID: $('#matIDModal').val(),												// 자재ID
			materialName: $('#matNameModal').val(),										// 자재명
			materialUses: $('#matUsesModal').val(),										// 자재용도
			contractID: $('#contractIDModal').val(),									// 계약번호
			companyName: $('#companyNameModal').val(),								// 거래처명
			unit: $('#unitModal').val(),															// 단위
			contractQuantity: $('#contractQuantityModal').val(),			// 계약입고수량
      inspectionQuantity: $('#inspectionQuantityModal').val(),	// 검사수량
      qsDiv1: $('#qsDiv1Modal').val(),													// 불량유형1
      qsDiv2: $('#qsDiv2Modal').val(),													// 불량유형2
      poorQuantity: $('#poorQuantityModal').val(),							// 불량수량
      note: $('#notesModal').val()															// 비고
		};
		
		// 입력 검증
		// 불량수량: 0 가능
		// 불량유형2: null 가능
		// 비고: null 가능
		/*if(!data.contractIDModal || !data.companyNameModal || !data.unitModal 
			|| !data.matIDModal || !data.matNameModal || !data.matUsesModal 
			|| !data.contractQuantityModal || !data.inspectionQuantityModal || !data.qsDiv1Modal
		) {
			alert('모든 필수 항목을 입력해야 합니다.');
			return;
		}*/
		
		// 데이터 목록에 추가
		addToInspectionList(data);
		
		// 입력 필드 초기화
		clearInputFields();
		
		// [자재불량목록]을 보이게 한다.
		document.querySelector('.newInspList').style.display = 'block';
	});
	
	/* 모달창 - [등록] 버튼 클릭 이벤트 */
	$('#registerBtn').click(function() {
		var itemList = collectItemsFromTable();
		if(itemList.length === 0) {
			alert('등록할 내용이 없습니다.');
			return;
		}
		
		// 서버로 데이터 전송 및 저장
		/*$.ajax({
			url: '/registerInspectionItems',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(itemList),
			success: function(response) {
				if(response.success) {
					alert('성공적으로 등록되었습니다.');
					location.reload();	// 페이지를 새로고침 하거나 목록을 업데이트
				} else {
					alert('등록에 실패했습니다.');
				}
			},
			error: function() {
				alert('서버 오류로 등록에 실패했습니다.');
			}
		});*/
	});
	
	/* Ajax - 서버로 데이터 전송 및 저장 */
	function registerItems() {
		let items = collectItemsFromTable();	// Form 데이터를 수집하는 함수(수정필요)
		fetch('/api/registerInspectionItems', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify(items)
		})
		.then(response => response.json())
		.then(data => {
			if(data.success) {
				alert(data.message);											// 서버에서 전달된 성공 메시지 표시
				window.location.href = '/inspectionIB';		// 성공 시 페이지 리다이렉션
			} else {
				alert(data.message);											// 서버에서 전달된 실패 메시지 표시
			}
		})
		.catch(error => console.error('Error:', error));
	}
	
	/* 입력 필드 초기화 함수 */
	function clearInputFields() {
		$('#contractIDModal').val('');					// 계약번호
		$('#companyNameModal').val('');					// 거래처명
		$('#unitModal').val('');								// 단위
    $('#matIDModal').val('');								// 자재번호
    $('#matNameModal').val('');							// 자재명
    $('#matUsesModal').val('');							// 자재용도
    $('#contractQuantityModal').val('');		// 계약입고수량
    $('#inspectionQuantityModal').val('');	// 검사수량
    $('#poorQuantityModal').val('');				// 불량수량
    $('#qsDiv1Modal').val('');							// 불량유형1
    $('#qsDiv2Modal').val('');							// 불량유형2
    $('#notesModal').val('');								// 비고
	}
	
	/* 테이블에서 데이터 수집 */
	function collectItemsFromTable() {
    var items = [];
    $('#inspectionTable tbody tr').each(function() {
      var row = $(this);
      var item = {
        contractID: row.find('.contractID').text(),
        matID: row.find('.matID').text(),
        inspectionQuantity: parseInt(row.find('.inspectionQuantity').text(), 10),
        poorQuantity: parseInt(row.find('.poorQuantity').text(), 10),
        qsDiv1: row.find('.qsDiv1').text(),
        qsDiv2: row.find('.qsDiv2').text(),
        notes: row.find('.notes').text()
      };
      items.push(item);
    });
    return items;
  }
  
  /* 목록에 데이터 추가 */
  function addToInspectionList(data) {
		var newRow = `<tr>
      <td class="contractID">${data.contractIDModal}</td>
      <td class="matID">${data.matIDModal}</td>
      <td class="inspectionQuantity">${data.inspectionQuantityModal}</td>
      <td class="poorQuantity">${data.poorQuantityModal}</td>
      <td class="qsDiv1">${data.qsDiv1Modal}</td>
      <td class="qsDiv2">${data.qsDiv2Modal || 'N/A'}</td>
      <td class="notes">${data.notesModal || 'N/A'}</td>
      <td><button onclick="removeRow(this)">삭제</button></td>
    </tr>`;
    $('#inspectionTable tbody').append(newRow);
	}
	
	/* 행 삭제 */
	window.removeRow = function(button) {
		$(button).closest('tr').remove();
	}




});