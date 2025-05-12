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
<title>멜롱 사이트</title>
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
	    					<button class="btn btn-success" type="submit">검색</button>
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
					<div class="h3">곡 정보</div>
					<%! 
						// search가 null이거나 제목이 같은 노래가 없으면 false를 리턴하는 메소드
						public boolean isSearchCheck(List<Map<String, Object>> musicList, String search){
							for(Map<String, Object> musicInfoMap : musicList){
								if(search.equals(musicInfoMap.get("title"))){
									return true;
								}
							}
							if(search.equals("")){
								return false;
							}
							return false;
						}
					%>
					<%
						// null 처리
						// id가 0부터 시작된다면 null을 음수로 처리 또는 null을 가주고 그대로 진행하는 방향으로
						int id = (request.getParameter("id") != null) ? Integer.parseInt(request.getParameter("id")) : 0;
						String search = (request.getParameter("search") != null) ? request.getParameter("search") : "";
						boolean isSearch = false;
						
						if(isSearchCheck(musicList, search) || !(id == 0)){
						for(Map<String, Object> musicInfoMap : musicList){
							if(id == (Integer)musicInfoMap.get("id") || search.equals(musicInfoMap.get("title"))){
					%>
					<div class="border border-success d-flex p-3">
						<div>
							<img alt="앨범표지" src="<%= musicInfoMap.get("thumbnail") %>" width="250px">
						</div>
						<div class="ml-3">
							<div class="display-3"><%= musicInfoMap.get("title") %></div>
							<div class="text-success h4 mt-3 font-weight-bolder"><%= musicInfoMap.get("singer") %></div>
							<div class="d-flex mt-4 text-secondary">
								<div>
									<div>앨범</div>
									<div>재생시간</div>
									<div>작곡가</div>
									<div>작사가</div>
								</div>
								<div class="ml-3">
									<div><%= musicInfoMap.get("album") %></div>
									<div><%= (Integer)musicInfoMap.get("time") / 60 %> : <%= (Integer)musicInfoMap.get("time") % 60 %></div>
									<div><%= musicInfoMap.get("composer") %></div>
									<div><%= musicInfoMap.get("lyricist") %></div>
								</div>
							</div>
						</div>
					</div>
					<%
								}
							}
						
					%>
				</div>
			</article>
			<article>
				<div class="py-3">
					<div class="h3">가사</div>
					<div class="border-top border-bottom py-2 pb-5">가사 정보 없음</div>
				</div>
			</article>
			<%
						}else{
			%>
			<div class="text-danger">검색된 곡이 없습니다</div>
			<%
						}
			%>
		</section>
		<footer class="col-12">
			<div class="small border-top py-3">Copyright 2021. 닉네임 All rights reserved.</div>
		</footer>
	</div>
</body>
</html>