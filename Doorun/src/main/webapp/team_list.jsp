<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/assets/css/team_list_css.css" rel="stylesheet">
    <script type="text/javascript" src="/assets/js/insertMeeting.js"></script>
    <title>모임 리스트</title>
</head>
<body>
<%@include file="/common_jsp/header.jsp" %>
    <div class="container-fluid">
        <div class="main">
            <div class="team-header">
                <h2 style="display: inline-block; font-weight: bold;">모임 찾기</h2>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button class="btn btn-dark team-making mb-3" data-bs-toggle="modal" data-bs-target="#make-meeting" onclick="setTimeout(function(){ hosting_map(); }, 200);">모임 주최하기</button>
                </div>
                <div class="modal fade" id="make-meeting" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content" style="width:750px;">
                            <div class="modal-header" style="text-align: center;">
                                <h5 class="modal-title" style="display: block;">모임 주최하기</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!-- 지도 -->
                                <div id="hosting_map" style="width:700px;height: 300px;display: block; margin-bottom:10px;"></div>
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
                                    <textarea rows="4" class="form-control" name="content"></textarea>
                                    <label class="col-sm-12 col-form-label" style="text-align: left;">장소: </label>
                                    <div class="search_boxes">
                                        <div class="search_box" style="display: inline-block; width:49%">
                                            <select class="form-select" name="general" id="general" onchange="insertCategoryChange(this)" required>
                                                <option value="">시/도 선택</option>
                                                <option value="강원">강원</option>
                                                <option value="경기">경기</option>
                                                <option value="경남">경남</option>
                                                <option value="경북">경북</option>
                                                <option value="광주">광주</option>
                                                <option value="대구">대구</option>
                                                <option value="대전">대전</option>
                                                <option value="부산">부산</option>
                                                <option value="서울">서울</option>
                                                <option value="울산">울산</option>
                                                <option value="인천">인천</option>
                                                <option value="전남">전남</option>
                                                <option value="전북">전북</option>
                                                <option value="제주">제주</option>
                                                <option value="충남">충남</option>
                                                <option value="충북">충북</option>
                                            </select>
                                        </div>
                                        <div class="search_box" style="display: inline-block; width:49%; margin-left:1%">
                                            <select class="form-select" name="state" id="insert_state" required>
                                                <option value="">군/구 선택</option>
                                            </select>
                                        </div>
                                    </div>
                                    <label class="col-sm-12 col-form-label" style="text-align: left;">날짜: </label>
                                    <input type="date" class="form-control" name="meeting_date">
                                    <label class="col-sm-12 col-form-label" style="text-align: left;">시간: </label>
                                    <input type="time" class="form-control" name="meeting_time">
                                    <label class="col-sm-12 col-form-label" style="text-align: left;">총 인원: </label>
                                    <input type="text" class="form-control" name="total_member">
                                    <div style="margin-top:10px" class="d-grid gap-2 col-6 mx-auto">
                                        <input type="submit" class="btn btn-danger" value="만들기">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <table class="table table-striped table-hover table-borderless">
                    <thead>
                        <tr class="mb-4">
                            <td class="p-4" style="background-color:rgba(0, 0, 0, 0.08);">
                                <form class="row ps-3" action="/searchMeeting.do" method="post">
                                    <div class="col-4">
                                        <input class="form-control" type="text" placeholder="모임 이름" aria-label="default input example" name="team_name">
                                    </div>
                                    <div class="col-6 row">
                                        <div class="search_boxes">
	                                        <div class="search_box" style="display: inline-block; width:48%">
	                                            <select class="form-select" name="general" id="general" onchange="categoryChange(this)">
	                                                <option value="">시/도 선택</option>
	                                                <option value="강원">강원</option>
	                                                <option value="경기">경기</option>
	                                                <option value="경남">경남</option>
	                                                <option value="경북">경북</option>
	                                                <option value="광주">광주</option>
	                                                <option value="대구">대구</option>
	                                                <option value="대전">대전</option>
	                                                <option value="부산">부산</option>
	                                                <option value="서울">서울</option>
	                                                <option value="울산">울산</option>
	                                                <option value="인천">인천</option>
	                                                <option value="전남">전남</option>
	                                                <option value="전북">전북</option>
	                                                <option value="제주">제주</option>
	                                                <option value="충남">충남</option>
	                                                <option value="충북">충북</option>
	                                            </select>
	                                        </div>
	                                        <div class="search_box" style="display: inline-block; width:48%;">
	                                            <select class="form-select" name="state" id="select_state">
	                                                <option value="">군/구 선택</option>
	                                            </select>
	                                        </div>
	                                    </div>
	                                    <script>
								        function categoryChange(e) {
								            const state = document.getElementById("select_state");
								
								            const gangwon = ["전체","강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
								            const gyeonggi = ["전체","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
								            const gyeongsangnam = ["전체","거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
								            const gyeongsangbuk = ["전체","경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
								            const gwangju = ["전체","광산구", "남구", "동구", "북구", "서구"];
								            const daegu = ["전체","남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
								            const daejeon = ["전체","대덕구", "동구", "서구", "유성구", "중구"];
								            const busan = ["전체","강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
								            const seoul = ["전체","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
								            const ulsan = ["전체","남구","동구","북구","중구","울주군"];
								            const incheon = ["전체","계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
								            const jeonnam = ["전체","광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
								            const jeonbuk = ["전체","군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
								            const jeju = ["전체","서귀포시","제주시","남제주군","북제주군"];
								            const chungbuk = ["전체","제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
								            
								            if (e.value == "강원") {
								                add = gangwon;
								            } else if (e.value == "경기") {
								                add = gyeonggi;
								            } else if (e.value == "경남") {
								                add = gyeongsangnam;
								            } else if (e.value == "경북") {
								                add = gyeongsangbuk;
								            } else if (e.value == "광주") {
								                add = gwangju;
								            } else if (e.value == "대구") {
								                add = daegu;
								            } else if (e.value == "대전") {
								                add = daejeon;
								            } else if (e.value == "부산") {
								                add = busan;
								            } else if (e.value == "서울") {
								                add = seoul;
								            } else if (e.value == "울산") {
								                add = ulsan;
								            } else if (e.value == "인천") {
								                add = incheon;
								            } else if (e.value == "전남") {
								                add = jeonnam;
								            } else if (e.value == "전북") {
								                add = jeonbuk;
								            } else if (e.value == "제주") {
								                add = jeju;
								            } else if (e.value == "충남") {
								                add = chungnam;
								            } else if (e.value == "충북") {
								                add = chungbuk;
								            }
								
								            state.options.length = 1;
								            // 군/구 갯수;
								            for (property in add) {
								                let opt = document.createElement("option");
								                opt.value = add[property];
								                opt.innerHTML = add[property];
								                state.appendChild(opt);
								            }
								        }
								    </script>
                                    </div>    
                                    <div class="col-2">
                                        <input type="submit" class="btn btn-dark" style="width: 100%;" value="검색">
                                    </div>
                                </form>
                            </td>
                        </tr>
                    </thead>
                </table>
                <hr>
            </div>
            
            <div class="team-body">
                <table class="table table-striped table-hover table-borderless">
                    <tbody>
                        <tr></tr>
                        
                        <!-- 참가한 모임 -->
                        <c:forEach items="${joined_meeting.keySet() }" var="meet">
                        <tr>
                            <td>
                                <table class="table table-borderless team-tbl">
                                    <tr>
                                        <th style="width: 50%;" class="px-5 py-3">${meet.title }</th>
                                        <td style="width: 35%; text-align:right; font-size:0.8em; padding-right:4em" class="align-bottom pb-2">
                                            모집인원: ${meet.joined_member } / ${meet.total_member }
                                        </td>
                                        <td rowspan="4" class="align-middle pe-5" style="width: 15%;">
                                        	<!-- 참가하기 버튼 -->
                                            <button type="button" class="btn btn-danger mb-1" style="width: 100%;" data-bs-toggle="modal" data-bs-target="#teamJoinModal">
                                            	참가완료
                                            </button>
                                            <div class="modal fade" id="teamJoinModal" tabindex="-1" aria-labelledby="teamJoinModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                    <div class="modal-content">
                                                    
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="teamJoinModalLabel">모임 참가하기</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            모임에 참가하시겠습니까?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-danger">참가하기</button>
                                                            <button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소하기</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
    										
    										<!-- 상세정보 버튼 -->
                                            <button class="btn btn-outline-dark mt-1" style="width: 100%;" data-bs-toggle="modal" data-bs-target="#detailteam${meet.id }" onclick="setTimeout(function(){ map${meet.id}.relayout();}, 200); setTimeout(function(){ map${meet.id}.setCenter(new kakao.maps.LatLng(${meet.latitude }, ${meet.longitude }));}, 250);">
                                            	상세정보
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
																
																setTimeout(function(){ map${meet.id}.setCenter(center);}, 100);
															</script>
															<h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 지역: ${meet.location }</h6>
			                                				<h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 일시: ${meet.meeting_date }</h6>
			                                				<h6 class="card-subtitle mb-2 text-muted col-sm-12" style="padding: 0; text-align: left;"> 주최자: ${meet.master }</h6>
			                                                <h6 style="text-align:left"><br>${meet.content }</h6>
			                                            </div>
			                                            <div class="modal-footer">
			                                            	<input type="hidden" name="meeting_id" id="meeting_id" value="${meet.id }">
			                                    			<input type="hidden" name="member_id" id="member_id" value="${id }">
			                                                <button type="button" class="btn btn-danger" id="joinBtn">참가</button>
			                                                <button type="button" data-bs-dismiss="modal" aria-label="Close" class="btn btn-dark">닫기</button>
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-5"><small>지역: ${meet.location }</small></td>
                                        <td style="padding-right:3em" rowspan="3" class="align-top">
                                			<c:forEach items="${joined_meeting.get(meet) }" var="member_img">
			                                    <img src="/upload_img/profile_img/${member_img.profile_image }" alt="Profile" class="rounded-circle float-end" style="border-radius: 50em; width:55px">
		                                	</c:forEach>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-5"><small>일시: ${meet.meeting_date }</small></td>
                                    </tr>
                                    <tr>
                                        <td class="px-5 pb-3"><small>주최자: ${meet.master }</small></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </c:forEach>
                        
                        <!-- 참가하지 않은 모임 -->
                        <c:forEach items="${not_joined_meeting.keySet() }" var="meet">
                        <tr>
                            <td>
                                <table class="table table-borderless team-tbl">
                                    <tr>
                                        <th style="width: 50%;" class="px-5 py-3">${meet.title }</th>
                                        <td style="width: 35%; text-align:right; font-size:0.8em; padding-right:4em" class="align-bottom pb-2">
                                            모집인원: ${meet.joined_member } / ${meet.total_member }
                                        </td>
                                        <td rowspan="4" class="align-middle pe-5" style="width: 15%;">
                                        	<!-- 참가하기 버튼 -->
                                            <button type="button" class="btn btn-outline-danger mb-1" style="width: 100%;" data-bs-toggle="modal" data-bs-target="#jointeam${meet.id }"data-bs-toggle="modal" data-bs-target="#jointeam${meet.id }">
                                            	참가하기
                                            </button>
                                            <div class="modal fade" id="jointeam${meet.id }" tabindex="-1" aria-labelledby="teamJoinModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                    <div class="modal-content">
                                                    
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="teamJoinModalLabel">모임 참가하기</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            모임에 참가하시겠습니까?
                                                        </div>
                                                        <form action="joinMeeting.do" method="post">
						                                    <div class="modal-footer">
						                                    	<input type="hidden" name="meeting_id" value="${meet.id }">
						                                    	<input type="hidden" name="member_id" value="${id }">
						                                        <input type="submit" class="btn btn-danger" style="width:70px" value="참가">
						                                        <button type="button" class="btn btn-dark" data-bs-dismiss="modal" aria-label="Close" style="width:70px">취소</button>
						                                    </div>
						                                </form>
                                                    </div>
                                                </div>
                                            </div>
    										
    										<!-- 상세정보 버튼 -->
                                            <button class="btn btn-outline-dark mt-1" style="width: 100%;" data-bs-toggle="modal" data-bs-target="#detailteam${meet.id }" onclick="setTimeout(function(){ map${meet.id}.relayout(); }, 200); setTimeout(function(){ map${meet.id}.setCenter(new kakao.maps.LatLng(${meet.latitude }, ${meet.longitude }));}, 250);">
                                            	상세정보
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
			                                                <h6 style="text-align:left"><br>${meet.content }</h6>
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
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-5"><small>지역: ${meet.location }</small></td>
                                        <td style="padding-right:3em" rowspan="3" class="align-top">
                                        	<c:forEach items="${not_joined_meeting.get(meet) }" var="image">
	                                    		<img src="/upload_img/profile_img/${image.profile_image }" alt="Profile" class="rounded-circle float-end" style="border-radius: 50em; width:55px">
                                			</c:forEach>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-5"><small>일시: ${meet.meeting_date }</small></td>
                                    </tr>
                                    <tr>
                                        <td class="px-5 pb-3"><small>주최자: ${meet.master }</small></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%@include file="/common_jsp/footer.jsp" %>
    
</body>
</html>