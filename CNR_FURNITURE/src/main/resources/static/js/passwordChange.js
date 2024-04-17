  // 비밀번호 변경 함수
  $(function() {
    // 정규표현식을 이용한 비밀번호 유효성 검사
    // 영어 숫자, 특수 문자(!,@,#,-,_) 6~20글자사이
    const regEx = /^[A-Za-z0-9\!\@\#\-\_]{6,20}$/
    var email_auth_cd = '';

    $('#password_btn').click(function(){

      // 유효성검사
      if($('#eamil').val() == ""){
        alert("이메일을 입력해주세요.");
        return false;
      }

      if($('#email_auth_key').val() == ""){
        alert("인증번호를 입력해주세요.");
        return false;
      }

      if($('#email_auth_key').val() != email_auth_cd){
        alert("인증번호가 일치하지 않습니다.");
        return false;
      }

      if($('#password').val() == ""){
        alert("비밀번호를 입력해주세요.");
        return false;
      }

      // 비밀번호 유효성 검사
      if(regEx.test(password.value)){
        alert("비밀번호 형식이 유효합니다.");
      }else{
        alert("비밀번호 형식이 유효 하지 않습니다. <br>" +
          "영어 숫자, 특수문자(!,@,#,-,_) 6~20글자사이로 작성해주세요.");
      }

      if($('#password').val() != $('#password_ck').val()){
        alert("비밀번호가 일치하지 않습니다.");
        return false;
      }

      $("#PasswordChangeProc").submit();

      const updateSuccessCount = '<c:out value="${updateSuccessCount}" />'
      if(updateSuccessCount) {
          alert('비밀번호가 변경 되었습니다.');
      }

    });

    // 인증번호 일치 검사
    $("#code_ck").click(function(){
      if($('#email_auth_key').val() != email_auth_cd){
        alert("인증번호가 일치하지 않습니다.");
        return false;
      }

      if($('#email_auth_key').val() == email_auth_cd){
        alert("인증번호가 일치합니다.");
        $('.pw-area').css('visibility', 'visible');
        return false;
      }
    });

    // 인증번호 메일 발송 ajax
    $("#email_auth_btn").click(function(){
      var email = $('#email').val();
      if(email == ''){
       alert("이메일을 입력해주세요.");
       return false;
      }

      $.ajax({
        type : "POST",
        url : "/emailAuth",
        data : {email : email},
        success: function(data){
          alert("인증번호가 발송되었습니다.");
          email_auth_cd = data;
        },
        error: function(data){
          alert("메일 발송에 실패했습니다.");
        }
      });
    });

  })();