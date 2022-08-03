<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- ======= Sidebar ======= -->
    <aside id="sidebar" class="sidebar">
        <ul class="sidebar-nav" id="sidebar-nav">
            <li class="nav-item">
                <a class="nav-link collapsed" href="/index.jsp">
                <i class="bi bi-grid"></i>
                <span>메인</span>
                </a>
            </li>

            <!-- 개인 -->
            <!-- class="active" 추가하면 활성화-->
            <li class="nav-item">
                <a class="nav-link" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
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
                        <a href="/meeting.do">
                        <i class="bi bi-circle"></i><span>모임 찾기</span>
                        </a>
                    </li>
                    <li>
                        <a href="/joinedMeeting.do">
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
                <a class="nav-link collapsed" href="/getBoardList.do?board_id=1">
                	<i class="bi bi-journal-text"></i><span>전체 게시판</span>
                </a>
            </li>
            <!-- 전체 게시판 -->
        </ul>
    </aside><!-- 사이드바-->