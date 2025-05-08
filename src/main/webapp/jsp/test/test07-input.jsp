<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의 민족 input</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="h1">메뉴검색</div>
		<form method="get" action="/jsp/test/test07.jsp">
			<div class="d-flex">
				<input type="text" name="search" class="form-control col-4 mr-2">
				<label><input type="checkbox" name="isException" value="exception">4점 이하 제외</label>
			</div>
			<button type="submit" class="btn btn-success">검색</button>
		</form>
	</div>
</body>
</html>