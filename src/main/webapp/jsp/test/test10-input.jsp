<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멜롱 사이트 input</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
<%
// 아티스트 정보 

    Map<String, Object> artistInfo = new HashMap<>();
    artistInfo.put("name", "아이유");
    artistInfo.put("debute", 2008);
    artistInfo.put("agency", "EDAM엔터테인먼트");
    artistInfo.put("photo", "https://musicmeta-phinf.pstatic.net/artist/000/112/112579.jpg?type=ff300_300");


// 아이유 노래 리스트 
    List<Map<String, Object>> musicList = new ArrayList<>();

    Map<String, Object> musicInfo = new HashMap<>();
    musicInfo.put("id", 1);
    musicInfo.put("title", "팔레트");
    musicInfo.put("album", "Palette");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/002/000/2000240.jpg?type=r360Fll");
    musicInfo.put("time", 217);
    musicInfo.put("composer", "아이유");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 2);
    musicInfo.put("title", "좋은날");
    musicInfo.put("album", "Real");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/000/184/184117.jpg?type=r360Fll");
    musicInfo.put("time", 233);
    musicInfo.put("composer", "이민수");
    musicInfo.put("lyricist", "김이나");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 3);
    musicInfo.put("title", "밤편지");
    musicInfo.put("album", "palette");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/002/000/2000240.jpg?type=r360Fll");
    musicInfo.put("time", 253);
    musicInfo.put("composer", "제휘,김희원");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 4);
    musicInfo.put("title", "삐삐");
    musicInfo.put("album", "삐삐");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/002/559/2559408.jpg?type=r360Fll");
    musicInfo.put("time", 194);
    musicInfo.put("composer", "이종훈");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 5);
    musicInfo.put("title", "스물셋");
    musicInfo.put("album", "CHAT-SHIRE");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/000/592/592471.jpg?type=r360Fll");
    musicInfo.put("time", 194);
    musicInfo.put("composer", "아이유,이종훈,이채규");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 6);
    musicInfo.put("title", "Blueming");
    musicInfo.put("album", "Love poem");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/003/399/3399860.jpg?type=r360Fll");
    musicInfo.put("time", 217);
    musicInfo.put("composer", "아이유,이종훈,이채규");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);
%>
<div class="container">
		<header class="d-flex pb-3 col-12">
			<div class="h1 mr-5"><a href="/jsp/test/test10-input.jsp" class="text-decoration-none text-success">Melong</a></div>
			<div class="d-flex align-items-center col-5">
				<form method="get" action="/jsp/test/test10.jsp">
					<div class="input-group">
						<input type="text" name="search" class="form-control">
	  					<div class="input-group-append">
	    					<button class="btn btn-info" type="submit">검색</button>
						</div>
					</div>
				</form>	
			</div>
		</header>
		<nav>
			<ul class="nav font-weight-bolder">
				<li class="nav-item"><a href="#" class="nav-link text-dark">멜롱차트</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark">최신음악</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark">장르음악</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark">멜롱DJ</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark">뮤직어워드</a></li>
			</ul>
		</nav>
		<section class="col-12">
			<article>
				<div class="py-3">
					<div class="border border-success d-flex p-3">
						<div>
							<img alt="아티스트 사진" src="<%= artistInfo.get("photo") %>" width="200px">
						</div>
						<div class="ml-3">
							<div class="h1"><%= artistInfo.get("name") %></div>
							<div class="mt-3"><%= artistInfo.get("agency") %></div>
							<div><%= artistInfo.get("debute") %>년 데뷔</div>
						</div>
					</div>
				</div>
			</article>
			<article >
				<div class="pb-3">
					<div class="h3">곡 목록</div>
					<table class="table text-center">
						<thead>
							<tr>
								<th>no</th>
								<th>제목</th>
								<th>앨범</th>
							</tr>
						</thead>
						<tbody>
							<%
								for(Map<String, Object> musicInfoMap : musicList){
							%>
							<tr>
								<td><%= musicInfoMap.get("id") %></td>
								<td><a href="/jsp/test/test10.jsp?id=<%= musicInfoMap.get("id") %>"><%= musicInfoMap.get("title") %></a></td>
								<td><%= musicInfoMap.get("album") %></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</article>
		</section>
		<footer class="col-12">
			<div class="small border-top py-3">Copyright 2021. 닉네임 All rights reserved.</div>
		</footer>
	</div>
</body>
</html>