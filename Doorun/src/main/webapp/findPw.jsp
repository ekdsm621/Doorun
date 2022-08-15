<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >

<head>
   <%@include file="/common_jsp/head_settings.jsp" %>
         <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link href="/assets/css/crew_detail_css.css" rel="stylesheet">
  <title>DOORUN DOORUN</title>
</head>

<body style="background-image: url(assets/img/pexels-pixabay-235922.jpg); opacity: 0.9; background-size: cover;">

<%@include file="/common_jsp/header_login.jsp" %>



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
                  
                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">비밀번호 찾기</h5>
                  </div>

                  <form action = "/findpw.do" method="get" class="row g-3 needs-validation" >

                    <div class="col-12">
                      <div class="input-group has-validation">
                        <input type="text" name="email" class="form-control" id="email" placeholder="이메일" required>
                        <div class="invalid-feedback">이메일을 입력해주세요</div>
                      </div>
                       <span style="color:red;">${msg1}</span>
                       <span style="color:green;">${msg2}</span>
                    </div>


                    <div class="col-12">
                      <button class="btn btn-dark w-100" type="submit">찾기</button> <p></p>
                      <p class="small mb-0">계정이 없으신가요? <a href="createAccount.jsp">회원가입</a></p>
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


</body>

</html>