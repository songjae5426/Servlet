package com.songjae.database.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/db/test01")
public class Test01Controller extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest reqeust, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		
		// jdbc 라이브러리 활용 시작
		try {
			// ------------------------- DB 접속 ---------------------
			
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
			// url(접속 주소, 포트, 사용할 데이터베이스 이름), 계정ID, 비밀번호
			// jdbc:mysql(스키마) localhost(도메인) 3360(포트번호) leesongjae(사용할 DB이름)
			String url = "jdbc:mysql://localhost:3306/leesongjae";	// 접속 주소, 포트, 사용할 데이터베이스 
			String username = "root";								// 사용자이름
			String password = "root";								// 비밀전호
			
			// 어떠한 인터페이스를 구현한 클래스 => 구현체
			
			// (업캐스팅)
			// Connection은 인터페이스이다 
			// Connection객체는 데이터베이스와의 연결을 관리하는 역할을 한다
			// DriverManager클래스의 getConnection()메소드는 위에서 등록한 JDBC드라이버로 DB에 연결 후 connection인터페이스를 구현한 구현체의 객체를 반환한다
			Connection connection = DriverManager.getConnection(url, username, password);	
			
			// Statement는 인터페이스이다 (sql패키지의 Statement인터페이스)
			// Statement객체는 SQL쿼리를 데이터베이스에 실행할 때 사용하는 객체이다 => 이 객체를 통해 SELECT,INSERT,UPDATE, DELETE등의 SQL 명령을 실행한다
			// Connection객체의 createStatement()메소드는 Statement인터페이스를 구현한 구현체의 객체를 반환한다
			Statement statement = connection.createStatement();	 
			
			// --------------------------------------------
			
			// ---------- INSERT 쿼리 실행 ------------------
			String query = "INSERT INTO `real_estate`\r\n"
					+ "(`realtorId`, `address`, `area`, `type`, `price`, `rentPrice`)\r\n"
					+ "value\r\n"
					+ "(3, '헤라펠리스 101동 5305호', 350, '매매', 1500000, null);";
			
			// statement의 excuteUpdate(쿼리)메소드는 SQL의 변경작업(INSERT, UPDATE, DELETE 등)을 실행할때 사용하는 메소드 
			// 실행결과로 영향을 받은 행의 개수를 int로 반환해 준다
			int count = statement.executeUpdate(query);
			out.println("실행 결과 : " + count);
			
			// -----------------------------------------------
			
			
			
			
			// ------------ SELECT 쿼리 실행
			query = "SELECT * FROM `real_estate`";
			
			// statement의 executeQuery(쿼리)메소드는 SELECT문을 실행 할때 사용하는 메소드로 ResultSet객체를 반환해준다
			// ResultSet 객체 => 쿼리 실행 후 반환된 테이블 데이터를 행(row) 단위로 관리하는 객체
			// ResultSet객체의 next()메소드를 이용하여 이터레이터처럼 각행을 이동하며 해당 행의 칼럼들을 가져올수있다 => 다음행이 없으면 false반환
			ResultSet resultSet = statement.executeQuery(query);	
			
			while(resultSet.next()) {	// 맨처음 행의 전을 가리키고있다가 ResultSet객체의 next()메소드가 실행 될때마다 다음행을 가리킴
				// 각 칼럼의 타입에 맞는 get()메소드로 가지고 와야한다 
				// ex) 칼럼의 타입이 int명 getInt() => int로 반환, 문자열이면 getString() => String으로 반환 
				// get() 메소드의 매개변수에는 칼럼명을 문자열로 넣어준다
				String address = resultSet.getString("address");
				int area = resultSet.getInt("area");
				String type = resultSet.getString("type");
				
				out.println("매물 주소 : " + address + " 면적 : " + area + " 타입 : " + type);
			}
			
			// ----------------------------------------
			
			// -------------- 닫기 ---------------
			statement.close();	// statement 닫기
			connection.close(); // db연결 종료
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
