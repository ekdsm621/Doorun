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
    <nav class="navbar navbar-expand-lg navbar-light bg-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand">DooRun</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="#">개인</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        모임
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">모임 참여</a></li>
                            <li><a class="dropdown-item" href="#">참여한 모임</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            크루
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">크루 가입</a></li>
                            <li><a class="dropdown-item" href="#">가입한 크루</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">마라톤</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">전체게시판</a>
                    </li>
                </ul>
                <div class="d-flex">
                    <img src="/assets/img/messages-2.jpg" style="border-radius: 50em; width:45px">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                아이디
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">개인 페이지 이동</a></li>
                                <li><a class="dropdown-item" href="#">개인정보 수정</a></li>
                                <li><a class="dropdown-item" href="#">로그아웃</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

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
                    <button class="nav-link active" id="crew-rank-tab" data-bs-toggle="tab" data-bs-target="#crew-rank" type="button" role="tab" aria-controls="crew-rank" aria-selected="true">
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
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="crew-board-tab" data-bs-toggle="tab" data-bs-target="#crew-board" type="button" role="tab" aria-controls="crew-board" aria-selected="false">
                        게시판
                    </button>
                </li>
            </ul>
            <div class="tab-content" id="crewTabContent">
                <!-- 크루순위표 -->
                <div class="tab-pane fade show active" id="crew-rank" role="tabpanel" aria-labelledby="crew-rank-tab">
                    <div class="row">
                        <div class="col-8">
                            <h2 class="top-rank-title">TOP 3</h2>
                            <table class="table align-middle top-rank">
                                <tbody>
                                <c:forEach items="${crewMemberList }" var="member">
                                <c:set var="i" value ="${i+1 }"/>
                                    <tr>
                                        <th scope="row">${i }</th>
                                        <td><img src="upload_img/profile_img/${member.profile_image }"></td>
                                        <td>${member.name }</td>
                                        <td>${member.nickname }</td>
                                        <td>${member.totaldistance }KM</td>
                                        <td>${member.totalduration }</td>
                                        <td>8'46''</td>
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
                                <c:forEach items="${crewMemberList }" var="member">
                                <c:set var="j" value ="${j+1 }"/>
                                    <tr>
                                        <th scope="row">${j }</th>
                                        <td><img src="upload_img/profile_img/${member.profile_image }"></td>
                                        <td>${member.name }</td>
                                        <td>${member.nickname }</td>
                                        <td>${member.totaldistance }KM</td>
                                        <td>${member.totalduration }</td>
                                        <td>8'46''</td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-3 crew-join">
                            <h3>친구 초대하기</h3>
                            <p>친구와 함께 달리면 더 즐거워집니다.</p>
                            <p>지금 바로 같이 크루 활동을 시작할 친구를 초대하세요!</p>
                            <!-- 초대하기 modal -->
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#joinModal">
                                초대하기
                            </button>
                        </div>
                        <!-- Modal -->
                        <div class="modal fade" id="joinModal" tabindex="-1" aria-labelledby="joinModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="joinModalLabel">친구 초대하기</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form class="d-flex">
                                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                            <button class="btn btn-outline-success" type="submit">Search</button>
                                        </form>
                                        <form>
                                            <table class="table table-borderless align-middle">
                                                <tbody>
                                                    <tr>
                                                        <td><img src="/assets/img/messages-3.jpg" class="member-img"></td>
                                                        <td>홍길동 <button class="btn btn-outline-danger">초대하기</button></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>
                                </div>
                            </div>
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
                            <h3>친구 초대하기</h3>
                            <p>친구와 함께 달리면 더 즐거워집니다.</p>
                            <p>지금 바로 같이 크루 활동을 시작할 친구를 초대하세요!</p>
                            <!-- 초대하기 modal -->
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#joinModal">
                                초대하기
                            </button>
                        </div>
                        <!-- Modal -->
                        <div class="modal fade" id="joinModal" tabindex="-1" aria-labelledby="joinModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="joinModalLabel">친구 초대하기</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form class="d-flex">
                                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                            <button class="btn btn-outline-success" type="submit">Search</button>
                                        </form>
                                        <form>
                                            <table class="table table-borderless align-middle">
                                                <tbody>
                                                    <tr>
                                                        <td><img src="/assets/img/messages-3.jpg" class="member-img"></td>
                                                        <td>홍길동 <button class="btn btn-outline-danger">초대하기</button></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>
                                </div>
                            </div>
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
                                <h3>친구 초대하기</h3>
                                <p>친구와 함께 달리면 더 즐거워집니다.</p>
                                <p>지금 바로 같이 크루 활동을 시작할 친구를 초대하세요!</p>
                                <!-- 초대하기 modal -->
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#joinModal">
                                    초대하기
                                </button>
                            </div>
                            <!-- Modal -->
                            <div class="modal fade" id="joinModal" tabindex="-1" aria-labelledby="joinModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="joinModalLabel">친구 초대하기</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form class="d-flex">
                                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                                <button class="btn btn-outline-success" type="submit">Search</button>
                                            </form>
                                            <form>
                                                <table class="table table-borderless align-middle">
                                                    <tbody>
                                                        <tr>
                                                            <td><img src="/assets/img/messages-3.jpg" class="member-img"></td>
                                                            <td>홍길동 <button class="btn btn-outline-danger">초대하기</button></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="tab-pane fade" id="crew-board" role="tabpanel" aria-labelledby="crew-board-tab">
                    <div class="row">
                        <div class="col-8">
                            <h4 class="board-title">크루 게시판</h4>
                            <table class="table">
                                <thead>
                                    <tr>
                                    <th scope="col">id</th>
                                    <th scope="col">title</th>
                                    <th scope="col">writer</th>
                                    <th scope="col">date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>오늘 달리기할 사람 모집해요~</td>
                                        <td>ekdsm621</td>
                                        <td>2022-08-03</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>내일 달리기할 사람 모집해요~</td>
                                        <td>ekdsm621</td>
                                        <td>2022-08-03</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>달리기 하고 왔습니다~</td>
                                        <td>ekdsm621</td>
                                        <td>2022-08-03</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-3 crew-join">
                            <h3>친구 초대하기</h3>
                            <p>친구와 함께 달리면 더 즐거워집니다.</p>
                            <p>지금 바로 같이 크루 활동을 시작할 친구를 초대하세요!</p>
                            <!-- 초대하기 modal -->
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#joinModal">
                                초대하기
                            </button>
                        </div>
                        <!-- Modal -->
                        <div class="modal fade" id="joinModal" tabindex="-1" aria-labelledby="joinModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="joinModalLabel">친구 초대하기</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form class="d-flex">
                                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                            <button class="btn btn-outline-success" type="submit">Search</button>
                                        </form>
                                        <form>
                                            <table class="table table-borderless align-middle">
                                                <tbody>
                                                    <tr>
                                                        <td><img src="/assets/img/messages-3.jpg" class="member-img"></td>
                                                        <td>홍길동 <button class="btn btn-outline-danger">초대하기</button></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>
                                </div>
                            </div>
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