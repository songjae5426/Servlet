<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사칙연산 POST-input</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h3>사칙연산</h3>
		<form method="post" action="/jsp/test/test04.jsp">
			<div class="d-flex">
				<input type="text" name="number1" class="form-control col-3">
				<select name="operator" class="form-control col-1">
					<option value="+">+</option>
					<option value="-">-</option>
					<option value="*">*</option>
					<option value="/">/</option>
				</select>
				<input type="text" name="number2" class="form-control col-3">
				<button type="submit" class="btn btn-success">계산</button>
			</div>
		</form>
	</div>
</body>
</html>