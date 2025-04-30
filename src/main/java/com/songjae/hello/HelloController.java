package com.songjae.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// HTTP 요청을 처리 하기 위해서는 HttpServlet클래스를 상속 받아야 한다
// Response : 응답, Request : 요청
public class HelloController extends HttpServlet{
	
	// doGet()메소드는 클라이언트가 GET요청을 보냈을 때 호출된다
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// response의 getWriter()메소드는 클라이언트에게 응답을 보낼 수 있는 출력스트림을 PrintWriter타입으로 반환한다
		// response의 getWriter()메소드는 예외가 발생 할 수있기 때문에 예외처리를 해줘야한다
		PrintWriter out = response.getWriter();	
		out.println("Hello World!");	// 가져온 출력스트림의 println()메소드를 이용하여 입력한 문자열을 응답을 보내 클라이언트에서 출력한다
	}
}
