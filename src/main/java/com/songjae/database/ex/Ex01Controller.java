package com.songjae.database.ex;



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

@WebServlet("/db/ex01")
public class Ex01Controller extends HttpServlet{

	@Override

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// used_goods 테이블의 모든 행을 조회해서 일부 데이터를 response에 담는다.
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();


		// jdbc 라이브러리 활용 시작
		try {
			// database 접속 (예외처리 필요)
			// 드라이버 등록
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

			// 접속에 필요한 정보
			// 접속 주소, 포트, 사용할 데이터베이스, 사용자이름, 비밀번호

			// jdbc:mysql: => 는 규격(스키마), localhost => 도메인, 3306=> 포트번호 leesongjae=>DB이름
			String url = "jdbc:mysql://localhost:3306/leesongjae";	// 접속 주소, 포트, 사용할 데이터베이스 
			String username = "root";								// 사용자이름
			String password = "root";								// 비밀번호

			
			Connection connection = DriverManager.getConnection(url, username, password);	// 데이터베이스 연결하면서 Connectio객체를 반환
			
			
			
			
			
			String query = "SELECT * FROM `used_goods`";

			
			// 쿼리 수행
			// Statement => sql패키지로, ResultSet  => sql패키지로
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);	


			// resultSet.next(); 이터레이터랑 비슷
			while(resultSet.next()) {	// 이터레이터 처럼 첫번째 전의 행에서 부터 next()가 홏출될때 마다 다음 행을 가리킨다 다음행이 없을경우 false를 반환
				String title = resultSet.getString("title");	//해당 칼럼의 타입에 맞는 get메소드로 가져오기 ()안에는 칼럼명
				int price = resultSet.getInt("price");
				String description = resultSet.getString("description");

				// 제목 : ~ 가격 : ~ 설명 : ~
				out.println("제목 : " + title + " 가격 : " + price + " 설명 : " + description);
			}

			

			statement.close();	// statement 닫기
			
			// insert
			// insert 쿼리는 요청이 될떄 마다 응답을 보내기 때문에 계속 삽입 될 수 있다
			query = "INSERT `used_goods`\r\n"
					+ "(`sellerId`, `title`, `price`, `description`)\r\n"
					+ "value\r\n"
					+ "(3, '고양이 간식 팝니다', 5000, '저희 고양이가 입맛이 까다로워서 안먹어요!');";
			statement = connection.createStatement();
			
			// INsert update delet 할떄 사용하는 메소드 executeUpdate()
			// 리턴 값 => 실행된 행의 개수(int)
			int count = statement.executeUpdate(query);
			
			out.println("실행 결과 : " + count);
			
			statement.close();	// statement 닫기
			connection.close();	// db연결 종료

			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}