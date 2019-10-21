package com.kh.myapp.bbs.dao;

import java.util.List;

import com.kh.myapp.bbs.dto.BbsDTO;

public interface BbsDAO {
	//게시글 작성
	int write(BbsDTO bbsDTO);
	//게시글 수정
	int modify(BbsDTO bbsDTO);
	//게시글 삭제
	int delete(String bnum);
	//게시글 보기
	BbsDTO view(String bnum);
	//게시글 목록보기
	//1)전체
	List<BbsDTO> list();
	//2)검색어 없는 경우
	List<BbsDTO> list(int starRec, int endRec);																			
	//3)검색어 있는 경우
	List<BbsDTO> list(int starRec, int endRec, String searchType, String keyword);	
	//게시글 페이징
	//게시글 검색
	//게시글 답글
	int reply(BbsDTO bbsDTO);
	//게시글 총계
	
	//1)검색어 없는 경우
	int totalRec();
	//2)검색어 있는 경우
	int searchTotalRec(String searchType, String keyword);
	
}
