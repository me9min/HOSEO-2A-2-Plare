<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="info_box">
	<b style="color:white;"><%=bmenu.getNickname(email) %></b> 님<br><br>
	보유 포인트<br>
	<b style="color:white;"><%=NumberFormat.getInstance().format(point) %></b><br><br>
	<button type="button" class="button special" onclick="location.href='/member/wallet'">충전하기</button><br><br>
	<button type="button" class="button special" onclick="location.href='/member/cart/'">장바구니</button>
</div>