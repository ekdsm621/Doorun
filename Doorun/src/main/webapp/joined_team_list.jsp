<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/assets/css/team_list_css.css" rel="stylesheet">
    <title>참여한 모임</title>
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <%@include file="/common_jsp/header.jsp" %>
    <div class="container-fluid">
        <div class="main row">
            <div class="team-header">
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
                                    <script>
								        function insertCategoryChange(e) {
								            const state = document.getElementById("insert_state");
								
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
            </div>

			<!-- 참여한 모임 -->
            <div class="team-body col-6">
                <h3 style="font-weight: bold;">참여한 모임</h3>
                <hr>
                <table class="table">
                    <tbody>
                        <tr></tr>
                        <c:forEach items="${joined_meeting.keySet() }" var="join">
                        <tr>
                            <td>
                                <table class="table table-borderless team-tbl">
                                    <tr>
                                        <th style="width: 70%;" class="px-5 py-3">${join.title }</th>
                                        <td rowspan="5" class="align-middle pe-5" style="width: 30%;">
                                            <button type="button" class="btn btn-outline-danger mb-1" style="width: 100%;" data-bs-toggle="modal" data-bs-target="#jointeam${join.id }">참가취소</button>
                                            <div class="modal fade" id="jointeam${join.id }" tabindex="-1" aria-labelledby="teamJoinModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="teamJoinModalLabel">참가취소</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            정말 취소 하시겠습니까?
                                                        </div>
                                                        <div class="modal-footer">
	                                                        <form action="deleteJoin.do" method="post">
						                                    	<input type="hidden" name="meeting_id" value="${join.id }">
						                                    	<input type="hidden" name="member_id" value="${id }">
						                                        <input type="submit" class="btn btn-danger" value="예" style="width:80px">
						                                        <button type="button" class="btn btn-dark" data-bs-dismiss="modal" aria-label="Close" style="width:80px">아니오</button>
							                                </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <button class="btn btn-outline-dark mt-1" style="width: 100%;" data-bs-toggle="modal" data-bs-target="#detailteam${join.id }" onclick="setTimeout(function(){ map${join.id}.relayout();}, 200); setTimeout(function(){ map${join.id}.setCenter(new kakao.maps.LatLng(${join.latitude }, ${join.longitude }));}, 250);">
                                            	상세정보
                                            </button>
                                            <div class="modal fade" id="detailteam${join.id }" tabindex="-1" >
			                                    <div class="modal-dialog modal-dialog-centered">
			                                        <div class="modal-content" style="width:750px;">
			                                            <div class="modal-header">
			                                                <h5 class="modal-title" style="display: block;text-align: center;" >${meet.title }</h5>
			                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			                                            </div>
			                                            <div class="modal-body">
			                                                
			                                                <div id="map${join.id }" style="width:700px;height: 400px;display: block; margin-bottom:10px;"></div>
			
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
			                                                <h6 style="text-align:left"><br>${join.content }</h6>
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-5"><small>지역: ${join.location }</small></td>
                                    </tr>
                                    <tr>
                                        <td class="px-5"><small>일시: ${join.meeting_date }</small></td>
                                    </tr>
                                    <tr>
                                        <td class="px-5"><small>모집인원: ${join.joined_member } / ${join.total_member }</small></td>
                                    </tr>
                                    <tr>
                                        <td class="px-5 pb-3"><small>주최자: ${join.master }</small></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
    					</c:forEach>
                    </tbody>
                </table>
            </div>

			<!-- 주최한 모임 -->
            <div class="team-body col-6">
                <h3 style="font-weight: bold;">주최한 모임</h3>
                <hr>
                <table class="table">
                    <tbody>
                        <tr></tr>
                        <c:choose>
	                     <c:when test="${hosting_meeting == null }">
		                     <tr>
	                   			<h5 class="col-sm-12" style="padding: 0; text-align: center;">주최한 모임이 없습니다</h5>
	                   		 </tr>
                         </c:when>
                         <c:otherwise>
		                 <c:forEach items="${hosting_meeting.keySet() }" var="host">
                        <tr>
                            <td>
                                <table class="table table-borderless team-tbl">
                                    <tr>
                                        <th style="width: 70%;" class="px-5 py-3">${host.title }</th>
                                        <td rowspan="5" class="align-middle pe-5" style="width: 30%;">
                                            <button type="button" class="btn btn-outline-danger mb-1" style="width: 100%;" data-bs-toggle="modal" data-bs-target="#jointeam${host.id }">삭제하기</button>
                                            <div class="modal fade" id="jointeam${host.id }" tabindex="-1" aria-labelledby="teamJoinModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="teamJoinModalLabel">모임삭제</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            정말 삭제 하시겠습니까?
                                                        </div>
                                                        <form action="deleteMeeting.do" method="post">
						                                    <div class="modal-footer">
						                                    	<input type="hidden" name="meeting_id" value="${host.id }">
						                                        <input type="submit" class="btn btn-danger" style="width:80px" value="예">
						                                        <button type="button" class="btn btn-dark" data-bs-dismiss="modal" aria-label="Close" style="width:80px">아니오</button>
						                                    </div>
						                                </form>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <button type="button" class="btn btn-outline-dark mb-1" style="width: 100%;" data-bs-toggle="modal" data-bs-target="#update-meeting${host.id }" onclick="setTimeout(function(){ map${host.id}.relayout(); }, 200); setTimeout(function(){ map${host.id}.setCenter(new kakao.maps.LatLng(${host.latitude }, ${host.longitude }));}, 250);">
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
					                                        <div id="update_map${host.id }" style="width:700px;height: 350px;display: block; margin-bottom:10px;"></div>
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
						                                         <textarea class="form-control" rows="4" name="content" >${host.content }</textarea>
						                                         <label class="col-sm-12 col-form-label" style="text-align: left;">장소: </label>
						                                         <div class="search_boxes">
							                                        <div class="search_box" style="display: inline-block; width:49%">
							                                            <select class="form-select" name="general" id="general" onchange="updateCategoryChange${host.id}(this)" required>
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
							                                            <select class="form-select" name="state" id="update_state${host.id}" required>
							                                                <option value="">군/구 선택</option>
							                                            </select>
							                                        </div>
							                                    </div>
							                                    <script>
															        function updateCategoryChange${host.id}(e) {
															            const state = document.getElementById("update_state${host.id}");
															
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
						                                         <label class="col-sm-12 col-form-label" style="text-align: left;">날짜: </label>
						                                         <input type="date" class="form-control" name="meeting_date" value="${host.meeting_date}">
						                                         <label class="col-sm-12 col-form-label" style="text-align: left;">시간: </label>
                                         						 <input type="time" class="form-control" name="meeting_time" value="${host.meeting_time}">
						                                         <label class="col-sm-12 col-form-label" style="text-align: left;">총 인원: </label>
						                                         <input type="text" class="form-control" name="total_member" value="${host.total_member }">
						                                         <div style="margin-top:10px" class="mx-auto">
							                                         <input type="submit" class="btn btn-danger" value="수정" >
							                                         <button type="button" class="btn btn-dark" data-bs-dismiss="modal" aria-label="Close" >취소</button>
						                                         </div>
						                                     </form>
						                                 </div>
					                                 </div>
						                         </div>
                    						 </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-5"><small>지역: ${host.location }</small></td>
                                    </tr>
                                    <tr>
                                        <td class="px-5"><small>일시: ${host.meeting_date }</small></td>
                                    </tr>
                                    <tr>
                                        <td class="px-5"><small>모집인원: ${host.joined_member } / ${host.total_member }</small></td>
                                    </tr>
                                    <tr>
                                        <td class="px-5 pb-3"><small>주최자: ${host.master }</small></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </c:forEach>
		                 </c:otherwise>
		                </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <%@include file="/common_jsp/footer.jsp" %>
</body>
</html>