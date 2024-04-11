<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="/resources/css/login.css">

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>비밀번호 변경</title>
</head>
<body>
  <div class="pwChange-area">
    <div class="pwdImg-area">
      <img class="LogoB" src="/resources/img/C&RLogoB.png">
    </div>
    <form action="" method ="post">
      <div class="pwdText-area">
        <div class="pwdInt-area">
            <div class="pwdInt-area-name">이메일</div>
            <input type="email" class="int-area-input" name="E_EMAIL" id="E_EMAIL"
                autocomplete="off" placeholder="Email" required />
            <input type="button" class="put-btn" id="pushBtn" value="발송"/>
            <div class="pwdInt-area-name">인증번호</div>
            <input type="text" class="int-area-input" name="" id=""
                autocomplete="off" placeholder="인증번호" required />
            <input type="button" class="put-btn" id="pushBtn" value="확인"/>
        </div>
        <div class="pw-area">
            <div class="pwdInt-area-name">새 비밀번호</div>
            <input type="password" class="pwdInt-area-input" name="E_PWD" id="E_PWD"
                autocomplete="off" placeholder="Password" required />
            <div class="pwdInt-area-name">한번 더 입력</div>
            <input type="password" class="pwdInt-area-input" name="E_PWD" id="E_PWD"
                autocomplete="off" placeholder="Retype Password" required />
            <div class="pw-btn-area">
                <input type="submit" class="pwd-btn" id="pwBtn" value="비밀번호 변경"/>
            </div>
        </div>
      </div>
    </form>
  </div>
</body>
</html>

<script>

</script>