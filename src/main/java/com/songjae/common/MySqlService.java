package com.songjae.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

// 모듈화
public class MySqlService {
	
	private Connection connection;	// connect(), disconnect(), select()에서 공용으로 쓰기 위해서
	
	// 데이터 베이스 접속 기능 (접속 성공 true, 실패 false) 
	public boolean connect() {
		try {
			// 1. 드라이버 등록
			// DriverManager는 JDBC드라이버를 관리하는 클래스
			// DriverManager의 registerDriver() 메소드는 새로운 JDBC드라이버를 등록하는 메소드
			// com.mysql.cj.jdbc.Driver() => com.mysql.cj.jdbc 패키지의 Driver클래스의 생성자를 의미
			// new com.mysql.cj.jdbc.Driver() => mySql의 Driver 객체 
			// 즉, DriverManager에 registerDriver()메소드로 사용할 JDBC드라이버 객체를 등록해준다
			// *모든 JDBC드라이버는 java.sql.Driver인터페이스를 구현한 구현체이다*
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());	// 예외처리 필요
			 
			// 2. 접속에 필요한 정보 등록
			// 접속에 필요한 정보 
			// url(접속 주소, 포트, 사용할 데이터베이스), 계정ID, 비밀번호
			// jdbc:mysql(스키마) localhost(도메인) 3360(포트번호) leesongjae(사용할 DB이름)
			String url = "jdbc:mysql://localhost:3306/leesongjae";	// 접속 주소, 포트, 사용할 데이터베이스 
			String username = "root";								// 사용자이름
			String password = "root";								// 비밀전호
			
			// 어떠한 인터페이스를 구현한 클래스 => 구현체
			// (업캐스팅)
			// Connection은 인터페이스이다 
			// Connection객체는 데이터베이스와의 연결을 관리하는 역할을 한다 (연결해제, SQL쿼리를 실행하는 Statement객체를 가져올떄 등 사용)
			// DriverManager클래스의 getConnection()메소드는 위에서 등록한 JDBC드라이버로 DB에 연결 후 connection인터페이스를 구현한 구현체의 객체를 반환한다
			connection = DriverManager.getConnection(url, username, password);
		}catch (SQLException e) {
			e.printStackTrace();
			return false;	// 접속 실패
		}
		return true;	// 접속 성공
	}
	
	// 조회 쿼리 수행 기능
	public ResultSet select(String query) {
		Statement statement;
		try {
			// SQL쿼리를 실행할수있는 Statement 객체를 가져옴
			statement = connection.createStatement();
			// SELECT문을 실행하기위한 Statement객체의 excuteQuery()메소드 사용
			// excuteQuery()메소드는 ResultSet을 반환한다 
			// ResultSet 객체 => 쿼리 실행 후 반환된 테이블 데이터를 행(row) 단위로 관리하는 객체
			// while문과 next()메소드를 통해 이터레이터처럼 행을 순회 한다
			ResultSet resultSet = statement.executeQuery(query);
			return resultSet;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;	// 객체 반환 실패시에는 null을 리턴 
		}
	}
	
	
	// 데이터베이스 접속 끊기 (성공 true 실패 false)
	public boolean disconnect() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	
}
