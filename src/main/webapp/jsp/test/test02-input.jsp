<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bmi-input</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h2>체격 조건 입력</h2>
		<form method="get" action="/jsp/test/test02.jsp">
			<div class="d-flex align-items-end">
				<input type="text" name="height" class="form-control col-2">
				<label for="height" class="">cm</label>
				<input type="text" name="weight" class="form-control col-2 ml-3">
				<label for="weight">kg</label>
				<button class="btn btn-primary ml-3">계산</button>
			</div>
		</form>
	</div>

	
</body>
</html>