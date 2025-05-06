<%@page import="javax.swing.text.DefaultTextUI"%>
<%@page import="javax.print.attribute.HashPrintRequestAttributeSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사칙연산 POST</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%!
		// 계산 메소드
		public double arithmometer(int number1, int number2, String operator){
			switch(operator){
				case "+" : 
					return number1 + number2;
				case "-" : 
					return number1 - number2;
				case "*" : 
					return number1 * number2;
				case "/" : 
					return number1 / number2;
				default :
					return 0;
			}
		
		}
	%>
	
	<%
		int number1 = Integer.parseInt(request.getParameter("number1"));
		String operator = request.getParameter("operator");
		int number2 = Integer.parseInt(request.getParameter("number2"));
	%>
	
	<div class="container">
		<h3>계산 결과</h3>
		<div class="h1"><%= number1 %> <%= operator %> <%= number2 %> = <span class="text-primary"><%= arithmometer(number1, number2, operator) %></span></div>
	</div>
</body>
</html>