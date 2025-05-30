<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 기본 문법</title>
</head>
<body>
	<h3>기본 문법</h3>
	<!-- html 주석 -->
	<%-- jsp 주석 --%>
	
	<%-- 1부터 10까지의 합을 h3태그로 표시 --%>
	<%
		int sum = 0;
		for(int i = 1; i <= 10; i++){
			sum += i;
		}
		
		// out.println("<h3>합계 : " + sum + "</h3>");
	%>
	
	<h3>합계 : <%= sum %></h3>
	<input type="text" value="<%= sum %>">
	
	<%-- <div <%= sum %> </div> --%>
	
	<div><%= sum * 2 %></div>
	
	<h3>리스트 다루기</h3>
	<%
		// 동물이름 리스트
		List<String> animalList = new ArrayList<>();
		
		animalList.add("고양이");
		animalList.add("강아지");
	%>
	
	<ul>
		<li><%= animalList.get(0) %></li>
		<li><%= animalList.get(1) %></li>
	</ul>
	
	<h3>메소드 만들기</h3>
	<%!
		// Hello World를 문자열로 리턴하는 메소드
		public String getHelloWorld(){
				return "Hello World";
		}
	%>
	
	<%
		String message = getHelloWorld();
	%>
	
	<h3><%= message %></h3>
	<h3><%= getHelloWorld() %></h3>
	
</body>
</html>