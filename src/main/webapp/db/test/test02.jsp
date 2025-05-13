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
					MySqlService mySqlService = new MySqlService();
					mySqlService.connect();
					
					String query = "SELECT `name`, `url` FROM `favorites` ORDER BY `id` DESC;";
					
					ResultSet resultSet = mySqlService.select(query);
					
					while(resultSet.next()) {
				%>
				<tr>
					<td><%= resultSet.getString("name") %></td>
					<td><a href="<%= resultSet.getString("url") %>"><%= resultSet.getString("url") %></a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>