<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/assets/css/entire_board.css" rel="stylesheet">
    <link href="/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <title>게시판 글쓰기</title>
</head>
<body> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   	<%@include file="/common_jsp/header.jsp" %>
 	  <div class="container-fluid">
	  	<h2><strong>게시판 글쓰기</strong></h2>
	  	<div class="row">
	  		<form method="post" action="/insertBoard.do" enctype="multipart/form-data">
	  			<input type="hidden" name="board_id" value="<%=request.getParameter("id")%>">
		  		<table class="table table-striped" style="text-align:center; border:1px solid #dddddd;">
		  			<thead>
		  				<tr>
		  					<th colspan="2" style="background-color:#eee; text-align:center; padding:10px;">게시판 글쓰기</th>
		  				</tr>
		  			</thead>
		  			<tbody>
		  				<tr>
		  					<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"></td>		  					 				
		  				</tr>
		  				<tr>
		  					<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height:400px;"></textarea></td>
		  				</tr>
		  				<tr>
		  					<td>
		  						<div class="col-sm-9">
        	                   		<input class="form-control" type="file" id="imageFile" name="uploadFile">
		                       </div>
                          	</td>
		  				</tr>
		  			</tbody>
		  		</table>	
	  			<a href="/boardList.do?id=<%=request.getParameter("id")%>" class="btn btn-dark mb-3 " style="width:80px; float:right">목록</a>
	  			<input type="submit" class="btn btn-dark mb-3 mx-1" value="등록" style="width:80px; float:right">
	  		</form>  		
	  	</div>			
	   </div>
	   	<%@include file="/common_jsp/footer.jsp" %>
</body>
</html>