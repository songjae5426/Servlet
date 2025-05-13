<%@page import="java.sql.ResultSet"%>
<%@page import="com.songjae.common.MySqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 리스트</title>
</head>
<body>
	<%
		MySqlService mySqlService = new MySqlService();
	
		mySqlService.connect();	// DB 접속
		ResultSet resultSet = mySqlService.select("SELECT * FROM `new_user`");
		
		
		
		
	%>

	<table border="1">
		<thead>
			<tr>
				<th>이름</th>
				<th>이메일</th>
				<th>자기소개</th>
			</tr>
		</thead>
		<tbody>
			<%
				while(resultSet.next()){
			%>
			<tr>
				<td><%= resultSet.getString("name") %></td>
				<td><%= resultSet.getString("email") %></td>
				<td><%= resultSet.getString("introduce") %></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>