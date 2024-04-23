package com.cnr_furniture.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 오류 발생시에 대한 컨트롤러 입니다.
 * **/
@Controller
public class ErrorHandler implements ErrorController {

  @GetMapping("/error")
  public String handleError(HttpServletRequest request) {
    Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
    // error로 들어온 에러의 status를 불러온다 (ex:404,500,403...)
    if(null != status){
      int statusCode = Integer.valueOf(status.toString());
      if(statusCode == HttpStatus.FORBIDDEN.value()){
        return "error/403";
      } else if(statusCode == HttpStatus.NOT_FOUND.value()){
        return "error/404";
      } else {
        return "error";
      }
    }
    return "error";
  }
}
