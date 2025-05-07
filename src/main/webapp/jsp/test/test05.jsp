<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길이 변환POST</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%!
		// cm -> 인치로 변환 메소드
		public double inchConverter(double cm) {
			return cm / 2.54;
		}
		// cm -> 야드로 변환
		public double yardConverter(double cm) {
			return cm / 91.44;
		}
		// cm -> 피트로 변환
		public double ftConverter(double cm) {
			return cm / 30.48;
		}
		// cm -> 미터로 변환
		public double mConverter(double cm) {
			return cm / 100;
		}
		
	%>
	<%
		// getParameter() 은 해당 파라미터의 하나의 값만 가져온다
		// getPatameterValues()는 해당 파라미터의 여러개의 값을 String배열로 묶어서 반환해준다 => 체크박스처럼 하나의 파라미터로 여러개의 값이 넘어올때 사용
		double cm = Double.parseDouble(request.getParameter("cm"));
		String[] units = request.getParameterValues("units");
		
		
	%>
	<div class="container">
		<h3>변환 결과</h3>
		<div class="h5"><%= cm %> cm</div>
		<hr>
	<%
		String inch = "";
		String yard = "";
		String ft = "";
		String m = "";
		String notUnit = "";
		if(units != null){
			for(String unit : units){
				if(unit.equals("inch")){
					// out.println("<div class=\"h5\">" + inchConverter(cm) + " " + unit + "</div>");
					inch += inchConverter(cm) + " " + unit; 
				}else if(unit.equals("yard")){
					// out.println("<div class=\"h5\">" + yardConverter(cm) + " " + unit + "</div>");
					yard += yardConverter(cm) + " " + unit;
				}else if(unit.equals("ft")){
					// out.println("<div class=\"h5\">" + ftConverter(cm) + " " + unit + "</div>");
					ft += ftConverter(cm) + " " + unit;
				}else if(unit.equals("m")){
					// out.println("<div class=\"h5\">" + mConverter(cm) + " " + unit + "</div>");
					m += mConverter(cm) + " " + unit;
				}
			}
		} else{
			notUnit = "단위를 선택해 주세요!";
		}
		
	%>
		<!-- div는 안에 값이 없고 크기를 지정하지 않으면 공간을 차지하지 않는다 -->
		<div class="h5"><%= inch %></div>
		<div class="h5"><%= yard %></div>
		<div class="h5"><%= ft %></div>
		<div class="h5"><%= m %></div>
		<div class="h5"><%= notUnit %></div>
	
	</div>
	
	
</body>
</html>