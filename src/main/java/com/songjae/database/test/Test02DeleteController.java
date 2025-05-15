package com.songjae.database.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.songjae.common.MySqlService;

@WebServlet("/db/test02Delete")
public class Test02DeleteController extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		
		MySqlService mySqlService = MySqlService.getInstance();
		mySqlService.connect();
		
		String id = request.getParameter("id");
		
		String query = "DELETE FROM `favorites` WHERE `id` = " + id + ";";
		
		int count = mySqlService.update(query);
		mySqlService.disconnect();
		if(count == -1) {
			out.println("delete 오류발생");
		}else {
			response.sendRedirect("/db/test/test02.jsp");
		}
		
	}
}
