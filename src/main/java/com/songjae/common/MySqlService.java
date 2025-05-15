package com.songjae.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// 모듈화
public class MySqlService {
	// 하나의 참조변수에 new연산자로 계속해서 객체를 생성하면 객체는 계속해서 만들어 지지만 참조변수는 마지막에 생성한 객체만 참조하고있는 상태가 된다
	
	private Connection connection;	// connect(), disconnect(), select()에서 공용으로 쓰기 위해서
	
	// 밑에 처럼 객체를 딱 하나만 만들어서 돌려사용 하는걸 singleton pattern이라고 한다 => 디자인 패턴중에 한 종류
	
	// 클래스를 설계한 입장에서
	// 해당 클래스의 객체가 두개이상 만들어지지 않도록 
	// 하나의 객체를 공유해서 사용한다.
	// static 변수 : 객체 생성 없이 사용할 수 있다
	// static은 항상 메모리에 올라와있다 다른 맴버변수들은 객체를 만들어야 메모리가 올라감
	// 즉, 항상 메모리를 차지하기때문에 무분별하게 사용X
	private static MySqlService mysqlService = null;
	
	// 해당 클래스의 객체를 return 하는 메소드 => 이런 메소드를 보통 getInstance라고 한다
	// static 메소드 : 객체 생성없이 사용할 수 있는 메소드
	// 객체 생성없이 수행되는 기능이기 때문에 객체 생성을 통해서 만들어지는 맴버변수는 사용 불가능 => static맴버변수를 사용해야한다
	// 하나의 변수에 객체를 계속생성 하면 객체 갯수 질문
	public static MySqlService getInstance() {
		if(mysqlService == null) {	// 생성된 적이 없는 경우에만 객체 생성
			mysqlService = new MySqlService();
		}
		return mysqlService;
	}
	
	
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
	public List<Map<String, Object>> select(String query) {
		Statement statement;
		try {
			// SQL쿼리를 실행할수있는 Statement 객체를 가져옴
			statement = connection.createStatement();
			// SELECT문을 실행하기위한 Statement객체의 excuteQuery()메소드 사용
			// excuteQuery()메소드는 ResultSet을 반환한다 
			// ResultSet 객체 => 쿼리 실행 후 반환된 테이블 데이터를 행(row) 단위로 관리하는 객체
			// while문과 next()메소드를 통해 이터레이터처럼 행을 순회 한다
			ResultSet resultSet = statement.executeQuery(query);
			
			// 조회 결과의 컬럼 목록
			ResultSetMetaData rsmd =resultSet.getMetaData();	// 조회한 정보를  ResultSetMetaData탕비으로 반환
			int columnCount = rsmd.getColumnCount();
			
			List<String> columnList = new ArrayList<>();
			for(int i = 1; i <= columnCount; i++) {	// 1부터 시작함
				columnList.add(rsmd.getColumnName(i));
			}
			// ---------------------------------
			// ResultSet이 아니라 자바를 기반으로한 데이터구조로 리턴하기 위해 밑에와 같은 일을함
			List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
			while(resultSet.next()) {	// 한 행 마다
				
				// 한 행 마다 칼럼의 이름을 키, 해당 칼럼의 값을 value로 map에 저장함
				Map<String, Object> row = new HashMap<String, Object>();	// while문이기 때문에 계속해서 Map객체를 생성함 => 하나의 행씩
				// 하나의 행에서 컬럼 이름으로 모든 값 얻어 오기
				for(String column : columnList) {
					Object value = resultSet.getObject(column);	// 업캐스팅 된 상태로 반환타입 상관없이 값을 가져오기 위해
					row.put(column, value);
				}
				
//				String name = resultSet.getString("name");
//				String email = resultSet.getString("email");
//				String introduce = resultSet.getString("introduce");
//				// 하나의 행의 각 칼럼을 하나의 Map에 담음
//				Map<String, Object> row = new HashMap<>();
//				row.put("name", name);
//				row.put("email", email);
//				row.put("introduce", introduce);
				
				resultList.add(row);
			}
			
			statement.close(); // => resultSet이 수행되는 동안에는 열려있어야한다 이렇게 하면 오류 => next()는 DB에게 계속 다음행을 요구하고 가져오는 일을 하기때문에 연결이 끊기면 안됨
			return resultList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;	// 객체 반환 실패시에는 null을 리턴 
		}
	}
	
	// INSERT, UPDATE, DELETE 기능 메소드
	public int update(String query) {
		Statement statement;
		try {
			statement = connection.createStatement();
			int count = statement.executeUpdate(query);	// count는 실행된 행의 갯수
			statement.close();
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;	// 음수는 절떄 나올수 없으므로 예외 발생시 음수 반환
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
