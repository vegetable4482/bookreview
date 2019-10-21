package com.kh.myapp.student;

import static org.junit.Assert.assertTrue;

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
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import lombok.Data;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestUpdateJdbcTemplate {

	private static Logger logger =LoggerFactory.getLogger(TestUpdateJdbcTemplate.class);
	
	@Inject
	JdbcTemplate jt;
	
	StringBuffer sql;
	
	@BeforeEach
	void before() {
		sql =new StringBuffer();
	}
	
	@Disabled
	@Test
	void update() {
		int[] jumsu= {100,100,100};
		String id="id2";
		
		sql.append("update student set kor=?, eng=?,math=? where id =? ");
		int cnt=jt.update(new PreparedStatementCreator() {
			
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1,jumsu[0]);
				pstmt.setInt(2,jumsu[1]);
				pstmt.setInt(3,jumsu[2]);
				pstmt.setString(4, id);
				
				return pstmt;
			}
		});
		logger.info("변경건수 : "+cnt);
		
		//select
		sql= new StringBuffer();
		sql.append("select kor,eng,math from student where id = ? ");
		//조회되는 데이터가 하나일 경우 queryForObject
//  case1)
		StudentDTO student=jt.queryForObject(sql.toString(),new BeanPropertyRowMapper<>(StudentDTO.class),id);
		
 	//case2)
//		StudentDTO student = jt.queryForObject(sql.toString(), new RowMapper<StudentDTO>() {
//			
//			@Override
//			public StudentDTO mapRow(ResultSet rs, int rowNum) throws SQLException{
//				StudentDTO student = new StudentDTO();
//				student.setKor(Integer.parseInt(rs.getString("kor")));
//				student.setEng(Integer.parseInt(rs.getString("eng")));
//				student.setMath(Integer.parseInt(rs.getString("math")));
//				return student;
//			}
//			
//		},id);
		
		
		boolean result = student.getKor()	== jumsu[0] &&
										 student.getEng()	== jumsu[1] &&
										 student.getMath()	== jumsu[2];
		
		assertTrue(result);
 	}//update의 끝
	@Disabled
	@Test
	void update2(){
		sql.append("update student set kor=?, eng=?,math=? where id =? ");
		//치환할게 없는 경우
		int cnt= jt.update(sql.toString(), 90,90,90,"id2");
		
		logger.info("변경건수 :" +cnt);
		
	}
	
	@Test
	void update3(){
		sql.append("update student set kor=?, eng=?,math=? where id =? ");
		//치환할게 없는 경우
		int cnt= jt.update(sql.toString(),new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				
				int[] jumsu= {70,70,70};
				String id="id3";
				
				ps.setInt(1,jumsu[0]);
				ps.setInt(2,jumsu[1]);
				ps.setInt(3,jumsu[2]);
				ps.setString(4, id);
				
			}
		});
		
		logger.info("변경건수 :" +cnt);
		
	}
	
	@Test
	void update4() {
		sql.append("update student set kor=?, eng=?,math=? where id =? ");
		int cnt=jt.update(sql.toString(),
							new Object[] {"60","60","60","id4"},
							new int[] {Types.INTEGER,Types.INTEGER,Types.INTEGER,Types.VARCHAR});
		
		logger.info("변경건수:"+cnt);
	}
	
	
}//main의 끝

@Data
class StudentDTO{
	private String id;
	private String name;
	private int kor;
	private int eng;
	private int math;
	
}
