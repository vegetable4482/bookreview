package com.kh.myapp.service;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.myapp.member.dao.MemberDAOImplJDBC;
import com.kh.myapp.member.dto.MemberDTO;
import com.kh.myapp.member.service.MemberSvc;

@ExtendWith(SpringExtension.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class TestMemberSvcIml {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImplJDBC.class);
	@Inject
	MemberSvc memberSvc;
	
	@Test
	void testInsert() {
		MemberDTO mdto = new MemberDTO();
		mdto.setId("rla71666");
		mdto.setPw("12345");
		mdto.setTel("010-1234-1235");
		mdto.setNickname("이런");
		mdto.setGender("남");
		mdto.setRegion("울산");
		mdto.setBirth("2001-01-01");
		
		int cnt = memberSvc.insert(mdto);
		assertEquals(1, cnt);
		logger.info(String.valueOf(cnt));
	}
	
	@Test
	void testModify() {
		MemberDTO mdto = new MemberDTO();
		mdto.setId("test@test.com");
		mdto.setPw("1235");
		mdto.setTel("011-0111-0112");
		mdto.setNickname("바뀐다");
		mdto.setGender("여");
		mdto.setRegion("울산");
		mdto.setBirth("2001-20-02");
		
		int cnt = memberSvc.modify(mdto);
		logger.info(String.valueOf(cnt));
	}
	
	@Test
	void TestDelete() {
		
		int cnt = memberSvc.delete("rla71666");
		assertEquals(1, cnt);
		logger.info(String.valueOf(cnt));
	}
	
	@Test
	void TestGetMember() {
		MemberDTO mdto = memberSvc.getMember("rla71666");
		logger.info(mdto.toString());
	}
	
	@Test
	void TestGetMemberList() {
		List<MemberDTO> list = memberSvc.getMemberList();
		logger.info(list.toString());
	}
	
}
