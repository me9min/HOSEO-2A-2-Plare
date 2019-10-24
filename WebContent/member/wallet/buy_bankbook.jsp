<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.*,java.util.*,java.text.*" %>

<%@ include file="/assets/include/login_check.jsp" %>
<jsp:useBean id="member" class="Bean.Member" />

<!DOCTYPE HTML>
<html>
	<head>
		<title>일반카드 등록</title>
		<style>
			td {color: black; background-color: #ffffff;}
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
								<h2>무통장입금</h2>
							</header>
							<center><p>포인트와 실제 금액은 같습니다</p></center><br>
			<div class="row uniform">
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">입금자명</div>
				</div>
				<div class="5u 12u$(xsmall)">
					<input type="text" name="bankbook_name" id="card_number" value="" placeholder="입금자명">
				</div>
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">은행</div>
				</div>
				<div class="5u 12u$(xsmall)">
				 	<select name="card_bank">
				 		<option value='' selected>입금할 은행 선택</option>
				 		<option value="NH" style="width:100px;height:70px;">NH농협 302-2222-4446</option>
				 		<option value="KB" style="width:100px;height:70px;">KB국민 214-1151-1461</option>
				 		<option value="IBK" style="width:100px;height:70px;">IBK기업 019-2555-4444</option>
				 		<option value="KEB" style="width:100px;height:70px;">KEB하나 155-4465-1111</option>
				 	</select>
			 	</div>
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
					
			<div class="row uniform">
				<div class="5u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)">
					<button type="button" style="width:150px;height:70px;" onclick="cardCheck()">
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