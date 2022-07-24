<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>진행 중인 모임</title>
<%@include file="/common_jsp/head_settings.jsp" %>
	<style>
	    #make-meeting-card:hover{
	        background-color: #f6f9ff;
	        cursor: pointer;
	    }
	    #map{
	    	width:700px;
	    	height: 400px;
	    	display: block;
	    }
	</style>
</head>
<body>
<%@include file="/common_jsp/header.jsp" %>
<%@include file="/common_jsp/sidebar.jsp" %>
	<!-- 메인 -->
     <main id="main" class="main" style="text-align: center;">
         <div class="row" style="margin-right: 0; padding-right:0;">
             <!-- 모임 게시판 -->
             <div class="col-sm-6" style="margin-top:40px;">
                 <div class="col-sm-12">
                     <!-- 모임 게시판 제목 -->
                     <div class="pagetitle col-sm-12">
                         <h1 style="font-size: 30px;" align="center">참가한 모임</h1>
                     </div>
                     <!-- 모임 컨텐츠들:card -->
                     <div class="card">
                         <div class="card-body row" >
                             <!-- 제목, 지역, 일시 -->
                             <div class="col-sm-8">
                                 <h5 class="card-title col-sm-12" style="padding: 0; text-align: left;">한강에서 함께 달려요~</h5>
                                 <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 지역: 서울 xx동</h6>
                                 <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 일시: 2022.07.10 18:00</h6>
                                 <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 주최자: 이다은</h6>
                             </div>
                             <!-- 모집인원, 프로필 사진 -->
                             <div class="col-sm-4 nav justify-content-end" >
                                 <h5 class="card-subtitle mb-2 text-muted col-sm-12 nav justify-content-end"> </h5>
                                 <h6 class="card-subtitle mb-2 text-muted col-sm-12 nav justify-content-end align-self-end" style="margin: 0; height: 20px;"> 모집인원: 3/4</h6>
                                 <!-- 프로필 사진 -->
                                 <div style="padding: 0;">
                                     <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle" style="width: 40px; height: 40px; padding: 0;">
                                     <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle" style="width: 40px; height: 40px; padding: 0;">
                                     <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle" style="width: 40px; height: 40px; padding: 0;">
                                 </div>
                             </div>
                             <!-- 버튼 -->
                             <div class="col-sm-12 nav justify-content-center" style="margin-top: 15px;">
                                 <button type="button" class="btn btn-outline-primary col-sm-5" style="margin: 0 10px" data-bs-toggle="modal" data-bs-target="#jointeam">
                                     참가하기
                                 </button>
                                 <div class="modal fade" id="jointeam" tabindex="-1">
                                     <div class="modal-dialog modal-dialog-centered">
                                         <div class="modal-content">
                                             <div class="modal-header">
                                                 <h5 class="modal-title">참가하기</h5>
                                             </div>
                                             <div class="modal-body">
                                                 정말 참가 하시겠습니까?
                                             </div>
                                             <div class="modal-footer">
                                                 <button type="button" class="btn btn-danger" style="width:70px">예</button>
                                                 <button type="button" class="btn btn-dark" data-bs-dismiss="modal" aria-label="Close" style="width:70px">아니오</button>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                                 <button type="button" class="btn btn-outline-dark col-sm-5" data-bs-toggle="modal" data-bs-target="#detailteam">
                                     세부내용
                                 </button>
                                 <div class="modal fade" id="detailteam" tabindex="-1">
                                     <div class="modal-dialog modal-dialog-centered">
                                         <div class="modal-content">
                                             <div class="modal-header" style="text-align: center;">
                                                 <h5 class="modal-title" style="display: block;" >한강에서 함께 달려요~</h5>
                                             </div>
                                             <div class="modal-body">
                                                 <img src="assets/img/지도사진.png" style="height: 350px; display: block;">
                                                 오늘 저녁 6시 한강에서 함께 달릴 분 모집합니다<br>
                                                 xx동 xx에서 만나서 출발할거에요~<br>
                                             </div>
                                             <div class="modal-footer">
                                                 <button type="button" class="btn btn-danger">참가</button>
                                                 <button type="button" data-bs-dismiss="modal" aria-label="Close" class="btn btn-dark">닫기</button>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>

             <div class="col-sm-6" style="margin-top:40px;">
                 <div class="col-sm-12">
                     <!-- 모임 게시판 제목 -->
                     <div class="pagetitle col-sm-12">
                         <h1 style="font-size: 30px;" align="center">주최한 모임</h1>
                     </div>
                     <!-- 모임 컨텐츠들:card -->
                     <div class="card">
                         <div class="card-body row" >
                             <!-- 제목, 지역, 일시 -->
                             <h5 class="col-sm-12" style="padding: 0; text-align: center;">주최한 모임이 없습니다</h5>
                         </div>
                     </div>
                     <!-- 모임 주최하기 -->
                     <div class="card" id="make-meeting-card">
                         <div class="card-body row" data-bs-toggle="modal" data-bs-target="#make-meeting" onclick="setTimeout(function(){ map.relayout(); }, 200);">
                             <h5 class="col-sm-12" style="padding: 0; text-align: center;">+ 모임 주최하기</h5>
                         </div>
                     </div>
                     <div class="modal fade" id="make-meeting" tabindex="-1">
                         <div class="modal-dialog modal-dialog-centered">
                             
                                 <div class="modal-content" style="width:750px;">
                                     <div class="modal-header" style="text-align: center;">
                                         <h5 class="modal-title" style="display: block;">모임 주최하기</h5>
                                     </div>
                                     <div class="modal-body">
                                         
                                         <!-- 지도 -->
                                         <div id="map"></div>
										<p><em>지도를 클릭해 정확한 장소를 선택해주세요!</em></p> 
										<div id="clickLatlng"></div>
										
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e276eb8837d2a3c0160dc186ed9a6c5a"></script>
										<script>
										var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										    mapOption = { 
										        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨
										    };
										var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
										
										// 지도를 클릭한 위치에 표출할 마커입니다
										var marker = new kakao.maps.Marker({ 
										    // 지도 중심좌표에 마커를 생성합니다 
										    position: map.getCenter() 
										}); 
										// 지도에 마커를 표시합니다
										marker.setMap(map);
										// 지도에 클릭 이벤트를 등록합니다
										// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
										kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
										    // 클릭한 위도, 경도 정보를 가져옵니다 
										    var latlng = mouseEvent.latLng; 
										    // 마커 위치를 클릭한 위치로 옮깁니다
										    marker.setPosition(latlng);
										    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
										    message += '경도는 ' + latlng.getLng() + ' 입니다';
										    var resultDiv = document.getElementById('clickLatlng'); 
										    resultDiv.innerHTML = message;
										    
										    document.querySelector("#longitude").value= latlng.getLng();
										    document.querySelector("#latitude").value= latlng.getLat();
										});
										</script>
										<form action="/insertMeeting.do" method="post">
                                         <input id="longitude" type="hidden" name="longitude" value="">
                                         <input id="latitude" type="hidden" name="latitude" value=""> 
                                         <input type="hidden" name="master" value="${id }">
                                         <label class="col-sm-12 col-form-label" style="text-align: left;">제목: </label>
                                         <input type="text" class="form-control" name="title">
                                         <label class="col-sm-12 col-form-label" style="text-align: left;">내용: </label>
                                         <input type="text" class="form-control" name="content">
                                         <label class="col-sm-12 col-form-label" style="text-align: left;">장소: </label>
                                         <input type="text" class="form-control" name="location">
                                         <label class="col-sm-12 col-form-label" style="text-align: left;">날짜: </label>
                                         <input type="date" class="form-control" name="meeting_date">
                                         <label class="col-sm-12 col-form-label" style="text-align: left;">총 인원: </label>
                                         <input type="text" class="form-control" name="total_member">
                                         <input type="submit" class="btn btn-danger" value="만들기">
                                         
                                         </form>
                                     </div>
                                     <div class="modal-footer">
                                     </div>
                                 </div>
                             
                         </div>
                     </div>
                 </div>
             </div>
             
         </div>
     </main>
     <%@include file="/common_jsp/footer.jsp" %>

</body>
</html>