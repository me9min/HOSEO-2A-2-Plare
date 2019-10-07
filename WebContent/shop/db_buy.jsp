<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.BoardBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%
	String pname = "10000P 추가";
	int price = 10000;
	
	String name = "장비를정지합니다";
	String phone = "010-3165-6898";
	String addr = "이세상 어딘가";
	String postcode = "123-456";
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
function request_buy(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp35661052'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	IMP.request_pay({
		pg : 'kakao', // version 1.1.0부터 지원.
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '<%=pname%>',
		amount : <%=price%>,
		buyer_email : '<%=email%>',
		buyer_name : '<%=name%>',
		buyer_tel : '<%=phone%>',
		buyer_addr : '<%=addr%>',
		buyer_postcode : '<%=postcode%>',
		m_redirect_url : 'http://localhost/shop/db_buy.jsp'
	}, function(rsp) {
		if ( rsp.success ) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
		alert(msg);
	});
}
</script>
<!DOCTYPE html>
<html>
<head>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">	
	<style>
		#inputtext{
		height:300px;
		}
		#border{
		border-top:none;
		}
		table {
		border-collapse:collapse;
		}
		#link {color: black; text-decoration: none;}
		#link:visited {color: black; text-decoration: none;}
		#link:hover {color: red; text-decoration: none;}
		#blank {text-align: right; width: 5%;}
	</style>
	<script language="JavaScript" src="write.js"></script>
	
<%@ include file="/assets/include/menu_member.jsp" %>

</head>
<body>

<%@ include file="/assets/include/board_top.jsp" %>

	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<div class="row">
						<div class="col-md-8">
							<div style="width:350px; background:white; margin:0 auto;" >
							  <img src="/assets/images/test2.jpg" width="350px">
							</div>
						</div>
							<div class="col-md-4">
							  <div style="border: 1px solid #ff0000; padding:15px;">
							  	<h3><%=pname%></h3>
							  	<hr>
							  	<h4><img src="/assets/images/PointLogo.png" width="30px" height="30px;"> <%=price%></h4>
							  	<input type="button" value="바로구매" onclick="request_buy()">
							  	
							  </div>
							</div>
		
		
		
		
					</div>
				</div>
			</div>
		</div>
	</section>
		
<%@ include file="/assets/include/foot.jsp" %>

</body>
</html>



