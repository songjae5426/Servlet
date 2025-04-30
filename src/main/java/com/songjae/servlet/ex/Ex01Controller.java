package com.songjae.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex01Controller extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 결과물에 대한 정보를 설정 => Response Header (응답에 대한 헤더)
		// Character set : utf-8 => utf-8형식으로 응답을 만들었다는 정보
		response.setCharacterEncoding("utf-8");
		// 데이터의 타입 (Content type)
		// MIME : 데이터의 타입을 구분하기 위한 정해진 문자열 
		// contentType이 브라우저가 처리하지 못하는 타입일 경우 브라우저는 다운로드 시켜버린다
		// text/plain => 일반적이 문자열
		response.setContentType("text/plain");
		
		// 결과물 => Response Body
		PrintWriter out =  response.getWriter();	// Response Body에 문자열을 담는 메소드
		out.println("Servler Response!!");			// response body에 servlet Response!! 문자열을 담음
		
		
		// 현재 날짜 시간을 보여주는 페이지
		Date now = new Date();	// java.util.Date => Date객체는 현재 날짜와 시간을 담고있다
		out.println(now);
		
		// Date 객테의 날짜 시간 정보를 원하는 규격의 날짜 시간 문자열로 만들기
		// 2025년 4워 25일 16시:54:11
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 M월 d일 HH:mm:ss");	// 대문자 M은 월, 소문자 m은 분, H는 24시표현
		String dateTimeString = formatter.format(now);	// => 변환하고싶은 Date객체를 넣어준다 => 변환한 Date를문자열로 반환해줌
		
		out.println(dateTimeString);
	
	}
}
