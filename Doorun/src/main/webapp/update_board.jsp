<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
    <title>UpdateBoard</title>
    <%@include file="/common_jsp/head_settings.jsp" %>
    </head>

    <body>
	<%@include file="/common_jsp/header.jsp" %>
    <%@include file="/common_jsp/sidebar.jsp" %>

    <!-- 메인 -->
    <main id="main" class="main">
        <div class="pagetitle" align="center" style="margin-top:50px;">
            <h1 style="font-size: 30px;">글 수정</h1>
        </div>
        <hr style="margin-top:50px; margin-bottom: 50px;">
        <section class="section">
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-10">
                    <div class="card">
                        <div class="card-body">
                            <!-- General Form Elements -->
                            <form method="post" action="/updateBoard.do" enctype="multipart/form-data">
	                            <div class="row mb-3">
	                                <label for="inputText" class="col-sm-2 col-form-label">Title</label>
	                                <div class="col-sm-10">
	                                    <input type="text" class="form-control" name="title" value="${board.title }">
	                                </div>
	                            </div>
	                            <input type="hidden" name="board_id" value="${board.board_id }">
	                            <input type="hidden" name="id" value="${board.id }">
	                            <div class="row mb-3">
	                                <label for="inputPassword" class="col-sm-2 col-form-label">Content</label>
	                                <div class="col-sm-10">
	                                <textarea class="form-control" style="height: 400px" name="content">${board.content }</textarea>
	                                </div>
	                            </div>
	                            <div class="row mb-3">
	                                <label for="inputNumber" class="col-sm-2 col-form-label">Image Upload</label>
	                                <div class="col-sm-10">
	                                    <input class="form-control" type="file" id="formFile">
	                                </div>
	                            </div>
	                            <div class="row mb-3">
	                                <div class="col-sm-12">
	                                    <button type="submit" class="btn btn-outline-dark" style="width: 100px; float:right">SUBMIT</button>
	                                </div>
	                            </div>
                            </form><!-- End General Form Elements -->
            
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </main>
    
    <%@include file="/common_jsp/footer.jsp" %>
</body>
</html>
