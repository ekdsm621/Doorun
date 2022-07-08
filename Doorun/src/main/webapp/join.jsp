<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="address_api.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3> 회원가입</h3>
		
	       <form action = "insertUser.do" method ="post">
	              	<label for="id">아이디</label>
	              	<input id="id" type="text" name="id" ><br>
	              	
		              <label for="password">비밀번호</label>
		              <input id="password" type="password" name="password" ><br>
		              
	                <label for="repass">비밀번호 재입력</label>
	                <input id="repass" name="repass" type="password"><br>
	                
	                <label for="name">이름</label>                
	                <input id="name" name="name" type="text"><br>
	                
			        <input type="text" id="postcode" placeholder="우편번호">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="address" name="address" placeholder="주소" style="width:300px"><br>
					
	                <label for="phone">전화번호</label>
	                <input id="phone" name="phone" type="tel"><br>
	                
	                <label for="email">이메일</label>
	                <input id="email" name="email" type="email"><br>
	                
	                <label for="birth">생년월일</label>
	                <input id="birth" name="birth" type="date"><br>
	                
	                <label for="gender">성별</label>
	                <input type="radio" name="gender" value="man">남
					<input type="radio" name="gender" value="woman">여<br>
					
	                <label for="groupid">그룹명</label>
	                <input id="groupid" name="groupid" type="text"><br>
	                
		            <input type = "submit" value = "회원가입">
		            <button id="cancle" onclick="location.href='login.jsp'" >취소</button>
            </form>
    </center>

</body>
</html>