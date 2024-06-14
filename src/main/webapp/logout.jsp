<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		session.invalidate();// 세션 삭제
	%>
	<h2>관리자 로그 아웃</h2>
	<hr>
	로그아웃을 수행하였습니다<br>
	그동안 수고하셨습니다.<br>
	<table border="0">
	<tr>
		<td>
		<td>
			<form action="login.jsp">
				<input type="submit" value="다시 로그인 ▶▶">
			</form>
		</td>	
	</tr>
</body>
</html>