<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test02-Input</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<header>
			<div class="h1">즐겨찾기 추가</div>
		</header>
		<section>
			<article>
				<div>
					<form method="post" action="/db/test02Insert">
						<div>
							<label>사이트명:</label>
							<input type="text" name="name" class="form-control col-4">
							<label>사이트 주소:</label>
							<input type="text" name="url" class="form-control col-6">
							<br>
							<button type="submit" class="btn btn-success">추가</button>
						</div>
					</form>
				</div>
			</article>
		</section>
	</div>
</body>
</html>