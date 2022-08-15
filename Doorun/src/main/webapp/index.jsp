<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/assets/css/main.css" rel="stylesheet">   
    <title>DOORUN</title>
</head>
<body> 
   	<%@include file="/common_jsp/index_header.jsp" %>	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   	   			
	<div class="main">
	<section class="run">
		<div class="header">
			<h1>JUST DO RUN</h1>
		</div>
	</section>	
		<div class="middle">	
			<span>
				<h2>WELCOME TO DOORUN RUNNING CLUB</h2>
				<h3>일회성 모임부터 크루까지 다양한 사람들과 함께 운동 해보세요.</h3>
			</span>			
		</div>
		<div class="middle2">
			<div class="md">
				<h2>기록 및 분석<br><br><img src="/assets/img/record.png"></h2>				
				<h3>어플을 통해 활동을 기록하고 분석하여<br> 계획을 세워보세요.</h3>				
			</div>
			<div class="md2">
				<h2>탐색 및 경쟁<br><br><img src="/assets/img/people.png"></h2>					
				<h3>크루에 가입하여 다른 크루와 경쟁하여 향상된 기록을 세워보세요.</h3>
			</div>			
		</div>
		<div class="middle2">
			<div class="img1">
				<img src="/assets/img/running_record.png">
				<p>달린 거리를 기록하여 시간과 거리 평균페이스를 측정해줍니다.</p>
			</div>
			<div class="img2">
				<img src="/assets/img/graph.png">
				<p>지난 7일간의 거리를 기록하여 시각화된 그래프를 제공합니다.</p>
			</div>
		</div>
		<section class="together_run">
			<div class="middle3">
				<div class="md3">
					<h2>친구를 초대하여 함께 새로운 경험을 공유하세요.</h2>									
				</div>
			</div>
		</section>
		<div class="middle4">
			<div class="md4">
				<h2>JOIN OUR RUNNING CLUB</h2>
				<h3>자신과 어울리는 크루에 가입해 다양한 사람들을 만나 운동해보세요.</h3>
			</div>
		</div>		
		<div class="middle5">
			<h2>지금 바로 가입해 여러가지 기능을<br> 사용해보세요.</h2>
				<a href="login.jsp">JOIN NOW</a>
			<img src="/assets/img/join_running.jpg">
		</div>
	</div>
		
</body>
</html>