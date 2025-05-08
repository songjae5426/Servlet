<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String image = request.getParameter("image");
	%>
	<div class="container d-flex">
		<div class="col-4">
			<img alt="책 표지" src="<%= image %>" class="w-100">
		</div>
		<div>
			<div class="display-2 font-weight-bolder"><%= title %></div>
			<div class="text-info display-3"><%= author %></div>
			<div class="text-secondary display-4"><%= publisher %></div>
		</div>
	</div>
</body>
</html>