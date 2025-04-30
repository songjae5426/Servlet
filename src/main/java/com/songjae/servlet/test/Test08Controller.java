package com.songjae.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test08")
public class Test08Controller extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse responses) throws IOException {
		responses.setCharacterEncoding("utf-8");	// response body를 utf-8로 인코딩
		responses.setContentType("text/html");		// response body에 담길 내용을 html타입으로 지정
		PrintWriter out = responses.getWriter();
		
		List<String> list = new ArrayList<>(Arrays.asList(
		        "강남역 최고 맛집 소개 합니다.", 
		        "오늘 기분 좋은 일이 있었네요.", 
		        "역시 맛집 데이트가 제일 좋네요.", 
		        "집에 가는 길에 동네 맛집 가서 안주 사갑니다.",
		        "자축 저 오늘 생일 이에요."));
		
		String search = request.getParameter("search");	// 파라미터에서 검색 가져오기
	
		out.println(""
				+ "<html>\n"
				+ "	<head>\n"
				+ "		<title>검색하기</title>\n"
				+ "	</head>\n"
				+ "	<body>\n");
		for(String listStr : list) {
			if(listStr.contains(search)) {
				String temp = listStr.replace(search, "<b>" + search + "</b>");
				out.println(""
						+ "		<div>" + temp + "</div>\n"
						+ "		<hr>\n");
			} 
		}
		out.println(""
				+ "	</body>\n"
				+ "	</html>");
		
	}
}
