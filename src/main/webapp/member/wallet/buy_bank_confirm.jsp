<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.*,java.util.*,java.text.*" %>
<%@ include file="/assets/include/login_check.jsp" %>

<%	
    Shop shop = Shop.getInstance();
	int point = shop.getPoint(email);
	int price = Integer.parseInt(request.getParameter("price"));
	String name = request.getParameter("bank_name");
	String account = request.getParameter("bank_account");
	
    Calendar currentCalendar = Calendar.getInstance();
    DecimalFormat df = new DecimalFormat("00");
    String year = Integer.toString(currentCalendar.get(Calendar.YEAR));
    String month  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
    String day = Integer.toString(currentCalendar.get(Calendar.DAY_OF_MONTH) + 1);
%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>무통장 입금 대기</title>
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
						<form method="post" action="db_card.jsp" name="card">
							<header class="align-center">
								<h2>무통장 입금 대기</h2>
								<br><br>
							</header>
			<div class="row uniform">
				<div class="4u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="4u 12u$(xsmall)">
					<input type="text" value="<%=name %>" disabled>
				</div>
				<div class="4u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			
				
				<div class="4u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:right; vertical-align:middle;height:27px;">은행</div>
				</div>
				<div class="4u 12u$(xsmall)">
				 	<input type="text" value="<%=account %>" disabled> 
			 	</div>
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				
				<div class="4u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="4u 12u$(xsmall)">
					<input type="text" value="<%=NumberFormat.getInstance().format(price) %> 포인트" disabled> 
				</div>
				<div class="4u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				
				<div class="3u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="6u 12u$(xsmall)" style="color:#ff0000 !important; line-height:27px;text-align:center;vertical-align:middle;">
					<%=year %>-<%=month %>-<%=day %> 23:59분까지 입금을 완료해주십시오
				</div>
				<div class="3u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			</div>	
			
			<br><br>
			<div class="row uniform">
				<div class="4u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="4u 12u$(xsmall)" >
					<button type="button" style="width:150px;height:70px;position:relative;left:15%;" onclick="location.href='db_buy_bank.jsp?price=<%=price %>'">
						확인
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