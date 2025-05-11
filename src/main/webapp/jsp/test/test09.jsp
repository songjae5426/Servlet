<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IPTV 채널 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%
	    List<Map<String, String>> list = new ArrayList<>();
	    Map<String, String> map = new HashMap<String, String>() {{ put("ch", "5"); put("name", "SBS"); put("category", "지상파"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "7"); put("name", "KBS2"); put("category", "지상파"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "9"); put("name", "KBS1"); put("category", "지상파"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "11"); put("name", "MBC"); put("category", "지상파"); } };
	    list.add(map);
	
	    map = new HashMap<String, String>() {{ put("ch", "54"); put("name", "OCN"); put("category", "영화"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "56"); put("name", "Screen"); put("category", "영화"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "57"); put("name", "Mplex"); put("category", "영화"); } };
	    list.add(map);
	
	    map = new HashMap<String, String>() {{ put("ch", "30"); put("name", "KBS 드라마"); put("category", "드라마"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "32"); put("name", "MBC 드라마"); put("category", "드라마"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "34"); put("name", "Olive"); put("category", "드라마"); } };
	    list.add(map);
	
	    map = new HashMap<String, String>() {{ put("ch", "3"); put("name", "tvN"); put("category", "예능"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "28"); put("name", "MBC Every1"); put("category", "예능"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "48"); put("name", "JTBC2"); put("category", "예능"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "49"); put("name", "E채널"); put("category", "예능"); } };
	    list.add(map);
	
	    map = new HashMap<String, String>() {{ put("ch", "120"); put("name", "SPOTV"); put("category", "스포츠"); } };
	    list.add(map);
	    map = new HashMap<String, String>() {{ put("ch", "121"); put("name", "KBSN 스포츠"); put("category", "스포츠"); } };
	    list.add(map);
	%>
	<div class="wrap">
		<header class="d-flex justify-content-center text-danger font-weight-bolder h1 py-2">
			<div>Sk broadband IPTV</div>
		</header>
		<nav>
			<ul class="nav nav-fill bg-danger">
				<li class="nav-item"><a href="/jsp/test/test09.jsp" class="nav-link text-white">전체</a></li>
				<li class="nav-item"><a href="/jsp/test/test09.jsp?categorySelect=지상파" class="nav-link text-white">지상파</a></li>
				<li class="nav-item"><a href="/jsp/test/test09.jsp?categorySelect=드라마" class="nav-link text-white">드라마</a></li>
				<li class="nav-item"><a href="/jsp/test/test09.jsp?categorySelect=예능" class="nav-link text-white">예능</a></li>
				<li class="nav-item"><a href="/jsp/test/test09.jsp?categorySelect=영화" class="nav-link text-white">영화</a></li>
				<li class="nav-item"><a href="/jsp/test/test09.jsp?categorySelect=스포츠" class="nav-link text-white">스포츠</a></li>
			</ul>
		</nav>
		<section>
			<article>
				<table class="table text-center">
					<thead>
						<tr>
							<th>채널</th>
							<th>채널명</th>
							<th>카테고리</th>
						</tr>
					</thead>
					<tbody>
					<%
						// 전체일때는 파라미터가 null
						String categorySelect = request.getParameter("categorySelect");
						for(Map<String, String> channelInfoMap : list){
							// (파라미터가 없다 전체) 이거나 (파라미터가 있는데 map에 있는 값이랑 같을때)
							// 즉, 파라미터가 없을때는 모든 map이 출력된다
							if(categorySelect == null || channelInfoMap.get("category").equals(categorySelect)) {
					%>
						<tr>
							<td><%= channelInfoMap.get("ch") %></td>
							<td><%= channelInfoMap.get("name") %></td>
							<td><%= channelInfoMap.get("category") %></td>
						</tr>
					<%
							}
						}
					%>
					</tbody>
				</table>
			</article>
		</section>
		<footer>
			<div class="small text-center">Copyright 2021. 닉네임 All rights reserved.</div>
		</footer>
		
	</div>
</body>
</html>