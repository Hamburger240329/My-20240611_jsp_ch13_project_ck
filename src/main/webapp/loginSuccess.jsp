<%@page import="java.sql.*"%>
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
		request.getParameter("utf-8");
	
		String adminID = request.getParameter("adminId");
		String adminPW = request.getParameter("adminPW");
		
		String sql = "SELECT * FORM members WEERE id=? AND passwd =?";
			
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jsp_projectdb";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driverName); // jdbc 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, adminID);
			pstmt.setString(1, adminPW);
					
			// int success = pstmt.executeUpdate(); // sql 문 실행(1이 반환되면 성공, 0이 반환되면 실패)
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {//참이면 로그인 성공->rs내에 반환되어진 레코드가 1개 존재
				session.setAttribute("adminID", adminID);
			} else {//로그인 실패 ->rs 내에 반환되어진레코드가 0개
				response.sendRedirect("loginErr.jsp");
			}
			
		} catch(Exception e) {
			e.printStackTrace(); //에러 내용 출력	
		} finally {
			try{
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	%>

</body>
</html>
