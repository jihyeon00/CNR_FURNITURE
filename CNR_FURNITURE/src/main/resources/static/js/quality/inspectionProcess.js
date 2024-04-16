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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});