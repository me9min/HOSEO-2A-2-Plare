<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.*,java.util.*,java.text.*" %>

<%@ include file="/assets/include/login_check.jsp" %>
<jsp:useBean id="member" class="Bean.Member" />

<!DOCTYPE HTML>
<html>
	<head>
		<title>카드 비밀번호 등록</title>
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
			#buy_title{
				line-height:27px;
				text-align:center; 
				vertical-align:middle;
				height:27px;
			}
			#buy_title2{
				line-height:27px;
				text-align:left; 
				vertical-align:middle;
				height:27px;
				font-size:20px !important;
				color:#ee1111 !important; 
				font-weight: bold;
			}
      </style>
      <script language="JavaScript" src="wallet.js"></script>
      <script>
      function onlyNumber(event){
  		event = event || window.event;
  		var keyID = (event.which) ? event.which : event.keyCode;
  		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 ) 
  			return;
  		else
  			return false;
  	  }
      </script>
<%@ include file="/assets/include/menu_member.jsp" %>
<%@ include file="/assets/include/member_top.jsp" %>

		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
						<form method="post" action="db_pw.jsp" name="pay"> 
							<header class="align-center">
								<h2>결제 비밀번호 설정</h2>
								<br><br>
							</header>
			<div class="row uniform">
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">카드번호</div> 
				</div>
				<div class="4u 12u$(xsmall)">
					<input type="password" name="card_number" id="card_number" value=""/>
				</div>
				<div class="3u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			</div>
			<br><br>
			<div class="row uniform">
			
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">결제 비밀번호</div>
				</div>
				<div class="4u 12u$(xsmall)">
					<input type="password" name="pay_password" id="pay_password" value="" placeholder="결제 비밀번호 숫자 6자리" maxlength="6" onkeydown="return onlyNumber(event)"/>
				</div>
				<div class="3u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">비밀번호 확인</div>
				</div>
				<div class="4u 12u$(xsmall)">
					<input type="password" name="pay_repassword" id="pay_repassword" value="" placeholder="결제 비밀번호 확인" maxlength="6" onkeydown="return onlyNumber(event)"/>
				</div>
				<div class="3u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			</div><br><br><br>
			<div class="row uniform">
				<div class="5u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)">
					<button type="button" style="width:150px;height:70px;" onclick="passwordCheck()">
						비밀번호 설정
					</button>
				</div>
				<div class="4u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			</div>	<br><br>
			</form>
			</div>	

					</div>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>