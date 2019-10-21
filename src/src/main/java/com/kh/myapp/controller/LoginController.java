package com.kh.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.myapp.login.service.LoginSvc;
import com.kh.myapp.member.dto.MemberDTO;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger
	= LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	private LoginSvc loginSvc;
	
	@GetMapping("/login")
	public String login() {
			
		return "/login/loginForm";
		
	}
	//로그인이 성공했을 때
	@PostMapping("/loginOk")
	public String loginOk(@RequestParam("id") String id, 
												@RequestParam("pw") String pw,
												HttpSession session) {
		
		logger.info("id=" + id);
		logger.info("pw=" + pw);
		//1)회원유무
		int result = loginSvc.isMember(id, pw);
		//2)세션에 회원 정보 저장
		if(result == 1) {
			MemberDTO mdto = loginSvc.getMember(id, pw);
			session.setAttribute("user", mdto);
			logger.info("로그인처리 끝:"+mdto.getId());

		}else {
			return "/login/loginForm";
		}
		
		
		return "redirect:/";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
}
