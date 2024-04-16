/* 페이지가 준비되면 바로 실행되는 함수 */
$(document).ready(function() {
	/* 검색 기능 */
	function search() {
		// 불량유형1의 option을 선택했다가, 
		// 다시 "불량유형1 선택" option을 선택하면, qsDiv1 필드를 제출(검색 submit) 데이터에서 제외
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
	  var qsDiv1 = $(this).val();                // qsDiv1의 선택된 값 가져오기
	  var qsDiv2Select = $('#qsDiv2Modal');      // qsDiv2 셀렉트 박스 선택
	  qsDiv2Select.empty();                     // 기존의 옵션들을 비우기
	
	  if (qsDiv1) {
	    $.ajax({
	      url: '/qsDiv2ModalList?qsDiv1Modal=' + qsDiv1,
	      type: 'GET',
	      dataType: 'json',
	      success: function(data) {
	        if (data.length > 0) {
	          $.each(data, function(index, item) {
	            qsDiv2Select.append($('<option>', {
	              value: item.qsDiv2Modal || '',
	              text: item.qsDiv2Modal || 'No Valid Option'
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
	
	
	// 모달창 닫기 전에 확인 후, 닫고 싶은데..
	// 1회 닫은 후에 다시 모달창 열고 취소-안닫겠다. 누르면 모달창이 닫혀서 정신이 나갈 것 같다.
	
	/* 모달창 - [취소] 버튼 클릭 이벤트 */
	// 
	/*$('#cancelBtn').click(function() {
    if (confirm('등록을 취소하시겠습니까?')) {
      // 입력 필드 초기화
      $('#registerIBInspection input, #registerIBInspection select').val('');

      // 자재불량목록 숨기기 및 내용 삭제
      $('.newInspList tbody').empty();
      $('.newInspList').hide();

      // 모달 닫기
      document.getElementById('cancelBtn').setAttribute('data-dismiss', 'modal');
      //이건 템플릿, jQuery 버전이 안 맞아서 사용을 못하는 것 같다.
      //$('#registerIBInspection').modal('hide');
    } else {
			// 모달 닫는 속성 제거
			$('#cancelBtn').removeData('dismiss');
		}
  });*/
  
  /* 모달이 닫히는 이벤트를 감지하여 [취소] 버튼의 닫기 속성을 지운다. */
  // BootStrap에서 제공하는 함수는 작동하지 않는다.(아마 css 템플릿과 버전이 맞지 않아서 그런듯 하다.)
  // 근데 이거도 작동 안된다......
  // 모달 요소를 선택한다.
  /*var modal = document.getElementById('registerIBInspection');
  // 관찰자 객체 생성, 설정을 구성한다.
  var observer = new MutationObserver(function(mutations) {
		mutations.forEach(function(mutation) {
			if(mutation.attributeName === 'style') {
				var displayStyle = modal.style.display;
				if(displayStyle === 'none') {
					// 모달이 닫혔을 때 실행할 코드
					console.log('모달 닫김');
					// [취소] 버튼에서 'data-dismiss' 속성 제거
					$('#cancelBtn').removeAttribute('data-dismiss');
				}
			}
		});
	});
	// 모달 요소의 스타일 변화를 관찰하도록 설정
	observer.observe(modal, { attributes: true, attributeFilter: ['style'] });*/

	
	/* 모달창 - [추가] 버튼 클릭 이벤트 */
	$('#addInspectionBtn').click(function() {
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
		addToInspectionList(data);
		
		// [자재불량목록]을 보이게 한다.
		/*document.querySelector('.newInspList').style.display = 'block';*/
		$('.newInspList').css('display', 'block');
		console.log('display = block');
		
		// 입력 필드 초기화
		clearInputFields();
		console.log('입력필드 초기화');
	});
	
	/* 모달창에서 입력된 데이터 수집하는 함수 */
	function collectDataFromModal() {
		// 모달창에서 입력된 데이터 수집
		return {
			materialID: $('#matIDModal').val(),												// 자재ID
			materialName: $('#matNameModal').val(),										// 자재명
			materialUses: $('#matUsesModal').val(),										// 자재용도
			contractID: $('#contractIDModal').val(),									// 계약번호
			companyName: $('#companyNameModal').val(),								// 거래처명
			unit: $('#unitModal').val(),															// 단위
			contractQuantity: $('#contractQuantityModal').val(),			// 계약입고수량
      inspectionQuantity: $('#inspectionQuantityModal').val(),	// 검사수량
      qsDiv1: $('#qsDiv1Modal').val(),													// 불량유형1
      qsDiv2: $('#qsDiv2Modal').val() || '',										// 불량유형2(null 가능)
      poorQuantity: $('#poorQuantityModal').val(),							// 불량수량
      note: $('#notesModal').val() || '',												// 비고(null 가능)
      inspectionDate: new Date().toISOString().split('T')[0]  	// 오늘 날짜를 YYYY-MM-DD 형식으로
		};
	}
	
	/* 입력 필드 유효성 검사 */
	// 불량수량: 0 가능
	// 불량유형2: null 가능
	// 비고: null 가능
	function validateFields(data) {
		if(!$('#contractIDModal').val() ||
			 !$('#companyNameModal').val() ||
			 !$('#unitModal').val() ||
			 !$('#matIDModal').val() ||
			 !$('#matNameModal').val() ||
			 !$('#matUsesModal').val() ||
			 !$('#contractQuantityModal').val() ||
			 !$('#poorQuantityModal').val() ||
			 !$('#qsDiv1Modal').val()) {
			// 유효성 검사 실패 시 알림 표시
			if (!$('#contractIDModal').val()) {
				alert('[계약번호]를 입력하세요. 숫자만 가능합니다.');
				$('#contractIDModal').focus();
			} else if(!$('#inspectionQuantityModal').val()) {
				alert('[검사수량]을 입력하세요. 숫자만 가능합니다.');
				$('#inspectionQuantityModal').focus();
			} else if(!$('#poorQuantityModal').val()) {
				alert('[불량수량]을 입력하세요. 숫자만 가능합니다.');
				$('#poorQuantityModal').focus();
			} else if(!$('#qsDiv1Modal').val()) {
				alert('[불량유형1]을 입력하세요.');
				$('#qsDiv1Modal').focus();
			} 
			return false;
	  }
	  
	  var inspectionQuantity = parseInt($('#inspectionQuantityModal').val(), 10);	// '10'은 10진수를 의미함
	  var poorQuantity = parseInt($('#poorQuantityModal').val(), 10);
	  
	  if(isNaN(inspectionQuantity) || isNaN(poorQuantity)) {
			alert('검사수량 또는 불량수량에 유효한 숫자를 입력해주세요.');
			$('#poorQuantityModal').focus();
			return false;
		}
		if(poorQuantity > inspectionQuantity) {
			alert('[불량수량]은 [검사수량]보다 많을 수 없습니다.');
			$('#poorQuantityModal').focus();
			return false;
		}
	  return true;
	}
	
	/* 목록(Table)에 데이터(행) 추가하는 함수 */
  function addToInspectionList(data) {
		// 테이블
		var table = $('.newInspList tbody');
		// 불량률 계산
		var defectRate = calculateDefectRate(data.poorQuantity, data.inspectionQuantity);
		
		// 테이블 행 추가
		// [주의]: data.컬럼명의 '컬럼명'은 collectDataFromModal() 함수의 컬럼명과 일치시킬 것.
		var newRow = `<tr>
			<td class="listSeq">${table.children().length + 1}</td>						// 추가된 목록 번호
			<td class="materialID">${data.materialID}</td>										// 자재ID
			<td class="materialName">${data.materialName}</td>								// 자재명
			<td class="materialUses">${data.materialUses}</td>								// 자재용도
      <td class="contractID">${data.contractID}</td>										// 계약ID
      <td class="companyName">${data.companyName}</td>									// 거래처명
      <td class="unit">${data.unit}</td>																// 단위
      <td class="contractQuantity">${data.contractQuantity}</td>				// 계약입고수량
      <td class="inspectionQuantity">${data.inspectionQuantity}</td>		// 검사수량(입고수량)
      <td class="qsDiv1">${data.qsDiv1}</td>														// 불량유형1
      <td class="qsDiv2">${data.qsDiv2 || ''}</td>											// 불량유형2
      <td class="poorQuantity">${data.poorQuantity}</td>								// 불량수량
      <td class="defectRate">${defectRate}%</td>												// 불량률(%)
      <td class="goodQuantity"></td>																		// 양품수량 [업데이트되어야 함.]
      <td class="inspectionDate">${data.inspectionDate}</td>						// 검사일자(입고일자)
      <td class="notes">${data.note || ''}</td>													// 비고
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
	
	/* 양품수량 계산 및 테이블 목록에 업데이트하는 함수 */
	// 동일한 [계약번호 & 자재번호]이지만, 다른 종류의 불량인 경우를 위해, 계산이 필요함.
	function updateGoodQuantities() {
		$('.newInspList tbody tr').each(function() {
			var row = $(this);
			var inspectionQuantity = parseInt(row.find('.inspectionQuantity').text(), 10);	// 검사수량
			var totalDefects = totalDefectQuantity({
				contractID: row.find('.contractID').text(),
				materialID: row.find('.materialID').text()
			});
			var goodQuantity = Math.max(inspectionQuantity - totalDefects, 0);	// 음수 방지
			row.find('.goodQuantity').text(goodQuantity);		// 목록의 양품수량 Update
		});
	}
	
	/* 불량률 계산 함수 */
	function calculateDefectRate(poorQuantity, inspectionQuantity) {	// [불량수량], [검사수량]을 받아 계산
		// 숫자로 변환
		poorQuantity = parseFloat(poorQuantity, 10);											// '10'은 10진수를 의미
		inspectionQuantity = parseFloat(inspectionQuantity, 10);
		if(inspectionQuantity > 0) {
			return ((poorQuantity / inspectionQuantity) * 100).toFixed(2);	// 소수점 2번째 자리까지
		}
	  return "0.00"; // 검사수량이 0일 경우 불량률도 0으로 처리
	}
	
	/* 누적 불량수량 계산 함수 */
	// 동일한 [계약번호 & 자재번호]이지만, 다른 종류의 불량인 경우를 위해, 계산이 필요함.
	function totalDefectQuantity(data) {
		var total = 0;
		$('.newInspList tbody tr').each(function() {
			if($(this).find('.contractID').text() === data.contractID
			&& data.materialID === $(this).find('.materialID').text()) {
				total += parseInt($(this).find('.poorQuantity').text(), 10);
			}
		});
		return total;
	}
	
	/* 입력 필드 초기화 함수 */
	function clearInputFields() {
    $('#registerIBInspection input, #registerIBInspection select').val('');
	}
	
	/* 행 삭제 및 양품수량 업데이트 */
	window.removeRow = function(button) {
		if(confirm('삭제하시겠습니까?')) {
			$(button).closest('tr').remove();
			updateGoodQuantities();
		}
	}
	
	/* 모달창 - [등록] 버튼 클릭 이벤트 */
	$('#registerBtn').click(function() {
		var items = collectItemsFromTable();	// 테이블에서 모든 항목 수집
		if(items.length === 0) {
			alert('등록할 내용이 없습니다.');
			return;
		}
		if(confirm('자재불량정보를 등록하시겠습니까?')) {
			registerInspectionItems(items);	// 수집된 데이터를 DB에 저장
		}
	});
	
	/* 등록 - 테이블에서 데이터 수집 */
	function collectItemsFromTable() {
		var items = [];
		$('.newInspList tbody tr').each(function() {
			var row = $(this);
			items.push({
				matIDModal: row.find('.materialID').text(),
				matNameModal: row.find('.materialName').text(),
				matUsesModal: row.find('.materialUses').text(),
				contractIDModal: row.find('.contractID').text(),
				companyNameModal: row.find('.companyName').text(),
				unitModal: row.find('.unit').text(),
				contractQuantityModal: row.find('.contractQuantity').text(),
				inspectionQuantityModal: row.find('.inspectionQuantity').text(),
				qsDiv1Modal: row.find('.qsDiv1').text(),
				qsDiv2Modal: row.find('.qsDiv2').text() || '',
				poorQuantityModal: row.find('.poorQuantity').text(),
				defectRate: row.find('.defectRate').text(),
				goodQuantityModal: row.find('.goodQuantity').text(),
				inspectionDateModal: row.find('.inspectionDate').text(),
				notesModal: row.find('.notes').text() || ''
			});
		});
		return items;
	}
	
	/* 등록 - 데이터베이스 저장 로직 */
	function registerInspectionItems(items) {
		$.ajax({
			url: '/registerInspectionItems',	// 데이터 저장을 처리하는 서버의 API 경로
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(items),
			success: function(response) {
				alert('등록이 완료되었습니다.');
				/*window.location.reload();					// 저장 후, 페이지 새로고침*/
				window.location.href = '/inspectionIB';	// 저장 후, '/inspectionIB'로 리다이렉트
			},
			error: function(xhr, status, error) {
				console.error('자재불량등록 Error', error);
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
	
	/* 수정 - 불량유형1 변경 시, 불량유형2 동적 로드 */
	$('#editQsDiv1').change(function() {
		updateQsDiv2Options();
	});
	
	/* 수정 - '불량유형2' 옵션을 업데이트하는 함수 */
	function updateQsDiv2Options() {
		var qsDiv1 = $('#editQsDiv1').val();	// 현재 선택된 '불량유형1' 값
		var qsDiv2Select = $('#editQsDiv2');	// '불량유형2' 셀렉트 박스
		qsDiv2Select.empty();	// 기존 옵션 비우기
		
		$.ajax({
			url: '/qsDiv2ListForEdit?qsDiv1=' + qsDiv1,
			type: 'GET',
			dataType: 'json', 
			success: function(data) {
				if(data && data.length > 0) {
					data.forEach(function(item) {
						var option = $('<option>').val(item.qsDiv2).text(item.qsDiv2);
						qsDiv2Select.append(option);
					});
				} else {
					qsDiv2Select.qppend($('<option>', {
						value: '',
						text: '옵션이 없습니다'
					}));
				}
			} ,
			error: function(xhr, status, error) {
				console.log("수정 모달창 [불량유형2] option Error: ", error);
			}
		});
	}
	
	
	/* 수정 - Ajax로 DB에 업데이트 */
	$('#updateBtn').on('click', function() {
		if(!confirm('수정하시겠습니까?')) {
			return;	// 사용자가 '아니오'를 선택하면 함수를 종료
		}
		
		// Form에서 데이터 수집
		var formData = {
			qiID: $('#qiID').val(),
			qsDiv1: $('#editQsDiv1').val(),
			qsDiv2: $('#editQsDiv2').val() || '',
			notes: $('#editNotes').val() || ''
		};
		
		console.log(formData);
		
		// Ajax 요청을 사용하여 서버에 수정 사항 전송
		$.ajax({
			url: '/inspectionIB/update',	// 수정 처리를 위한 서버 URL
			type: 'POST',	// HTTP 요청 방식
			contentType: 'application/json',	// 요청 컨텐츠 타입
			data: JSON.stringify(formData),		// JSON 형식으로 데이터 전송
			success: function(response) {
				if(response.success) {
					alert('수정이 완료되었습니다.');
					window.location.href = '/inspectionIB';	// 성공 후, '/inspectionIB' 페이지로 리다이렉트
				} else {
					alert('수정 실패: ' + response.message);
				}
			},
			error: function(xhr, status, error) {	// 요청 실패 시
				alert('수정 중 에러가 발생했습니다. 에러: ' + error);
			}
		});
		
	});






});