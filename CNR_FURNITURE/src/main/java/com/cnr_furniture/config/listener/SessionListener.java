package com.cnr_furniture.config.listener;

import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SessionListener implements HttpSessionListener {
  //@Value("${server.servlet.session.timeout}")
  private int sessionTime = 1800;       // session 30분 설정 (단위는 초)

  public void sessionCreated(HttpSessionEvent se) {
    se.getSession().setMaxInactiveInterval(sessionTime);
  }

  public void sessionDestroyed(HttpSessionEvent se) {

  }
}

