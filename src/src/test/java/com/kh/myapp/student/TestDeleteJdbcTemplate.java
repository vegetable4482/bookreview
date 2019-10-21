package com.kh.myapp.student;

import javax.inject.Inject;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestDeleteJdbcTemplate {

	private static Logger logger =LoggerFactory.getLogger(TestDeleteJdbcTemplate.class);
	
	@Inject
	JdbcTemplate jt;
	
	StringBuffer sql;
	
	@BeforeEach
	void before() {
		sql =new StringBuffer();
	}
	
	//object...args= 가변변수 항상 맨 끝에 와야함
}
