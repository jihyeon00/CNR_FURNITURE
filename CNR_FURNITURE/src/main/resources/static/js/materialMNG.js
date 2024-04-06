
/* 페이지가 준비되면 바로 실행되는 함수 */
/*$(document).ready(function(){
		$("input.shDate").datepicker(); // 영어로 되어있는 기능을 한국어로 치환하는 함수 
});

$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
});*/

/* 테이블의 y축 스크롤 자동 조정 */
$(document).ready(function() {
  // 화면 높이의 70%를 계산
  var maxHeight = $(window).height() * 0.7;
  
  // .matIB-table에 최대 높이 설정 및 overflow-y 속성 추가
  $('.matIB-table, .matOB-table').css({
    'max-height': maxHeight + 'px',
    'overflow-y': 'auto'
  });
});
