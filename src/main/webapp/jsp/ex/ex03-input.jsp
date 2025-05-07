<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post input</title>
</head>
<body>	
	<form method="post" action="/jsp/ex/ex03.jsp">
		<label>닉네임 : </label> <input type="text" name="nickname">
		
		<!-- 라디오 버튼 -->
		<!-- value값을 주지않으면 모든 라디오버튼의 파라미터 값이 on이 된다 (value값 필수) -->
		<h4>좋아하는 동물을 고르세요</h4>
		<label>고양이<input type="radio" name="animal" value="cat" checked></label>
		<label>강아지<input type="radio" name="animal" value="dog"></label>
		<label>사자<input type="radio" name="animal" value="lion"></label>
		<br>
		
		<!-- 셀렉트  -->
		<!-- option태그에 value값을 주지 않으면 태그사이의 문자열이 파라미터 값으로 전달된다 -->
		<h4>좋아하는 과일을 고르세요</h4>
		<select name="fruit">
			<option value="banana">바나나</option>
			<option value="strawberry">딸기</option>
			<option>복숭아</option>
		</select>
		
		<!-- 체크박스 -->
		<!-- value값을 주지않으면 파라미터 값이 null이 된다 -->
		<!-- 여러값을 하나의 파라미터로 전달 한다 => 하나의 파라미터에 여러개의 값이 배열로 전달된다 -->
		<h4>좋아하는 음식을 모두 고르세요</h4>
		<label>민트초코<input type="checkbox" name="food" value="mint"></label>
		<label>하와이안피자<input type="checkbox" name="food" value="pizza"></label>
		<label>번데기<input type="checkbox" name="food" value="bug"></label>
		
		
		<div>
			<button type="submit">입력</button>
		</div>
	</form>
	
</body>
</html>