<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.Shop" %>
<%@ page import = "Bean.ShopBean" %>
<%@ page import = "Bean.Cart" %>
<%@ page import = "Bean.CartBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%	
	Board board = Board.getInstance();
    Shop shop = Shop.getInstance();
    Cart cart = Cart.getInstance();
    
	int count = cart.getCartCount(email);
	int point = shop.getPoint(email);

    List<Integer> idList = cart.getCartId(email, 1, count);
	List<ShopBean> itemList = shop.getItems(idList);
	
	int all = 0;
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>장바구니</title>
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
    	<script>
			$(document).ready( function() {
			  $('.check-all').click( function() {
			    $('.items').prop('checked', this.checked);
			    
			    if (this.checked) {
			          total = parseInt($('#all').val());
			      } else {
			    	  total = 0;
			      }
	
			      $('#total_value').val(total);
			      $('#total').text(total);
			  } );
			  
			  $('.items').click( function(event) {
				  var total = parseInt($('#total_value').val());
				  var count = $(this).val();
				  var id = "#price" + count;
			      var price = parseInt($(id).val());
	
			      if (this.checked) {
			          total += price;
			      } else {
			    	  total -= price;
			      }
	
			      $('#total_value').val(total);
			      $('#total').text(total);
			  } );
			} );
	    </script>
<%@ include file="/assets/include/menu_member.jsp" %>

<%@ include file="/assets/include/member_top.jsp" %>

			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h3>장바구니</h3><br>
							</header>
<% if(count == 0) { %>
		<br><br><br><center>장바구니에 아이템이 존재하지 않습니다.</center><br><br><br>
<% } else { %>
							<form method="post" action="" name="cart_select">
							<table class="table table-hover">
							<thead>
								<tr>
									<td width="5%" id="thead">
										<input type="checkbox" class="check-all">
									</td>
									<td width="25%" id="thead">&nbsp;</td>
									<td width="30%" id="thead">상품명</td>
									<td width="10%" id="thead">종류</td>
									<td width="25%" id="thead">가격</td>
									<td width="5%" id="thead">&nbsp;</td>
								</tr>
							</thead>
							<tbody>
<%
		for(int i=0; i<itemList.size(); i++) {
			ShopBean item = itemList.get(i);
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
			
		    String img = "/assets/images/test2.jpg";
			if(item.getItem_img() != null) {
				img = "/assets/upload/static/" + item.getItem_type() + "/" + item.getItem_img();
			}
			
			all += item.getItem_price();
%>
							    <tr>
									<td id="tbody">
										<input type="checkbox" name="checkItem" value="<%=item.getId() %>" class="items">
										<input type="hidden" name="price<%=item.getId() %>" id="price<%=item.getId() %>" value="<%=item.getItem_price() %>">
									</td>
									<td id="tbody">
										<img src="<%=img %>" width="100%">
									</td>
									<td style="font-weight:bold; vertical-align:middle;"><%=item.getItem_name() %></td>
									<td id="tbody"><%=type %></td>
									<td id="tbody">
										<img src="/assets/images/PointLogo.png" height="20px;"> <%=NumberFormat.getInstance().format(item.getItem_price()) %>
									</td>
									<td id="tbody">
										<input type="button" value="X" class="button special" style="padding:0 10px;" 
										onclick="location.href='db_delete.jsp?menu_id=<%=item.getId() %>'">
									</td>
								</tr>
							</tbody>
<%
		}
%>
							<tfoot>
								<tr>
									<td colspan="6" style="text-align:center;">
										<input type="hidden" name="total_value" id="total_value" value="0">
										<input type="hidden" name="all" id="all" value="<%=all %>">
									</td>
								</tr>
								<tr><td style="border:none;">&nbsp;</td></tr>
								<tr style="text-align:right; font-size:24px;">
									<td colspan="4">
										<b>총 주문 금액</b>
									</td>
									<td colspan="2">
										<img src="/assets/images/PointLogo.png" height="24px;"> 
										<b id="total" style="color:#ff0000;">0</b>
									</td>
								</tr>
								<tr>
									<td colspan="6" style="text-align:right; border:none;">
										<br>
										<input type="button" value="선택삭제" class="button special" style="background-color:black;" onclick="deleteCheck()"> 
										<input type="button" value="선택구매" class="button special" onclick="buyCheck()">
									</td>
								</tr>
							</tfoot>
							</table>
							</form>
<%
}
%>
						</div>
					</div>
				</div>

<%@ include file="/assets/include/info_box.jsp" %>

			</section>
<%@ include file="/assets/include/foot.jsp" %>

</html>