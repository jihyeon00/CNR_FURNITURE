package com.cnr_furniture.config.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.*;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import java.io.IOException;
import java.net.URLEncoder;

@Component
public class CustomAuthFailureHandler extends SimpleUrlAuthenticationFailureHandler {

  @Override
  public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                      AuthenticationException exception)
    throws IOException, ServletException {

    String errorMessage = null;
    if(exception instanceof BadCredentialsException || exception instanceof InternalAuthenticationServiceException){
      errorMessage = "이메일과 비밀번호가 맞지 않습니다. 다시 확인해 주십시오";
    } else if (exception instanceof UsernameNotFoundException) {
      errorMessage = "계정이 존재하지 않습니다. 관리자에게 문의하세요.";
    } else if (exception instanceof InternalAuthenticationServiceException) {
      errorMessage = "내부적으로 발생한 시스템 문제로 인해 요청을 처리할 수 없습니다. 관리자에게 문의하세요.";
    } else {
      errorMessage = "알 수 없는 이유로 로그인에 실패하였습니다. 관리자에게 문의하세요.";
    }
    errorMessage = URLEncoder.encode(errorMessage, "UTF-8"); /* 한글 인코딩 깨진 문제 방지 */
    setDefaultFailureUrl("/login?error=true&exception="+errorMessage);
    super.onAuthenticationFailure(request, response, exception);
  }


}
