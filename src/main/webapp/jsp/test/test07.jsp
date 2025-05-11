<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의 민족 검색</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%! 
		public double isExceptionCheck(String isException){
			// null 값인지를 먼저 비교해야한다 
			// 만약 if(isException.equals("exception"))이 먼저 있으면 null일때 equals가 오류가 남
			// null 먼저 걸러줘야된다
			if(isException == null || !(isException.equals("exception"))){
		    	return 0;
		    }else{
		    	return 4.0;
		    }
		}
	%>
	<%
		List<Map<String, Object>> list = new ArrayList<>();
	    Map<String, Object> map = new HashMap<String, Object>() {{ put("name", "버거킹"); put("menu", "햄버거"); put("point", 4.3); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "BBQ"); put("menu", "치킨"); put("point", 3.8); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "교촌치킨"); put("menu", "치킨"); put("point", 4.1); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "도미노피자"); put("menu", "피자"); put("point", 4.5); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "맥도날드"); put("menu", "햄버거"); put("point", 3.8); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "BHC"); put("menu", "치킨"); put("point", 4.2); } };
	    list.add(map);
	    map = new HashMap<String, Object>() {{ put("name", "반올림피자"); put("menu", "피자"); put("point", 4.3); } };
	    list.add(map);
	    
	    
	    String search = request.getParameter("search");
	    String isException = request.getParameter("isException");	// 파라미터가 없으면 null이 들어온다
	    
	    
	    
	%>

	<div class="wrap">
		<header class="d-flex justify-content-center">
			<h1>검색 결과</h1>
		</header>
		<section>
			<article>
				<div class="border-top border-bottom d-flex py-3">
					<div class="col-4 text-center font-weight-bolder">메뉴</div>
					<div class="col-4 text-center font-weight-bolder">상호</div>
					<div class="col-4 text-center font-weight-bolder">별점</div>
				</div>
				<%
					for(Map<String, Object> storeInfoMap : list){
						// Map<String, Object> 이기 때문에 point의 값을 Object로 반환 시킨다 그러므로 명시적으로 Double로 한번 형변환을 해줘야 한다 => Object이기 때문에 기본 타입이 아닌 레퍼 클래스로 타입으로 형변환 해줘야한다 그후 기본타입으로 바꾸던지 
						// point가 null이면 검색조건만으로 모든 가게 검색
						// if(search.equals(storeInfoMap.get("menu")) && (storInfoMap.get("point") == null || (Double)storeInfoMap.get("point") > 4.0))
						if(search.equals(storeInfoMap.get("menu")) && (Double)storeInfoMap.get("point") > isExceptionCheck(isException)){
							
				%>
				<div class="border-top d-flex py-3">
					<div class="col-4 text-center"><%= storeInfoMap.get("menu") %></div>
					<div class="col-4 text-center"><%= storeInfoMap.get("name") %></div>
					<div class="col-4 text-center"><%= storeInfoMap.get("point") %></div>
				</div>
				<%
							
						}
					}
				%>
			</article>
		</section>
	</div>
</body>
</html>