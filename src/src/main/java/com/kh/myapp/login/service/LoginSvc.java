package com.kh.myapp.login.service;

import com.kh.myapp.member.dto.MemberDTO;

public interface LoginSvc {
	//회원 유무 체크
	int isMember(String id,String pw);
	
  //회원 정보 읽어오기
  default MemberDTO getMember(String id,String pw) {
		
		return null;
	}
}
