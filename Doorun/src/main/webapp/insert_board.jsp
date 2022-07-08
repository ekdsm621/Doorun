<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
    <title>InsertBoard</title>
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
            <!--메인카테고리 a class=collapsed 제거하면 활성화 
                서브카테고리 a class="active" 추가하면 활성화
                ul class="show" 추가하면 열림-->
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
                <a class="nav-link collapsed active" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
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
            <h1 style="font-size: 30px;">글 쓰기</h1>
        </div>
        <hr style="margin-top:50px; margin-bottom: 50px;">
        <section class="section">
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-10">
                    <div class="card">
                        <div class="card-body">
                            <!-- General Form Elements -->
                            <form method="post" action="/insertBoard.do">
	                            <div class="row mb-3">
	                                <label for="inputText" class="col-sm-2 col-form-label">Title</label>
	                                <div class="col-sm-10">
	                                    <input type="text" class="form-control" name="title">
	                                </div>
	                            </div>
	                            <input type="hidden" name="board_id" value="1">
	                            <div class="row mb-3">
	                                <label for="inputPassword" class="col-sm-2 col-form-label">Content</label>
	                                <div class="col-sm-10">
	                                <textarea class="form-control" style="height: 400px" name="content"></textarea>
	                                </div>
	                            </div>
	                            <div class="row mb-3">
	                                <label for="inputNumber" class="col-sm-2 col-form-label">Image Upload</label>
	                                <div class="col-sm-10">
	                                    <input class="form-control" type="file" id="formFile">
	                                </div>
	                            </div>
	                            <div class="row mb-3">
	                                <div class="col-sm-12">
	                                    <button type="submit" class="btn btn-outline-dark" style="width: 100px; float:right">SUBMIT</button>
	                                </div>
	                            </div>
                            </form><!-- End General Form Elements -->
            
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </main>
    
	<%@include file="/common_jsp/footer.jsp" %>
</body>
</html>
