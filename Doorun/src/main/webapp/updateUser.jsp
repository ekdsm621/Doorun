<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html >

<head>
  <%@include file="/common_jsp/head_settings.jsp" %>
  <title>DORUN DORUN</title>
</head>

<body>

  <%@include file="/common_jsp/header.jsp" %>

  <!-- ======= Sidebar ======= -->
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

    
    
        
  <main id="main" class="main">


   
    <section class="section profile">
      <div   style="text-align: center;" >
       

        <div class="col-xl-8" style="display: inline-block;">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">


                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-edit">프로필 수정</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">비밀번호 변경</button>
                </li>

              </ul>
              <div class="tab-content pt-2">

              

                <div class="tab-pane fade show active profile-overview" id="profile-edit">

                  <!-- Profile Edit Form -->
                  <form action = "/updateUser.do" method = "post">

                    <br>
                    <div class="text-center">
                      <img src="assets/img/1564534_customer_man_user_account_profile_icon.png" name = "userimg" id="userimg" class="rounded-circle" >
                    </div>
                    <div class="text-center" >
                      <button class="btn btn-light rounded-pill" type="button"><i class="ri-camera-2-line"></i></button>
                    </div>
      

                    <br>
                    <div class="row mb-3">
                      <label for="email" class="col-md-4 col-lg-3 col-form-label">이메일</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="email" type="text" class="form-control" id="email" value="${user.email}" readonly>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="name" class="col-md-4 col-lg-3 col-form-label">이름</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="name" type="text" class="form-control" id="name" value="${user.name}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="introduce" class="col-md-4 col-lg-3 col-form-label">소개</label>
                      <div class="col-md-8 col-lg-9">
                        <textarea name="introduce" class="form-control" id="introduce" style="height: 150px">${user.introduce}</textarea>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="postcode" class="col-md-4 col-lg-3 col-form-label">우편번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="postcode" type="text" class="form-control" id="postcode" value="${user.postcode}" >
                      </div>
                    </div>
                    
                    <div class="row mb-3">
                      <label for="address_road" class="col-md-4 col-lg-3 col-form-label">주소</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="address_road" type="text" class="form-control" id="address_road" value="${user.address_road}" >
                      </div>
                    </div>
                    
                    <div class="row mb-3">
                      <label for="address_detail" class="col-md-4 col-lg-3 col-form-label">상세주소</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="address_detail" type="text" class="form-control" id="address_detail" value="${user.address_detail}" >
                      </div>
                    </div>


                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">수정</button>
                    </div>
                  </form><!-- End Profile Edit Form -->

                </div>

               

                <div class="tab-pane fade pt-3" id="profile-change-password">
                  <!-- Change Password Form -->
                  <form action = "/updatepw.do" method = "post">

                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">현재 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="currentPassword" type="password" class="form-control" id="currentPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">새로운 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="password" type="password" class="form-control" id="Password">
                      </div>
                    </div>

                    

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">변경</button>
                    </div>
                  </form><!-- End Change Password Form -->

                </div>

              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>

    
    
  </main>
  
    
   


	<%@include file="/common_jsp/footer.jsp" %>
	
	<!-- 주소 검색 -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
  window.onload = function(){
      document.getElementById("postcode").addEventListener("click", function(){ //주소입력칸을 클릭하면
          //카카오 지도 발생
          new daum.Postcode({
              oncomplete: function(data) { //선택시 입력값 세팅
            	  document.getElementById("postcode").value = data.zonecode; // 우편번호 넣기
                  document.getElementById("address_road").value = data.address; // 주소 넣기
                  document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
              }
          }).open();
      });
  }
  </script>


</body>

</html>