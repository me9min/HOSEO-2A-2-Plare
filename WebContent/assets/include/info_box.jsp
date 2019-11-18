<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="info_box">
<%
	try {
		if(email != null) {
%>
	<b style="color:white;"><%=bmenu.getNickname(email) %></b> 님<br><br>
	보유 포인트<br>
	<b style="color:white;"><%=NumberFormat.getInstance().format(point) %></b><br><br>
	<button type="button" class="button special" onclick="location.href='/member/wallet/buy_point.jsp'">충전하기</button><br><br>
	<button type="button" class="button special" onclick="location.href='/member/cart/'">장바구니</button><br><br>
	<button type="button" class="button special" onclick="location.href='/member/inventory/'">인벤토리</button>
<%
		} else {
			throw new Exception("no login!");
		}
	} catch(Exception ex) {
%>
	<b style="color:white;">?</b> 님<br><br>
	<b style="color:white;">상점이용은<br>로그인과<br>스팀아이디<br>등록이<br>필요합니다</b><br><br>
	<button type="button" class="button special" onclick="location.href='/member/login'">로그인하기</button>
<%
	}
%>
</div>