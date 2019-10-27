<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.*, java.util.*" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	Member member = Member.getInstance();
	List<MemberBean> cardList = null;
	int count = member.getCardCount(email);
	cardList = member.getCards(email, 1, count);
	
	String str = "";
	boolean check = member.hasPayPassword(email);
	System.out.println(check);
	if(check == true) {
		str = "수정";
	} else {
		str = "설정";
	}
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>간편 카드 결제 관리</title>
		<style>
			td {color: black; background-color: #ffffff; height: 100%;}
			#thead {text-align: center; background-color: black; color: white;}
			#tbody {vertical-align: middle; text-align: center;}
			#link {color: black; text-decoration: none;}
			#link:visited {color: black; text-decoration: none;}
			#link:hover {color: #ff0000; text-decoration: none;}
		</style>
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
								<header class="align-center">
									<h2>간편 결제 카드 관리</h2><br><br>
								</header>
								
							<table class="table table-hover">
							<thead>
								<tr>
									<td id="thead">&nbsp;</td>
									<td width="20%" id="thead">카드사</td>
									<td width="30%" id="thead">카드번호</td>
									<td id="thead">&nbsp;</td>
								</tr>
							</thead>
							<tbody>
<%
		for(int i=0; i<cardList.size(); i++) {
			MemberBean card = new MemberBean();
			card = cardList.get(i);
			String bank = "";
			if(card.getCard_bank().equals("NH")) {
				bank = "NH농협";
			} else if(card.getCard_bank().equals("KB")) {
				bank = "KB국민";
			} else if(card.getCard_bank().equals("IBK")) {
				bank = "IBK기업";
			} else if(card.getCard_bank().equals("KEB")) {
				bank = "KEB하나";
			} else if(card.getCard_bank().equals("woori")) {
				bank = "우리";
			} else if(card.getCard_bank().equals("shinhan")) {
				bank = "신한";
			} else if(card.getCard_bank().equals("hyundae")) {
				bank = "현대";
			} else if(card.getCard_bank().equals("BC")) {
				bank = "BC";
			} else if(card.getCard_bank().equals("lotte")) {
				bank = "롯데";
			}
			String num = "0000-0000-0000-0000";
			if(card.getCard_num().length() == 16) {
				String num1 = card.getCard_num().substring(0, 4);
				String num2 = card.getCard_num().substring(4, 8);
				String num3 = card.getCard_num().substring(8, 12);
				String num4 = card.getCard_num().substring(12, 16);
				num = num1 + " - " + num2 + " - " + num3 + " - " + num4;	
			} else {
				String num1 = card.getCard_num().substring(0, 4);
				String num2 = card.getCard_num().substring(4, 8);
				String num3 = card.getCard_num().substring(8, 12);
				String num4 = card.getCard_num().substring(12, 15);
				num = num1 + " - " + num2 + " - " + num3 + " - " + num4 + "0";
			}
%>
							<tr>
									<td id="tbody">
										<%=i+1 %>
									</td>
									<td id="tbody"><%=bank %></td>
									<td id="tbody"><%=num %></td>
									<td id="tbody">
										<input type="button" value="X" class="button special" style="padding:0 10px;" 
										onclick="location.href='db_card_delete.jsp?id=<%=card.getId() %>'">
									</td>
								</tr>
<%
		}
%>
							</tbody>
							</table>
							<br><br><br><br>
							<header class="align-center">
								<h2>결제 비밀번호 <%=str %></h2><br><br>
							</header>
<%
	if(check == true) {
%>
	<form method="post" name="password_edit" action="db_pw_edit.jsp">
		<div class="row uniform">
			<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
			<div class="6u 12u$(xsmall)">
				<input type="password" name="password_origin" id="password_origin" value="" placeholder="기존 비밀번호" />
			</div>
			<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
		</div>
		<div class="row uniform">
			<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
			<div class="6u 12u$(xsmall)">
				<input type="password" name="password_new" id="password_new" value="" placeholder="새 비밀번호" />
			</div>
			<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
		</div>
		<div class="row uniform">	
			<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
			<div class="6u 12u$(xsmall)">
				<input type="password" name="repassword_new" id="repassword_new" value="" placeholder="새 비밀번호 확인" />
			</div>
			<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
		</div><br>
			<div class="row uniform">
				<div class="5u 12u$(xsmall)" style="visibility:hidden;"> 빈공간</div>
				<div class="2u 12u$(xsmall)" style="text-align:center;">
					<input type="submit" class="button special" value="확인">
				</div>
				<div class="5u 12u$(xsmall)" style="visibility:hidden;"> 빈공간</div>
			</div>	
	</form>
<%
	} else {
%>
	
	<form method="post" name="password_add" action="db_pw_add.jsp">
		<div class="row uniform">
			<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
			<div class="6u 12u$(xsmall)">
				<input type="password" name="password" id="password" value="" placeholder="새 비밀번호 숫자 6자리" />
			</div>
			<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
		</div>
		<div class="row uniform">	
			<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
			<div class="6u 12u$(xsmall)">
				<input type="password" name="repassword" id="repassword" value="" placeholder="새 비밀번호 확인" />
			</div>
			<div class="3u 12u$(xsmall)" style="visibility:hidden;">빈공간</div>
		</div><br>
		<ul class="actions">
			<div class="row uniform">
				<div class="5u 12u$(xsmall)" style="visibility:hidden;"> 빈공간</div>
				<div class="2u 12u$(xsmall)" style="text-align:center;">
					<li><input type="submit" class="button special" value="확인"></li>
				</div>
				<div class="5u 12u$(xsmall)" style="visibility:hidden;"> 빈공간</div>
			</div>	
		</ul>
	</form>
<%
	}
%>						</div><br><br>
							</div>
						</div>
				</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>