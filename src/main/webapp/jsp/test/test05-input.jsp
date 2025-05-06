<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길이 변화-input</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h3>길이 변환</h3>
		<form method="post" action="/jsp/test/test05.jsp">
			<div class="input-group d-felx align-items-end">
				<input type="text" name="cm" class="form-control col-3">
				<label for="cm">cm</label>
			</div>
			<input type="checkbox" name="units" value="inch">
			<label for="unit">인치</label>
			<input type="checkbox" name="units" value="yard">
			<label for="unit">야드</label>
			<input type="checkbox" name="units" value="ft">
			<label for="unit">피트</label>
			<input type="checkbox" name="units" value="m">
			<label for="unit">미터</label>
			<br>
			<button type="submit" class="btn btn-success">변환</button>
		</form>
	</div>
</body>
</html>