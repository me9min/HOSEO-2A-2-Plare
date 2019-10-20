<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.BoardBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
 <html>
 	<head>
		<title>상점</title>
		<script language="JavaScript" src="shop.js"></script>
<%@ include file="/assets/include/menu.jsp" %>
<%@ include file="/assets/include/shop_top.jsp" %>
  <section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h2>상품등록</h2>
							</header>
		<form method="post" action="db_write.jsp" name="item_insert">
		<table class="table">
			<tr>
				<td align="center" width="30%" style="vertical-align: middle">아이템 고유 아이디</td>
				<td><input type="text" name="unique_id" id="unique_id" /></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">카테고리</td>
				<td><select name="item_type">
					<option value="playerskin">플레이어 스킨</option>
					<option value="hat">모자</option>
					<option value="pet">펫</option>
					<option value="grenadeskin">수류탄 스킨</option>
					<option value="lasersight">레이저 사이트</option>
				</select></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">이름</td>
				<td><input type="text" name="item_name" id="item_name"/></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">가격</td>
				<td><input type="text" name="item_price" id="item_price"/></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">이미지 파일</td>
				<td></td>
			</tr>
			<tr>
				<td height="200px" align="center" style="vertical-align: middle">아이템 설명</td>
				<td height="200px">
					<input type="text" name="item_dec" id="item_dec" style="height:200px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" class="button special pull-right" value="등록하기" onclick="insertCheck()"></td>
			</tr>
		</table>
		</form>
	</div></div></div></section>
	
<%@ include file="/assets/include/foot.jsp" %>
  </body>
 </html>
