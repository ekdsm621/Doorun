<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>진행 중인 모임</title>
<%@include file="/common_jsp/head_settings.jsp" %>
	<style>
	    #make-meeting-card:hover{
	        background-color: #f6f9ff;
	        cursor: pointer;
	    }
	    #map, #hosting_map, #update_map{
	    	width:700px;
	    	height: 400px;
	    	display: block;
	    }
	</style>
	<script type="text/javascript" src="/assets/js/insertMeeting.js"></script>
</head>
<body>
<%@include file="/common_jsp/header.jsp" %>
<%@include file="/common_jsp/sidebar.jsp" %>
	<!-- 메인 -->
     <main id="main" class="main" style="text-align: center;">
         <div class="row" style="margin-right: 0; padding-right:0;">
             <!-- 모임 게시판 -->
             
             <!-- 참가한 모임 -->
             <div class="col-sm-6" style="margin-top:40px;">
                 <div class="col-sm-12">
                     <!-- 모임 게시판 제목 -->
                     <div class="pagetitle col-sm-12">
                         <h1 style="font-size: 30px;" align="center">참가한 모임</h1>
                     </div>
                     <c:forEach items="${joined_meeting.keySet() }" var="join">
                    <div class="card">
                        <div class="card-body row" >
                            <!-- 제목, 지역, 일시 -->
                            <div class="col-sm-8">
                                <h5 class="card-title col-sm-12" style="padding: 0; text-align: left;">${join.title }</h5>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 지역: ${join.location }</h6>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 일시: ${join.meeting_date }</h6>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 주최자: ${join.master }</h6>
                            </div>
                            <!-- 모집인원, 프로필 사진 -->
                            <div class="col-sm-4 nav justify-content-end" >
                                <h5 class="card-subtitle mb-2 text-muted col-sm-12 nav justify-content-end"> </h5>
                                <h6 class="card-subtitle mb-2 text-muted col-sm-12 nav justify-content-end align-self-end" style="margin: 0; height: 20px;"> 모집인원: ${join.joined_member } / ${join.total_member }</h6>
                                <!-- 프로필 사진 -->
                                <div style="padding: 0;">
                                	<c:forEach items="${joined_meeting.get(join) }" var="image">
	                                    <img src="/upload_img/profile_img/${image.profile_image }" alt="Profile" class="rounded-circle" style="width: 40px; height: 40px; padding: 0;">
                                	</c:forEach>
                                </div>
                            </div>
                            <!-- 버튼 -->
                            <div class="col-sm-12 nav justify-content-center" style="margin-top: 15px;">
                                <button type="button" class="btn btn-outline-danger col-sm-5" style="margin: 0 10px" data-bs-toggle="modal" data-bs-target="#jointeam${join.id }">
                                    참가취소
                                </button>
                                <div class="modal fade" id="jointeam${join.id }" tabindex="-1">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">참가취소</h5>
                                    </div>
                                    <div class="modal-body">
                                        정말 취소 하시겠습니까?
                                    </div>
                                    <form action="deleteJoin.do" method="post">
	                                    <div class="modal-footer">
	                                    	<input type="hidden" name="meeting_id" value="${join.id }">
	                                    	<input type="hidden" name="member_id" value="${id }">
	                                        <input type="submit" class="btn btn-danger" style="width:70px" value="예">
	                                        <button type="button" class="btn btn-dark" data-bs-dismiss="modal" aria-label="Close" style="width:70px">아니오</button>
	                                    </div>
	                                </form>
                                    </div>
                                </div>
                                </div>


                                <button type="button" class="btn btn-outline-dark col-sm-5" data-bs-toggle="modal" data-bs-target="#detailteam${join.id }" onclick="setTimeout(function(){ map${join.id}.relayout(); }, 200);">
                                    세부내용
                                </button>
                                <div class="modal fade" id="detailteam${join.id }" tabindex="-1" >
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content" style="width:750px;">
                                            <div class="modal-header" style="text-align: center;">
                                                <h5 class="modal-title" style="display: block; text-align:center" >${join.title }</h5>
                                            </div>
                                            <div class="modal-body">
                                                
                                                <div id="map${join.id }" style="width:700px;height: 400px;display: block; margin-bottom:20px"></div>

												<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e276eb8837d2a3c0160dc186ed9a6c5a"></script>
												<script>
													var lat = ${join.latitude};
													var log = ${join.longitude};
													var meet_id = ${join.id};
													var map_id = "map"+meet_id;
													
													var mapContainer = document.getElementById(map_id), // 지도를 표시할 div 
													    mapOption = { 
													        center: new kakao.maps.LatLng(lat, log), // 지도의 중심좌표
													        level: 3 // 지도의 확대 레벨
													    };
													var map${join.id } = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
													// 마커가 표시될 위치입니다 
													var markerPosition  = map${join.id }.getCenter();
													// 마커를 생성합니다
													var marker = new kakao.maps.Marker({
													    position: markerPosition
													});
													// 마커가 지도 위에 표시되도록 설정합니다
													marker.setMap(map${join.id });
													// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
													// marker.setMap(null);    
												</script>
                                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 지역: ${join.location }</h6>
                                				<h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 일시: ${join.meeting_date }</h6>
                                				<h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 주최자: ${join.master }</h6>
                                                <h6 style="text-align:left">내용: ${join.content }</h6>
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
                    </c:forEach>
                 </div>
             </div>
             <!-- 참가한 모임 끝 -->

			 <!-- 주최한 모임 -->
             <div class="col-sm-6" style="margin-top:40px;">
                 <div class="col-sm-12">
                     <!-- 모임 게시판 제목 -->
                     <div class="pagetitle col-sm-12">
                         <h1 style="font-size: 30px;" align="center">주최한 모임</h1>
                     </div>
                     <!-- 모임 컨텐츠들:card -->
                     
                     <!-- 제목, 지역, 일시 -->
                     <c:choose>
	                     <c:when test="${hosting_meeting == null }">
		                    <div class="card">
	                        	<div class="card-body row" >
	                     			<h5 class="col-sm-12" style="padding: 0; text-align: center;">주최한 모임이 없습니다</h5>
	                     		</div>
	                     	</div>                     
                         </c:when>
                         <c:otherwise>
		                     <c:forEach items="${hosting_meeting.keySet() }" var="host">
			                     <div class="card">
			                        <div class="card-body row" >
			                            <!-- 제목, 지역, 일시 -->
			                            <div class="col-sm-8">
			                                <h5 class="card-title col-sm-12" style="padding: 0; text-align: left;">${host.title }</h5>
			                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 지역: ${host.location }</h6>
			                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 일시: ${host.meeting_date }</h6>
			                                <h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 주최자: ${host.master }</h6>
			                            </div>
			                            <!-- 모집인원, 프로필 사진 -->
			                            <div class="col-sm-4 nav justify-content-end" >
			                                <h5 class="card-subtitle mb-2 text-muted col-sm-12 nav justify-content-end"> </h5>
			                                <h6 class="card-subtitle mb-2 text-muted col-sm-12 nav justify-content-end align-self-end" style="margin: 0; height: 20px;"> 모집인원: ${host.joined_member } / ${host.total_member }</h6>
			                                <!-- 프로필 사진 -->
			                                <div style="padding: 0;">
			                                	<c:forEach items="${hosting_meeting.get(host) }" var="image">
				                                    <img src="/upload_img/profile_img/${image.profile_image }" alt="Profile" class="rounded-circle" style="width: 40px; height: 40px; padding: 0;">
			                                	</c:forEach>
			                                </div>
			                            </div>
			                            
			                            <!-- 모임 삭제 / 수정 버튼 -->
			                            <div class="col-sm-12 nav justify-content-center" style="margin-top: 15px;">
			                            	<!-- 모임 삭제 버튼 -->
			                                <button type="button" class="btn btn-outline-danger col-sm-5" style="margin: 0 10px" data-bs-toggle="modal" data-bs-target="#jointeam${host.id }">
			                                    모임삭제
			                                </button>
			                                <div class="modal fade" id="jointeam${host.id }" tabindex="-1">
				                                <div class="modal-dialog modal-dialog-centered">
				                                    <div class="modal-content">
					                                    <div class="modal-header">
					                                        <h5 class="modal-title">모임삭제</h5>
					                                    </div>
					                                    <div class="modal-body">
					                                        정말 삭제 하시겠습니까?
					                                    </div>
					                                    <form action="deleteMeeting.do" method="post">
						                                    <div class="modal-footer">
						                                    	<input type="hidden" name="meeting_id" value="${host.id }">
						                                        <input type="submit" class="btn btn-danger" style="width:70px" value="예">
						                                        <button type="button" class="btn btn-dark" data-bs-dismiss="modal" aria-label="Close" style="width:70px">아니오</button>
						                                    </div>
						                                </form>
				                                    </div>
				                                </div>
			                                </div>
			                                <!-- 모임 수정 버튼 -->
			                                <button type="button" class="btn btn-outline-dark col-sm-5" style="margin: 0 10px" data-bs-toggle="modal" data-bs-target="#update-meeting${host.id }" onclick="setTimeout(function(){ map${host.id}.relayout(); }, 200);">
			                                    모임수정
			                                </button>
			                                <div class="modal fade" id="update-meeting${host.id }" tabindex="-1">
												<div class="modal-dialog modal-dialog-centered">
						                         	<div class="modal-content" style="width:750px;">
						                            	<div class="modal-header" style="text-align: center;">
						                                	<h5 class="modal-title" style="display: block;">모임 수정하기</h5>
						                                </div>
						                                <div class="modal-body">
					                                        <!-- 지도 -->
					                                        <div id="update_map${host.id }" style="width:700px; height: 400px; display: block;"></div>
															<p><em>지도를 클릭해 정확한 장소를 선택해주세요!</em></p> 
															
															<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e276eb8837d2a3c0160dc186ed9a6c5a"></script>
															<script>
																var lat = ${host.latitude};
																var log = ${host.longitude};
																var meet_id = ${host.id};
																var map_id = "update_map"+meet_id;
																var mapContainer = document.getElementById(map_id), // 지도를 표시할 div
																    mapOption = { 
																        center: new kakao.maps.LatLng(lat, log), // 지도의 중심좌표
																        level: 3 // 지도의 확대 레벨
																    };
																var map${host.id } = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
																
																// 지도를 클릭한 위치에 표출할 마커입니다
																var marker${host.id} = new kakao.maps.Marker({ 
																    // 지도 중심좌표에 마커를 생성합니다 
																    position: map${host.id }.getCenter() 
																}); 
																// 지도에 마커를 표시합니다
																marker${host.id}.setMap(map${host.id });
																// 지도에 클릭 이벤트를 등록합니다
																// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
																kakao.maps.event.addListener(map${host.id }, 'click', function(mouseEvent) {        
																    // 클릭한 위도, 경도 정보를 가져옵니다 
																    var latlng = mouseEvent.latLng; 
																    // 마커 위치를 클릭한 위치로 옮깁니다
																    marker${host.id}.setPosition(latlng);
																    
																    document.querySelector("#longitude_update${host.id}").value= latlng.getLng();
																    document.querySelector("#latitude_update${host.id}").value= latlng.getLat();
																});
															</script>
															<form action="/updateMeeting.do" method="post" name="update_frm" onsubmit="return checkUpdate()">
						                                         <input id="longitude_update${host.id}" type="hidden" name="longitude" value="${host.longitude }">
						                                         <input id="latitude_update${host.id}" type="hidden" name="latitude" value="${host.latitude }"> 
						                                         <input type="hidden" name="id" value="${host.id }">
						                                         <label class="col-sm-12 col-form-label" style="text-align: left;">제목: </label>
						                                         <input type="text" class="form-control" name="title" value="${host.title }">
						                                         <label class="col-sm-12 col-form-label" style="text-align: left;">내용: </label>
						                                         <input type="text" class="form-control" name="content" value="${host.content }">
						                                         <label class="col-sm-12 col-form-label" style="text-align: left;">장소: </label>
						                                         <input type="text" class="form-control" name="location" value="${host.location }">
						                                         <label class="col-sm-12 col-form-label" style="text-align: left;">날짜: </label>
						                                         <input type="date" class="form-control" name="meeting_date" value="${host.meeting_date}">
						                                         <label class="col-sm-12 col-form-label" style="text-align: left;">시간: </label>
                                         						 <input type="time" class="form-control" name="meeting_time" value="${host.meeting_time}">
						                                         <label class="col-sm-12 col-form-label" style="text-align: left;">총 인원: </label>
						                                         <input type="text" class="form-control" name="total_member" value="${host.total_member }">
						                                         <div style="margin-top:10px">
							                                         <input type="submit" class="btn btn-danger" value="수정" >
							                                         <button type="button" class="btn btn-dark" data-bs-dismiss="modal" aria-label="Close" >취소</button>
						                                         </div>
						                                     </form>
						                                 </div>
					                                 </div>
						                         </div>
                    						 </div>
			                                <!-- 모임 수정 버튼 끝 -->
										</div>
			                		</div>
			                	</div>
		                    </c:forEach>                         
                         </c:otherwise>  
                     </c:choose>
                     <!-- 주최한 모임 끝-->
                     
                     <!-- 모임 주최하기 -->
                     <div class="card" id="make-meeting-card">
                         <div class="card-body row" data-bs-toggle="modal" data-bs-target="#make-meeting" onclick="setTimeout(function(){ hosting_map(); }, 200);">
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
                                         <div id="hosting_map"></div>
										<p><em>지도를 클릭해 정확한 장소를 선택해주세요!</em></p> 
										
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e276eb8837d2a3c0160dc186ed9a6c5a"></script>
										<script>
										function hosting_map(){
											var mapContainer = document.getElementById('hosting_map'), // 지도를 표시할 div 
											    mapOption = { 
											        center: new kakao.maps.LatLng(33.44733433956454, 126.56966682635797), // 지도의 중심좌표
											        level: 3 // 지도의 확대 레벨
											    };
											var hosting_map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
											
											// 지도를 클릭한 위치에 표출할 마커입니다
											var marker = new kakao.maps.Marker({ 
											    // 지도 중심좌표에 마커를 생성합니다 
											    position: hosting_map.getCenter() 
											}); 
											// 지도에 마커를 표시합니다
											marker.setMap(hosting_map);
											// 지도에 클릭 이벤트를 등록합니다
											// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
											    
											kakao.maps.event.addListener(hosting_map, 'click', function(mouseEvent) {        
												        
										        // 클릭한 위도, 경도 정보를 가져옵니다 
										        var latlng = mouseEvent.latLng; 
										        
										        // 마커 위치를 클릭한 위치로 옮깁니다
										        marker.setPosition(latlng);
											        
											    document.querySelector("#longitude").value= latlng.getLng();
											    document.querySelector("#latitude").value= latlng.getLat();
										    });
										}
										</script>
										<form action="/insertMeeting.do" method="post" name="frm" onsubmit="return checkInsert()">
                                         <input id="longitude" type="hidden" name="longitude" value="126.56966682635797">
                                         <input id="latitude" type="hidden" name="latitude" value="33.44733433956454"> 
                                         <input type="hidden" name="master" value="${id }">
                                         <label class="col-sm-12 col-form-label" style="text-align: left;">제목: </label>
                                         <input type="text" class="form-control" name="title">
                                         <label class="col-sm-12 col-form-label" style="text-align: left;">내용: </label>
                                         <input type="text" class="form-control" name="content">
                                         <label class="col-sm-12 col-form-label" style="text-align: left;">장소: </label>
                                         <input type="text" class="form-control" name="location">
                                         <label class="col-sm-12 col-form-label" style="text-align: left;">날짜: </label>
                                         <input type="date" class="form-control" name="meeting_date">
                                         <label class="col-sm-12 col-form-label" style="text-align: left;">시간: </label>
                                         <input type="time" class="form-control" name="meeting_time">
                                         <label class="col-sm-12 col-form-label" style="text-align: left;">총 인원: </label>
                                         <input type="text" class="form-control" name="total_member">
                                         <div style="margin-top:10px">
	                                         <input type="submit" class="btn btn-danger" value="만들기">
                                         </div>
                                         </form>
                                     </div>
                                 </div>
                             	<!-- 모임 주최하기 끝 -->
                         </div>
                     </div>
                 </div>
             </div>
             
         </div>
     </main>
     <%@include file="/common_jsp/footer.jsp" %>

</body>
</html>