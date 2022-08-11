<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/assets/css/crew_join.css" rel="stylesheet">
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
    <title>크루 리스트</title>
    
    
</head>
<body> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <%@include file="/common_jsp/header.jsp" %>
 	  <div class="container-fluid">
	      <div class="main">
	          <div class="team-header">
	              <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	              	<a href="../createCrew.jsp">
	                  <button class="btn btn-dark team-making mb-3">크루 만들기</button>
	                </a>
	              </div>
	              <table class="table table-striped table-hover table-borderless">
	                  <thead>
	                      <tr class="mb-4">
	                          <td class="p-4" style="background-color: rgb(200, 199, 199);">
	                              <form class="row">
	                                  <div class="col-4">
	                                      <input class="form-control" type="text" placeholder="크루 이름" aria-label="default input example">
	                                  </div>
	                                  <div class="col-4">
	                                      <input class="form-control" type="text" placeholder="크루 지역" aria-label="default input example">
	                                  </div>
	                                  <div class="col-4">
	                                      <input type="submit" class="btn btn-dark" value="검색">
	                                  </div>
	                              </form>
	                          </td>
	                      </tr>
	                  </thead>				     		
	               </table>
	              	<hr>
	          	</div>  
          	</div>
	          	<div class="team-body" style="margin-top:100px">
	          		<table class="table table-striped table-hover table-borderless" style=" border:#dddddd;">
	          			<thead>
			        		<tr>	        				        			
			        			<th style="background-color: #fafafa; text-align: center;">크루명</th>
			        			<th style="background-color: #fafafa; text-align: center;">지역</th>
			        			<th style="background-color: #fafafa; text-align: center;">회원수</th>
			        			<th style="background-color: #fafafa; text-align: center;"></th>
			       			</tr>
	     				</thead>
			     		<tbody>
			     		<c:forEach items="${crewList }" var="crew">
			     			<tr>	     				
			     				<td>
			     					<div>
			     						<a href="../detailCrew.do?id=${crew.id }"><img src="upload_img/crew_img/${crew.image_file }" class="crew-sub-img"></a>
			     					</div>
			     					<a href="../detailCrew.do?id=${crew.id }">${crew.name }</a>
			     				</td>
			     				<td>${crew.area }</td>
			     				<td>${crew.member }명</td>
			     				<td>
			     					<a href="../joinCrew.do?id=${crew.id }">
			     						<button class="btn btn-primary" type="button">참가</button>
			     					</a>
			     				</td>			     				
			     			</tr>
			     		</c:forEach>	
	   	     	 	     	     				
			     		</tbody>
	          		</table>
	          	</div>
          	</div>         
          	<%@include file="/common_jsp/footer.jsp" %>
</body>
</html>