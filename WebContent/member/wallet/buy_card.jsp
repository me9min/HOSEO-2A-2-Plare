<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Member" %>
<%@ page import = "Bean.MemberBean" %>
<%@ page import = "Bean.Shop" %>
<%@ page import = "Bean.ShopBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.text.NumberFormat" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%!
    int pageSize = 2;
%>
<%	
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
	    pageNum = "1";
	}
	
	int endPage = 0;
	int currentPage = Integer.parseInt(pageNum);
	
    Shop shop = Shop.getInstance();
	int point = shop.getPoint(email);
	int price = Integer.parseInt(request.getParameter("price"));

	Member member = Member.getInstance();
	List<MemberBean> cardList = null;
	int count = member.getCardCount(email);
	if(count > 0) {
		endPage = count + 1;
	}
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>포인트 충전</title>
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
		<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
		<script>
		$(document).ready(function () {
			$("#card").click(function(){ 
			    $("#card").css("border","2px solid red");
			});
			$("#card0").click(function(){ 
				$("#card0").css("border","2px solid red");
				$("#card1").css("border","1px solid black");
			});
			$("#card1").click(function(){ 
				$("#card1").css("border","2px solid red");
				$("#card0").css("border","1px solid black");
			});
		});
		</script>
<%@ include file="/assets/include/menu_member.jsp" %>

<%@ include file="/assets/include/member_top.jsp" %>

			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h3>신용카드 간편 결제</h3><br>
							</header>
							<form method="post" action="db_buy.jsp" name="cart_buy">
							<table class="table table-hover">
							<tbody>
								<tr>
									<td colspan="2" style="text-align:center; padding:50px 0;">
