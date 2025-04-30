package com.songjae.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex04")
public class Ex04Controller extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 이름과 생년월일을 전달 받고,
		// 이름과 나이를 html로 구성
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
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
