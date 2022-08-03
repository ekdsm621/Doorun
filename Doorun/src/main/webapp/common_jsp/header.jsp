<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <img src="upload_img/profile_img/<%=session.getAttribute("profile_image") %>" alt="Profile" class="rounded-circle">
                    <span class="d-none d-md-block dropdown-toggle ps-2"><%=session.getAttribute("nickname") %></span>
                </a><!-- End Profile Iamge Icon -->
        
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
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
                    <%if(session.getAttribute("member_type").equals("EMAIL")){ %>
                    <a href="/logout.do" class="dropdown-item d-flex align-items-center" href="#">
                        <i class="bi bi-box-arrow-right"></i>
                        <span>로그아웃</span>
                    </a>
                    <%} %>
                    <%if(session.getAttribute("member_type").equals("KAKAO")){ %>
                    <a href="javascript:kakaoLogout();" class="dropdown-item d-flex align-items-center" >
                        <i class="bi bi-box-arrow-right"></i>
                        <span>로그아웃</span>
                    </a>
                    <%} %>
                    </li>
        
                </ul><!-- End Profile Dropdown Items -->
                </li><!-- End Profile Nav -->
        
            </ul>
            </nav><!-- End Icons Navigation -->
            
        
        </header><!-- End Header -->
    
            <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
            <script type="text/javascript">
            window.Kakao.init('a86d3c36ccc01996ba44e0964be7fe82');
               function kakaoLogout() {
            	   
	    	    	if (Kakao.Auth.getAccessToken()) {
		    	      Kakao.API.request({
		    	        url: '/v1/user/unlink',
		    	        success: function (response) {
		    	           console.log(response)
		    	        },
		    	        fail: function (error) {
		    	          console.log(error)
		    	        },
		    	      })
		    	      Kakao.Auth.setAccessToken(undefined)
		    	      window.location.href="/logout.do";
		    	    }
		    	  }  
            </script>