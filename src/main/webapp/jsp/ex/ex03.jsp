<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post method</title>
</head>
<body>
	
	<%
		// getParamerter() => 하나의 파라미터에 하나의 값이 전달될때	(String)
		// getParamerterValues() => 하나의 파라미터로 여러개의 값이 넘어올때 (String[])
	
		// input text
		// nickname을 전달 받고 그대로 보여준다.
		String nickname = request.getParameter("nickname");
		
		// radio 버튼
		// 좋아하는 동물 하나를 전달 받고 보여준다
		// 고양이, 강아지, 사자
		String animal = request.getParameter("animal");
		
		// select 박스
		// 좋아하는 과일 하나를 전달 받고 보여준다
		// 바나나, 딸기, 복숭아
		String fruit = request.getParameter("fruit");
		
		// check 박스
		// 좋아하는 음식을 모두 전달 받고 보여준다.
		// 민트초코, 하와이안 피자, 번데기
		String[] foodArray = request.getParameterValues("food");
		
		String foodString = "";
		for(int i = 0; i < foodArray.length; i++){
			foodString += " " + foodArray[i];
		}
	%>
	
	
	<h3><%= nickname %></h3>
	<h3><%= animal %></h3>
	<h3><%= fruit %></h3>
	<h3><%= foodString %></h3>
</body>
</html>