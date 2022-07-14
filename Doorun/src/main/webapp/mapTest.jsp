<%@page import="java.util.List"%>
<%@page import="com.doorun.myapp.run.vo.LocationVO"%>
<%@page import="org.springframework.ui.Model"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>원, 선, 사각형, 다각형 표시하기</title>
    
</head>
<%   

List<LocationVO> list = (List<LocationVO>)request.getAttribute("locationList"); 

%>
<body>
<%=list.size() %>
<div id="map" style="width:50%;height:500px;"></div>    

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c162825c55c60498b8e0afcb0f6c2617"></script>

<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.47836955, 126.87926727), // 지도의 중심좌표
    level: 1, // 지도의 확대 레벨
};  

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다

var linePath = [
<% for(int i=0; i<list.size(); i++){%>	
	new kakao.maps.LatLng(<%=list.get(i).getLatitude()%>,<%=list.get(i).getLongitude()%>),
<%}%>
];
//지도에 표시할 선을 생성합니다
var polyline = new kakao.maps.Polyline({
    path: linePath, // 선을 구성하는 좌표배열 입니다
    strokeWeight: 5, // 선의 두께 입니다
    strokeColor: '#FFAE00', // 선의 색깔입니다
    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid' // 선의 스타일입니다
});

// 지도에 선을 표시합니다 
polyline.setMap(map);  


</script>
</body>
</html>