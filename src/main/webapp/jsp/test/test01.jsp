<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 스크립트 요소</title>
</head>
<body>
	<!-- 1. 점수들의 평균 구하기
	스크립틀릿(scriptlet) <% %> 문법을 사용해서 주어진 점수들의 평균을 구하세요. -->
	<%
		int[] scores = {80, 90, 100, 95, 80};
		int sum = 0;
		for(int i = 0; i < 5; i++){
			sum += i;
		}
		double avg = (double)(sum / scores.length);
	%>
	
	<!-- 2. 채점 결과
	아래 채점표로 시험점수가 몇점인지 구하세요. -->
	<%
		List<String> scoreList = Array.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
	%>
</body>
</html>