<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/assets/css/crew_detail_css.css" rel="stylesheet">
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
    <script src="assets/vendor/jquery/jquery-3.6.0.min.js"></script>
    <title>크루 상세</title>
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<%@include file="/common_jsp/header.jsp" %>

    <div class="container-fluid">
        <div class="main">
            <img src="upload_img/crew_img/${detailCrew.background_img }" class="crew-main-img">
            <img src="upload_img/crew_img/${detailCrew.image_file }" class="crew-sub-img">
            <div>
                <h1 class="crew-name">${detailCrew.name }</h1>
            </div>
            <div class="crew-intro">
            ${detailCrew.describe }
            </div>

            <ul class="nav nav-tabs" id="crewTab" role="tablist">
            	<li class="nav-item" role="presentation">
                    <button class="nav-link active" id="crew-board-tab" data-bs-toggle="tab" data-bs-target="#crew-board" type="button" role="tab" aria-controls="crew-board" aria-selected="true">
                        게시판
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="crew-rank-tab" data-bs-toggle="tab" data-bs-target="#crew-rank" type="button" role="tab" aria-controls="crew-rank" aria-selected="false">
                        크루순위표
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="crew-recent-tab" data-bs-toggle="tab" data-bs-target="#crew-recent" type="button" role="tab" aria-controls="crew-recent" aria-selected="false">
                        최근활동
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="crew-member-tab" data-bs-toggle="tab" data-bs-target="#crew-member" type="button" role="tab" aria-controls="crew-member" aria-selected="false">
                        회원
                    </button>
                </li>
            </ul>
            <div class="tab-content" id="crewTabContent">
                <!-- 크루순위표 -->
                <div class="tab-pane fade" id="crew-rank" role="tabpanel" aria-labelledby="crew-rank-tab">
                    <div class="row">
                        <div class="col-8">
                            <h2 class="top-rank-title">TOP 3</h2>
                            <table class="table align-middle top-rank">
                                <tbody>
                                <c:forEach items="${crewMemberList }" var="member" varStatus="status">
                                <c:set var="i" value ="${i+1 }"/>
                                    <tr>
                                        <th scope="row">${i }</th>
                                        <td><img src="upload_img/profile_img/${member.profile_image }"></td>
                                        <td>${member.name }</td>
                                        <td>${member.nickname }</td>
                                        <td>${member.total_distance }KM</td>
                                        <td>${total_durationList[status.index] }</td>
                                        <td>${paceList[status.index] }</td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                            
                            <table class="table align-middle table-hover rank-tbl">
                                <thead>
                                    <tr>
                                        <th scope="col">순위</th>
                                        <th scope="col">이미지</th>
                                        <th scope="col">회원명</th>
                                        <th scope="col">닉네임</th>
                                        <th scope="col">총거리</th>
                                        <th scope="col">총시간</th>
                                        <th scope="col">페이스</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${crewMemberList }" var="member" varStatus="status">
                                <c:set var="j" value ="${j+1 }"/>
                                    <tr>
                                        <th scope="row">${j }</th>
                                        <td><img src="upload_img/profile_img/${member.profile_image }"></td>
                                        <td>${member.name }</td>
                                        <td>${member.nickname }</td>
                                        <td>${member.total_distance }KM</td>
                                        <td>${total_durationList[status.index] }</td>
                                        <td>${paceList[status.index] }</td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-3 crew-join">
                             <h3>크루 둘러보기</h3>
                             <p>더 많은 크루에서 활동하고 싶으신가요?</p>
                             <p>지금 바로 활동하고 싶은 크루를 찾아보세요!</p>
                             <!-- 초대하기 modal -->
                             <a href="/getCrewList.do">
                             <button type="button" class="btn btn-danger">
                                 크루 찾기로 이동
                             </button>
                             </a>
                        </div>
                    </div>
                </div>
                <!-- 최근활동 -->
                <div class="tab-pane fade" id="crew-recent" role="tabpanel" aria-labelledby="crew-recent-tab">
                    <div class="row">
                        <div class="col-8">
                        <c:forEach items="${getCrewRecentRecord}" var="record">
                            <div class="card mb-3">
                                <iframe id="myIframe" src="/detailRecord.do?id=${record.id }" loading="lazy"  width="100%" height="300px" frameborder='0' scrolling="no" src='hompage' style="overflow-y:hidden"></iframe>

                                <div class="card-body">
                                    <h5 class="card-title">${record.member_id } 회원님</h5>
                                    <p class="card-text">달린 거리: ${record.distance } Km</p>
                                    <p class="card-text">달린 시간: ${record.duration }</p>
                                    <p class="card-text">평균 페이스: ${record.avg_speed }</p>
                                    <p class="card-text"><small class="text-muted">${record.running_date }</small></p>
                                </div>
                            </div>
						</c:forEach>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-3 crew-join">
                             <h3>크루 둘러보기</h3>
                             <p>더 많은 크루에서 활동하고 싶으신가요?</p>
                             <p>지금 바로 활동하고 싶은 크루를 찾아보세요!</p>
                             <!-- 초대하기 modal -->
                             <a href="/getCrewList.do">
                             <button type="button" class="btn btn-danger">
                                 크루 찾기로 이동
                             </button>
                             </a>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="crew-member" role="tabpanel" aria-labelledby="crew-member-tab">
                    <div class="container">
                        <div class="row">
                            <div class="col-8">
                                <h4 class="member-title">크루장</h4>
                                <hr>
                                <table class="table table-borderless align-middle crew-member-tbl">
                                    <tbody>
                                        <tr>
                                            <td><img src="upload_img/profile_img/${masterImage }" class="member-img"></td>
                                            <td>${detailCrew.master }</td>
                                        </tr>
                                    </tbody>
                                </table>

                                <h4 class="member-title">회원</h4>
                                <hr>
                                <table class="table table-borderless align-middle crew-member-tbl">
                                    <tbody>
                                    <c:forEach items="${crewMemberList }" var="member">
                                        <tr>
                                            <td><img src="upload_img/profile_img/${member.profile_image }" class="member-img"></td>
                                            <td>${member.nickname }</td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <div class="col-1"></div>
                            <div class="col-3 crew-join">
                                <h3>크루 둘러보기</h3>
                                <p>더 많은 크루에서 활동하고 싶으신가요?</p>
                                <p>지금 바로 활동하고 싶은 크루를 찾아보세요!</p>
                                <!-- 초대하기 modal -->
                                <a href="/getCrewList.do">
                                <button type="button" class="btn btn-danger">
                                    크루 찾기로 이동
                                </button>
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="tab-pane show active" id="crew-board" role="tabpanel" aria-labelledby="crew-board-tab">
                    <div class="row">
                        <div class="col-8">
                            <h4 class="board-title">크루 게시판</h4>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <a href="/entireBoard_insert.jsp?id=<%=request.getParameter("id")%>"><button class="btn btn-dark">글쓰기</button></a>
                            </div>
                            <table class="table">
                                <thead>
                                    <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">작성일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${viewAll }" var="list">
	                                    <tr>
	                                        <th scope="row">${list.id }</th>
	                                        <td><a href="detailBoard.do?id=${list.id }&board_id=<%=request.getParameter("id")%>">${list.title }</a></td>
	                                        <td>${list.writer }</td>
	                                        <td>${list.reg_date }</td>
	                                    </tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                            <div style="display: block; text-align: center;">		
								<c:if test="${paging.startPage != 1 }">
									<a href="/detailCrew.do?id=${paging.board_id }&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<b>${p }</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<a href="/detailCrew.do?id=${paging.board_id }&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<a href="/detailCrew.do?id=${paging.board_id }&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
								</c:if>
						</div>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-3 crew-join">
                             <h3>크루 둘러보기</h3>
                             <p>더 많은 크루에서 활동하고 싶으신가요?</p>
                             <p>지금 바로 활동하고 싶은 크루를 찾아보세요!</p>
                             <!-- 초대하기 modal -->
                             <a href="/getCrewList.do">
                             <button type="button" class="btn btn-danger">
                                 크루 찾기로 이동
                             </button>
                             </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <footer class="d-flex flex-wrap justify-content-between align-items-center border-top">
            <p class="col-md-4 mb-0 text-muted">&copy; 2022 Company, Inc</p>
        
            <a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
            </a>
        
            <ul class="nav col-md-4 justify-content-end">
                <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
            </ul>
        </footer>
    </div>
</body>
</html>