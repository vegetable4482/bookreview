package com.kh.myapp.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller //Component 어노테이션을 상속받음 
@RequestMapping("/test") //클라이언트가 test를 url상에 요청하면 TestController를 찾음 
public class TestController {
	
	private static final Logger logger
	=LoggerFactory.getLogger(TestController.class);
	
	@GetMapping("/member")
//	@RequestMapping("/member") 
	public String member(
			@RequestParam("name") String name,
			@RequestParam("age") String age) {
		
		logger.info("member()호출");
		logger.info("name=" +name);
		logger.info("age="+age);
		return "/test/member";
	}
	

	@RequestMapping(value="/member",method=RequestMethod.POST)
	public String memberPost(
			@RequestParam("name") String name,
			@RequestParam("age") String age) {
		
		logger.info("memberPost()호출");
		logger.info("name=" +name);
		logger.info("age="+age);
		return "/test/member";
	}
}
