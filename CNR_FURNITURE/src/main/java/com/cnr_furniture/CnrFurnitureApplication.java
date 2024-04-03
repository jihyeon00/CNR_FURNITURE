package com.cnr_furniture;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class CnrFurnitureApplication {

	public static void main(String[] args) {
		SpringApplication.run(CnrFurnitureApplication.class, args);
	}

}
