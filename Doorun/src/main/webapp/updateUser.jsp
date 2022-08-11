<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html >

<head>
  <%@include file="/common_jsp/head_settings.jsp" %>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/assets/css/marathon.css" rel="stylesheet">
    <link href="/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
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
  <title>DORUN DORUN</title>
</head>

<body>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<%@include file="/common_jsp/header.jsp" %>        
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

              

                <div class="tab-pane fade show active profile-overview" id="profile-edit" >

                  <!-- Profile Edit Form -->
                  <form action = "/updateUser.do" method = "post" enctype="multipart/form-data">

                    <br>
                    <div class="text-center">
                      <img src="upload_img/profile_img/${user.profile_image}" class="rounded-circle" >
                    </div>
                    <div class="row mb-3">
                       <label for="imageFile" class="col-md-4 col-lg-3 col-form-label">프로필 사진</label>
                       <div class="col-sm-9">
                           <input class="form-control" type="file" id="imageFile" name="imageFile">
                       </div>
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
                      <button type="submit" class="btn btn-dark team-making mb-3">수정</button>
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
                      <button type="submit" class="btn btn-dark team-making mb-3">변경</button>
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