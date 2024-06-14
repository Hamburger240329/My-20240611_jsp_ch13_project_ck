<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
</head>
<body>
	<%
		if(session.getAttribute("adminID") == null || !(session.getAttribute("adminID").equals("space"))){
			response.sendRedirect("login.jsp");
		}
		
	%>

	<h2>회원 리스트</h2>
	<hr>
	아이디 / 이메일 / 가입일시 <br>
	<%
		request.getParameter("utf-8");
	
		String adminID = request.getParameter("adminId");
		String adminPW = request.getParameter("adminPW");
		
		String sql = "SELECT id, email, signuptime FROM members"; // 비밀번호는 가져오지 말라고 예제에 있으니 비밀번호 외에 항목 기입
		
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
			
					
			// int success = pstmt.executeUpdate(); // sql 문 실행(1이 반환되면 성공, 0이 반환되면 실패)
			rs = pstmt.executeQuery();
			
			int count = 0;
			
			while(rs.next()) {
				count++; // count 에다가 반복될 수록 더함 1번은 1, 2번은 2 ...
				String mid = rs.getString("id");
				String memail = rs.getString("email");
				String mtime = rs.getString("signuptime");
				
				out.println(count + " : "+ mid + " / " + memail + " / " + mtime + "<br>");

			}
			
			out.println("총 회원 수 : " + count + "명");
						
		} catch(Exception e) {
			e.printStackTrace(); //에러 내용 출력	
		} finally {
			try{
				if(rs != null){
					rs.close();
				}	
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
	<hr>
	<table border="0">
	<tr>
		<td>
			<form action="withdraw.jsp">
				<input type="submit" value="◀ 회원탈퇴시키기">
			</form>
		</td>
		<td>
			<form action="logout.jsp">
				<input type="submit" value="회원 탈퇴하기 ▶">
			</form>
		</td>	
	</tr>
</table>
	
</body>
</html>