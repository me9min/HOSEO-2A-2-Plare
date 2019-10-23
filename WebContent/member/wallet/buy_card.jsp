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
<%@ include file="/assets/include/menu_member.jsp" %>
<%@ include file="/assets/include/member_top.jsp" %>

		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h2>일반카드 등록</h2>
							</header>
							<center><p>포인트와 실제 금액은 같습니다</p></center><br>
			<div class="row uniform">
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">은행</div>
				</div>
				<div class="5u 12u$(xsmall)">
				 	<select name="bank">
				 		<option value="NH" style="width:100px;height:70px;">NH농협</option>
				 		<option value="KB" style="width:100px;height:70px;">KB국민은행</option>
				 		<option value="IBK" style="width:100px;height:70px;">IBK기업은행</option>
				 		<option value="KEB" style="width:100px;height:70px;">KEB하나은행</option>
				 		<option value="woori" style="width:100px;height:70px;">우리은행</option>
				 		<option value="shinhan" style="width:100px;height:70px;">신한은행</option>
				 	</select>
			 	</div>
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">카드 번호</div>
				</div>
				<div class="5u 12u$(xsmall)">
					<input type="text" name="card_num" id="card_num" value="" placeholder="카드 숫자만 16자리"/>
				</div>
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">카드 만기일</div>
				</div>
				<div class="4u 12u$(xsmall)">
					<input type="text" name="card_data" id="card_data" maxlength="4" value="" placeholder="월, 연도 숫자만"/>
				<div class="3u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			</div>
			<div class="row uniform">
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">카드 CVC</div>
				</div>
				<div class="4u 12u$(xsmall)">
					<input type="text" name="card_cvc" id="card_cvc" value="" placeholder="CVC 뒤 3자리만"/>
				</div>
				<div class="3u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">비밀번호</div>
				</div>
				<div class="4u 12u$(xsmall)">
					<input type="password" name="card_password" id="card_password" value="" placeholder="카드 비밀번호 앞 2자리"/>
				</div>
				<div class="3u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			</div>	
			</div><br><br>
			<div class="row uniform">
				<div class="5u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)">
					<button type="button" style="width:150px;height:70px;">
						카드 등록하기
					</button>
				</div>
				<div class="4u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			</div>	<br><br>

					</div>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>