<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료 구조 다루기</title>
</head>
<body>
	<%
		// 과일 이름 리스트
		List<String> fruitList = new ArrayList<>();
		fruitList.add("사과");
		fruitList.add("바나나");
		fruitList.add("딸기");
		
	
	%>
	
	
	<table border="1">
		<% for(String fruit : fruitList){ %>
		<tr>
			<td><%= fruit %></td>
		</tr>
		<% } %>
	</table>
	
	<%
		// 여러 학생의 국어, 수학, 영어
		// 학생1 : 국어 : 90, 수학 : 95, 영어 : 80
		// 학생2 : 국어 : 100, 수학 : 90, 영어 : 70
		
		// Map
		// {"국어":90, "수학":95, "영어":80}
		// {"국어":100, "수학":90, "영어":70}
		
		// List안에 Map
		// [{"국어":80, "수학":95, "영어":80}, {"국어":100, "수학":90, "영어":70}]
	
		Map<String, Integer> scoreMap1 = new HashMap<>();
		scoreMap1.put("국어", 90);
		scoreMap1.put("수학", 95);
		scoreMap1.put("영어", 80);
		
		Map<String, Integer> scoreMap2 = new HashMap<>();
		scoreMap2.put("국어", 100);
		scoreMap2.put("수학", 90);
		scoreMap2.put("영어", 70);
		
		List<Map<String, Integer>> scoreList = new ArrayList<>();
		scoreList.add(scoreMap1);
		scoreList.add(scoreMap2);
		
				
	%>
	<table border="1">
		<thead>
			<tr>
				<th>국어</th>
				<th>수학</th>
				<th>영어</th>
			</tr>
		</thead>
		<tbody>
			<%
				//for(Map<String, Integer> score : scoreList){
			%>
			<%
				for(int i = 0; i < scoreList.size(); i++){
			%>
			<tr>
				<td><%= scoreList.get(i).get("국어") %></td>
				<td><%= scoreList.get(i).get("수학") %></td>
				<td><%= scoreList.get(i).get("영어") %></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

</body>
</html>