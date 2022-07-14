<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
	<head>
    <title>DetailBoard</title>
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
        
        <div class="row align-items-top">
            <div class="col-lg-2"></div>
            <div class="col-lg-8">
    
                <div class="card"  height="auto">
                    <div class="card-body">
                        <h5 class="card-title" style="text-align: center;">${board.title }</h5>
                        <c:if test="${not empty board.image_file }">                        
                        	<img src="upload_img/free_board/${board.image_file }" height="400px" style="display: block;">
                        </c:if>
                        <div>
                        	${board.content }
                        </div>
                        <br>
                        <c:if test="${id eq board.writer }">
	                        <a href="/deleteBoard.do?id=${board.id }"><button class="btn btn-danger" style="float: right; margin-left: 5px;">삭제</button></a>
	                        <a href="/updateBoard.do?id=${board.id }"><button class="btn btn-secondary" style="float: right;">수정</button></a>                        
                        </c:if>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">댓글</h5>
                        <c:forEach items="${reply }" var="re">
	                        <div class="row mb-3" style="padding: 10px; background-color: #f5faff; border-radius: 10px">
	                            <div style="text-align:left">
	                            	${re.writer }: 
	                            </div>
	                            <div class="col-sm-10">
	                                <span>
	                                	${re.content }
	                                </span>
	                            </div>
	                            <div style="text-align:right; color:#e90000">
	                            	삭제
	                            </div>
	                        </div>
                        </c:forEach>
                        <!-- Horizontal Form -->
                        <form action="/reply.do" method="post">
                        	<input type="hidden" name="board_id" value="${board.id }">
                        	<input type="hidden" name="writer" value="${id }">
                            <div class="row mb-3" style="padding: 10px;">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">댓글 입력: </label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="inputText" name="content">
                                </div>
                                <div class="col-sm-3">
                                    <button type="submit" class="btn btn-outline-primary col-sm-5" style="float: left; width:45%">입력</button>
                                    <span class="col-sm-2"></span>
                                    <button type="reset" class="btn btn-outline-dark col-sm-5" style="float: right; width:45%">취소</button>
                                </div>
                            </div>
                        </form><!-- End Horizontal Form -->
                    </div>
                </div>
            </div>
        </div>
    </main>
    
	<%@include file="/common_jsp/footer.jsp" %>
</body>
</html>
