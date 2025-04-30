package com.songjae.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Web.xml수정대신 어노테이션으로 url패턴 연결
// @WebServlet("url패턴")
@WebServlet("/servlet/ex02")
public class Ex02Controller extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 1 ~ 10까지의 합을 보여주는 (html 문서)를 응답에 담기
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();	
		
		int sum = 0;
		for(int i = 1; i <= 10; i++) {
			sum += i;
		}
		// html문서를 response body에 담음
		out.println(""
				+ "<html>\n"
				+ "		<head><title>합계</title></head>\n"
				+ "		<body>\n"
				+ "			<h2> 합계 : " + sum + "</h2>"
						+ "</body>\n"
				+ "</html>");
		
		
	}
}
