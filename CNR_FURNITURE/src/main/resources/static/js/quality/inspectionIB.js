/* 페이지가 준비되면 바로 실행되는 함수 */
$(document).ready(function() {
	
	/* 검색 기능 */
	function search() {
		// 검색 로직 실행
		document.getElementById('searchInspIB').submit();
	}
	
	
	/* 불량유형1 option 선택에 따른 불량유형2 option값 변경 */
	$('#qsDiv1').change(function() {
		var qsDiv1 = $(this).val();
		$.ajax({
				url: '/qsDiv2List?qsDiv1=' + qsDiv1,
				type: 'GET',
				dataType: 'json',
				success: function(data) {
						var qsDiv2Select = $('#qsDiv2');
						qsDiv2Select.empty();		// 불량유형2의 기존 옵션을 모두 제거
						$.each(data, function(index, item) {
								qsDiv2Select.append($('<option>', {
										value: item.qsDiv2,
										text: item.qsDiv2
								}));
						});
				},
				error: function(xhr, status, error) {
						console.error("Error qsDiv2 option: ", error);
				}
		});
	});
	
	
	
	
	
	
	
	
    
  
});