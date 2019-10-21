package com.kh.myapp.login;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.myapp.login.dao.LoginDAO;
import com.kh.myapp.member.dao.TestMemberDAOImplJDBC;
import com.kh.myapp.member.dto.MemberDTO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestLgoinDAOImplJDBC {
	
	private final static Logger logger 
	= LoggerFactory.getLogger(TestMemberDAOImplJDBC.class);
	@Inject       //자바표준 어노테이션 : 컨텍스트에 등록된 빈을 참조한다.
	@Qualifier("memberDAOImplXML")
	private LoginDAO logDAO;
	
	@Test
	void testIsMember() {
		int result =  logDAO.isMember("ddd@naver.com","asd1234~!");
		
		assertEquals(1, result); //(예상치,성공치,오차범위)
		
	}
	
	@Test
	void testGetMember() {

		MemberDTO mdto = logDAO.getMember("ddd@naver.com","asd1234~!");
		logger.info(mdto.toString());
//		assertEquals("01000000000", mdto.getTel());
		
	}

	
}
