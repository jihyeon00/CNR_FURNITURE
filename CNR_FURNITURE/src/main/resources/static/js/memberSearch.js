// 검색 버튼을 눌렀을 때 이벤트
  function search() {
    document.getElementById('searchForm').submit();
  }
  /** 검색창에서 엔터키를 눌렀을 때 이벤트 **/
  $('#find_DP_name').on("keyup", function(e) {
    if (e.keyCode == 13) {search();}
  });
  $('#find_emp_name').on("keyup", function(e) {
    if (e.keyCode == 13) {search();}
  });
  $('#find_name').on("keyup", function(e) {
    if (e.keyCode == 13) {search();}
  });
  $('#find_material').on("keyup", function(e) {
    if (e.keyCode == 13) {search();}
  });
  $('#find_item').on("keyup", function(e) {
    if (e.keyCode == 13) {search();}
  });