package com.kh.myapp.member.dto;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Entity	
@Data
public class MemberDTO {
	
	@NotNull
	@Pattern(regexp="^\\w+@\\w+\\.\\w+(\\.\\w+)?$",message="ex)aaa@bbb.com")
	private String id;				//아이디(이메일)
	
	@NotNull
	@Size(min=6,max=10, message="비밀번호는 6~10자리로 입력바랍니다.")
	private String pw;				//비밀번호
	
	@NotNull
	@Pattern(regexp="^(02|010)-\\d{3,4}-\\d{4}$" , message="ex)010-1234-5678")
	private String tel;				//전화번호
	
	@NotNull
	@Size(min=3,max=10,message="닉네임은 3~10자리로 입력바랍니다.")
	private String nickname;	//별칭
	
	
	private String gender;		//성별
	private String region;		//지역
	private String birth;			//생년월일
	private Timestamp cdate;			//생성일 = 가입일
	private Timestamp udate;     //수정일
	//회원 이미지 첨부용
	private MultipartFile file;
	private String originFn;	//업로드파일 
	private String randomFn;	//내부 관리 되는 실제 파일명 (랜덤)
	
	
}

