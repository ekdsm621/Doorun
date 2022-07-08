<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
    <title>DetailBoard</title>
    <%@include file="/common_jsp/head_settings.jsp" %>
	</head>
	
    <body>
	<%@include file="/common_jsp/header.jsp" %>
    <!-- ======= Sidebar ======= -->
    <aside id="sidebar" class="sidebar">
        <ul class="sidebar-nav" id="sidebar-nav">
            <li class="nav-item">
                <a class="nav-link collapsed" href="#">
                <i class="bi bi-grid"></i>
                <span>메인</span>
                </a>
            </li>

            <!-- 개인 -->
            <!-- class="active" 추가하면 활성화-->
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-person-fill"></i><span>개인</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="components-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                <li>
                    <a href="#">
                    <i class="bi bi-circle"></i><span>프로필</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                    <i class="bi bi-circle"></i><span>기록 보기</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                    <i class="bi bi-circle"></i><span>통계 보기</span>
                    </a>
                </li>
                <li>
                    <a href="components-breadcrumbs.html">
                    <i class="bi bi-circle"></i><span>가입한 크루</span>
                    </a>
                </li>
                </ul>
            </li>
            <!-- 개인 -->
            <!-- 모임 -->
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-people-fill"></i>
                    <span>모임</span>
                    <i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="/find_team.html">
                        <i class="bi bi-circle"></i><span>모임 찾기</span>
                        </a>
                    </li>
                    <li>
                        <a href="/join_team.html">
                        <i class="bi bi-circle"></i><span>진행 중인 모임</span>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 모임 -->
            <!-- 크루 -->
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                <i class="ri-team-fill"></i><span>크루</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="#">
                    <i class="bi bi-circle"></i><span>크루 소개</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                    <i class="bi bi-circle"></i><span>순위</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                    <i class="bi bi-circle"></i><span>게시판</span>
                    </a>
                </li>
                </ul>
            </li>
            <!-- 크루 -->
            <!-- 크루 가입 -->
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-person-plus-fill"></i><span>크루 가입</span>
                </a>
            </li>
            <!-- 크루 가입 -->
            <!-- 전체 게시판 -->
            <li class="nav-item">
                <a class="nav-link" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="/free_board.html">
                <i class="bi bi-journal-text"></i><span>전체 게시판</span>
                </a>
            </li>
            <!-- 전체 게시판 -->
        </ul>
    </aside><!-- 사이드바-->

    <!-- 메인 -->
    <main id="main" class="main">
        <div class="pagetitle" align="center" style="margin-top:50px;">
            <h1 style="font-size: 30px;">전체 게시판</h1>
        </div>
        <hr style="margin-top:50px; margin-bottom: 50px;">
        
        <div class="row align-items-top">
            <div class="col-lg-2"></div>
            <div class="col-lg-8">
    
                <div class="card"  height="auto">
                    <div class="card-body">
                        <h5 class="card-title" style="text-align: center;">${board.title }</h5>
                        <img src="assets/img/지도사진.png" height="400px" style="display: block;">
                        <div>
                        	${board.content }
                        </div>
                        <br>
                        <a href="/deleteBoard.do?id=${board.id }"><button class="btn btn-danger" style="float: right; margin-left: 5px;">삭제</button></a>
                        <a href="/updateBoardView.do?id=${board.id }"><button class="btn btn-secondary" style="float: right;">수정</button></a>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">댓글</h5>
                        <div class="row mb-3" style="padding: 10px;">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">ID: </label>
                            <div class="col-sm-10">
                                <span type="text">
                                    Ut in ea error laudantium quas omnis officia. Sit sed praesentium voluptas. Corrupti inventore consequatur nisi necessitatibus modi consequuntur soluta id. Enim autem est esse natus assumenda. Non sunt dignissimos officiis expedita. Consequatur sint repellendus voluptas.
                                    Quidem sit est nulla ullam. Suscipit debitis ullam iusto dolorem animi dolorem num
                                </span>
                            </div>
                        </div>
                        <!-- Horizontal Form -->
                        <form>
                            <div class="row mb-3" style="padding: 10px;">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">댓글 입력: </label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="inputText">
                                </div>
                                <div class="col-sm-3">
                                    <button type="submit" class="btn btn-outline-primary col-sm-5" style="float: left; width:45%">입력</button>
                                    <span class="col-sm-2"></span>
                                    <button type="reset" class="btn btn-outline-dark col-sm-5" style="float: right; width:45%">취소</button>
                                </div>
                            </div>
                        </form><!-- End Horizontal Form -->
                    </div>
                </div>
            </div>
        </div>
    </main>
    
	<%@include file="/common_jsp/footer.jsp" %>
</body>
</html>
