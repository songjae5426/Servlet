package com.songjae.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test03")
public class Test03Controller extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");		// response body를 utf-8로 인코딩
		response.setContentType("text/html");		// response body의 타입을 html로 지정
		
		PrintWriter out = response.getWriter();		// PrintWriter의 객체를 response의 getWriter()메소드를 통해 얻어옴
		Date date = new Date();						// 현재 날짜와 시간을 갖는 Date객체를 생성
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");	// Date의 포맷 지정
		String dateFormat = simpleDateFormat.format(date);	// SimpleDateFormat클래스의 format()메소드는 해당 포맷으로 바꾼 date를 문자열로 반환해줌
		// PrintWriter의 println()메소드를 통해 response body에 데이터를 담아줌
		out.println(""
				+ "<html>"
				+ "		<head>"
				+ "			<title>뉴스 기사 출력</title>"
				+ "		</head>"
				+ "		<body>"
				+ "			<h2>[단독] 고양이가 야옹해</h2>"
				+ "			<p>기사 입력시간 : " + dateFormat + "</p>"
				+ "			<hr>"
				+ "			<div><b>끝</b></div>"
				+ "		</body>"
				+ "</html>");
	}
}
