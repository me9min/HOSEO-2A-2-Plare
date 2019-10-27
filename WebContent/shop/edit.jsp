<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.Shop" %>
<%@ page import = "Bean.ShopBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "com.*" %>
<%
	RemoveTag rt = new RemoveTag();
	int id = Integer.parseInt(request.getParameter("id"));
	
	try {
		Shop shop = Shop.getInstance();
		ShopBean item = shop.getItem(id);
		String dec = "";
		if(item.getItem_dec() != null) {
			dec = item.getItem_dec();
		}
%>
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
		<form method="post" action="db_edit.jsp" name="item_update">
		<input type="hidden" name="id" value="<%=id %>">
		<table class="table">
			<tr>
				<td align="center" width="30%" style="vertical-align: middle">아이템 고유 아이디</td>
				<td><input type="text" name="unique_id" id="unique_id" value="<%=item.getUnique_id() %>" /></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">카테고리</td>
				<td><select name="item_type">
					<option value="playerskin" <% if(item.getItem_type().equals("playerskin")) {%>selected<%} %>>플레이어 스킨</option>
					<option value="hat" <% if(item.getItem_type().equals("hat")) {%>selected<%} %>>모자</option>
					<option value="pet" <% if(item.getItem_type().equals("pet")) {%>selected<%} %>>펫</option>
					<option value="grenadeskin" <% if(item.getItem_type().equals("grenadeskin")) {%>selected<%} %>>수류탄 스킨</option>
					<option value="lasersight" <% if(item.getItem_type().equals("lasersight")) {%>selected<%} %>>레이저 사이트</option>
				</select></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">이름</td>
				<td><input type="text" name="item_name" id="item_name" value="<%=item.getItem_name() %>"/></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">가격</td>
				<td><input type="text" name="item_price" id="item_price" value="<%=item.getItem_price() %>"/></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">이미지 파일</td>
				<td>
					<div class="row uniform">
						<div class="2u 12u$(small)"><a href="#" class="button alt" onclick="window.open('upload_image.html','이미지 첨부','width=800,height=600,top=0,left=0,toolbar=no,menubar=no,scrollbars=1,resizable=1')">첨부</a></div>
						<div class="10u 12u$(small)"><input type="text" name="item_img" id="item_img" value="<%=item.getItem_img() %>"/></div>
					</div>
				</td>
			</tr>
			<tr>
				<td height="200px" align="center" style="vertical-align: middle">아이템 설명</td>
				<td height="200px">
					<input type="textarea" name="item_dec" id="item_dec" style="height:200px;width:600px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" class="button special pull-right" value="수정하기" onclick="updateCheck()"></td>
			</tr>
		</table>
		</form>
	</div></div></div></section>
	
<%@ include file="/assets/include/foot.jsp" %>
  </body>
</html>

<script>
	var content = '<%=rt.removeJSInput(item.getItem_dec())%>';
	window.onload = function () {
		document.getElementById('item_dec').value = content;
	}
</script>
 <%
	} catch(Exception e) {}
 %>