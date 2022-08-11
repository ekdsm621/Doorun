<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
    <title>Board</title>
    <%@include file="/common_jsp/head_settings.jsp" %>
    </head>

    <body>
	<%@include file="/common_jsp/header.jsp" %>
    <%@include file="/common_jsp/sidebar.jsp" %>

    <!-- 메인 -->
    <main id="main" class="main">
        <div class="pagetitle" align="center" style="margin-top:50px;">
            <h1 style="font-size: 30px;">전체 게시판</h1>
        </div>
        <hr style="margin-top:50px; margin-bottom: 50px;">

        <section class="section">
            <div class="row" style="float: none; margin:100 auto;">
                <div class="col-lg-10"  style="float: none; margin:0 auto;">
            
                <div class="card">
                <div class="card-body">
                    <h5 class="card-title"></h5>
    
                    <!-- Default Table -->
                    <table class="table datatable">
                    <thead>
                        <tr>
                        <th scope="col">id</th>
                        <th scope="col">title</th>
                        <th scope="col">writer</th>
                        <th scope="col">date</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${boardList }" var="board">
                        <tr>
	                        <th scope="row">${board.rownum }</th>
	                        <td><a href="detailBoard.do?id=${board.id }" style="color:black">${board.title }</a></td>
	                        <td>${board.writer }</td>
	                        <td>${board.reg_date }</td>
                        </tr>
                    	</c:forEach>
                    </tbody>
                    </table>
					<a href="insert_board.jsp?"><button class="btn btn-outline-dark" style="float:right; width:10%">글쓰기</button></a>
                </div>
                </div>
                </div>
                </div>
        </section>

    </main>
    
    <%@include file="/common_jsp/footer.jsp" %>
</body>
</html>
