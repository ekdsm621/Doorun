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
                    <p class="text-center small" >이메일로 가입</p>
                  </div>

                  <form action="/insertUser.do" method= "post" class="row g-3 needs-validation">

                    <div class="col-12">
                    
                      <div class="input-group has-validation">
                        <input type="text" name="email" class="form-control" id="email" placeholder="이메일" oninput="emailCheck()" required> 
                      </div>
                      <span class="email_no" style="display:none; color:red;">이메일을 입력 해주세요.</span>
                        <span class="email_ok" style="display:none; color:green;">사용 가능한 이메일입니다.</span>
						            <span class="email_already" style="display:none; color:red;" >중복된 이메일입니다</span>
                      
                    </div>
                    
                    <div class="col-12">
                      <input type="text" name="id" class="form-control" id="id" placeholder="아이디" oninput="idCheck()" required>
                      <div class="invalid-feedback">아이디를 입력해주세요</div>
                   	    <span class="id_ok" style="display:none; color:green;">사용 가능한 아이디입니다.</span>
						<span class="id_already" style="display:none; color:red;" >중복된 아이디입니다</span>
                    </div>

                    <div class="col-12">
                      <input type="password" name="password" class="form-control" id="password" placeholder="비밀번호" required>
                      <div class="invalid-feedback">비밀번호를 입력해주세요</div>
                    </div>
                    
                    <div class="col-12">
                      <input type="password" name="password_check" class="form-control" id="password_check" placeholder="비밀번호 확인" oninput="pwCheck()" required>
                      <span class="pw_ok" style="display:none; color:green;">비밀번호가 일치합니다.</span>
					  <span class="pw_no" style="display:none; color:red;" >비밀번호가 일치하지 않습니다.</span>
                    </div>
                    

                    <div class="col-12">
                      <input type="text" name="name" class="form-control" id="name" placeholder="이름" required>
                      <div class="invalid-feedback">이름을 입력해주세요</div>
                    </div>
                    <div class="col-12">
                      <input type="text" name="nickname" class="form-control" id="nickname" placeholder="닉네임" oninput="nicknameCheck()" required>
                       <span class="nickname_ok" style="display:none; color:green;">사용 가능한 닉네임입니다.</span>
					   <span class="nickname_already" style="display:none; color:red;" >중복된 닉네임입니다</span>
                      <div class="invalid-feedback">닉네임을 입력해주세요</div>
                    </div>
                    <div class="col-12">
                      <input id="phone" type="text" name="phone" class="form-control" placeholder="휴대전화" readonly>
                      <div class="invalid-feedback">휴대폰 번호를 입력해주세요</div>
                    </div>
                    <div class="col-12" data-bs-toggle="modal" data-bs-target="#sendSMS" >
                        <button type="button" class="btn btn-primary">휴대폰 본인인증</button>
                    </div>
                    
                    <div class="modal fade" id="sendSMS" tabindex="-1">
  						<div class="modal-dialog" role="document">
    						<div class="modal-content">
      							<div class="modal-header">
        							<h5 class="modal-title">인증번호 입력</h5>
    					  		</div>
      							<div class="modal-body">
      								<div class="col-12">
      									<input id="inputPhone" type="text" placeholder="휴대폰(번호만입력)" style="width:300px;height:35px;font-size:20px;">
      									<button id="sendPhoneNumber" type="button" class="btn btn-primary">인증번호받기</button>
      								</div>
      								<div class="col-12">
        								<input id="certifiedNumber" type="text" placeholder="인증번호를 입력해 주세요" style="width:300px;height:35px;font-size:20px;"/>
        							</div>
        					
      							</div>
      							<div class="modal-footer">
        							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        							<button type="button" class="btn btn-primary" id="checkBtn">인증확인</button>
      							</div>
    						</div>
  						</div>
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
                      <button id="submit" class="btn btn-primary w-100" type="submit" >가입</button> <p></p>
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
  
  <!-- 문자인증 -->
  $('#sendPhoneNumber').click(function(){
      let phoneNumber = $('#inputPhone').val();
      Swal.fire('인증번호 발송 완료!')

      $.ajax({
          type: "GET",
          url: "/sendSMS.do",
          data: {
              "phoneNumber" : phoneNumber
          },
          success: function(res){
              $('#checkBtn').click(function(){
                  if($.trim(res) ==$('#certifiedNumber').val()){
                      Swal.fire(
                              '인증성공!',
                              '휴대폰 인증이 정상적으로 완료되었습니다.',
                              'success'
                          )
                      document.getElementById('phone').value=phoneNumber ; 
                      $('#sendSMS').modal('hide')
  
                  }else{
                      Swal.fire({
                          icon: 'error',
                          title: '인증오류',
                          text: '인증번호가 올바르지 않습니다!',
                      })
                  }
              })


          }
      })
  });
  
  
  	<!-- 이메일 중복검사 -->
  	function emailCheck(){
  		
  		$.ajax({
  			url : "/emailcheck.do",
  			type : "POST",
  			data : {"email" : $("#email").val()},
  			success : function(resp){
  				var email = $("#email").val();
  		  		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  				if(email.match(regExp) != null){
  					$('.email_no').css("display", "none");
	  				if(resp == 'n'){
	  					 $('.email_already').css("display","inline-block");
	                     $('.email_ok').css("display", "none");
	  				}else{
	  					$('.email_ok').css("display","inline-block"); 
	                    $('.email_already').css("display", "none");
	  				}
  				}else{
  					$('.email_no').css("display","inline-block");
  					$('.email_ok').css("display", "none");
  					$('.email_already').css("display", "none");
  				}
  			},
	  		  error: function (request, status,error){
	  			alert(data);
	  	        alert(error+" " + request.status + " " + request.responseText);
	  	    }
  		})
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
  				}else{
  					$('.id_ok').css("display","inline-block"); 
                    $('.id_already').css("display", "none");
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
	                  
	                     
	  				}else{
	  					$('.nickname_ok').css("display","inline-block"); 
	                    $('.nickname_already').css("display", "none");
	  				}
	  			},
		  		  error: function (request, status,error){
		  			alert(data);
		  	        alert(error+" " + request.status + " " + request.responseText);
		  	    }
	  		})
	  	}
  	
  	<!-- 비밀번호 확인 -->
  	function pwCheck() {
  		var p1 = document.getElementById("password").value;
  		var p2 = document.getElementById("password_check").value;
  		if(p1 == p2){
  			$('.pw_ok').css("display","inline-block"); 
            $('.pw_no').css("display", "none");
  		}else{
  			 $('.pw_no').css("display","inline-block");
             $('.pw_ok').css("display", "none");
  		}
	}
  	
  	
  	
  	
  </script>
  

</body>

</html>