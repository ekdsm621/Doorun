<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>

<head>
  <%@include file="/common_jsp/head_settings.jsp" %>
  <title>DOORUN DOORUN</title>
  

  
</head>

<body style="background-image: url(assets/img/pexels-pixabay-235922.jpg); opacity: 0.9; background-size: cover;">

  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <div class="logo d-flex align-items-center">
        <img src="assets/img/3289577_fast_run_running_icon.png" alt="">
        <span class="d-none d-lg-block"><a href="login.jsp">DORUN DORUN</a></span>
      </div>
    </div>

  </header><!-- End Header -->




  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <div  class="logo d-flex align-items-center w-">
                  <img src="assets/img/3289577_fast_run_running_icon.png" alt="">
                  <span class="d-none d-lg-block">DORUN DORUN</span>
                </div>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">
                  

                  <form action="/insertUser.do" method= "post" class="row g-3 needs-validation">

                    <div class="col-12">
                    
                      <div class="input-group has-validation">
                        <input type="text" name="email" class="form-control" id="email" placeholder="이메일" value=<%=request.getParameter("email") %> readonly>
                        <div class="invalid-feedback">이메일을 입력해주세요</div>
                      </div>
                      
                    </div>
                    
                    <div class="col-12">
                      <input type="text" name="id" class="form-control" id="id" placeholder="아이디" required>
                      <div class="invalid-feedback">아이디를 입력해주세요</div>
                    </div>

 

                    <div class="col-12">
                      <input type="text" name="name" class="form-control" id="name" placeholder="이름" required>
                      <div class="invalid-feedback">이름을 입력해주세요</div>
                    </div>
                    <div class="col-12">
                      <input type="text" name="nickname" class="form-control" id="nickname" placeholder="닉네임" required>
                      <div class="invalid-feedback">닉네임을 입력해주세요</div>
                    </div>
                    
                    
                    
                    
                    <div class="col-12">
                      <input type="text" name="postcode" class="form-control" id="postcode" placeholder="우편번호" required>
                    </div>
                    <div class="col-12">
                      <input type="text" name="address_road" class="form-control" id="address_road" placeholder="주소" required>
                    </div>
                    <div class="col-12">
                      <input type="text" name="address_detail" class="form-control" id="address_detail" placeholder="상세주소" required>
                    </div>


                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">가입</button> <p></p>
                      <p class="small mb-0">이미 회원이신가요? <a href="login.jsp">로그인</a></p>
                    </div>
                  </form>

                </div>
              </div>


            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

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