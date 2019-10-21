package com.kh.myapp.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestSelectJdbcTemplate {

	private static Logger logger =LoggerFactory.getLogger(TestSelectJdbcTemplate.class);
	@Inject
	
	JdbcTemplate jt;
	
	StringBuffer sql =null;
	
	@BeforeEach
	void before(){
		sql = new StringBuffer();
	}
	@Disabled
	@Test
	void select() {
		sql.append("select id,name,kor,eng,math from student ");
		List<Map<String, Object>>  list =null;
		//하나의 레코드를 컬럼은 key, 값은 value로  맵객체를 만들고 List에 담아올 때 사용
		list = jt.queryForList(sql.toString());    //여러레코드를 읽어올 때
		
//		for(Map<String,Object>map : list) {
//			logger.info(map.toString());
//		}
		
		list.stream().forEach(map->{
			logger.info(map.toString());
		});
	}//select의 끝
	@Disabled
	@Test
	void select2() {
		sql.append("select math from student ");
		
		List<Integer> list=null;
		
		//레코드 중 1개의 컬럼만을 기본타입으로 List에 담아올 때 사용
		list = jt.queryForList(sql.toString(), Integer.class);
		
		for(Integer i: list) {
			logger.info(i.toString());
		}
	}//select2의 끝
	
	@Disabled
	@Test
	void select3() {
		sql.append("select id,name,kor,eng,math from student where kor > ? and math >?");
		
		List<Map<String, Object>>  list =null;
		list = jt.queryForList(sql.toString(), 50,80);
		for(Map<String,Object>map : list) {
		logger.info(map.toString());
		
		}//for문의 끝
	}//select3의 끝
	
	@Disabled
	@Test
	void select4() {
		sql.append("select name from student where math >?");
		List<String> list =null;
		list = jt.queryForList(sql.toString(), String.class, 50);
		
		
		for(String name : list) {
			logger.info(name.toString());
		}
		
		
	}//select4의 끝
	
	@Disabled
	@Test
	void select5() {
		
		sql.append("select name from student where  kor >?and math>? ");
		
		List<Map<String, Object>>  list =null;
   	list =	jt.queryForList(sql.toString(), new Object[] {60,60}, new int[] {Types.INTEGER,Types.INTEGER});
		
		for(Map<String, Object>map : list) {
			logger.info(map.toString());
		}
	
   	
	}//select5의 끝
	@Disabled
	@Test
	void select6() { //컬럼이 여러개일 경우 Map을 사용, 하나일 경우 String 을 사용 하나일경우 Class<T>requiredType
	 sql.append("select name from student where kor>? and math >? ");	
	 List<String> list =null;
	 list = jt.queryForList(sql.toString(),
							 						 new Object[] {60, 60},
							 						 new int[] {Types.INTEGER,Types.INTEGER},
							 						 String.class);
		for(String name : list) {
			logger.info(name.toString());
		}
	}//select5의 끝
	
	//========== 레코드 2개 이상 =============================================
	
	@Disabled
	@Test
	void select10() {
		sql.append("select name from student where id= 'id1' ");
		String name = jt.queryForObject(sql.toString(), String.class );
		logger.info("이름:"+name);	
	}
	@Disabled
	@Test
	void select11() {
		sql.append("select name,kor,eng,math from student where id= 'id2' ");
		//레코드 하나를 dto에 담기위해 
		StudentDTO student = jt.queryForObject(sql.toString(), new RowMapper<StudentDTO>() {

			@Override										//가상의 결과 테이블
			public StudentDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				StudentDTO student = new StudentDTO();
				
				student.setName(rs.getString("name"));
				student.setKor(rs.getInt("kor"));
				student.setEng(rs.getInt("eng"));
				student.setMath(rs.getInt("math"));
				return student;
			}
		});
		logger.info("student:"+student.toString());	
	}
	@Disabled
	@Test
	void select12() {
		sql.append("select name from student where id=? ");
		String name =jt.queryForObject(sql.toString(), String.class, "id3");
		logger.info("이름:"+name);
	}
	@Disabled
	@Test
	void select13() {
		sql.append("select name from student where kor =? and eng=? and math=?  ");
		String name = jt.queryForObject(sql.toString(), new Object[] {100,100,100}, String.class);
		logger.info("이름:"+name);
		
	}//select13의 끝
	@Disabled
	@Test
	void select14() {
		sql.append("select id,name,kor,eng,math from student where kor =? and eng=? and math=?  ");
		StudentDTO student = jt.queryForObject(sql.toString(), new Object[] {100,100,100}, new RowMapper<StudentDTO>() {

			@Override
			public StudentDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				StudentDTO student = new StudentDTO();
				student.setId(rs.getString("id"));
				student.setName(rs.getString("name"));
				student.setKor(rs.getInt("kor"));
				student.setEng(rs.getInt("eng"));
				student.setMath(rs.getInt("math"));
				return student;
			}
			
		});
		
		logger.info("학생:"+student);
	}//select14의 끝
	@Disabled
	@Test
	void select15() {
		sql.append("select id,name,kor,eng,math from student where kor =? and eng=? and math=?  ");
		StudentDTO student = jt.queryForObject(sql.toString(), new RowMapper<StudentDTO>() {

			@Override
			public StudentDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				StudentDTO student = new StudentDTO();
				student.setId(rs.getString("id"));
				student.setName(rs.getString("name"));
				student.setKor(rs.getInt("kor"));
				student.setEng(rs.getInt("eng"));
				student.setMath(rs.getInt("math"));
				return student;
			}
			
		}, 100,100,100);
		
		logger.info("학생:"+student);
	}
	//requiredType=컬럼이 하나
	//RowMapper == DTO에 담아야 할 것 
	@Disabled
	@Test
	void select16() {
		sql.append("select name from student where kor =? and eng=? and math=?  ");
		String name = jt.queryForObject(sql.toString(), new Object[] {100,100,100},
											new int[] {Types.INTEGER,Types.INTEGER,Types.INTEGER} , String.class);
		logger.info("이름 : "+ name);
	}
	@Disabled
	@Test
	void select17() {
		sql.append("select id,name,kor,eng,math from student where kor =? and eng=? and math=?  ");
		StudentDTO student = jt.queryForObject(sql.toString(),
													new Object[] {100,100,100},
													new int[] {Types.INTEGER,Types.INTEGER,Types.INTEGER},
													new BeanPropertyRowMapper<StudentDTO>(StudentDTO.class));
		
		logger.info("학생:"+student.toString());
	}
	//======================================
	@Disabled
	@Test
	void select20() {
		sql.append("select * from student where id = 'id1'");
		Map<String, Object> map= jt.queryForMap(sql.toString());
		logger.info("id : "+ map.get("id").toString());
		logger.info("name : "+ map.get("name").toString());
		logger.info("kor : "+ map.get("kor").toString());
		logger.info("eng : "+ map.get("eng").toString());
		logger.info("math : "+ map.get("math").toString());
	}
	@Disabled
	@Test
	void select21() {
		sql.append("select * from  student where id = ? ");
		Map<String, Object> map= jt.queryForMap(sql.toString(),"id1");
		logger.info("id : "+ map.get("id").toString());
		logger.info("name : "+ map.get("name").toString());
		logger.info("kor : "+ map.get("kor").toString());
		logger.info("eng : "+ map.get("eng").toString());
		logger.info("math : "+ map.get("math").toString());
	}
	@Disabled
	@Test
	void select22() {
		sql.append("select * from  student where  id = ? ");
		Map<String, Object> map= jt.queryForMap(sql.toString(),new Object[] {"id1"},new int[] {Types.VARCHAR});
		logger.info("id : "+ map.get("id").toString());
		logger.info("name : "+ map.get("name").toString());
		logger.info("kor : "+ map.get("kor").toString());
		logger.info("eng : "+ map.get("eng").toString());
		logger.info("math : "+ map.get("math").toString());
	
	}
	@Test

  void select30() {

      sql.append("select id,name,kor,eng,math from student where kor = ? and eng = ? and math = ? ");

      StudentDTO student = jt.query(new PreparedStatementCreator() {

          @Override
          public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
          PreparedStatement    pstmt = con.prepareStatement(sql.toString());
              pstmt.setInt(1, 100);
              pstmt.setInt(2, 100);
              pstmt.setInt(3, 100);
              return pstmt;
          }
      }, new ResultSetExtractor<StudentDTO>() {

          @Override
          public StudentDTO extractData(ResultSet rs) throws SQLException, DataAccessException {
              StudentDTO student = new StudentDTO();
              if(rs.next()) {
                  student.setId(rs.getString("id"));
                  student.setName(rs.getString("name"));
                  student.setKor(rs.getInt("kor"));
                  student.setEng(rs.getInt("eng"));
                  student.setMath(rs.getInt("math"));

              }
              return student;
          }
      });
      logger.info("학생:" + student.toString());
      }
	
}//main의끝


