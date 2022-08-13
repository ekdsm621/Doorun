<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/assets/css/marathon.css" rel="stylesheet">
    <link href="/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script>
        $(document).ready(function(){
            $(".dropdown").hover(function(){
                var dropdownMenu = $(this).children(".dropdown-menu");
                if(dropdownMenu.is(":visible")){
                    dropdownMenu.parent().toggleClass("open");
                }
            });
        });
    </script>
    <title>마라톤</title>
    
    
</head>
<body> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <%@include file="/common_jsp/header.jsp" %>
 	  <div class="container-fluid">
	          	<div class="team-body" style="margin-top:100px">
	          		<table class="table table-striped table-hover table-borderless" style=" border:#dddddd;">
 	  				<h2>마라톤</h2><p>
	          			<thead>
			        		<tr>	        				        			
			        			<th style="background-color: #fafafa; text-align: center;">날짜</th>
			        			<th style="background-color: #fafafa; text-align: center;">대회명</th>
			        			<th style="background-color: #fafafa; text-align: center;">위치</th>
			        			<th style="background-color: #fafafa; text-align: center;">주최</th>
			        			<th style="background-color: #fafafa; text-align: center;">홈페이지</th>
			       			</tr>
	     				</thead>
			     		<tbody>
			     		    <c:forEach items="${marathonlist }" var="marathon">
			     			<tr>	     				
			     				<td style="font-weight:bold;">${marathon.marathon.day}</td>
			     				<td style="font-weight:bold;">${marathon.marathon.name}</td>			     				
			     				<td style="font-weight:bold;">${marathon.marathon.place}</td>
			     				<td style="font-weight:bold;">${marathon.marathon.address}</td>
			     				<td><button class="btn btn-secondary"  onclick="window.open('http://${marathon.link.link}')" >
			     				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
  									<path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
 								    <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
								</svg></button>
								</td>
			     			</tr>
			     			</c:forEach>
			     		</tbody>
	          		</table>
	          	</div>
	          	
	          	
	          
          	</div>         
    <div class="container">
        <footer class="d-flex flex-wrap justify-content-between align-items-center border-top">
            <p class="col-md-4 mb-0 text-muted">&copy; 2022 Company, Inc</p>
        
            <a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
            </a>
        
            <ul class="nav col-md-4 justify-content-end">
                <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
            </ul>
        </footer>
    </div>
</body>
</html>