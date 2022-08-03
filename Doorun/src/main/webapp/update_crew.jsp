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
                  
                  <div class="pt-4 pb-2">
                    <p class="text-center" >크루 수정</p>
                  </div>

                  <form action="/updateCrew.do" method= "post" enctype="multipart/form-data" class="row g-3 needs-validation">
                  
                    
                    <input type="hidden" name="master" class="form-control" id="master" value=<%=session.getAttribute("id") %> required>

                    <div class="col-12">
                    
                      <div class="input-group has-validation">
                        <input type="text" name="name" class="form-control" id="name" placeholder="크루명을 입력해주세요" required>
                        <div class="invalid-feedback">크루명을 입력해주세요</div>
                      </div>
                      
                    </div>
                    
                    <div class="col-12">
                      <input type="file" name="uploadFile" class="form-control" id="uploadFile" placeholder="크루의 대표이미지를 선택해주세요">
                      <div class="invalid-feedback">크루의 대표이미지를 선택해주세요</div>
                    </div>

                    <div class="col-12">
                      <textarea cols="50" rows="10" name="describe" class="form-control" id="describe" placeholder="크루 설명" required></textarea>
                    </div>
                    


                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">크루생성</button> <p></p>
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
  <script src="assets/vendor/jquery/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  



</body>

</html>