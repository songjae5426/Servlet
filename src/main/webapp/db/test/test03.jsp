<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.songjae.common.MySqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍당무 마켓</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/db/test/test03Style.css">
</head>
<body>
	<div class="container">
		<header class="bg-danger">
			<div class="h1 text-center text-white">HONG당무 마켓</div>
			<nav class="py-2">
				<ul class="nav nav-fill">
					<li class="nav-item"><a href="#" class="nav-link text-white">리스트</a></li>
					<li class="nav-item"><a href="#" class="nav-link text-white">물건 올리기</a></li>
					<li class="nav-item"><a href="#" class="nav-link text-white">마이 페이지</a></li>
				</ul>
			</nav>
		</header>
		<section class="pt-4">
			<article>
				<div class="d-flex flex-wrap">
				<%
					MySqlService mySqlService = MySqlService.getInstance();
					mySqlService.connect();
					
					String qery = "SELECT seller.nickname, used_goods.title, used_goods.price, used_goods.image \r\n"
							+ "FROM `seller` \r\n"
							+ "JOIN `used_goods` \r\n"
							+ "ON seller.id = used_goods.sellerId\r\n"
							+ "ORDER BY used_goods.sellerId DESC;";
					List<Map<String, Object>> sellerGoodJoinMap = mySqlService.select(qery);
					
					
					for(Map<String, Object> sellerGoodJoinRow : sellerGoodJoinMap){
				%>
					<div class="col-4 p-0 p-2 mb-2">
						<div class="w-100 h-100 border border-danger p-2 hover">
							<div class="col-12 p-0 height">
							<%
								if(sellerGoodJoinRow.get("image") == null){
							%>
							<div class="text-secondary h3 h-100 d-flex align-items-center justify-content-center">이미지 없음</div>
							<%
								}else{
							%>
							<img alt="postImage" src="<%= sellerGoodJoinRow.get("image") %>" class="w-100 h-100">
							<%
								}
							%>
							</div>
							<div class="font-weight-bolder"><%= sellerGoodJoinRow.get("title") %></div>
							<div class="text-secondary small"><%= sellerGoodJoinRow.get("price") %>원</div>
							<div class="text-danger small"><%= sellerGoodJoinRow.get("nickname") %></div>
						</div>
						
					</div>
				<%
					}
				%>
				</div>
			</article>
		</section>
		<footer class="py-5">
			<div class="small text-secondary text-center">Copyright 2021. 닉네임 All rights reserved.</div>
		</footer>
	</div>
</body>
</html>