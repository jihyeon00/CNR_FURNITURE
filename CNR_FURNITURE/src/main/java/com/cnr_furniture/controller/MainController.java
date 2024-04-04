package com.cnr_furniture.controller;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {

	@GetMapping(value={"/","/main"})
	public String Main(){
		return "main/index";
	}
}
