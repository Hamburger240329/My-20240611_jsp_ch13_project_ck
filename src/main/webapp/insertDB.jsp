<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertDB.jsp</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");//파라미터로 넘어온 값(문자) utf-8로 인코딩
	
		String uid = request.getParameter("userID");
		String upw = request.getParameter("userPW");
		String uemail = request.getParameter("userEmail");
	
	
		String sql = "INSERT INTO members(id, passwd, email) VALUES(?,?,?)";
	
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jsp_projectdb";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driverName); // jdbc 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, uid);
			pstmt.setString(2, upw);
			pstmt.setString(3, uemail);
					
			int success = pstmt.executeUpdate(); // sql 문 실행(1이 반환되면 성공, 0이 반환되면 실패)
			
			if(success == 1){// 조건이 참이면 sql문 실행 성공
				out.println("회원 가입 성공!");
				response.sendRedirect("signupSuccess.jsp");

			} else{ // 조건이 거짓이므로 sql문 실행 실패
				out.println("회원 가입 실패!");
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