<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.songjae.common.MySqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<table class="table text-center">
			<thead>
				<tr>
					<th>사이트</th>
					<th>사이트 주소</th>
				</tr>
			</thead>
			<tbody>
				<%
					MySqlService mySqlService = MySqlService.getInstance();
					mySqlService.connect();
					
					String query = "SELECT * FROM `favorites` ORDER BY `id` DESC;";
					
					List<Map<String, Object>> list = mySqlService.select(query);
					
					for(Map<String, Object> map : list){
				%>
				
				<tr>
					<td><%= map.get("name") %></td>
					<td><a href="<%= map.get("url") %>"><%= map.get("url") %></a></td>
					<td><a href="/db/test02Delete?id=<%= map.get("id") %>" class="btn btn-success">삭제</a></td>
				</tr>
				<%
					}
					mySqlService.disconnect();
				%>
			</tbody>
		</table>
		<a href="/db/test/test02-input.jsp" class="btn btn-success">추가하기</a>
	</div>
</body>
</html>