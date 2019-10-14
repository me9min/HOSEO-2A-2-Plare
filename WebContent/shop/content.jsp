<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.Shop" %>
<%@ page import = "Bean.ShopBean" %>
<%@ page import = "java.text.NumberFormat" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">	
	<style>
		#info_box {
				position: fixed; top: 30%; right: 5%; background-color: black; color: white;
				text-align: center; vertical-align: middle; padding: 10px; border-radius: 5px;
		}
		#shop_button{
		width:150px;
		height:50px;
		}
		#inputtext{
		height:300px;
		}
		#border{
		border-top:none;
		}
		table {
		border-collapse:collapse;
		}
		#link {color: black; text-decoration: none;}
		#link:visited {color: black; text-decoration: none;}
		#link:hover {color: red; text-decoration: none;}
		#blank {text-align: right; width: 5%;}
	</style>
<%@ include file="/assets/include/menu.jsp" %>
<%@ include file="/assets/include/shop_top.jsp" %>
<%
	int id = 0;
	String ids = request.getParameter("id");
	if(ids != null) {
		id = Integer.parseInt(ids);
	}

	Board board = Board.getInstance();	
	Shop sh = new Shop();
	int point = sh.getPoint(email);

	String admin = "admin@plare.cf";

	try{
		Shop shop = Shop.getInstance(); 
		ShopBean item = shop.getItem(id);

	    String img = "/assets/images/test2.jpg";
		if(item.getItem_img() != null) {
			img = "/assets/upload/static/" + item.getItem_type() + "/" + item.getItem_img();
		}
%>
<head>
<title><%=item.getItem_name() %></title>
</head>
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
				<div style="height:438px;">
				<a href="index.jsp" class="button alt pull-right">상품목록</a><br><br><br>
					<div class="row">
						<div class="col-md-8">
							<div style="width:350px; background:white; margin:0 auto;" >
							  <img src="<%=img %>" width="350px">
							</div>
						</div>
							<div class="col-md-4">
							  <div style="border: 1px solid #ff0000; padding:15px;text-align:center;">
							  	<h4><%=item.getItem_name() %></h4>
							  	<hr>
							  	<div style="ling-height:23px;">
							  	   <h4><img src="/assets/images/PointLogo.png" height="23px;"> <%=NumberFormat.getInstance().format(item.getItem_price()) %></h4>
							  	</div>
							  	
							  	<br>
							  	<input type="button" value="장바구니 담기" id="shop_button" onclick="location.href='db_cart.jsp?id=<%=item.getId() %>'">
							  	<br><br>
							  	<input type="button" value="바로 구매"  id="shop_button" style="background-color:#ff0000 !important;" onclick="location.href='db_buy.jsp?id=<%=id %>'">
							  	<br><br><br>
<%
	if(email.equals(admin)) {
%>
							<br><br>
							<button class="button special" onclick="location.href='edit.jsp?id=<%=item.getId() %>'">수정</button>
							<button class="button special" onclick="location.href='db_delete.jsp?id=<%=item.getId() %>'">삭제</button>
<%
	}
%>
							  </div>
							</div>

					</div>
				</div>
				</div>
			</div>
		</div>
		<div id="info_box">
					<b style="color:white;"><%=board.getNickname(email) %></b> 님<br><br>
					보유 포인트<br>
					<b style="color:white;"><%=NumberFormat.getInstance().format(point) %></b><br><br>
					<button type="button" class="button special">충전하기</button><br><br>
					<button type="button" class="button special" onclick="location.href='../member/cart/'">장바구니</button>
		</div>
	</section>
<%
	} catch(Exception e) {}
%>

<%@ include file="/assets/include/foot.jsp" %>

</body>
</html>