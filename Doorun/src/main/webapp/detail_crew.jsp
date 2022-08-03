<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>크루 정보</title>
<%@include file="/common_jsp/head_settings.jsp" %>

<script type="text/javascript" src="/assets/js/insertMeeting.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
</head>
<body>
<%@include file="/common_jsp/header.jsp" %>
<%@include file="/common_jsp/sidebar.jsp" %>

<div style="margin-top: 100px; margin-left:500px;">
<p>크루이름 : ${detailCrew.name }</p>
<p>크루장: ${detailCrew.master }</p>
<p>크루 총 달린거리: ${detailCrew.distance }</p>
<p>크루 멤버수:${detailCrew.member }</p>
<p>크루 설명 :${detailCrew.describe }</p>

<c:forEach items="${crewMemberList }" var="member">
<p>닉네임 : ${member.nickname }&nbsp; 총 달린거리:${member.totaldistance } &nbsp; 총 달린시간:${member.totalduration }<p>

</c:forEach>
</div>



<%@include file="/common_jsp/footer.jsp" %>

</body>
</html>