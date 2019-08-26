<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입중..</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String passwordc = request.getParameter("passwordc");
	String nickname = request.getParameter("nickname");
	String birthday = request.getParameter("birthday");
	String phone = request.getParameter("phone");
	String zipcode = request.getParameter("zipcode");
	String referrer = request.getParameter("referrer");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	try {
		String jdbcUrl="jdbc:mysql://plare.cf:3306/web";
		String dbId="admin";
		String dbPw="asdf1346ma";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl,dbId,dbPw);
		
		String sql="insert into member values(?,?,?,now(),?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,email);
		pstmt.setString(2,password);
		pstmt.setString(3,nickname);
		pstmt.setString(4,birthday);
		pstmt.setString(5,phone);
		pstmt.setString(6,zipcode);
		pstmt.setString(7,referrer);
		pstmt.executeUpdate();
%>
<script>
	alert('회원가입성공');
    window.location.replace('../');
</script>
<%
	} catch(Exception e) {
		e.printStackTrace();
%>
<script>
	alert('회원가입실패');
	window.location.replace('./');
</script>
<%
	} finally {
		if(pstmt != null)
			try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)
			try{conn.close();}catch(SQLException sqle){}
	}
%>
</body>
</html>