<%
									if(count <= 0) {
%>
										<div style="display:inline-block; margin:5px; border:1px dashed black; width:250px; height:150px; border-radius:10px; 
										text-align:center; vertical-align:middle; line-height:150px;" onclick="location.href='buy_card_add.jsp'">
											<img src="/assets/images/logo_plus.png" width="30px" height="30px">
										</div>
<%										
									} else {
%>
<%
										if(currentPage != 1) {
%>
										<div style="display:inline-block; margin:5px; width:10%; height:150px; 
										text-align:center; vertical-align:middle; line-height:150px;">
											<a href="buy_card.jsp?pageNum=<%=currentPage - 1 %>&price=<%=price %>">&lt;</a>
										</div>
<%
										} else {
%>
										<div style="display:inline-block; margin:5px; width:10%; height:150px; 
										text-align:center; vertical-align:middle; line-height:150px;">
											&nbsp;
										</div>
<%
										}
%>
<%
										if(currentPage == endPage) {
%>
										<div style="display:inline-block; margin:5px; border:1px dashed black; width:250px; height:150px; border-radius:10px;
										text-align:center; vertical-align:middle; line-height:150px;" onclick="location.href='buy_card_add.jsp'">
											<img src="/assets/images/logo_plus.png" width="30px" height="30px">
										</div>
										<div style="display:inline-block; margin:5px; border:1px dashed black; width:250px; height:150px; border-radius:10px;
										text-align:center; vertical-align:middle; line-height:150px;" onclick="location.href='buy_card_edit.jsp'">
											<img src="/assets/images/logo_option.png" width="30px" height="30px">
										</div>
<%
										} else if(currentPage == endPage - 1) {
											MemberBean card = member.getLastCard(email);
											String bank = "";
											String color = "#ffffff";
											String font = "#000000";
											if(card.getCard_bank().equals("NH")) {
												bank = "NH농협";
												color = "#0066b3";
												font = "#ffffff";
											} else if(card.getCard_bank().equals("KB")) {
												bank = "KB국민";
												color = "#ffcc00";
												font = "#7f7367";
											} else if(card.getCard_bank().equals("IBK")) {
												bank = "IBK기업";
												color = "#004b9e";
												font = "#ffffff";
											} else if(card.getCard_bank().equals("KEB")) {
												bank = "KEB하나";
												color = "#029990";
												font = "#ffffff";
											} else if(card.getCard_bank().equals("woori")) {
												bank = "우리";
												color = "#08579a";
												font = "#ffffff";
											} else if(card.getCard_bank().equals("shinhan")) {
												bank = "신한";
												color = "#1068ac";
												font = "#ffffff";
											} else if(card.getCard_bank().equals("hyundae")) {
												bank = "현대";
												color = "#ffffff";
												font = "#000000";
											} else if(card.getCard_bank().equals("BC")) {
												bank = "BC";
												color = "#e6303f";
												font = "#ffffff";
											} else if(card.getCard_bank().equals("lotte")) {
												bank = "롯데";
												color = "#ffffff";
												font = "#e6303f";
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
										<div style="display:inline-block; margin:5px; border:1px solid black; width:250px; height:150px; border-radius:10px;
											text-align:center; vertical-align:middle; line-height:75px; background-color:<%=color %>;" id="card">
												<div style="height:10px;">&nbsp;</div>
												<div style="height:30px; background-color:black;">&nbsp;</div>
												<div style="height:30px; font-size:16px; color:<%=font %>;"><%=bank %></div>
												<div style="height:140px; font-size:18px; color:<%=font %>;"><%=num %></div>
											</div>
										<div style="display:inline-block; margin:5px; border:1px dashed black; width:250px; height:150px; border-radius:10px; 
										text-align:center; vertical-align:middle; line-height:150px;" onclick="location.href='buy_card_add.jsp'">
											<img src="/assets/images/logo_plus.png" width="30px" height="30px">
										</div>
<%
										} else {
											cardList = member.getCards(email, currentPage, pageSize);
											for(int i=0; i<cardList.size(); i++) {
												MemberBean card = cardList.get(i);
												String bank = "";
												String color = "#ffffff";
												String font = "#000000";
												if(card.getCard_bank().equals("NH")) {
													bank = "NH농협";
													color = "#0066b3";
													font = "#ffffff";
												} else if(card.getCard_bank().equals("KB")) {
													bank = "KB국민";
													color = "#ffcc00";
													font = "#7f7367";
												} else if(card.getCard_bank().equals("IBK")) {
													bank = "IBK기업";
													color = "#004b9e";
													font = "#ffffff";
												} else if(card.getCard_bank().equals("KEB")) {
													bank = "KEB하나";
													color = "#029990";
													font = "#ffffff";
												} else if(card.getCard_bank().equals("woori")) {
													bank = "우리";
													color = "#08579a";
													font = "#ffffff";
												} else if(card.getCard_bank().equals("shinhan")) {
													bank = "신한";
													color = "#1068ac";
													font = "#ffffff";
												} else if(card.getCard_bank().equals("hyundae")) {
													bank = "현대";
													color = "#ffffff";
													font = "#000000";
												} else if(card.getCard_bank().equals("BC")) {
													bank = "BC";
													color = "#e6303f";
													font = "#ffffff";
												} else if(card.getCard_bank().equals("lotte")) {
													bank = "롯데";
													color = "#ffffff";
													font = "#e6303f";
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
											<div style="display:inline-block; margin:5px; border:1px solid black; width:250px; height:150px; border-radius:10px;
											text-align:center; vertical-align:middle; line-height:75px; background-color:<%=color %>;" id="card<%=i %>">
												<div style="height:10px;">&nbsp;</div>
												<div style="height:30px; background-color:black;">&nbsp;</div>
												<div style="height:30px; font-size:16px; color:<%=font %>;"><%=bank %></div>
												<div style="height:140px; font-size:18px; color:<%=font %>;"><%=num %></div>
											</div>
<%
											}
										}
										if(currentPage != endPage) {
%>
										<div style="display:inline-block; margin:5px; width:10%; height:150px; 
										text-align:center; vertical-align:middle; line-height:150px;">
											<a href="buy_card.jsp?pageNum=<%=currentPage + 1 %>&price=<%=price %>">&gt;</a>
										</div>
<%
										} else {
%>
										<div style="display:inline-block; margin:5px; width:10%; height:150px; 
										text-align:center; vertical-align:middle; line-height:150px;">
											&nbsp;
										</div>
<%
										}
									}
%>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2" style="text-align:center;">
										&nbsp;
									</td>
								</tr>
								<tr style="text-align:right;">
									<td width="60%">
										<b>보유 금액</b>
									</td>
									<td>
										<b><%=point %></b>
									</td>
								</tr>
								<tr style="text-align:right;">
									<td style="border-top:none;">
										<b>충전 금액</b>
									</td>
									<td style="border-top:none;">
										<b>+ <%=price %></b>
									</td>
								</tr>
								<tr style="text-align:right; font-size:24px;">
									<td>
										<b>충전 후 금액</b>
									</td>
									<td>
										<img src="/assets/images/PointLogo.png" height="24px;"> 
										<b style="color:#ff0000;"><%=point+price %></b>
									</td>
								</tr>
<%
							if(count > 0) {
%>
								<tr>
									<td colspan="2" style="text-align:center; border:none;">
										정말로 결제하시겠습니까?
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:center; border:none;">
										<input type="button" class="button special" value="구매하기" onclick="location.href='buy_pw_check.jsp?price=<%=price %>'">
										<input type="button" class="button alt" value="이전으로" onclick="location.href='buy_point.jsp'">
									</td>
								</tr>
<%
							} else {
%>
								<tr>
									<td colspan="2" style="text-align:center; border:none;">
										먼저 카드 등록을 해주세요.
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:center; border:none;">
										<input type="button" class="button alt" value="이전으로" onclick="location.href='buy_point.jsp'">
									</td>
								</tr>
<%
							}
%>
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