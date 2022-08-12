<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/assets/css/crew_join.css" rel="stylesheet">
    <link href="/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script>
        $(document).ready(function(){
            $(".dropdown").hover(function(){
                var dropdownMenu = $(this).children(".dropdown-menu");
                if(dropdownMenu.is(":visible")){
                    dropdownMenu.parent().toggleClass("open");
                }
            });
        });
    </script>
    
    <title>크루 리스트</title>
</head>
<body> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <%@include file="/common_jsp/header.jsp" %>
    <div class="container-fluid">
        <div class="main">
            <div class="team-header">
                <h2 style="display: inline-block; font-weight: bold;">크루 찾기</h2>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                	<a href="../crew_create.jsp">
	                  <button class="btn btn-dark team-making mb-3">크루 만들기</button>
	                </a>
                </div>

                <table class="table table-striped table-hover table-borderless">
                    <thead>
                        <tr class="mb-4">
                            <td class="p-4" style="background-color:rgba(0, 0, 0, 0.08);">
                                <form class="row ps-3" action="/getCrewList.do" method="post">
                                    <div class="col-4">
                                        <input class="form-control" type="text" placeholder="크루 이름" aria-label="default input example" name="name">
                                    </div>
                                    <div class="col-6 row">
                                        <div class="search_boxes">
	                                        <div class="search_box" style="display: inline-block; width:48%">
	                                            <select class="form-select" name="temp_area" id="general" onchange="categoryChange(this)">
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
	                                            <select class="form-select" name="temp_area2" id="select_state">
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
			     		<c:forEach items="${crewList }" var="crew">
			     			<tr>	     				
			     				<td>
			     					<div class="py-3">
			     						<a href="../detailCrew.do?id=${crew.id }"><img src="upload_img/crew_img/${crew.image_file }" class="crew-sub-img"></a>
			     					</div>
			     				</td>
			     				<td style="text-align:left">${crew.name }</td>
			     				<td>${crew.area }</td>
			     				<td>${crew.member }명</td>
			     				<td>
			     					<button type="button" class="btn btn-outline-danger mb-1" data-bs-toggle="modal" data-bs-target="#joinCrew${crew.id }"data-bs-toggle="modal" data-bs-target="#joinCrew${crew.id }">
                                     	가입하기
                                    </button>
	                                    <div class="modal fade" id="joinCrew${crew.id }" tabindex="-1" aria-labelledby="crewJoinModalLabel" aria-hidden="true">
	                                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	                                            <div class="modal-content">
	                                            
	                                                <div class="modal-header">
	                                                    <h5 class="modal-title" id="crewJoinModalLabel">모임 참가하기</h5>
	                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                                                </div>
	                                                <div class="modal-body">
	                                                    크루에 가입하시겠습니까?
	                                                </div>
	                                                <form action="/joinCrew.do" method="post">
					                                  <div class="modal-footer">
					                                  	<input type="hidden" id="crew_id" name="crew_id" value="${crew.id }">
																	<input type="hidden" id="member_id" name="member_id" value="${id }">		
					                                      <input type="submit" class="btn btn-danger" style="width:70px" value="가입">
					                                      <button type="button" class="btn btn-dark" data-bs-dismiss="modal" aria-label="Close" style="width:70px">취소</button>
					                                  </div>
					                              </form>
	                                            </div>
	                                        </div>
	                                    </div>
			     					<br>
			     					<a href="../detailCrew.do?id=${crew.id }">
			     						<button class="btn btn-outline-dark" type="button">둘러보기</button>
			     					</a>
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