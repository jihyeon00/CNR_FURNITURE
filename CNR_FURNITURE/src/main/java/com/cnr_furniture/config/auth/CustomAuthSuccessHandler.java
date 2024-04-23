package com.cnr_furniture.config.auth;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import java.io.IOException;


public class CustomAuthSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
  public CustomAuthSuccessHandler(String defaultTargetUrl) {
    setDefaultTargetUrl(defaultTargetUrl);
  }

  /**
   * 인증에 성공할 경우 아래 매서드로 이동.
   */
  @Override
  public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                      FilterChain chain, Authentication authentication)
    throws IOException, ServletException {
    HttpSession session = request.getSession();
    if (session != null) {
      String redirectUrl = (String) session.getAttribute("prevPage");
      if (redirectUrl != null) {
        session.removeAttribute("prevPage");
        getRedirectStrategy().sendRedirect(request, response, redirectUrl);
      } else {
        super.onAuthenticationSuccess(request, response, authentication);
      }
    } else {
      super.onAuthenticationSuccess(request, response, authentication);
    }
  }
}
