package com.songjae.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex03")
public class Ex03Controller extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 이름과 생년월일을 전달 받고,
		// 이름과 나이를 html로 구성
		
		// 이름과 나이 정보만 전달(화면X 데이터만 전달)
		
		response.setCharacterEncoding("utf-8");
//		response.setContentType("text/html");
		response.setContentType("application/json");		// 데이터만 전달할때 json
		
		PrintWriter out = response.getWriter();
		
		// 이름과 생년월일을 전달 받는다.
		// * 기능을 만드는 쪽에서 사용법을 정한다 *
		// 기능을 만드는 쪽에서 파라미터 이름 값의 형식을 정한다
		// request에서 name이란 파라미터로 값을 꺼내 쓸꺼니 채워라
		// request에서 birthday이란 파라미터로 20041211 형식으로 채워라
		// request의 getParameter()메소드는 해당 파라미터의 값을 String으로 반환해준다
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		
		String yearString = birthday.substring(0,4);
		int year = Integer.parseInt(yearString);
		
		int age = 2025 - year + 1;		// 한국 나이 계산
		
		// 김인규, 31
		// 데이터를 전달하기 위한 (문자열) 규격 : JSON (JavaScript Object Notation) => 자바스크립트를 사용하는게 아니라 자바스크립트의 데이터를 표현하는 규격을 사용한다는것
		// {"name" : "김인규", "age" : 31}	// 객체
		// ["김인규", "유재석", "지예은"]		// 배열
		// 위에와 같은 규격을 만들어 응답에 담는다
		// 쌍따움표가 문자로써 출력(활용)되려면 \ 를 앞에 붙인다
		out.println("{\"name\": \"" + name + "\", \"age\": " + age + "}");
		
		
//		out.println(""
//				+ "<html>\n"
//				+ "	<head>\n"
//				+ "		<title>정보</title>\n"
//				+ "	<body>\n"
//				+ "		<h3>이름 : " + name + "</h3>\n"
//				+ "		<h3>나이 : " + age + "</h3>\n"
//				+ "	</body>\n"
//				+ "</html>");
	}
}
