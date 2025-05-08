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
<title>책 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%
		List<Map<String, Object>> list = new ArrayList<>();
	    Map<String, Object> map = new HashMap<String, Object>() {
	        { 
	            put("id", 1000);
	            put("title", "아몬드"); 
	            put("author", "손원평"); 
	            put("publisher", "창비");
	            put("image", "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791198363503.jpg");
	        } 
	    };
	    list.add(map);
	
	    map = new HashMap<String, Object>() {
	        { 
	            put("id", 1001);
	            put("title", "사피엔스"); 
	            put("author", "유발 하라리"); 
	            put("publisher", "김영사");
	            put("image", "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788934972464.jpg");
	        } 
	    };
	    list.add(map);
	
	    map = new HashMap<String, Object>() {
	        { 
	            put("id", 1002);
	            put("title", "코스모스"); 
	            put("author", "칼 세이건"); 
	            put("publisher", "사이언스북");
	            put("image", "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788983711892.jpg");
	        } 
	    };
	    list.add(map);
	
	    map = new HashMap<String, Object>() {
	        { 
	            put("id", 1003);
	            put("title", "나미야 잡화점의 기적"); 
	            put("author", "히가시노 게이고"); 
	            put("publisher", "현대문학");
	            put("image", "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/4808972756194.jpg");
	        } 
	    };
	    list.add(map);
	%>
	
	<div class="wrap">
		<header class="d-flex justify-content-center">
			<h1>검색 결과</h1>
		</header>
		<section>
			<article>
				<div class="border-top border-bottom d-flex py-3">
					<div class="col-1 text-center font-weight-bolder">id</div>
					<div class="col-2 text-center font-weight-bolder">표지</div>
					<div class="col-9 text-center font-weight-bolder">제목</div>
				</div>
				<%
					for(Map<String, Object> bookInfoMap : list){
				%>
				<div class="border-top d-flex py-3" >
					<div class="col-1 text-center"><%= bookInfoMap.get("id") %></div>
					<div class="col-2 text-center"><img alt="아몬드 책 표지" src="<%= bookInfoMap.get("image") %>" class="w-100"></div>
					<div class="col-9 text-center">
						<a href="/jsp/test/test08.jsp?title=<%= bookInfoMap.get("title") %>&author=<%= bookInfoMap.get("author") %>&publisher=<%= bookInfoMap.get("publisher") %>&image=<%= bookInfoMap.get("image") %>" class="display-4">
							<%= bookInfoMap.get("title") %>
						</a>
					</div>
				</div>
				<%
					}
				%>
				
			</article>
		</section>
	</div>
	
	
	
	
	
</body>
</html>