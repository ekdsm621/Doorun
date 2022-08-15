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
    <title>게시판 글</title>
</head>
<body> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   	<%@include file="/common_jsp/header.jsp" %>
 	  <div class="container-fluid">
	  	<h2><strong>전체게시판</strong></h2>
	  	<div class="board_view_wrap">
	  		<div class="board_view">
	  			<div class="title">
	  				${board.title }
	  			</div>
	  			<div class="info">
	  				<dl>
	  					<dt>번호</dt>
	  					<dd>${board.id }</dd>
	  				</dl>
	  				<dl>
	  					<dt>작성자</dt>
	  					<dd>${board.writer }</dd>
	  				</dl>
	  				<dl>
	  					<dt>작성일</dt>
	  					<dd>${board.reg_date }</dd>
	  				</dl>
	  				<c:if test="${id eq board.writer }">
			             <a href="/deleteBoard.do?id=${board.id }&board_id=${param.board_id}"><button class="btn btn-outline-danger" style="float: right; margin-left: 5px;">삭제</button></a>
			             <a href="/updateBoard.do?id=${board.id }&board_id=${param.board_id}"><button class="btn btn-outline-secondary" style="float: right;">수정</button></a>                        
		            </c:if>	  			
	  			</div>
	  			<div class="content">
	  				<c:if test="${not empty board.image_file }">                        
                       	<img src="upload_img/free_board/${board.image_file }" height="400px" style="display: block;">
	                    <br>
                    </c:if>
	  				${board.content }
	  			</div>	  		
	  		</div>
	  		<div class="content">
	            <h5 class="my-3 mx-3"><strong>댓글</strong></h5>
	            <c:forEach items="${reply }" var="re">
	             <div class="row mb-3 mx-4" style="padding: 10px; background-color: #f1f1f1;; border-radius: 10px">
	                 <div style="text-align:left">
	                 	<strong>${re.writer }</strong>
	                 </div>
	                 <br>
	                 <div class="col-sm-10">
	                     <span>
	                     	${re.content }
	                     </span>
	                 </div>
	                 <c:if test="${id == re.writer }">
			            <form action="/deleteReply.do" method="post">
			            	<input type="hidden" name="id" value="${re.id }">
			            	<input type="hidden" name="board_id" value="${re.board_id }">
			                 <div style="text-align:right; color:#e90000">
								<input type="submit" class="" value="삭제" style="border:0px; color:red;">
			                 </div>
			            </form>
	                 </c:if>
	             </div>
	            </c:forEach>
	            <!-- Horizontal Form -->
	            <form action="/reply.do" method="post">
	            	<input type="hidden" name="board_id" value="${board.id }">
	            	<input type="hidden" name="writer" value=<%=session.getAttribute("nickname") %>>
	                <div class="row mb-1 mx-auto" style="padding: 10px;">
	                    <label class="col-sm-1 col-form-label">댓글 입력: </label>
	                    <div class="col-sm-8">
	                        <input type="text" class="form-control" id="inputText" name="content" style="width:100%">
	                    </div>
	                    <div class="col-sm-2 ">
	                        <button type="submit" class="btn btn-outline-primary col-sm-5 ms-3" style="float: left; width:45%">입력</button>
	                    </div>
	                </div>
	            </form><!-- End Horizontal Form -->
	            <hr style="color:black">
            </div>
            <c:if test="${param.board_id == 1 }">
	            <a href="/boardList.do?id=1" class="btn btn-dark team-making mb-3" style="margin-left:10px; float:right">목록</a>
            </c:if>
            <c:if test="${param.board_id != 1 }">
	            <a href="/detailCrew.do?id=${param.board_id }" class="btn btn-dark team-making mb-3" style="margin-left:10px; float:right">목록</a>
            </c:if>
	  		</div>			
	   </div>
    <%@include file="/common_jsp/footer.jsp" %>
</body>
</html>