package com.kh.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jquery")
public class TestJqueryController {

	@GetMapping("/test")
	public String jqueryTest() {
		
		return "/test/jspquery";
	}
	
}
