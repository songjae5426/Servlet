package com.songjae.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test04")
public class Test04Controller extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		// listStr을 null로 초기화 하게되면 
		// for문에서 +연산자에 의해 null이 문자열로 변환되어 이어붙기때문에 빈 문자열을 사용
		String listStr = "";	
		for(int i = 0; i < 30; i++) {
			listStr += "				<li>" + (i + 1) + "번째 리스트</li>\n";
		}
		
		
		PrintWriter out = response.getWriter(); 	// PrintWriter의 객체를 response의getWriter()메소드로 얻어온다
		// PrintWriter의 println()의 메소드를 이용해 text를 response Body에 담는다
		// 방법 1
		out.println(""
				+ "<html>\n"
				+ "		<head>\n"
				+ "			<title>리스트 출력</title>\n"
				+ "		</head>\n"
				+ "		<body>\n"
				+ "			<ul>\n" 
				+				listStr
				+ "			</ul>\n"
				+ "		</body>\n"
				+ "</html>");
		
		// 방법 2 끊어서 생각하기 println은 자동 줄바꿈ㄴ
//		out.println(""
//				+ "<html>\n"
//				+ "		<head>\n"
//				+ "			<title>리스트 출력</title>\n"
//				+ "		</head>\n"
//				+ "		<body>\n"
//				+ "			<ul>\n"); 
//		for(int i = 0; i < 30; i++) {
//			out.println("				<li>" + (i + 1) + "번째 리스트</li>\n");
//		}
//		out.println("		</ul>\n"
//				+ "		</body>\n"
//				+ "</html>");	
		
	}
	
}
