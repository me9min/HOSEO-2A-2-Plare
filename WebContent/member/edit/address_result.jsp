<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주소 검색</title>
	<script>
		function autoInput(zipcode, address) {
			var address_value = zipcode + " " + address;
			window.opener.edit.address.value = address_value;
			window.close();
		}
	</script>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="../../assets/css/main.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>더 많은 기능이용</p>
								<h2>우편번호 검색</h2>
							</header>
							
	<table align="center">
		<tr>
			<td style="font-size:14px; text-align:center; color:black; font-weight:bold;">우편번호</td>
			<td style="font-size:14px; text-align:center; color:black; font-weight:bold;">주소</td>
		</tr>
<%
	request.setCharacterEncoding("utf-8");
	Database database = new Database();
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
				<a href="#" onclick="autoInput('<%=zipcode%>', '<%=address_result%>')"><%=zipcode%></a>
			</td>
			<td>
				<a href="#" onclick="autoInput('<%=zipcode%>', '<%=address_result%>')"><%=address_result%></a>
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
	<center><a href="JavaScript:self.close()" class="button alt">닫기</a> <a href="JavaScript:history.back()" class="button alt">뒤로가기</a></center>
						</div>
					</div>
				</div>
			</section>
</body>
<body>

</html>
