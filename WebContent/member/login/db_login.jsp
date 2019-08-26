<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인..</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>주민번호앞자리</td>
			<td>주민번호뒷자리</td>
			<td>이메일</td>
			<td>휴대전화번호</td>
			<td>zip코드</td>
			<td>주소</td>
			<td>직업</td>
		</tr>
		<%
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String mem_id="1";
			String mem_passwd="1";
			
			try {
				String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
				String dbId="jspid";
				String dbPw="jsppass";
				
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(jdbcUrl,dbId,dbPw);
				
				String sql="select * from member2";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				String check_passwd=rs.getString("passwd");
				
				if(mem_passwd.equals(check_passwd)) {
					while(rs.next()) {
						String id=rs.getString("id");
						String passwd=rs.getString("passwd");
						String name=rs.getString("name");
						String num1=rs.getString("mem_num1");
						String num2=rs.getString("mem_num2");
						String email=rs.getString("e_mail");
						String phone=rs.getString("phone");
						String zipcode=rs.getString("zipcode");
						String address=rs.getString("address");
						String job=rs.getString("job");
		%>
		<tr>
			<td><%=id %></td>
			<td><%=passwd %></td>
			<td><%=name %></td>
			<td><%=num1 %></td>
			<td><%=num2 %></td>
			<td><%=email %></td>
			<td><%=phone %></td>
			<td><%=zipcode %></td>
			<td><%=address %></td>
			<td><%=job %></td>
		</tr>
		<%
					}
				}
				else {
		%>
<script>
	alert('비밀번호 틀림');
	window.location.replace('./login.jsp');
</script>
		<%
				}
			} catch(Exception e) {
				e.printStackTrace();
		%>
<script>
	alert('로그인실패');
	window.close();
</script>
		<%
			} finally {
				if(rs != null)
					try{rs.close();}catch(SQLException sqle){}
				if(pstmt != null)
					try{pstmt.close();}catch(SQLException sqle){}
				if(conn != null)
					try{conn.close();}catch(SQLException sqle){}
			}
		%>
	</table>
</body>
</html>