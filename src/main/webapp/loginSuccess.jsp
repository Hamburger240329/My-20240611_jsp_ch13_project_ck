<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 성공</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String amdinID = request.getParameter("adminID");
		String amdinPW = request.getParameter("adminPW");
		
		String sql = "SELECT * FROM members WHERE id=? AND passwd =?";
			
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jsp_projectdb";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driverName);//jdbc 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, amdinID);			
			pstmt.setString(2, amdinPW);
					
			// int success = pstmt.executeUpdate(); // sql 문 실행(1이 반환되면 성공, 0이 반환되면 실패)
			rs = pstmt.executeQuery();
			
			
			if(rs.next() && amdinID.equals("space")) {//참이면 로그인 성공->rs내에 반환되어진 레코드가 1개 존재
				session.setAttribute("adminID", amdinID);
			} else {//로그인 실패 ->rs 내에 반환되어진레코드가 0개
				response.sendRedirect("loginErr.jsp");
			}
			
		} catch(Exception e) {
			e.printStackTrace();//에러 내용 출력
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}				
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}	
		
	%>
	<h2>관리자 로그인</h2>
	<hr>
	새로운 새션 성공!<br>
	관리자 [<%= amdinID %>] 님이 로그인 하셨습니다.<br>
	<table border="0">
	<tr>
		<td>
			<form action="memberList.jsp">
				<input type="submit" value="◀ 등록회원 관리하기">
			</form>
		</td>
		<td>
			<form action="logout.jsp">
				<input type="submit" value="로그 아웃 ▶">
			</form>
		</td>	
	</tr>
</table>
</body>
</html>
