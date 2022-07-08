<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Open+Sans:wght@620&display=swap" rel="stylesheet">

    <title>Board</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: NiceAdmin - v2.2.2
    * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
    </head>

    <body>

    <!-- ======= Header: 상단 메뉴들 ======= -->
    <header id="header" class="header fixed-top d-flex align-items-center">

        <div class="d-flex align-items-center justify-content-between">
            <i class="bi bi-list toggle-sidebar-btn"></i>
            <a href="#" class="logo d-flex align-items-center">
                <img src="" alt="">
                <span class="d-none d-lg-block">DOORUN!</span>
            </a>
            </div><!-- End Logo -->
        
            <nav class="header-nav ms-auto">
            <ul class="d-flex align-items-center">
                <li class="nav-item dropdown pe-3">
                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
                    <span class="d-none d-md-block dropdown-toggle ps-2">K. Anderson</span>
                </a><!-- End Profile Iamge Icon -->
        
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                    <h6>Kevin Anderson</h6>
                    <span>Web Designer</span>
                    </li>
                    <li>
                    <hr class="dropdown-divider">
                    </li>
        
                    <li>
                    <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                        <i class="bi bi-person"></i>
                        <span>My Profile</span>
                    </a>
                    </li>
                    <li>
                    <hr class="dropdown-divider">
                    </li>
        
                    <li>
                    <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                        <i class="bi bi-gear"></i>
                        <span>Account Settings</span>
                    </a>
                    </li>
                    <li>
                    <hr class="dropdown-divider">
                    </li>
        
                    <li>
                    <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                        <i class="bi bi-question-circle"></i>
                        <span>Need Help?</span>
                    </a>
                    </li>
                    <li>
                    <hr class="dropdown-divider">
                    </li>
        
                    <li>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <i class="bi bi-box-arrow-right"></i>
                        <span>Sign Out</span>
                    </a>
                    </li>
        
                </ul><!-- End Profile Dropdown Items -->
                </li><!-- End Profile Nav -->
        
            </ul>
            </nav><!-- End Icons Navigation -->
        
        </header><!-- End Header -->

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
                <a class="nav-link " data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-person-fill"></i><span>개인</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="components-nav" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
                <li>
                    <a href="#" class="active">
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
                        <a href="#">
                        <i class="bi bi-circle"></i><span>모임 찾기</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
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
                <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
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

        <section class="section">
            <div class="row" style="float: none; margin:100 auto;">
                <div class="col-lg-10"  style="float: none; margin:0 auto;">
            
                <div class="card">
                <div class="card-body">
                    <h5 class="card-title"></h5>
    
                    <!-- Default Table -->
                    <table class="table datatable">
                    <thead>
                        <tr>
                        <th scope="col">id</th>
                        <th scope="col">writer</th>
                        <th scope="col">title</th>
                        <th scope="col">date</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${boardList }" var="board">
                        <tr>
	                        <th scope="row">${board.id }</th>
	                        <td>${board.writer }</td>
	                        <td>${board.title }</td>
	                        <td>${board.reg_date }</td>
                        </tr>
                    	</c:forEach>
                    </tbody>
                    </table>

                </div>
                </div>
        </section>

    </main>
    
    <!-- ======= Footer ======= -->
    <footer id="footer" class="footer">
        <div class="copyright">
        &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
        </div>
        <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
    </footer><!-- End Footer -->

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/chart.js/chart.min.js"></script>
    <script src="assets/vendor/echarts/echarts.min.js"></script>
    <script src="assets/vendor/quill/quill.min.js"></script>
    <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
    <script src="assets/vendor/tinymce/tinymce.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
</body>
</html>
