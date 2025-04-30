package com.songjae.servlet.ex;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex05Controller extends HttpServlet{
	
	// doGet()메소드는 get으로 오는 요청에 실행된다
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		// 이름과 생년월일을 전달 받고,
		// 이름과 나이를 html로 구성
		
	}
	// post로 오는 요청에 실행되는 메소드
	// 파라미터가 보안에 민감한 데이터가 포함되어 있는지
	// 긴데이터가 포함되어 있는지
	// 파일과 같은 데이터 형태의 파라미터는 전달 할수 없다
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		
	}
}
