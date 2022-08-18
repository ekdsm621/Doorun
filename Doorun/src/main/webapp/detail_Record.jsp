<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.doorun.myapp.run.vo.RunVO"%>
<%@page import="com.doorun.myapp.run.dao.RunDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록 세부 페이지</title>
</head>
<%
List<RunVO> locationList = (List<RunVO>)request.getAttribute("locationList");
Map<String, Double> map= (Map<String, Double>)request.getAttribute("map");

double startLat = map.get("startLat");
double endLat = map.get("endLat");
double startLong = map.get("startLong");
double endLong = map.get("endLong");
	
double centerLat = map.get("centerLat");
double centerLong = map.get("centerLong");

double distance = map.get("distance");
%>
<body>

<div id="map" style="width:100%;height:300px;"></div>    

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c162825c55c60498b8e0afcb0f6c2617"></script>

<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(<%=centerLat%>, <%=centerLong%>), // 지도의 중심좌표
    level:
	<%if(distance<100){ %>
	2,
	<% }else if(distance>100 && distance<800){ %>
	5,
	<%}else if(distance>800 && distance<1500){ %>
	6,
	<%}else if(distance>1500 && distance<3000){ %>
	7,
	<%}else if(distance>3000 && distance<5000){ %>
	8,
	<%}else if(distance>5000 && distance<8000){ %>
	9,
	<%}else if(distance>8000 && distance<25000){ %>
	10,
	<%}else if(distance>18000 && distance<40000){ %>
	11,
	<%}else if(distance>40000 && distance<100000){ %>
	12,
	<%}else if(distance>100000 && distance<200000){ %>
	13,
	<%}else{ %>
	14,
	<%}%>
	
};  

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다

var linePath = [
<% for(int i=0; i<locationList.size(); i++){%>	
	new kakao.maps.LatLng(<%=locationList.get(i).getLatitude()%>,<%=locationList.get(i).getLongitude()%>),
<%}%>
];
//지도에 표시할 선을 생성합니다
var polyline = new kakao.maps.Polyline({
    path: linePath, // 선을 구성하는 좌표배열 입니다
    strokeWeight: 6, // 선의 두께 입니다
    strokeColor: '#FF0080', // 선의 색깔입니다
    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid' // 선의 스타일입니다
});

// 지도에 선을 표시합니다 
polyline.setMap(map);  


///////////////////////////////////////////////


var positions = [
    {
        content: '<div>출발</div>', 
        latlng: new kakao.maps.LatLng(<%=startLat %>, <%=startLong %>)
    },
    {
        content: '<div>도착</div>', 
        latlng: new kakao.maps.LatLng(<%=endLat %>, <%=endLong %>)
    }
];

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}




</script>

</body>
</html>