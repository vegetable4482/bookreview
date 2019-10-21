package com.kh.myapp.controller;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.myapp.common.Code;
import com.kh.myapp.login.service.LoginSvc;
import com.kh.myapp.member.dto.MemberDTO;
import com.kh.myapp.member.dto.PasswdDTO;
import com.kh.myapp.member.service.MemberSvc;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberSvc memberSvc;
	
	@Inject
	private LoginSvc loginSvc;
	
	@ModelAttribute
	public void initData(Model model) {
		//지역
		List<Code> region = new ArrayList<>();
		region.add(new Code("서울","서울"));
		region.add(new Code("경기","경기"));
		region.add(new Code("인천","인천"));
		region.add(new Code("대전","대전"));
		region.add(new Code("충북","충북"));
		region.add(new Code("충남","충남"));
		region.add(new Code("대구","대구"));
		region.add(new Code("부산","부산"));
		region.add(new Code("울산","울산"));
		region.add(new Code("제주","제주"));
		
		model.addAttribute("region",region);
		
		//성별
		List<Code> gender =new ArrayList<>();
		gender.add(new Code("여성","여성"));
		gender.add(new Code("남성","남성"));
		
		model.addAttribute("gender",gender);
	}
	//회원가입 양식
	@GetMapping("/memberJoinForm")
	public String memberJoinForm(Model model) {
		logger.info("memberJoinForm() 호출");
		model.addAttribute("mdto", new MemberDTO());
		return "/member/memberJoinForm";
	}
	
	//회원등록 처리
	@PostMapping(value = "/memberJoin")
	public String memberJoin(
			@Valid @ModelAttribute MemberDTO memberDTO,
			BindingResult result,Model model) {
		String viewName=null;
		
		logger.info("memberJoin() 호출");
		logger.info(memberDTO.toString());
		
		if(result.hasErrors()) {
			logger.info("회원가입시 오류 발생");
			logger.info(result.toString());
			return "/member/memberJoinForm";
		}		
		
		//회원중복체크
		if(memberSvc.getMember(memberDTO.getId()) != null) {
			viewName = "/member/memberJoinForm";
					model.addAttribute("svr_msg","중복된 아이디입니다.");
					return viewName;
		};
		
		
		//회원등록
		int cnt = memberSvc.insert(memberDTO);
		
		if(cnt == 1) {
			viewName= "redirect:/";
		}else {
			viewName= "/member/memberJoinForm";
		}
		return viewName;
	}
	//회원목록 조회
	@GetMapping("/memberList")	//파라미터상의 모델객체
	public String member(Model model) {
		
		List<MemberDTO> list = memberSvc.getMemberList();
		model.addAttribute("memberList", list);
		
		logger.info(list.toString());
		return "/member/memberList";
	}
	//회원 수정
	@GetMapping("/memberModifyForm/{id:.+}")
	public String memberModifyForm(@PathVariable String  id,Model model) {
		
		MemberDTO memberDTO = memberSvc.getMember(id);
		model.addAttribute("memberDTO", memberDTO);
		logger.info("memberDTO+" + memberDTO);
		return "/member/memberModifyForm";
	}
	//회원 수정 처리
	@PostMapping("/memberModify")
	public String memberModify(MemberDTO memberDTO,HttpSession session){
		
		logger.info("회원이미지 첨부파일명: " + memberDTO.getFile().getOriginalFilename());
		int result = memberSvc.modify(memberDTO);
		logger.info("수정처리결과:"+ result);

		if(result == 1) {
			MemberDTO mdto = loginSvc.getMember(
					memberDTO.getId(),((MemberDTO)session.getAttribute("user")).getPw());
			//기존 회원정보 제거 후 변경된 정보로 반영
			session.removeAttribute("user");
			session.setAttribute("user", mdto);
			
			return "redirect:/";
		}else {
			
			return "redirect:/memberModifyForm/"+memberDTO.getId();
		}
		
	}
	//비밀번호 변경
	@GetMapping("/mpwChangeForm")
	public String mpwChangeForm(Model model) {
		model.addAttribute("passwdDTO",new PasswdDTO());

	return "/member/mpwChangeForm";
	}
//비밀번호 변경 처리
	@PostMapping("/changePw")
	public String changePw(@Valid @ModelAttribute PasswdDTO passwdDTO,
												BindingResult result) {
		int cnt = memberSvc.changePw(passwdDTO);
	
		if(result.hasErrors()) {
			logger.info(result.toString());
			
			return "/member/mpwChangeForm";
			
		}
		
		logger.info("수정처리결과:"+ result);
		
		
		//비밀번호 변경
		if(cnt == 1) {

			
			return "redirect:/";
		}else {
			
			return "redirect:/mpwChangeForm";
		}
	}
	//회원 탈퇴화면
	@GetMapping("/memberOutForm")
	public String memberOut() {
		
		return "/member/memberOutForm";
	}
	//회원 탈퇴 처리(회원용)
	@PostMapping("/memberDelete")
	public String memberDelete(@RequestParam("id") String id,
														 @RequestParam("pw") String pw
														 ,HttpSession session) {
		
		int result = memberSvc.delete(id,pw);
		 session.invalidate();
		logger.info("회원 탈퇴처리결과"+result);
		
		return "redirect:/";
	}
	
	//회원 삭제 처리(관리자용)
	@GetMapping("/memberDelete/{id:.+}")
	public String memberDelete(@PathVariable String id) {

		int result = memberSvc.delete(id);
		logger.info("삭제처리결과"+result);
		
		return "redirect:/member/memberList";
	}
	
	
}
