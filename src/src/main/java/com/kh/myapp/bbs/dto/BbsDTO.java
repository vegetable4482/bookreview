package com.kh.myapp.bbs.dto;

import java.sql.Date;

import lombok.Data;



@Data
public class BbsDTO {

	private int bnum;					//게시글번호
	private String btitle;		//제목
	private String bid;				//작성자ID
	private String bnickname;	//작성자(별칭)
	private Date	bcdate;			//작성일
	private Date 	budate;			//수정일
	private int bhit;					//조회수
	private	String bcontent;	//본문내용
	private int bgroup;				//답글그룹
	private int bstep;				//답글의 단계
	private int bindent;			//답글의 들여쓰기
	

}
