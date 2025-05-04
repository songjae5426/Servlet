<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜 시간 출력</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%
		String dateOrTime = request.getParameter("dateOrTime");
		Date date = new Date();		// 현재 날짜와 시간을 가주고있는 Date객체를 생성
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 M월 dd일");	// date포맷 설정하는 SimpeDateFormat()객체 생성
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH시 mm분 ss초");	// date포맷 설정하는 SimpeDateFormat()객체 생성
		
		String result = null;
		
		if(dateOrTime.equals("d")){
			result = "오늘 날짜 " + dateFormat.format(date);	// date를 해당 포맷 형식의 문자열로 반환해줌
		}else if(dateOrTime.equals("t")){
			result = "현재 시간 " + timeFormat.format(date);	// date를 해당 포맷 형식의 문자열로 반환해줌
		}
		
	%>
	<div class="container">
		<h1><%= result %></h1>
	</div>
	
</body>
</html>