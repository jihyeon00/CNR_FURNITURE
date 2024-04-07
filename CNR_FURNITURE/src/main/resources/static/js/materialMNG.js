/* 페이지가 준비되면 바로 실행되는 함수 */

/* 테이블의 y축 스크롤 자동 조정 */
$(document).ready(function() {
  // 화면 높이의 70%를 계산
  var maxHeight = $(window).height() * 0.7;
  
  // .자재-table에 최대 높이 설정 및 overflow-y 속성 추가
  $('.matIB-table, .matOB-table, .matInventory-table, .matContInfo-table').css({
    'max-height': maxHeight + 'px',
    'overflow-y': 'auto'
  });
});
