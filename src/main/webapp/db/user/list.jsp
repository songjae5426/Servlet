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
<title>사용자 리스트</title>
</head>
<body>
	<%
		MySqlService mySqlService = MySqlService.getInstance();
	
		mySqlService.connect();	// DB 접속
		List<Map<String, Object>> userList = mySqlService.select("SELECT * FROM `new_user`");
		
		mySqlService.disconnect();	// db연결 끊기
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
				for(Map<String, Object> user : userList){
			%>
			<tr>
				<td><%= user.get("name") %></td>
				<td><%= user.get("email") %></td>
				<td><%= user.get("introduce") %></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>