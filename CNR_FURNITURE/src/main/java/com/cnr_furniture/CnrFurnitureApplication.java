package com.cnr_furniture;

import com.cnr_furniture.config.listener.SessionListener;
import jakarta.servlet.http.HttpSessionListener;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.Bean;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class CnrFurnitureApplication {

	public static void main(String[] args) {
		SpringApplication.run(CnrFurnitureApplication.class, args);
	}

	@Bean
	public HttpSessionListener httpSessionListener() {
		return new SessionListener();
	}
}
