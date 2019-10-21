package com.kh.myapp.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

import javax.inject.Inject;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class TestInsertJdbcTemplate {
	private static Logger logger =LoggerFactory.getLogger(TestInsertJdbcTemplate.class);
	
	@Inject
	JdbcTemplate jt;
	
	StringBuffer sql =null;
	@BeforeEach
	void before(){
		sql = new StringBuffer();
	}
	
	//1)insert : 치환할 값이 있는 경우
	@Disabled
	@Test
	void insert() {
		sql.append("insert into student (id,name,kor,eng,math) values (?,?,?,?,?) ");
		
		int cnt = jt.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {				
				PreparedStatement pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, "id1");
				pstmt.setString(2, "name1");
				pstmt.setInt(3, 70);
				pstmt.setInt(4, 80);
				pstmt.setInt(5, 90);	
				return pstmt;
			}
		});
		
		logger.info("생성건수: " + cnt);
	}//insert의 끝
	
	//2)insert : 치환할 값이 없는 경우
	@Disabled
	@Test
	void insert2() {
		//치환해줄 값이 없는 경우 update(String)
		
		sql.append("insert into student (id,name,kor,eng,math) values ('id2','name2',50,60,70) ");
		int cnt = jt.update(sql.toString());	
		logger.info("생성건수: " + cnt);
	}//insert2의 끝
	
	@Disabled
	@Test
	void insert3() {
		sql.append("insert into student (id,name,kor,eng,math) values (?,?,?,?,?) ");
		int cnt= jt.update(sql.toString(),"id3","name3",50,80,60);
		
		logger.info("생성건수: " + cnt);
	}//insert3의 끝
	
	@Test
	void insert4() {
		sql.append("insert into student (id,name,kor,eng,math) values (?,?,?,?,?) ");
		int cnt = jt.update(sql.toString(),new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, "id4");
				ps.setString(2, "name4");
				ps.setInt(3, 50);
				ps.setInt(4, 50);
				ps.setInt(5, 50);
			}
		});
		logger.info("생성건수: " + cnt);
	}//insert4의 끝
	
	@Disabled
	@Test
	void insert5() {
		
		sql.append("insert into student (id,name,kor,eng,math) values (?,?,?,?,?) ");
		int[] ty= {Types.VARCHAR,Types.VARCHAR,Types.INTEGER,Types.INTEGER,Types.INTEGER};
		int cnt = jt.update(sql.toString(), 
												new Object[] {"id5","name5",30,40,50,},
												ty);
		logger.info("생성건수: " + cnt);
				
		
		
	}//insert5의 끝
	
	
	//람다식을 사용
	@Disabled
	@Test
	void insert6() {
		sql.append("insert into student (id,name,kor,eng,math) values (?,?,?,?,?) ");
		
		int cnt = jt.update(con -> {
					PreparedStatement pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, "id6");
				pstmt.setString(2, "name6");
				pstmt.setInt(3, 70);
				pstmt.setInt(4, 80);
				pstmt.setInt(5, 90);	
				return pstmt;
		});
	}//insert6의 끝
	
	@Disabled
	@Test
	void insert7() {
		sql.append("insert into student (id,name,kor,eng,math) values (?,?,?,?,?) ");
		
		int cnt = jt.update(sql.toString(), ps -> {
			
			  ps.setString(1, "id7");
				ps.setString(2, "name7");
				ps.setInt(3, 70);
				ps.setInt(4, 80);
				ps.setInt(5, 90);	
				
		});
		
		logger.info("생성건수: " + cnt);
	}//insert7의 끝
}//main의 끝
