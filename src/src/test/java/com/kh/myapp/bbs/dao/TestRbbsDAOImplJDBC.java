package com.kh.myapp.bbs.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

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

import com.kh.myapp.bbs.dto.RbbsDTO;


@ExtendWith(SpringExtension.class)//테스트를 할 때 서버를 구동할 필요 x
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestRbbsDAOImplJDBC {
	
	private static Logger logger =LoggerFactory.getLogger(TestRbbsDAOImplJDBC.class);

	@Inject
	JdbcTemplate jt;
	
	@Inject
	RbbsDAO rbbsDAO;
	//댓글 등록
	@Test
	@Disabled
	 void test_write() {
    for(int i=0; i<25; i++) {
    RbbsDTO rbbsDTO = new RbbsDTO();
    rbbsDTO.setBnum(1);

    rbbsDTO.setRid("rereply"+i+"@test.com");
    rbbsDTO.setRnickname("댓글닉네임1");
    rbbsDTO.setRcontent("댓글입니다1!!!");
    rbbsDAO.write(rbbsDTO);
    }
}
	
	//댓글 목록
	@Disabled
	@Test
	void test_list() {
    List<RbbsDTO> list = rbbsDAO.list("1");
    logger.info(list.toString());
	}
	@Disabled
	@Test
	void test_list2() {
		List<RbbsDTO> list = rbbsDAO.list("1",11,20);
		logger.info(list.toString());
		assertEquals(10, list.size());
	}
	
	
	
	//댓글수정
	@Disabled
	@Test
	void test_modify() {
		RbbsDTO rbbsDTO = new RbbsDTO();
		rbbsDTO.setRnum(10);
		rbbsDTO.setRcontent("수졍ㅋ");
		int cnt= rbbsDAO.modify(rbbsDTO);
		assertEquals(1,  cnt);
		
	}
	//댓글삭제
	@Disabled
	@Test
	void test_delete() {
		int cnt = rbbsDAO.delete("28");
		assertEquals(1,cnt);
	}
	//호감비호감
	@Disabled
	@Test
	void test_goodOrBad() {
		rbbsDAO.goodOrBad("10", "good");
		rbbsDAO.goodOrBad("10", "bad");
	}
	//대댓글 등록
	@Disabled
	@Test
	void test_reply() {
		RbbsDTO rbbsDTO = new RbbsDTO();
		rbbsDTO.setRnum(4);
		rbbsDTO.setRid("rere2@test.com");
    rbbsDTO.setRnickname("등록자4");
    rbbsDTO.setRcontent("대댓글임ㅋ");
    
    int cnt = rbbsDAO.reply(rbbsDTO);
    assertEquals(1,cnt);
		
	}
	//대댓글 총계
	 @Test
   //@Disabled
   void test_replyTotalRec() {
       int cnt = rbbsDAO.replyTotalRec("10");
       logger.info("10번 게시글 댓글 총 갯수 => " + cnt);
   }
}
