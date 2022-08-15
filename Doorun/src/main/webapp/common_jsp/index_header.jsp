<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <nav class="navbar navbar-expand-lg navbar-light bg-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand"><a href="/index.jsp" style="text-decoration:none; font-size:18px; font-weight:bold; color:rgb(223, 210, 27);">DooRun</a></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span></button>

                
                	<%if(session.getAttribute("nickname") == null){%>
                		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        	<li class="nav-item dropdown">
                        		<a href="/login.jsp" class="nav-link" style="margin-left:900px; font-weight:bold">JOIN</a>
                        	</li>
                        </ul>
                	<%}else{ %>
			           <div class="collapse navbar-collapse" id="navbarSupportedContent">
			               <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			                   <li class="nav-item">
			                       <a class="nav-link" href="/userDetail.do">개인</a>
			                   </li>
			                   <li class="nav-item dropdown">
			                       <a class="nav-link dropdown-toggle" href="/meeting.do" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                       모임
			                       </a>
			                       <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			                           <li><a class="dropdown-item" href="/meeting.do">모임 참가</a></li>
			                           <li><a class="dropdown-item" href="/joinedMeeting.do">참가한 모임</a></li>
			                       </ul>
			                   </li>
			                   <li class="nav-item">
			                       <a class="nav-link" href="/getCrewList.do">
			                           크루
			                       </a>
			                   </li>
			                   <li class="nav-item">
			                       <a class="nav-link" href="/marathon.do">마라톤</a>
			                   </li>
			                   <li class="nav-item">
			                       <a class="nav-link" href="/boardList.do?id=1">전체게시판</a>
			                   </li>
			               </ul>
			               <div class="d-flex">                	
                    <img src="upload_img/profile_img/<%=session.getAttribute("profile_image") %>" alt="Profile" style="border-radius: 50em; width:45px">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <%=session.getAttribute("nickname") %>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/userDetail.do">개인 페이지 이동</a></li>
                                <li><a class="dropdown-item" href="/UserSetting.do">개인정보 수정</a></li>
                                <%if(session.getAttribute("member_type").equals("EMAIL")){ %>
                                	<li><a class="dropdown-item" href="/logout.do">로그아웃</a></li>
                    			<%} %>
                    			<%if(session.getAttribute("member_type").equals("KAKAO")){ %>
                    				<li><a class="dropdown-item" href="javascript:kakaoLogout();">로그아웃</a></li>
                    			<%} %>                	
                            </ul>
                        </li>
                    </ul>
                	<%} %>
                </div>
            </div>
        </div>
    </nav>
