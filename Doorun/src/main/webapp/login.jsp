<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<center>
		<h1>로그인</h1>
		<form action = "login.do" method="post">
			<tr>
				<td>아이디<input type="text" name="id" value="${user.id}"/></td>			
			</tr>
			<p><p><p>
			<tr>
				<td>비밀번호<input type="password" name="password" value="${user.password}"/></td>				
			</tr>
			<p><p><p>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="로그인"/></td>
				<td><input type="button" onclick="location.href='join.jsp'" value="회원가입"></td>
			</tr>
		</form>	
	</center>





</body>
</html>