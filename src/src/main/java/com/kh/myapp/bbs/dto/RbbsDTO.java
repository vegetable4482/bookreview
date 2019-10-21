package com.kh.myapp.bbs.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class RbbsDTO {

	private int rnum;					//댓글번호
	private int bnum;					//최초 원글
	
	private String rid;				//댓글 작성자 아이디
	private String rnickname;	//댓글 작성자 별칭
	@JsonFormat(pattern = "yyyy-mm-dd HH:mm:ss", timezone ="Asia/Seoul")
	//@JsonFormat(pattern = "yyyy-mm-dd h:mm:a", timezone ="Asia/Seoul")
	private Timestamp	rcdate;	//댓글 작성일시
	@JsonFormat(pattern = "yyyy-mm-dd HH:mm:ss", timezone ="Asia/Seoul")	
	private Timestamp rudate;	//댓글 수정일시
	
	private String rcontent;	//댓글 내용
	private int rgood;				//좋아요
	private int rbad;					//싫어요
	private int rgroup;				//댓글그룹
	private int rstep;				//댓글단계
	private int rindent;			//댓글 들여쓰기
	
	private Integer rrnum;				//부모글
	private String rrnickname;//부모 댓글 닉네임 
	private String rrid;			//부모 댓글 아이디
	
}
