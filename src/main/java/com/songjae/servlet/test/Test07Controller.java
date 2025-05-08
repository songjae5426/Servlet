package com.songjae.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test07")
public class Test07Controller extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String address = request.getParameter("address");
		String card = request.getParameter("card");
		String price = request.getParameter("price");
		
		
		// 조건 비교
		String isDelivery = null;
		String isPayment = null;
		if(!(address.contains("서울시"))) {
			isDelivery = "배달 불가 지역";
		} else {
			isDelivery = address + " 배달 준비중";
		}
		
		if(card.equals("신한카드")) {
			isPayment = "결제 불가 카드 입니다.";
		} else {
			isPayment = "결제금액 : " + price + "원";
		}
		
		
		out.println(""
				+ "<html>\n"
				+ "	<head>\n"
				+ "		<title>주문하기</title>\n"
				+ "	</head>\n"
				+ "	<body>\n");
		out.println(""
				+ "		<b>" + isDelivery + "</b>\n"
				+ "		<hr>\n"
				+ "		<p>" + isPayment + "</p>\n");
		out.println(""
				+ "	</body>\n"
				+ "</html>");
		
	}
}
