<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.Shop" %>
<%@ page import = "Bean.ShopBean" %>
<%@ page import = "java.text.NumberFormat" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%@ include file="/assets/include/steamid_check.jsp" %>
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
<%@ include file="/assets/include/menu_member.jsp" %>
<%@ include file="/assets/include/member_top.jsp" %>
<%
	int id = 0;
	String ids = request.getParameter("id");
	if(ids != null) {
		id = Integer.parseInt(ids);
	}

	Board board = Board.getInstance();	
	Shop sh = new Shop();
	int point = sh.getPoint(email);
	
	try{
		Shop shop = Shop.getInstance(); 
		ShopBean item = shop.getItem(id);

	    String img = "/assets/images/test2.jpg";
		if(item.getItem_img() != null) {
			img = item.getItem_img();
		}
		String dec = "";
		if(item.getItem_dec() != null) {
			dec = item.getItem_dec();
		}
		String type = "";
		if(item.getItem_type().equals("playerskin")) {
			type = "플레이어";
		} else if(item.getItem_type().equals("hat")) {
			type = "모자";
		} else if(item.getItem_type().equals("pet")) {
			type = "펫";
		} else if(item.getItem_type().equals("grenadeskin")) {
			type = "수류탄";
		} else if(item.getItem_type().equals("lasersight")) {
			type = "레이저 사이트";
		}
		int price_sell = (int)(item.getItem_price() * 0.5);
%>
<script>
	function sell_confirm() {
		if(confirm("정말 되파시겠습니까?") == true) {
			location.href='db_sell.jsp?id=<%=item.getUnique_id()%>';
		} else {
			return;
		}
	}
</script>
<head>
<title><%=item.getItem_name() %></title>
</head>
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
				<a href="index.jsp" class="button alt pull-right">보유목록</a><br><br><br>
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
							  	   <h5>실구매 가격 : </h5>
							  	   <h4 style="color:red; text-decoration:line-through;">
							  	   		<%=NumberFormat.getInstance().format(item.getItem_price()) %>
							  	   </h4>
							  	   <h5>되팔기 가격 : </h5>
							  	   <h3>
							  	   		<img src="/assets/images/PointLogo.png" height="30px;"> 
							  	   		<%=NumberFormat.getInstance().format(price_sell) %>
							  	   </h3>
							  	</div>
							  	<br>
							  	<input type="button" value="되팔기" id="shop_button" style="background-color:#ff0000 !important;" onclick="sell_confirm()">
							  	<br><br>
							</div>
							<br>
					</div>
					<div class="row" style="margin-top:20px;">
				  	  <div class="col-md-12" style="border: 1px solid white;">
				  	  	<h6 style="color:#a6a6a6;">해당 상품은 <%=type %> 외형 아이템으로 인게임 내에서 아무런 추가 효과가 없습니다.</h6><hr>
				  	    <h5><%=dec %></h5>
				  	  </div>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/assets/include/info_box.jsp" %>

	</section>
<%
	} catch(Exception e) {}
%>

<%@ include file="/assets/include/foot.jsp" %>

</body>
</html>