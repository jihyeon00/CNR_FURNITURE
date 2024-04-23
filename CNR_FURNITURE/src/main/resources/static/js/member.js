  // 권한선택 value 값 '' 주기
  $(document).ready(function() {
    $('#find_Role:option[value="권한선택"]').val('');
  });
  // 권한 조회 함수
  function getUserRole() {
    var userRole = store.getState().userRole;
    return userRole;
  }

  // 권한에 따라 버튼
  $(document).ready(function() {
    // 사원의 역할을 가져옵니다. (예: "매니저" 또는 "디렉터")
    var role = getUserRole(); // 사용자 권한을 가져오는 함수 (추가적으로 구현 필요)
    // 버튼을 선택합니다.
    var button = $("#roleUp");

    // 역할에 따라 버튼을 제어합니다.
    if (role === "ROLE_Manager") {
      // 매니저 역할인 경우 버튼을 비활성화합니다.
      // button.prop("disabled", true);
      // 또는 버튼을 숨길 수도 있습니다.
       button.hide();
    } else if (role === "ROLE_Director") {
      // 디렉터 역할인 경우 버튼을 활성화합니다.
      // button.prop("disabled", false);
      // 또는 버튼을 보여줍니다.
       button.show();
    }
  });



  /** 권한변경 **/
  function checkboxArr() {
    // 배열 선언
    var checkArr = [];
    var role = getUserRole();
    console.log(role);
//    if (role = )

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