package com.songjae.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test10")
public class Test10Controller extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// Filter를 적용했기 때문에 인코딩 설정 생략
		// Filter는 서블릿을 실행하기 전에 먼저 실행 되고 서블릿이 실행됨
//		request.setCharacterEncoding("utf-8"); 		// html에서 utf-8로 요청했으므로 request를 utf-8로 인코딩 하여 사용하겠다
//		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		
		out.println(""
				+ "<html>\n"
				+ "	<head>\n"
				+ "		<title>사용자 정보 확인</title>\n"
				+ "	<body>\n");
		
		out.println(""
				+ "<h2>" + loginResult(id, password) + "</h2>\n");
		
		out.println(""
				+ "	</body>\n"
				+ "</html>");
		
	}
	
	public String loginResult(String id, String password) {
		// 조건문은 큰것 부터 쪼개 나가야 한다
		if(!(userMap.get("password").equals(password) && userMap.get("id").equals(id))) {
			return "id와 password 모두 일치 하지 않습니다.";
		}else if(!(userMap.get("id").equals(id))) {
			return "id가 일치하지 않습니다.";
		}else if(!(userMap.get("password").equals(password))) {
			return "password가 일치하지 않습니다.";
		}else {
			return userMap.get("name") + "님 환영 합니다.";
		}
	}
	
	private final Map<String, String> userMap =  new HashMap<String, String>() {
	    {
	        put("id", "hagulu");
	        put("password", "asdf");
	        put("name", "김인규");
	    }
	};

}
