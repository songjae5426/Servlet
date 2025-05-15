<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.songjae.common.MySqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test03-input</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
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
		<section>
			<article class="p-5">
				<div class="display-4 col-12 pb-5">물건 올리기</div>
				<form method="post" action="/db/test03Insert" id="postForm">
					<div class="d-flex justify-content-between">
						<div class="col-3">
							<select name="sellerId" id="idSelect" class="form-control">
								<option value="-1">-아이디 선택-</option>
								<%
									MySqlService mySqlService = MySqlService.getInstance();
									mySqlService.connect();
									String query = "SELECT `id`,`nickname` FROM `seller`;";
									List<Map<String, Object>> sellerList = mySqlService.select(query);
									for(Map<String, Object> sellerRow : sellerList){
								%>
								<option value="<%= sellerRow.get("id") %>"><%= sellerRow.get("nickname") %></option>
								<%
									}
								%>
							</select>
						</div>
						<input type="text" id="title" name="title" placeholder="제목" class="form-control col-6">
						<div class="input-group col-3">
							<input type="text" id="price" name="price" class="form-control" placeholder="가격">
						  	<div class="input-group-append">
						    	<span class="input-group-text">원</span>
						  	</div>
						</div>
					</div>
					<div class="col-12 mt-3">
						<textarea rows="5" id="description" name="description" class="w-100 h-100 form-control"></textarea>
					</div>
					<div class="col-12 mt-3">
						<div class="input-group">
							<div class="input-group-append">
						    	<span class="input-group-text">이미지 url</span>
						  	</div>
							<input type="text" id="image" name="image" class="form-control">
						</div>
					</div>
					<div class="col-12 mt-3">
						<button type="submit" class="btn btn-secondary w-100" id="saveBtn">저장</button>
					</div>
				</form>
			</article>
		</section>
		<footer>
			<div class="small text-secondary text-center">Copyright 2021. 닉네임 All rights reserved.</div>
		</footer>
	</div>
	
	<script>
		$("#saveBtn").on("click", function(){
			event.preventDefault();	// submit button이나 a 태그의 기본 이벤트 동작을 막는 함수
			
			if($("#idSelect").val() == -1){
				alert("아이디를 선택해주세요");
				return;
			}
			if($("#title").val() == ""){
				alert("제목을 입력 해주세요");
				return;
			}
			if($("#price").val() == ""){
				alert("가격을 입력 해주세요");
				return;
			}
			
			
			$("#postForm").submit();	//폼 데이터 전송 코드
		});
	</script>
	
</body>
</html>