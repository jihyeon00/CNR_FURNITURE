<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="/resources/css/login.css">
<!-- jQuery -->
<script defer src="/resources/js/jquery-3.7.1.min.js"></script>
<script defer src="/resources/js/passwordChange.js"></script>
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
    <form action="/PasswordChangeProc" method ="post" id="passwordUpdate">
      <div class="pwdText-area">
        <div class="pwdInt-area">
            <div class="pwdInt-area-name">이메일</div>
            <input type="email" class="int-area-input" name="email" id="email"
                autocomplete="off" placeholder="Email" required />
            <input type="button" class="put-btn" id="email_auth_btn" value="발송" onClick="email_auth()" />
            <div class="pwdInt-area-name">인증번호</div>
            <input type="text" class="int-area-input" name="email_auth_key" id="email_auth_key"
                autocomplete="off" placeholder="인증번호" required />
            <input type="button" class="put-btn" id="code_ck" value="확인"/>
        </div>
        <div class="pw-area">
            <div class="pwdInt-area-name">새 비밀번호</div>
            <input type="password" class="pwdInt-area-input" name="password" id="password"
                autocomplete="off" placeholder="Password" required />
            <div class="pwdInt-area-name">한번 더 입력</div>
            <input type="password" class="pwdInt-area-input" name="password_ck" id="password_ck"
                autocomplete="off" placeholder="Retype Password" required />
            <div class="pw-btn-area">
                <input type="submit" class="pwd-btn" id="password_btn" value="비밀번호 변경"/>
            </div>
        </div>
      </div>
    </form>
  </div>
</body>
</html>
