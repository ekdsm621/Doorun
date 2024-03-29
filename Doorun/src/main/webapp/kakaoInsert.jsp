<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>

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
                    <p class="text-center small" >카카오로 가입</p>
                  </div>
                  

                  <form action="/insertUser.do" method= "post" class="row g-3 needs-validation">

                    <div class="col-12">
                    
                      <div class="input-group has-validation">
                        <input type="text" name="email" class="form-control" id="email" placeholder="이메일" value=<%=request.getParameter("email") %> readonly>
                        <div class="invalid-feedback">이메일을 입력해주세요</div>
                      </div>
                      
                    </div>
                    
                    <div class="col-12">
                      <input type="text" name="id" class="form-control" id="id" placeholder="아이디" oninput="idCheck()" required>
                      <div class="invalid-feedback">아이디를 입력해주세요</div>
                     	<span class="id_ok" style="display:none; color:green;">사용 가능한 아이디입니다.</span>
						<span class="id_already" style="display:none; color:red;" >중복된 아이디입니다</span>
                    </div>

 

                    <div class="col-12">
                      <input type="text" name="name" class="form-control" id="name" placeholder="이름" required>
                      <div class="invalid-feedback">이름을 입력해주세요</div>
                    </div>
                     <div class="col-12">
                      <input type="text" name="nickname" class="form-control" id="nickname" placeholder="닉네임" oninput="nicknameCheck()" required>
                       <span class="nickname_ok" style="display:none; color:green;">사용 가능한 닉네임입니다.</span>
					   <span class="nickname_already" style="display:none; color:red;" >중복된 닉네임입니다</span>
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
                      <button id="submit" class="btn btn-dark w-100" type="submit" disabled>가입</button> <p></p>
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
  <script src="assets/vendor/jquery/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  
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
  

  
  
 
  	
  	 <!-- 아이디 중복검사 -->
  	function idCheck(){
  		$.ajax({
  			url : "/idcheck.do" ,
  			type : "POST",
  			data : {"id" : $("#id").val()},
  			success : function(resp){
  				if(resp == 'n'){
  					 $('.id_already').css("display","inline-block");
                     $('.id_ok').css("display", "none");
                     $('#submit').attr('disabled', 'disabled');
  				}else{
  					if($("#id").val() != ""){
		  				$('.id_ok').css("display","inline-block"); 
  					}else{
  						 $('.id_ok').css("display", "none");
  					}
                    $('.id_already').css("display", "none");
                    if($('.nickname_already').css("display")=="inline-block" || $('.nickname_ok').css("display")=="none" || $("#nickname").val() == "" ){
                    	$('#submit').attr('disabled', 'disabled');	
                    }else{
	                    $('#submit').removeAttr("disabled");
                    }
  				}
  			},
	  		  error: function (request, status,error){
	  			alert(data);
	  	        alert(error+" " + request.status + " " + request.responseText);
	  	    }
  		})
  	}
  	
	 <!-- 닉네임 중복검사 -->
	  	function nicknameCheck(){
	  		$.ajax({
	  			url : "/nicknamecheck.do" ,
	  			type : "POST",
	  			data : {"nickname" : $("#nickname").val()},
	  			success : function(resp){
	  				if(resp == 'n'){
	  					 $('.nickname_already').css("display","inline-block");
	                     $('.nickname_ok').css("display", "none");
	                     $('#submit').attr('disabled', 'disabled');
	  				}else{
	  					if($("#nickname").val() != ""){
		  					$('.nickname_ok').css("display","inline-block"); 
	  					}else{
	  		                 $('.nickname_ok').css("display", "none");
	  					}
	                    $('.nickname_already').css("display", "none");
	                    if($('.id_already').css("display")=="inline-block" || $('.id_ok').css("display")=="none" || $("#id").val() == "" ){
	                    	$('#submit').attr('disabled', 'disabled');	
	                    }else{
		                    $('#submit').removeAttr("disabled");
	                    }
	  				}
	  			},
		  		  error: function (request, status,error){
		  			alert(data);
		  	        alert(error+" " + request.status + " " + request.responseText);
		  	    }
	  		})
	  	}
  
  	
  	
  	
  </script>
  

</body>

</html>