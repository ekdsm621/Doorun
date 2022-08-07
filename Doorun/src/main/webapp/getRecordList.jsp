<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록 리스트</title>
</head>
<body>

<c:forEach items="${recordList }" var="record">
<p>거리 : ${record.distance }&nbsp; 시간:${record.duration } &nbsp; 평균속도:${record.avg_speed } &nbsp; 날짜 : ${record.running_date }
	<a href="../detailRecord.do?id=${record.id }">[정보보기]</a>
<p>

</c:forEach>



</body>
</html>