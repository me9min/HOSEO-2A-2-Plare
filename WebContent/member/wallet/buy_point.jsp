<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.*,java.util.*,java.text.*" %>

<%@ include file="/assets/include/login_check.jsp" %>
<jsp:useBean id="member" class="Bean.Member" />
<%
	request.setCharacterEncoding("utf-8");
	
	MemberBean member_sql = member.load_info(email);
	
	String nickname = member_sql.getNickname();
	if(nickname == null) {nickname = "";}
	String phone = member_sql.getPhone();
	if(phone == null) {phone = "";}
	String address_road = member_sql.getAddress_road();
	if(address_road == null) {address_road = "";}
	String address_detail = member_sql.getAddress_detail();
	if(address_detail == null) {address_detail = "";}
	String zipcode = member_sql.getZipcode();
	if(zipcode == null) {zipcode = "";}
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
var IMP = window.IMP; // 생략가능
IMP.init('imp35661052'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
function request_buy(){
	var json = {
		pg : 'kakao', // version 1.1.0부터 지원.
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		buyer_email : '<%=email%>',
		buyer_name : '<%=nickname%>',
		buyer_tel : '<%=phone%>',
		buyer_addr : '<%=address_road+" "+address_detail%>',
		buyer_postcode : '<%=zipcode%>',
		m_redirect_url : '<%=request.getScheme()+"://"+request.getServerName()%>/member/wallet/db_buypoint_kakaopay.jsp?amount='
	};
	json.name = $("select[name=price]").val();
	json.amount = $("select[name=price]").val();
	IMP.request_pay(json, function(rsp) {
		if ( rsp.success ) {
			location.replace('./db_buypoint_kakaopay.jsp?amount='+$("select[name=price]").val());
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}
	});
}
</script>

<!DOCTYPE HTML>
<html>
	<head>
		<title>포인트 충전</title>
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
								<h2>포인트 충전</h2>
							</header>
							<center><p>포인트와 실제 금액은 같습니다</p></center><br>
			<div class="row uniform">
				<div class="3u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="2u 12u$(xsmall)" >
					
					<div style="line-height:27px;text-align:right; vertical-align:middle;height:27px;">충전하실 금액</div>
				</div>
				<div class="4u 12u$(xsmall)">
				 	<select name="price">
				 		<option value="5000" style="width:100px;height:70px;">5,000 포인트</option>
				 		<option value="10000" style="width:100px;height:70px;">10,000 포인트</option>
				 		<option value="25000" style="width:100px;height:70px;">25,000 포인트</option>
				 		<option value="50000" style="width:100px;height:70px;">50,000 포인트</option>
				 	</select>
			 	</div>
				<div class="3u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			</div><br><br>
			<div class="row uniform">
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)">
					<img src="/assets/images/payment_icon_yellow_medium.png" style="height:70px;" alt="카카오페이" onclick="request_buy()"/>
				</div>
				<div class="3u 12u$(xsmall)">
					<button type="button" style="width:150px;height:70px;" onclick="alert('현재 준비중인 기능입니다')">
						일반카드결제
					</button>
				</div>
				<div class="3u 12u$(xsmall)">
					<button type="button" style="width:150px;height:70px;" onclick="alert('현재 준비중인 기능입니다')">
						계좌이체(무통장)
					</button>
				</div>
				<div class="1u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			</div>	<br><br>

					</div>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>