<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String errMsg = (String)session.getAttribute("errMsg");
	if (errMsg == null) errMsg = "";
	
	session.invalidate();

%>


<!DOCTYPE html>
<html>
<head>
     <%@include file="/common_jsp/head_settings.jsp" %>
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
  

</head>

<body style="background-image: url(assets/img/pexels-pixabay-235922.jpg); opacity: 0.8; background-size: cover;">

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
                	<div class="text-center">
                     <a id="kakao-login-btn"></a>
                	</div>
                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4" style="font-size: 5px;">이메일로 로그인</h5>
                  </div>

                  

                  <form name="login" action="/login.do" method ="post" class="row g-3 needs-validation"  >

                    <div class="col-12">
                      <div class="input-group has-validation">
                        <input type="text" name="login" class="form-control" id="login" placeholder="이메일 or 아이디" required>
                        <div class="invalid-feedback">이메일이나 아이디를 입력해주세요</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <input type="password" name="password" class="form-control" id="password" placeholder="비밀번호" required>
                      <div class="invalid-feedback">비밀번호를 입력해주세요</div>
                    <div id ="errMsg" style ="color:red"><%=errMsg%></div>
                    </div>
                    

                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">이메일 저장</label>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">로그인</button>
                    </div>
                    <div class="col-12">
                      <p class="small mb-0">계정이 없으신가요? <a href="createAccount.jsp">회원가입</a></p>
                      <p class="small mb-0">비밀번호를 잊으셨나요? <a href="findPw.jsp">비밀번호 찾기</a></p>
                    </div>
                  </form>
                  <form name="kakaoLogin" action="/login.do" method ="post">
                  
					<input type="hidden" id="email" name="email">
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
  
   <!-- 카카오 로그인 -->
    <script type="text/javascript">
      window.Kakao.init('a86d3c36ccc01996ba44e0964be7fe82');
      <!-- 
      function kakaoLogin() {
          // 로그인
          window.Kakao.Auth.login({
              scope: 'profile_image , profile_nickname', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
              success: function(response) {
                  console.log(response) // 로그인 성공하면 받아오는 데이터
                  window.Kakao.API.request({ // 사용자 정보 가져오기 
                      url: '/v2/user/me',
                      success: (res) => {
                          const kakao_account = res.kakao_account;
                          console.log(kakao_account)
                      }
                  });
              },
              fail: function(error) {
                  console.log(error);
              }
          });
      }
      -->
      Kakao.Auth.createLoginButton({
    	    container: '#kakao-login-btn',
    	    success: function(authObj) {
    	      Kakao.API.request({
    	        url: '/v2/user/me',
    	        success: function(result) {
    	          $('#result').append(result);
    	          id = result.id
    	          connected_at = result.connected_at
    	          kakao_account = result.kakao_account
    	          $('#result').append(kakao_account);
    	          resultdiv="<h2>로그인 성공 !!"
    	          resultdiv += '<h4>id: '+id+'<h4>'
    	          resultdiv += '<h4>connected_at: '+connected_at+'<h4>'
    	          email ="";
    	          gender = "";
    	          if(typeof kakao_account != 'undefined'){
    	        	  email = kakao_account.email;
    	        	  gender = kakao_account.gender;
    	        	  document.getElementById("email").value = email
    	        	  document.kakaoLogin.submit();
    	          }
    	          resultdiv += '<h4>email: '+email+'<h4>'
    	          resultdiv += '<h4>gender: '+gender+'<h4>'
    	          $('#result').append(resultdiv);
    	        },
    	        fail: function(error) {
    	          alert(
    	            'login success, but failed to request user information: ' +
    	              JSON.stringify(error)
    	          )
    	        },
    	      })
    	    },
    	    fail: function(err) {
    	      alert('failed to login: ' + JSON.stringify(err))
    	    },
    	  })
      </script>
       
 
</body>

</html>