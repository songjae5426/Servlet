<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMI 수치</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%! 
		// BMI 계산 메소드
		public double bmiCalculator(double height, double weight){
			return weight / ((height / 100.0) * (height / 100.0));
		}
	%>

	<%!
		// 비만도 여부 메소드
		public String obesityCalculator(double bmi){
			if(18.5 > bmi){
				return "저체중";
			}else if(18.5 <= bmi && bmi < 25.0){
				return "정상";
			}else if(25 <= bmi && bmi < 30){
				return "과체중";
			}else{ // bmi가 30 이상일때
				return "비만";
			}
		}
	%>

	<%
		double height = Double.parseDouble(request.getParameter("height"));
		double weight = Double.parseDouble(request.getParameter("weight"));
		
		double bmi = bmiCalculator(height, weight);
		String obesity = obesityCalculator(bmi);
	%>

	<div class="container">
		<h2 class="fw-bold">BMI 측정 결과</h2>
		<div class="display-4">당신은 <span class="text-info"><%= obesity %></span> 입니다</div>
		<div>BMI 수치 : <%= bmi %></div>
	</div>
	
</body>
</html>