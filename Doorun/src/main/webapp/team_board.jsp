<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    
                    <!-- 모임 컨텐츠들:card - 이미 참가하고 있는 -->
                    <c:forEach items="${joined_meeting.keySet() }" var="meet">
                    <div class="card">
                        <div class="card-body row" >
                            <!-- 제목, 지역, 일시 -->
                            <div class="col-sm-8">
                                <h5 class="card-title col-sm-12" style="padding: 0; text-align: left;">${meet.title }</h5>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 지역: ${meet.location }</h6>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 일시: ${meet.meeting_date }</h6>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 주최자: ${meet.master }</h6>
                            </div>
                            <!-- 모집인원, 프로필 사진 -->
                            <div class="col-sm-4 nav justify-content-end" >
                                <h5 class="card-subtitle mb-2 text-muted col-sm-12 nav justify-content-end"> </h5>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12 nav justify-content-end align-self-end" style="margin: 0; height: 20px;"> 모집인원: ${meet.joined_member } / ${meet.total_member }</h6>
                                <!-- 프로필 사진 -->
                                <div style="padding: 0;">
                                	<c:forEach items="${joined_meeting.get(meet) }" var="image">
	                                    <img src="${image }" alt="Profile" class="rounded-circle" style="width: 40px; height: 40px; padding: 0;">
                                	</c:forEach>
                                </div>
                            </div>
                            <!-- 버튼 -->
                            <div class="col-sm-12 nav justify-content-center" style="margin-top: 15px;">
                                <button type="button" class="btn btn-outline-danger col-sm-5" style="margin: 0 10px">
                                    참가완료
                                </button>
                                <button type="button" class="btn btn-outline-dark col-sm-5" data-bs-toggle="modal" data-bs-target="#detailteam${meet.id }" onclick="setTimeout(function(){ map${meet.id}.relayout(); }, 200);">
                                    세부내용
                                </button>
                                <div class="modal fade" id="detailteam${meet.id }" tabindex="-1" >
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content" style="width:750px;">
                                            <div class="modal-header">
                                                <h5 class="modal-title" style="display: block;text-align: center;" >${meet.title }</h5>
                                            </div>
                                            <div class="modal-body">
                                                
                                                <div id="map${meet.id }" style="width:700px;height: 400px;display: block; margin-bottom:10px;"></div>

												<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e276eb8837d2a3c0160dc186ed9a6c5a"></script>
												<script>
													var lat = ${meet.latitude};
													var log = ${meet.longitude};
													var meet_id = ${meet.id};
													var map_id = "map"+meet_id;
													var mapContainer = document.getElementById(map_id), // 지도를 표시할 div 
													    mapOption = { 
													        center: new kakao.maps.LatLng(lat, log), // 지도의 중심좌표
													        level: 3 // 지도의 확대 레벨
													    };
													
													var map${meet.id} = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
													// 마커가 표시될 위치입니다 
													var markerPosition  = map${meet.id}.getCenter();
													// 마커를 생성합니다
													var marker = new kakao.maps.Marker({
													    position: markerPosition
													});
													// 마커가 지도 위에 표시되도록 설정합니다
													marker.setMap(map${meet.id});
													// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
												</script>
												<h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 지역: ${meet.location }</h6>
                                				<h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 일시: ${meet.meeting_date }</h6>
                                				<h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 주최자: ${meet.master }</h6>
                                                <h6 style="text-align:left">내용: ${meet.content }</h6>
                                            </div>
                                            <form action="joinMeeting.do" method="post">
	                                            <div class="modal-footer">
	                                            	<input type="hidden" name="meeting_id" value="${meet.id }">
	                                    			<input type="hidden" name="member_id" value="${id }">
	                                                <input type="submit" class="btn btn-danger" value="참가">
	                                                <button type="button" data-bs-dismiss="modal" aria-label="Close" class="btn btn-dark">닫기</button>
	                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    
                    <!-- 참가하지 않음 -->
                    <c:forEach items="${not_joined_meeting.keySet() }" var="meet">
                    <div class="card">
                        <div class="card-body row" >
                            <!-- 제목, 지역, 일시 -->
                            <div class="col-sm-8">
                                <h5 class="card-title col-sm-12" style="padding: 0; text-align: left;">${meet.title }</h5>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 지역: ${meet.location }</h6>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 일시: ${meet.meeting_date }</h6>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 주최자: ${meet.master }</h6>
                            </div>
                            <!-- 모집인원, 프로필 사진 -->
                            <div class="col-sm-4 nav justify-content-end" >
                                <h5 class="card-subtitle mb-2 text-muted col-sm-12 nav justify-content-end"> </h5>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12 nav justify-content-end align-self-end" style="margin: 0; height: 20px;"> 모집인원: ${meet.joined_member } / ${meet.total_member }</h6>
                                <!-- 프로필 사진 -->
                                <div style="padding: 0;">
                                	<c:forEach items="${not_joined_meeting.get(meet) }" var="image">
	                                    <img src="${image }" alt="Profile" class="rounded-circle" style="width: 40px; height: 40px; padding: 0;">
                                	</c:forEach>
                                </div>
                            </div>
                            <!-- 버튼 -->
                            <div class="col-sm-12 nav justify-content-center" style="margin-top: 15px;">
                                <button type="button" class="btn btn-outline-primary col-sm-5" style="margin: 0 10px" data-bs-toggle="modal" data-bs-target="#jointeam${meet.id }">
                                    참가하기
                                </button>
                                <div class="modal fade" id="jointeam${meet.id }" tabindex="-1">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">참가하기</h5>
                                    </div>
                                    <div class="modal-body">
                                        정말 참가 하시겠습니까?
                                    </div>
                                    <form action="joinMeeting.do" method="post">
	                                    <div class="modal-footer">
	                                    	<input type="hidden" name="meeting_id" value="${meet.id }">
	                                    	<input type="hidden" name="member_id" value="${id }">
	                                        <input type="submit" class="btn btn-danger" style="width:70px" value="예">
	                                        <button type="button" class="btn btn-dark" data-bs-dismiss="modal" aria-label="Close" style="width:70px">아니오</button>
	                                    </div>
	                                </form>
                                    </div>
                                </div>
                                </div>


                                <button type="button" class="btn btn-outline-dark col-sm-5" data-bs-toggle="modal" data-bs-target="#detailteam${meet.id }" onclick="setTimeout(function(){ map${meet.id}.relayout(); }, 200);">
                                    세부내용
                                </button>
                                <div class="modal fade" id="detailteam${meet.id }" tabindex="-1" >
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content" style="width:750px;">
                                            <div class="modal-header" style="text-align: center;">
                                                <h5 class="modal-title" style="display: block;" >${meet.title }</h5>
                                            </div>
                                            <div class="modal-body">
                                                
                                                <div id="map${meet.id }" style="width:700px;height: 400px;display: block; margin-bottom:10px;"></div>

												<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e276eb8837d2a3c0160dc186ed9a6c5a"></script>
												<script>
													var lat = ${meet.latitude};
													var log = ${meet.longitude};
													var meet_id = ${meet.id};
													var map_id = "map"+meet_id;
													var mapContainer = document.getElementById(map_id), // 지도를 표시할 div 
													    mapOption = { 
													        center: new kakao.maps.LatLng(lat, log), // 지도의 중심좌표
													        level: 3 // 지도의 확대 레벨
													    };
													
													var map${meet.id} = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
													// 마커가 표시될 위치입니다 
													var markerPosition  = map${meet.id}.getCenter();
													// 마커를 생성합니다
													var marker = new kakao.maps.Marker({
													    position: markerPosition
													});
													// 마커가 지도 위에 표시되도록 설정합니다
													marker.setMap(map${meet.id});
													// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
												</script>
												<h5 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 지역: ${meet.location }</h5>
                                				<h5 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 일시: ${meet.meeting_date }</h5>
                                				<h5 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 주최자: ${meet.master }</h5>
                                                <h5 style="text-align:left">내용: ${meet.content }</h5>
                                            </div>
                                            <form action="joinMeeting.do" method="post">
	                                            <div class="modal-footer">
	                                            	<input type="hidden" name="meeting_id" value="${meet.id }">
	                                    			<input type="hidden" name="member_id" value="${id }">
	                                                <input type="submit" class="btn btn-danger" value="참가">
	                                                <button type="button" data-bs-dismiss="modal" aria-label="Close" class="btn btn-dark">닫기</button>
	                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="col-sm-3"></div>
    </main>
    <%@include file="/common_jsp/footer.jsp" %>
</body>
</html>