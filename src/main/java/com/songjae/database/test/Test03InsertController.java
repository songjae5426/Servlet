package com.songjae.database.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.songjae.common.MySqlService;

@WebServlet("/db/test03Insert")
public class Test03InsertController extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		
		String sellerId = request.getParameter("sellerId");
		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String description = request.getParameter("description");
		String image = null;
		
		// 빈문자열이 넘어온다
		if(request.getParameter("image") == null || request.getParameter("image").equals("")) {
			image = "null";
		}else {
			image = "'" + request.getParameter("image") + "'";
		}
		
		
		MySqlService mySqlService = MySqlService.getInstance();
		
		String qeury = "INSERT INTO `used_goods`\r\n"
				+ "(`sellerId`, `title`, `price`, `description`, `image`)\r\n"
				+ "VALUE \r\n"
				+ "(" + sellerId + " ,'" + title + "', " + price + ", '" + description + "'," + image + ");";
		int count = mySqlService.update(qeury);
		mySqlService.disconnect();
		
		if(count != -1) {
			response.sendRedirect("/db/test/test03.jsp");
		}else {
			out.println("INSERT실패!");
		}
			
		
	}
}
