/* 페이지가 준비되면 바로 실행되는 함수 */
$(document).ready(function() {
	/* 테이블의 y축 스크롤 자동 조정 */
  // StickyOnTable.apply(대상); //sticky on table 를 적용한다.
	StickyOnTable.apply(document.querySelector(".sot"));
});
