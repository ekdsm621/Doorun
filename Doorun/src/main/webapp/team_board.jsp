<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>모임</title>
<%@include file="/common_jsp/head_settings.jsp" %>
</head>

<body>
<%@include file="/common_jsp/header.jsp" %>
<%@include file="/common_jsp/sidebar.jsp" %>

<!-- 메인 -->
    <main id="main" class="main" style="text-align: center;">
        <div class="row" style="margin-right: 0; padding-right:0;">
            <!-- 모임 게시판 -->
            <div class="col-sm-3"></div>
            <div class="col-sm-6" style="margin-top:40px;">
                <div class="col-sm-12">
                    <!-- 모임 게시판 제목 -->
                    <div class="pagetitle col-sm-12">
                        <h1 style="font-size: 30px;" align="center">모임 게시판</h1>
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


                                <button type="button" class="btn btn-outline-dark col-sm-5" data-bs-toggle="modal" data-bs-target="#detailteam" onclick="setTimeout(function(){ map.relayout(); }, 200);">
                                    세부내용
                                </button>
                                <div class="modal fade" id="detailteam" tabindex="-1">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header" style="text-align: center;">
                                                <h5 class="modal-title" style="display: block;" >한강에서 함께 달려요~</h5>
                                            </div>
                                            <div class="modal-body">
                                                
                                                <div id="map" style="width:100%;height:350px;"></div>

												<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e276eb8837d2a3c0160dc186ed9a6c5a"></script>
												<script>
													var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
													    mapOption = { 
													        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
													        level: 3 // 지도의 확대 레벨
													    };
													var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
													// 마커가 표시될 위치입니다 
													var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
													// 마커를 생성합니다
													var marker = new kakao.maps.Marker({
													    position: markerPosition
													});
													// 마커가 지도 위에 표시되도록 설정합니다
													marker.setMap(map);
													
													// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
													// marker.setMap(null);    
												</script>
                                                
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
                    <div class="card">
                        <div class="card-body row" >
                            <!-- 제목, 지역, 일시 -->
                            <div class="col-sm-8">
                                <h5 class="card-title col-sm-12" style="padding: 0; text-align: left;">한강에서 함께 달려요~</h5>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 지역: 서울 xx동</h6>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 일시: 2022.07.10 18:00</h6>
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
                                <a href="#" class="btn btn-outline-primary col-sm-5" style="margin: 0 10px">참가하기</a>
                                <a href="#" class="btn btn-outline-dark col-sm-5" style="margin: 0 10px">세부내용</a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body row" >
                            <!-- 제목, 지역, 일시 -->
                            <div class="col-sm-8">
                                <h5 class="card-title col-sm-12" style="padding: 0; text-align: left;">한강에서 함께 달려요~</h5>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 지역: 서울 xx동</h6>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 일시: 2022.07.10 18:00</h6>
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
                                <a href="#" class="btn btn-outline-primary col-sm-5" style="margin: 0 10px">참가하기</a>
                                <a href="#" class="btn btn-outline-dark col-sm-5" style="margin: 0 10px">세부내용</a>
                            </div>
                        </div>
                    </div>
                    <!-- card 끝 -->
                </div>
            </div>
        </div>
        <div class="col-sm-3"></div>
    </main>
    <%@include file="/common_jsp/footer.jsp" %>
</body>
</html>