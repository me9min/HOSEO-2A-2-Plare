<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.*,java.util.*,java.text.*" %>
<%@ include file="/assets/include/login_check.jsp" %>

<%	
    Shop shop = Shop.getInstance();
	int point = shop.getPoint(email);
	int price = Integer.parseInt(request.getParameter("price"));
%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>무통장 입금</title>
		<style>
			td {color: black; background-color: #ffffff; height: 100%;}
			#thead {text-align: center; background-color: black; color: white;}
			#info_box {
				position: fixed; top: 30%; right: 5%; background-color: black; color: white;
				text-align: center; vertical-align: middle; padding: 10px; border-radius: 5px;
			}
			#thead {text-align: center; background-color: black; color: white;}
			#con {display: inline; width: 100px;}
			#q {display: inline; width: 300px;}
			#link {color: black; text-decoration: none;}
			#link:visited {color: black; text-decoration: none;}
			#link:hover {color: #ff0000; text-decoration: none;}
      </style>
      <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
      <script language="JavaScript" src="wallet.js"></script>
     
<%@ include file="/assets/include/menu_member.jsp" %>
<%@ include file="/assets/include/member_top.jsp" %>

		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
						<form method="post" action="buy_bank_confirm.jsp" name="bank">
						<input type="hidden" name="price" value="<%=price %>">
							<header class="align-center">
								<h2>무통장 입금</h2>
							</header>
							<center><p>포인트와 실제 금액은 같습니다</p></center><br>
			<div class="row uniform">
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">입금자명</div>
				</div>
				<div class="5u 12u$(xsmall)">
					<input type="text" name="bank_name" id="bank_name" value="" placeholder="입금자명">
				</div>
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">은행</div>
				</div>
				<div class="5u 12u$(xsmall)">
				 	<select name="bank_account">
				 		<option value="" selected>입금할 은행 선택</option>
				 		<option value="NH농협 302-2222-4446" style="width:100px;height:70px;">NH농협 302-2222-4446</option>
				 		<option value="KB국민 214-1151-1461" style="width:100px;height:70px;">KB국민 214-1151-1461</option>
				 		<option value="IBK기업 019-2555-4444" style="width:100px;height:70px;">IBK기업 019-2555-4444</option>
				 		<option value="KEB하나 155-4465-1111" style="width:100px;height:70px;">KEB하나 155-4465-1111</option>
				 	</select>
			 	</div>
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			</div>	
			<table class="table table-hover"><br><br><br>
				<tfoot>
					<tr style="text-align:right;">
						<td colspan="4">
							<b>보유 금액</b>
						</td>
						<td>
							<b><%=point %></b>
						</td>
					</tr>
					<tr style="text-align:right;">
						<td colspan="4" style="border-top:none;">
							<b>충전 금액</b>
						</td>
						<td style="border-top:none;">
							<b>+ <%=price %></b>
						</td>
					</tr>
					<tr style="text-align:right; font-size:24px;">
						<td colspan="4">
							<b>충전 후 금액</b>
						</td>
						<td>
							<img src="/assets/images/PointLogo.png" height="24px;"> 
							<b style="color:#ff0000;"><%=point+price %></b>
						</td>
					</tr>
				</tfoot>
			</table>
			<div class="row uniform">
				<div class="5u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)">
					<button type="button" style="width:150px;height:70px;" onclick="bankCheck()">
						결제하기
					</button>
				</div>
				<div class="4u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			</div>	<br><br>
					</form>
					</div>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>