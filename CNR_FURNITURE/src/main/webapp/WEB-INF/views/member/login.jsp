<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>C&R Furniture</title>
  <!-- favicon -->
  <link rel="icon" href="/resources/img/favicon.ico" type="image/x-icon">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/css/adminlte.min.css">
  <!-- css -->
  <link rel="stylesheet" href="/resources/css/login.css">
  <!-- jQuery -->
  <script defer src="/resources/js/jquery-3.7.1.min.js"></script>
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
            <input type="email" class="int-area-input" name="email" id="email"
                autocomplete="off" placeholder="Email" required />
            <div class="int-area-name">비밀번호</div>
            <input type="password" class="int-area-input" name="password" id="password"
                autocomplete="off" placeholder="Password" required/>
        <span class="">
            <c:if test="${error}">
                <p id="valid" class="alert alert-danger ">${exception}</p>
            </c:if>
        </span>
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

</script>