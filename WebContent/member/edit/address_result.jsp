<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주소 검색</title>
	<script>
		function autoInput(address_road,zipcode,address) {
			window.opener.edit.address_road.value = address_road;
			window.opener.edit.zipcode.value = zipcode
			window.opener.edit.address.value = address;
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
			<th style="font-size:14px; text-align:center; color:black;">도로명주소</th>
			<th style="font-size:14px; text-align:center; color:black;">지번주소</th>
			<th style="font-size:14px; text-align:center; color:black;">영어주소</th>
			<th style="font-size:14px; text-align:center; color:black;">우편번호</th>
		</tr>
<%
	request.setCharacterEncoding("utf-8");
	String address_find = request.getParameter("address_find");
	address_find = address_find.trim().replaceAll(" +"," ");
	address_find = address_find.replace(" ","|");
	address_find = "'"+address_find+"'";
	//address_find = address_find.trim().replaceAll(" ","");
	//address_find = "'?"+address_find+"?'";
	
	if(address_find.length() > 50 || address_find == "") {
%>
<script>
	alert("최대 허용 길이 초과 (50자)");
	close();
</script>
<%
		return;
	}
	
	Database database = new Database();
	database.connect();
	
	String sql = "select buildingcode,zipcode,sido,sigungu,roadname,building1,building2,dongname,buildingname,jibun1,jibun2,roadname_en,sigungu_en,sido_en"
	+" from zipcode where"
	+" zipcode regexp "+address_find
	+" or sido regexp "+address_find
	+" or sigungu regexp "+address_find
	+" or roadname regexp "+address_find
	//+" and building1 regexp "+address_find
	//+" and building2 regexp "+address_find
	+" or dongname regexp "+address_find
	+" or buildingname regexp "+address_find;
	//+" and jibun1 regexp "+address_find
	//+" and jibun2 regexp "+address_find;
	// 주소검색
	ResultSet rs = database.result_query(sql);
	
	if(rs.next()) {
		do {
			String buildingcode = rs.getString("buildingcode");
			String zipcode = rs.getString("zipcode");
			String sido = rs.getString("sido");
			String sigungu = rs.getString("sigungu");
			String roadname = rs.getString("roadname");
			int building1 =  rs.getInt("building1");
			int building2 =  rs.getInt("building2");
			String dongname = rs.getString("dongname");
			String buildingname = rs.getString("buildingname");
			int jibun1 =  rs.getInt("jibun1");
			int jibun2 =  rs.getInt("jibun2");
			String roadname_en = rs.getString("roadname_en");
			String sigungu_en = rs.getString("sigungu_en");
			String sido_en = rs.getString("sido_en");
			
			String bar = "-";
			String building1s = "";
			String building2s = "";
			String jibun1s = "";
			String jibun2s = "";
			if(building1 > 0) {building1s = String.valueOf(building1);} else {building1s = "";}
			if(building2 > 0) {building2s = String.valueOf(building2);} else {building2s = "";bar = "";}
			if(dongname == null) {dongname = "";}
			if(buildingname == null) {buildingname = "";}
			if(jibun1 > 0) {jibun1s = String.valueOf(jibun1);} else {jibun1s = "";}
			if(jibun2 > 0) {jibun2s = String.valueOf(jibun2);} else {jibun2s = "";bar = "";}
			
			String address_result_road = sido+" "+sigungu+" "+roadname+" "+building1s+bar+building2s+"("+dongname+", "+buildingname+")";
			address_result_road = address_result_road.trim().replaceAll(" +"," ");
			
			String address_result_jibun = sido+" "+sigungu+" "+dongname+" "+jibun1s+bar+jibun2s+" "+buildingname;
			address_result_jibun = address_result_jibun.trim().replaceAll(" +"," ");
			
			String address_result_en = building1s+bar+building2s+", "+roadname_en+", "+sigungu_en+", "+sido_en;
%>
		<tr>
			<td>
				<a onclick="autoInput('<%=address_result_road%>','<%=zipcode%>','<%=buildingcode%>')"><%=address_result_road%></a>
			</td>
			<td>
				<%=address_result_jibun%>
			</td>
			<td>
				<%=address_result_en%>
			</td>
			<td>
				<%=zipcode%>
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
