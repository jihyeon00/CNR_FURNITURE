//페이지가 로드될 때
window.onload = function() {
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
	
	$('.reset').click(function() {
  	$('#find_work_company').val("");
  	$('#find_work_item').val("");
  	$('#workStartDate').val("");
  	$('#workEndDate').val("");
  	$('#find_work_instruction').val("");
  	$('#find_work_processInfo').val("");
  	$('#find_work_id').val("");
	});

	
	
}