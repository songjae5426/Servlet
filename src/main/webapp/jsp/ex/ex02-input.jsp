<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>정보 입력</h2>
	
	<form method="get" action="/jsp/ex/ex02.jsp">
		<label>이름 : </label> <input type="text" name="name">
		<label>생년월일 : </label> <input type="text" name="birthday">
		<button type="submit">입력</button>
	</form>
</body>
</html>