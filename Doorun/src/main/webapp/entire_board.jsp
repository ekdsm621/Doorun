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
    <title>전체 게시판</title>
</head>
<body> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   	<%@include file="/common_jsp/header.jsp" %>	
 	  <div class="container-fluid">
	  	<h2><strong>전체게시판</strong></h2>
       <div class="d-grid gap-2 d-md-flex justify-content-md-end">
           <a href="entireBoard_insert.jsp?id=<%=request.getParameter("id")%>" class="btn btn-dark team-making mb-3" style="width:100px;">글쓰기</a>
       </div>	  	
	  	<div class="row">	  	
	  		<table class="table table-striped" style="text-align:center; border: 1px solid #ddd;">
	  			<thead>
	  				<tr>
	  					<th style="background-color:#eee; text-align:center;">번호</th>
	  					<th style="background-color:#eee; text-align:center;">제목</th>
	  					<th style="background-color:#eee; text-align:center;">작성자</th>
	  					<th style="background-color:#eee; text-align:center;">작성일</th>
	  				</tr>
	  			</thead>
	  			<tbody>
	  				<c:forEach items="${viewAll }" var="list">
	  				<tr>
	  					<td>${list.id }</td>
	  					<td><a href="detailBoard.do?id=${list.id }&board_id=<%=request.getParameter("id")%>">${list.title }</a></td>
	  					<td>${list.writer }</td>
	  					<td>${list.reg_date }</td>
	  				</tr>
	  				</c:forEach>
	  			</tbody>
	  		</table>
	  	</div>	  	
	  	<div class="searchbox">
			<div class="row">
				<form method="post" name="search" action="/boardList.do?id=1">
					<table class="pull-right mx-auto">
						<tr>
							<td>
								<select class="form-select" name="searchField">
									<option value="TITLE">제목</option>
									<option value="WRITER">작성자</option>
								</select>
							</td>
							<td><input type="text" class="form-control" placeholder="글 찾기" name="searchKeyword" maxlength="100"></td>
							<td><button type="submit" class="btn btn-dark">검색</button></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	   </div>	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/boardList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/boardList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/boardList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	<%@include file="/common_jsp/footer.jsp" %>
</body>
</html>