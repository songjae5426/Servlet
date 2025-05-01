package com.songjae.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test09")
public class Test09Controller extends HttpServlet{
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// Filter를 적용했기 때문에 인코딩 설정 생략
		// Filter는 서블릿을 실행하기 전에 먼저 실행 되고 서블릿이 실행됨
//		request.setCharacterEncoding("utf-8"); 		// html에서 utf-8로 요청했으므로 request를 utf-8로 인코딩 하여 사용하겠다
//		response.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String introduction = request.getParameter("introduction");
		
		out.println(""
				+ "<html>\n"
				+ "	<head>\n"
				+ "		<title>입사 지원</title>\n"
				+ "	<body>\n");
		out.println(""
				+ "		<h2>" + name + "님 지원이 완료 되었습니다</h2>\n"
				+ "		<hr>\n"
				+ "		<div><b>지원 내용</b></div>\n"
				+ "		<div><b>" + introduction + "</b></div>\n");
		out.println(""
				+ "	</body>\n"
				+ "</html>");
				
		
		
	}
}
