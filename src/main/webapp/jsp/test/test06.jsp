<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장보기 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%
		List<String> goodsList = Arrays.asList(new String[]{ 
		    "저지방 우유", "요플레 4개", "딸기 1팩", "삼겹살 300g", "생수 6개", "주방 세제"
		});

	%>
	<div>
		<header class="d-flex justify-content-center">
			<h1>장 목록</h1>
		</header>
		<section>
			<article>
				<div class="border-top border-bottom d-flex py-3">
					<div class="col-3 text-center font-weight-bolder">번호</div>
					<div class="col-9 text-center font-weight-bolder">품목</div>
				</div>
				<% for(int i = 0; i < goodsList.size(); i++){ %>
				<div class="border-top d-flex py-3">
					<div class="col-3 text-center"><%= i + 1 %></div>
					<div class="col-9 text-center"><%= goodsList.get(i) %></div>
				</div>
				<% } %>
			</article>
		</section>
		
	</div>
	
	
</body>
</html>