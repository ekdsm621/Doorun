<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/assets/css/user_detail_css.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
    <title>개인</title>
</head>
<body>
	<%@include file="/common_jsp/header.jsp" %>
    <div class="container-fluid">
        <div class="main row">
            <div class="col-3">
                <div class="user">
                    <img src="upload_img/profile_img/<%=session.getAttribute("profile_image")%>" class="user-img">
                    <div class="card user-card">
                        <div class="card-body">
                            <table class="user-tbl">
                                <tr>
                                    <th colspan="3">
                                        <h5 class="card-title">${userDesc.nickname }</h5> 
                                    </th>
                                </tr>
                                <tr>
                                    <td>총거리</td>
                                    <td>총시간</td>
                                    <td>페이스</td>
                                </tr>
                                <tr>
                                    <td>${userDesc.total_distance }KM</td>
                                    <td>${totalHour }:${totalMin }:${totalSec }</td>
                                    <td>${paceMin }'${paceSec }''</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="card weekly-graph">
                         <div class="container">
						    <canvas id="myChart" width="200px" height="200px"></canvas>
						</div>
						<script type="text/javascript">
						var ctx = document.getElementById('myChart').getContext('2d');
						var myChart = new Chart(ctx, {
						    type: 'bar',
						    data: {
						        labels: ['${date.firstday_date}', '${date.secondday_date}', '${date.thirdday_date}', '${date.fourthday_date}', '${date.fifthday_date}', '${date.sixthday_date}','${date.seventhday_date}'],
						        datasets: [{
						            label: '지난 7일간 달린거리(KM)',
						            data: [${graph.firstday}, ${graph.secondday}, ${graph.thirdday}, ${graph.fourthday}, ${graph.fifthday}, ${graph.sixthday},${graph.seventhday}],
						            backgroundColor: [
						                'rgba(216, 27, 96, 0.6)',
						                'rgba(3, 169, 244, 0.6)',
						                'rgba(255, 152, 0, 0.6)',
						                'rgba(29, 233, 182, 0.6)',
						                'rgba(156, 39, 176, 0.6)',
						                'rgba(84, 110, 122, 0.6)'
						            ],
						            borderColor: [
						                'rgba(216, 27, 96, 1)',
						                'rgba(3, 169, 244, 1)',
						                'rgba(255, 152, 0, 1)',
						                'rgba(29, 233, 182, 1)',
						                'rgba(156, 39, 176, 1)',
						                'rgba(84, 110, 122, 1)'
						            ],
						            borderWidth: 1
						        }]
						    },
						    options: {
						        legend: {
						            display: false
						        },
						        title: {
						            display: true,
						            text: 'Life Expectancy by Country',
						            position: 'top',
						            fontSize: 16,
						            padding: 20
						        },
						        scales: {
						            yAxes: [{
						                ticks: {
						                	
						                    min: 75
						                }
						            }]
						        }
						    }
						});
						</script>
                    </div>
                </div>
            </div>
	
            <!-- 유저 활동 최근 순서로 -->
            <div class="col-6">
                <h2 style="text-align: center; color:rgb(64, 64, 64);">활동 기록</h2>
                <hr style="margin-bottom: 5%;">
                <c:forEach items="${userRecordList }" var="record">
                <div class="card mb-3">
                    <iframe id="myIframe" src="/detailRecord.do?id=${record.id }" loading="lazy"  width="100%" height="300px" frameborder='0' scrolling="no" src='hompage' style="overflow-y:hidden"></iframe>
                    <div class="card-body">
                        <h5 class="card-title">${record.running_date }</h5>
                        <p class="card-text">달린 거리: ${record.distance } KM</p>
                        <p class="card-text">달린 시간: ${record.duration }</p>
                        <p class="card-text">평균 페이스: ${record.avg_speed }</p>
                    </div>
                </div>
                </c:forEach>
			</div>
                
            <div class="col-3 sub-menu">
                <div class="col-12">
                    <span class="crew-title">가입한 크루</span>
                </div>    
                <div class="col-12 crew-body">
                	<c:forEach items="${joinedCrewList}" var="crew">
                		<a href="/detailCrew.do?id=${crew.id }">
		                    <img class="crew-img" src="upload_img/crew_img/${crew.image_file }">
                		</a>
                	</c:forEach>
                </div>
                <a href="/getCrewList.do">
                    <div class="col-12 sub-list">
                        <div class="title">
                            크루 가입하기
                        </div>
                        <div class="content">
                            크루에서 여러 사람들과 함께 소통하며 달려보세요.<br>
                            노하우를 나누고, 활동 범위를 넓힐 수 있어요!<br>
                        </div>
                    </div>
                </a>
                <a href="/createCrew.jsp">
                    <div class="col-12 sub-list">
                        <div class="title">
                            크루 생성하기
                        </div>
                        <div class="content">
                            나에게 딱 맞는 크루가 없으신가요?<br>
                            나만의 크루를 만들고, 운영해보세요.<br>
                        </div>
                    </div>
                </a>
                <a href="">
                    <div class="col-12 sub-list">
                        <div class="title">
                            친구 초대하기
                        </div>
                        <div class="content">
                            친구를 초대하여 모험을 함께하세요.<br>
                            함께하면 더 즐거워집니다!<br>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <%@include file="/common_jsp/footer.jsp" %>
</body>
</html>