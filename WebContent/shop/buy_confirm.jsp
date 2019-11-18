<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.Shop" %>
<%@ page import = "Bean.ShopBean" %>
<%@ page import = "Bean.Cart" %>
<%@ page import = "Bean.CartBean" %>
<%@ page import = "java.text.NumberFormat" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%@ include file="/assets/include/steamid_check.jsp" %>
<%!
    int pageSize = 6;
%>
<%
	String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }
	int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;

	Board board = Board.getInstance();
    Shop shop = Shop.getInstance();
    Cart cart = Cart.getInstance();
    
    int id = Integer.parseInt(request.getParameter("id"));
	ShopBean item = shop.getItem(id);
	int point = shop.getPoint(email);
	
	int all = 0;
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>구매</title>
		<style>
			td {color: black; background-color: #ffffff; height: 100%;}
			#thead {text-align: center; background-color: black; color: white;}
			#tbody {vertical-align: middle; text-align: center;}
			#info_box {
				position: fixed; top: 30%; right: 5%; background-color: black; color: white;
				text-align: center; vertical-align: middle; padding: 10px; border-radius: 5px;
			}
			#link {color: black; text-decoration: none;}
			#link:visited {color: black; text-decoration: none;}
			#link:hover {color: #ff0000; text-decoration: none;}
		</style>
		<script language="JavaScript" src="cart.js"></script>
		<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/assets/include/menu_member.jsp" %>

<%@ include file="/assets/include/member_top.jsp" %>

			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h3>구매</h3><br>
							</header>
							<form method="post" action="db_buy.jsp" name="cart_buy">
							<table class="table table-hover">
							<thead>
								<tr>
									<td id="thead">&nbsp;</td>
									<td width="40%" id="thead">상품명</td>
									<td id="thead">종류</td>
									<td width="20%" id="thead">가격</td>
								</tr>
							</thead>
							<tbody>
<%
			String type = "";
			if(item.getItem_type().equals("playerskin")) {
				type = "스킨";
			} else if(item.getItem_type().equals("hat")) {
				type = "모자";
			} else if(item.getItem_type().equals("pet")) {
				type = "펫";
			} else if(item.getItem_type().equals("grenadeskin")) {
				type = "수류탄";
			} else if(item.getItem_type().equals("lasersight")) {
				type = "레이저 사이트";
			}
%>
							    <tr>
									<td id="tbody">&nbsp;</td>
									<td style="font-weight:bold; vertical-align:middle;" id="tbody"><%=item.getItem_name() %></td>
									<td id="tbody"><%=type %></td>
									<td id="tbody">
										<img src="/assets/images/PointLogo.png" height="20px;"> <%=NumberFormat.getInstance().format(item.getItem_price()) %>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="4" style="text-align:center;">
										<input type="hidden" name="all" id="all" value="<%=all %>">
									</td>
								</tr>
								<tr><td style="border:none;">&nbsp;</td></tr>
								<tr style="text-align:right;">
									<td colspan="3">
										<b>보유 금액</b>
									</td>
									<td>
										<b><%=point %></b>
									</td>
								</tr>
								<tr style="text-align:right;">
									<td colspan="3" style="border-top:none;">
										<b>주문 금액</b>
									</td>
									<td style="border-top:none;">
										<b>- <%=item.getItem_price() %></b>
									</td>
								</tr>
								<tr style="text-align:right; font-size:24px;">
									<td colspan="3">
										<b>구매 후 금액</b>
									</td>
									<td>
										<img src="/assets/images/PointLogo.png" height="24px;"> 
										<b style="color:#ff0000;"><%=point-item.getItem_price() %></b>
									</td>
								</tr>
								
<%
	if((point - item.getItem_price()) < 0) {
%>
								<tr>
									<td colspan="4" style="text-align:center; border:none;">
										보유 포인트가 부족합니다.
									</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center; border:none;">
										<input type="button" class="button special" value="충전하기" onclick="location.href='../member/wallet/buy_point.jsp'">
<%		
	} else {
%>
								<tr>
									<td colspan="4" style="text-align:center; border:none;">
										정말로 구매하시겠습니까?
									</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center; border:none;">
										<input type="button" class="button special" value="구매하기" onclick="location.href='db_buy.jsp?id=<%=id %>'">
										<input type="button" class="button alt" value="이전으로" onclick="history.back()">
<%
	}
%>
									</td>
								</tr>
							</tfoot>
							</table>
							</form>
						</div>
					</div>
				</div>

<%@ include file="/assets/include/info_box.jsp" %>

			</section>
<%@ include file="/assets/include/foot.jsp" %>

</html>