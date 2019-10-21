package com.kh.myapp.bbs.dao;

import java.util.List;

import com.kh.myapp.bbs.dto.RbbsDTO;

public interface RbbsDAO {
	//댓글 등록
	int write(RbbsDTO rbbsDTO);
	
	//댓글 목록
	List<RbbsDTO> list(String bnum);
	List<RbbsDTO> list(String bnum,int startRec, int endRec);
	
	//댓글 수정
	int modify(RbbsDTO rbbsDTO);
	
	
	//댓글 삭제
	int delete(String rnum);
	
	//댓글 좋아요/싫어요
	int goodOrBad(String rnum, String goodOrBad);
	
	//대댓글 등록
	int reply(RbbsDTO rbbsDTO);
	
	//대댓글 총계
	int replyTotalRec(String bnum);
	
	
}
