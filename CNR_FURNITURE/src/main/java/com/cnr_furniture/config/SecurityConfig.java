package com.cnr_furniture.config;

import com.cnr_furniture.config.auth.CustomAuthFailureHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity //웹보안 활성화를위한 annotation
@EnableMethodSecurity(securedEnabled = true)   // @Secured, @PreAuthorize, @PostAuthorize 어노테이션 사용해주는 어노테이션
public class SecurityConfig {

  @Bean
  public static BCryptPasswordEncoder bCryptPasswordEncoder() {
    return new BCryptPasswordEncoder();
  }
  @Bean
  public static CustomAuthFailureHandler customAuthFailureHandler() {
    return new CustomAuthFailureHandler();
  }

  @Bean
  public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

    http
      .csrf(AbstractHttpConfigurer::disable)
      .authorizeHttpRequests(requests -> requests
        // 모두 접근
        .requestMatchers("/login", "/PasswordChange").permitAll()
        // 사원 권한 페이지 설정
//        .requestMatchers(
//          new AntPathRequestMatcher("/"),                   // 메인페이지
//          new AntPathRequestMatcher("/standardInfo/**"),    // 기준정보
//          new AntPathRequestMatcher("/production/**"),      // 생산관리
//          new AntPathRequestMatcher("/inventory/**"),       // 재고관리
//          new AntPathRequestMatcher("/process/**"),         // 공정관리
//          new AntPathRequestMatcher("/quality/**"),         // 품질관리
//          new AntPathRequestMatcher("/machine/**"),         // 설비관리
//          new AntPathRequestMatcher("/member/**")           // 시스템관리 - 사원권힌관리
//        )
//        .authenticated()
        // 매니저 권한 페이지 설정
        .requestMatchers(
          new AntPathRequestMatcher("/M/**"))
        .hasAnyRole("Manager", "Director")
        // 디렉터 권한 페이지 설정
        .requestMatchers(
          new AntPathRequestMatcher("/D/**"))
        .hasRole("Director")
        .anyRequest().permitAll()
      )
      .formLogin(form -> form
        .loginPage("/login")
        .loginProcessingUrl("/login")
        .usernameParameter("email")	          // login 에 필요한 id 값을 email 로 설정 (default 는 username)
        .passwordParameter("password")	      // login 에 필요한 password 값을 password(default)로 설정
        .failureHandler(customAuthFailureHandler()) /* 로그인 실패 핸들러 */
        .defaultSuccessUrl("/", true)
        .permitAll()
      )
      .logout(logout -> logout
        .logoutSuccessUrl("/login")
        .permitAll()
      );


    return http.build();
  }
}
