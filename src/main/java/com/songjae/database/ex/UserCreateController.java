package com.songjae.database.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.songjae.common.MySqlService;

@WebServlet("/db/user/create")
public class UserCreateController extends HttpServlet{
	// 요청에서 전달된 값이 저장
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
//		PrintWriter out = response.getWriter();
		
		// 입력할 정보를 요청으로 부터 전달 받는다
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String introduce = request.getParameter("introduce");	// 길어지기 떄문에 post로
		
		MySqlService mySqlService = MySqlService.getInstance();
		mySqlService.connect();
		String query = "INSERT INTO `new_user`\r\n"
				+ "(`name`, `yyyymmdd`, `email`, `introduce`)\r\n"
				+ "VALUE\r\n"
				+ "('" + name + "', '" + birthday + "', '" + email + "', '" + introduce + "');";
		
		int count = mySqlService.update(query);
		
		// 응답 => 클라이언트야 내가 너한테 줄 정보는 없고, list.jsp에 다시 요청하면 조회 결과 볼 수 있을거야
		// 그러니까 list.jsp로 새롭게 요첳해
		
		// redirect : response에 새롭게 요청할 url path를 전달 => 즉, 클라이언트가 해당 주소로 다시 요청을 보냄
//		out.println("실행 결과 : " + count);
		response.sendRedirect("/db/user/list.jsp");
		
		
	}
}
