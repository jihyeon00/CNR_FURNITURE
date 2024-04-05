<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="/resources/css/login.css">

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인</title>
</head>
<body>
  <div class="login-area">
    <div class="img-area">
      <img class="LogoB" src="/resources/img/C&RLogoB.png">
    </div>
    <form action="/login" method ="post">
      <div class="loginText-area">
        <div class="loginInt-area" id="email-area">
            <div class="int-area-name">이메일</div>
            <input type="email" class="int-area-input" name="E_EMAIL" id="E_EMAIL"
                autocomplete="off" placeholder="Email" />
            <div class="int-area-name">비밀번호</div>
            <input type="password" class="int-area-input" name="E_PWD" id="E_PWD"
                autocomplete="off" placeholder="Password"/>
        </div>
        <div class="pwChange">
            <a href="/PasswordChange">비밀번호를 잊으셨나요?</a>
        </div>
        <div class="btn-area">
            <input type="submit" class="login-btn" id="loginBtn" value="로그인"/>
        </div>
      </div>
    </form>
  </div>
</body>
</html>

<script>



    // 활용
    function IBUpdates(IB_ID) {
        $.get("/ibrest/"+IB_ID , function(result) {
            console.log("ibupdate:", result);

            $('#IB_ID').val(result.ib_ID);

            $('#IB_Company_ID').val(result.ib_Company_ID);
            $('#IB_MATERIAL_ID').val(result.ib_MATERIAL_ID);
            $('#IB_Quantity').val(result.ib_Quantity);
            $('#IB_Test_Quantity').val(result.ib_Test_Quantity);
            $('#IB_Defective_Quantity').val(result.ib_Defective_Quantity);
            $('#IB_Status').val(result.ib_Status);

            $('#IB_Defective_Date').val(result.ib_Defective_Date);

            $('#IB_Expected_Date').val(result.ib_Expected_Date);

            $('#IB_Complete_Date_date').val(result.ib_Complete_Date_date);
            $('#IB_Complete_Date_time').val(result.ib_Complete_Date_time);

            $('#IB_Note').val(result.ib_Note);
        }).fail(function(xhr, status, err){
            console.log("ibupdate err:", err);
        });
    }

   	function Request() {
		document.getElementById("IBWhere").value='입고요청';
		location.href = "/IBList?IBWhere=" + $('#IBWhere').val();
	  }

        if (!$('#IB_Quantity_').val()) {
            alert('공급수량을 입력하세요.');
            $('#IB_Quantity_').focus();
            return;
        }
        if (!/^\d+$/.test( $('#IB_Quantity_').val() )) {
            alert('공급수량은 숫자만 입력하세요.');
            $('#IB_Quantity_').focus();
            return;
        } else {
            return false;
        }
    }
    function prevCheckTextBox() {
        if (confirm('수정하시겠습니까?')) {
            document.getElementById('form-IB-Update').submit();
        } else {
             return false;
        }
    }
</script>