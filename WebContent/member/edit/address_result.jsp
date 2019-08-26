<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주소 검색</title>
	<script>
		function auto_input(zipcode, address) {
			var address_value = zipcode + " " + address;
			window.opener.edit.address.value = address_value;
			window.close();
		}
	</script>
</head>
<body>
	<table align="center">
		<tr>
			<th>우편번호</th>
			<th>주소</th>
		</tr>
<%
	Database database = new Database();
	request.setCharacterEncoding("utf-8");
	
	database.connect();
	String address = request.getParameter("address");
	
	String sql = "select * from zipcode where dong like '%" + address + "%'";
	ResultSet rs = database.result_query(sql);
	
	if(rs.next()) {
		do {
			String zipcode = rs.getString("zipcode");
			String sido = rs.getString("sido");
			String gugun = rs.getString("gugun");
			String dong = rs.getString("dong");
			String ri = rs.getString("ri");
			String bunji = rs.getString("bunji");
			if(ri == null) ri = "";
			if(bunji == null) bunji = "";
			String address_result = sido + " " + gugun + " " + dong + " " + ri + " " + bunji;
%>
		<tr>
			<td>
				<a href="#" onclick="auto_input('<%=zipcode%>', '<%=address_result%>')"><%=zipcode%></a>
			</td>
			<td>
				<a href="#" onclick="auto_input('<%=zipcode%>', '<%=address_result%>')"><%=address_result%></a>
			</td>
		</tr>
<%
		} while(rs.next());
%>
	</table>
<%
	} else {
%>
	</table>
	검색 결과가 존재하지 않습니다.
<%
	}
%>
	<center><a href="JavaScript:self.close()">닫기</a></center>
</body>
</html>
