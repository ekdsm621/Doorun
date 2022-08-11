<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>크루 리스트</title>
<script type="text/javascript" src="/assets/js/insertMeeting.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="/assets/css/crew_list.css" rel="stylesheet" >
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
</head>
<body>
<%@include file="/common_jsp/header.jsp" %>

    <div class="container" style="margin-top: 100px; margin-left: 400px">
        <h5 class="section-title h1">크루</h5>
        <div class="row">
            <!-- Team member -->
            <c:forEach items="${crewList }" var="crew">
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" >
                    <div class="mainflip flip-0">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="upload_img/crew_img/${crew.image_file }" alt="card image"></p>
                                    <h4 class="card-title">${crew.name }</h4>
                                    <p class="card-text">총 거리 ${crew.distance }</p>
                                    <p class="card-text">크루원 수 ${crew.member }</p>
                                    <a href="https://www.fiverr.com/share/qb8D02" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">${crew.name }</h4>
                                    <p class="card-text">${crew.describe }</p>
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                <i class="fa fa-facebook"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                <i class="fa fa-twitter"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                <i class="fa fa-skype"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="https://www.fiverr.com/share/qb8D02">
                                                <i class="fa fa-google"></i>
                                            </a>
                                        </li>
                                    </ul>
                                    <a href="../detailCrew.do?id=${crew.id }"><button type="button" class="btn btn-primary" id="checkBtn">크루정보</button></a>
                                    <a href="../joinCrew.do?id=${crew.id }"><button type="button" class="btn btn-primary" id="checkBtn">가입하기</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			</c:forEach>

        </div>
    </div>
<%@include file="/common_jsp/footer.jsp" %>

</body>
</html>