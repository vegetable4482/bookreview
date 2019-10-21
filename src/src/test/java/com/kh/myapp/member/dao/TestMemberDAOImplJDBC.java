package com.kh.myapp.member.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.myapp.member.dto.MemberDTO;
import com.kh.myapp.member.dto.PasswdDTO;

@ExtendWith(SpringExtension.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestMemberDAOImplJDBC {
	
	private final static Logger logger 
	= LoggerFactory.getLogger(TestMemberDAOImplJDBC.class);
	
	@Inject
	@Qualifier("memberDAOImplXML")
	MemberDAO mdaoImpl;
	
	@Disabled
	@Test
	void testInsert() {
		MemberDTO mdto = new MemberDTO();
		mdto.setId("qopqopqop0000000");
		mdto.setPw("asd1234~!");
		mdto.setTel("010-1234-1235");
		mdto.setNickname("뜽우뜽우");
		mdto.setGender("여");
		mdto.setRegion("울산");
		mdto.setBirth("1994-01-01");
		
		int cnt = mdaoImpl.insert(mdto);
		assertEquals(1, cnt);
		logger.info(String.valueOf(cnt));	
	}
	@Disabled
	@Test
	void testModify() {
		MemberDTO mdto = new MemberDTO();
		mdto.setId("test@test.com");
		mdto.setPw("1234");
		mdto.setTel("011-0111-0112");
		mdto.setNickname("바뀐다");
		mdto.setGender("여");
		mdto.setRegion("울산");
		mdto.setBirth("2001-20-02");
		
		int cnt = mdaoImpl.modify(mdto);
		logger.info(String.valueOf(cnt));
	}
	@Disabled
	@Test
	void TestDelete() {
		
		int cnt = mdaoImpl.delete("qopqopqop0000","asd1234~!");
							
		assertEquals(1, cnt);
		logger.info(String.valueOf(cnt));
	}
	@Disabled
	@Test
	void TestGetMember() {
		MemberDTO mdto = mdaoImpl.getMember("rla71666");
		logger.info(mdto.toString());
	}
	@Disabled
	@Test

	void TestGetMemberList() {
		List<MemberDTO> list = mdaoImpl.getMemberList();
		logger.info(list.toString());
	}

	@Test
	void TestChangePw() {
		PasswdDTO passwdDTO = new PasswdDTO();
		
		String id="test@test.com";
		String fromPW="asd1234~!";
		String toPW="asd4567";
		passwdDTO.setId(id);
		passwdDTO.setFromPW(fromPW);
		passwdDTO.setToPW(toPW);
		
		mdaoImpl.changePw(passwdDTO);
		
	}
	
	
	
}
