package com.songjae.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test06")
public class Test06Controller extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");			// response body의 텍스트를 utf-8로 인코딩
		response.setContentType("application/json");	// response body에 json타입을 담을거다
		
		PrintWriter out = response.getWriter();			// PrintWriter객체 얻어오기
		
		// 파라미터의 이름과, 값의 형식은 기능을 만드는쪽 => 서블릿에서 정한다
		String numberStr1 = request.getParameter("number1");	// request(요청)으로 넘어온 파라미터 가져오기 String으로 반환한다
		String numberStr2 = request.getParameter("number2");
		int numberInt1 = Integer.parseInt(numberStr1);
		int numberInt2 = Integer.parseInt(numberStr2);
		int addtion = numberInt1 + numberInt2;
		int subtraction = numberInt1 - numberInt2;
		int multiplication = numberInt1 * numberInt2;
		int division = numberInt1 / numberInt2;
		
		// 서블릿에서 화면 없이 데이터만 응답 할떄 JSON형식 이용
		// JSON (JavaScript Object Notation) => 자바스크립트를 사용하는게 아니라 자바스크립트의 데이터를 표현하는 규격을 문자열로 표현한것
		// JSON은 자바스크립트 객체 표기법을 기반으로 한 문자열 형식이에요. 즉, 자바스크립트의 객체 형식을 차용해서 데이터를 표현하지만, 실제로는 텍스트 데이터일 뿐이에요.
		// Ex)
		// {"name" : "김인규", "age" : 31}	// 객체
		// ["김인규", "유재석", "지예은"]		// 배열
		// 자바스크립트의 객체안에는 배열이 들어갈수 있다
		// 데이터를 JSON규격으로 만들기
		// {"addtion" : 135, "subtraction" : 123, "multiplication" : 456, "division" : 789} 
		out.println("{\"addition\": " + addtion + ", "
		           + "\"subtraction\": " + subtraction + ", "
		           + "\"multiplication\": " + multiplication + ", "
		           + "\"division\": " + division + "}");
	}
}
