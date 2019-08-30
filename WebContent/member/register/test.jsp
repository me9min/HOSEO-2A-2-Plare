<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String address_find = "서울   금하로 24  나길 17      ";
	if(address_find.length() > 50) {
%>
<script>
	alert("최대 허용 길이 초과 (50자)");
	close();
</script>
<%
		return;
	}
	address_find = address_find.trim().replaceAll(" +"," ");
	address_find = address_find.replace(" ","|");
	address_find = "'"+address_find+"'";
	//address_find = address_find.trim().replaceAll(" ","");
	//address_find = "'?"+address_find+"?'";
	
	out.print(address_find);
	
	String sql = "select zipcode,sido,sigungu,roadname,building1,building2,dongname,buildingname,jibun1,jibun2,roadname_en,sigungu_en,sido_en"
	+" from zipcode where"
	+" zipcode regexp "+address_find
	+" and sido regexp "+address_find
	+" and sigungu regexp "+address_find
	+" and roadname regexp "+address_find
	//+" and building1 regexp "+address_find
	//+" and building2 regexp "+address_find
	+" and dongname regexp "+address_find
	+" and buildingname regexp "+address_find;
	//+" and jibun1 regexp "+address_find
	//+" and jibun2 regexp "+address_find;
	out.print("<br>"+sql);
%>