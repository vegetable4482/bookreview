package com.kh.myapp.bbs.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.myapp.bbs.dto.BbsDTO;


@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestBbsDAOImplJDBC {

	private static Logger logger = 
			LoggerFactory.getLogger(TestBbsDAOImplJDBC.class);
	
	@Inject
	JdbcTemplate jt;
	
	@Inject
	BbsDAO bbsDAO;
	
	//게시글 작성
	@Test
//	@Disabled
	void test_write() {
		BbsDTO bbsDTO = new BbsDTO();
		bbsDTO.setBtitle("제목1");
		bbsDTO.setBid("test1");
		bbsDTO.setBnickname("홍길동");
		bbsDTO.setBcontent("내용1");
		
		int cnt = bbsDAO.write(bbsDTO);
		assertEquals(1, cnt);
	}
	
	//게시글 수정
	@Test
	@Disabled
	void test_modify() {
		BbsDTO bbsDTO = new BbsDTO();
		bbsDTO.setBnum(1182);
		bbsDTO.setBcontent("[수정] 내용1");
		bbsDTO.setBtitle("[수정] 제목1");
		
		int cnt = bbsDAO.modify(bbsDTO);
		assertEquals(1, cnt);
	}
	
	//게시글 삭제
	@Test
	@Disabled
	void test_delete() {
		int cnt = bbsDAO.delete("1182");
		assertEquals(1, cnt);
	}
	
	//게시글 조회
	@Test
	@Disabled
	void test_view() {
		BbsDTO bbsDTO = bbsDAO.view("1185");
		boolean result = bbsDTO.getBnum() == 1185;
		assertTrue(result);
		logger.info(bbsDTO.toString());
	};

	//게시글 목록보기
	//1) 전체
	@Test
	@Disabled
	void test_list() {
		List<BbsDTO> list = bbsDAO.list();
		logger.info(list.toString());
		
		assertEquals(5, list.size());
	}
	
	//2) 검색어 없는 경우
	@Test
	@Disabled
	void test_list2() {
		List<BbsDTO> list = bbsDAO.list(11, 20);
		logger.info(list.toString());
		assertEquals(5, list.size());
	}
	
	//3) 검색어 있는 경우
	@Test
	@Disabled
	void test_list3() {
		List<BbsDTO> list = bbsDAO.list(11, 20, "T", "제목");
		logger.info(list.toString());
		assertEquals(5, list.size());
	}
	
	
	
}
