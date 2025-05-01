package com.songjae.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex05")
public class Ex05Controller extends HttpServlet{
	
	// doGet()메소드는 get으로 오는 요청에 실행된다
	// get으로 오는 요청 => url에 파라미터(쿼리문자열)이 담겨서 값이 넘어 오는 방식
//	@Override
//	public void doGet(HttpServletRequest request, HttpServletResponse response) {
//	}
	
	
	// post로 오는 요청에 실행되는 메소드
	// 파라미터가 보안에 민감한 데이터가 포함되어 있는지
	// 긴데이터가 포함되어 있는지
	// 파일과 같은 데이터 형태의 파라미터는 전달 할수 없다
	// post 방식일때는 form태그 필수
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 이름과 생년월일을 전달 받고,
		// 이름과 나이를 html로 구성
		
		// Filter를 적용했기 때문에 인코딩 설정 생략
		// Filter는 서블릿을 실행하기 전에 먼저 실행 되고 서블릿이 실행됨
//		request.setCharacterEncoding("utf-8"); 		// html에서 utf-8로 요청했으므로 request를 utf-8로 인코딩 하여 사용하겠다
//		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		// 파라미터 받아오기 (form태그 안에 input태그의 name속성 값이 파라미터 이름)
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		
		// 나이 계산
		int yearInt = Integer.parseInt(birthday.substring(0, 4));
		int age = 2025 - yearInt + 1;
		
		// body태그사이만 나두고 미리 구조를 만들고 진행하기
		out.println(""
				+ "<html>\n"
				+ "	<head>\n"
				+ "		<title>정보</title>\n"
				+ "	<body>\n");
		out.println(""
				+ "		<h3>이름 : " + name + "</h3>\n"
				+ "		<h3>나이 : " + age + "</h3>\n");
		out.println(""
				+ "	</body>\n"
				+ "</html>");
		
		
		
	
	
	}
}
