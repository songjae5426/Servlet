package com.songjae.database.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.songjae.common.MySqlService;

@WebServlet("/db/test02Insert")
public class Test02InsertController extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String url = request.getParameter("url");
		
		MySqlService mySqlService = MySqlService.getInstance();
		mySqlService.connect();
		
		String query = "INSERT INTO `favorites`\r\n"
				+ "(`name`, `url`)\r\n"
				+ "VALUE \r\n"
				+ "('" + name + "', '" + url + "');";
		
		int count = mySqlService.update(query);
		mySqlService.disconnect();
		
		if(count == -1) {
			out.println("INSERT 오류 발생");
		}else {
			response.sendRedirect("/db/test/test02.jsp");
		}
		
		
		
		
	}
}
