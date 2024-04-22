  // 권한선택 value 값 '' 주기
  $(document).ready(function() {
    $('#find_Role:option[value="권한선택"]').val('');
//      $("#find_Role:[value='권한선택']").val('');
  });

  /** 권한변경 **/
  function checkboxArr() {
    // 배열 선언
    var checkArr = [];
    if($('.list-checkBox:checked').length<1) {
      alert('권한 변경할 사원을 체크해주세요');
    } else {
      //선언한 배열에 데이터를 삽입
      $(".list-checkBox:checked").each(function(i) {
        // 선택된 체크박스를 순회하면서 데이터 추출
        var row = $(this).closest('tr');        // 현재 체크박스가 속한 행 선택
        var id = row.find("#m_id").text();      // 행에서 id 값을 가져옴
        var name = row.find("#m_name").text();  // 행에서 이름 값을 가져옴
        var role = row.find("#m_role").text();  // 행에서 역할 값을 가져옴
        // 데이터를 객체로 만들어 배열에 추가
        var param = {
          id: id,
          name: name,
          role: role
        };
        checkArr.push(param);
      })
      // console.log(checkArr);
      // 권한 변경 확인 체크
      if (confirm('사원권한 변경을 하시겠습니까?')) {
        // ajax를 통하여 전송
        $.ajax({
          type : "POST",
          url : "/D/modifyMemberList",
          contentType: "application/json",
          data : JSON.stringify(checkArr),
          dateType: "text",
          success: function(text){
            alert("권한 변경이 완료되었습니다.");
            location.href="/M/member/memberRole"
          },
          error: function(request, status, error, xhr){
            alert("권한 변경을 실패습니다. \n 에러코드: "+xhr.status);
          }
        });
      } else {
        return false;
      }
    }
  }
  // 사원등록
  function staffInsert() {
    document.getElementById('addMemberForm').submit();
  }