<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.*,java.util.*,java.text.*" %>

<%@ include file="/assets/include/login_check.jsp" %>
<jsp:useBean id="member" class="Bean.Member" />

<!DOCTYPE HTML>
<html>
	<head>
		<title>카드 등록</title>
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
      <script>
      function onlyNumber(event){
    		event = event || window.event;
    		var keyID = (event.which) ? event.which : event.keyCode;
    		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 ) 
    			return;
    		else
    			return false;
    	}
    	function removeChar(event) {
    		event = event || window.event;
    		var keyID = (event.which) ? event.which : event.keyCode;
    		if ( keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 ) 
    			return;
    		else
    			event.target.value = event.target.value.replace(/[^0-9]/g, "");
    	}
	 </script>
	 <script>
	 $(document).ready(function () {
		   $(function () {
		            $('#card_number').keydown(function (event) {
		             var key = event.charCode || event.keyCode || 0;
		             var temp = "";
		             $text = $(this); 
                	 $text.val($text.val().replace(/[^0-9\-]/g, ""));
                     temp = $text.val().replace(/[^0-9]/g, "");
                     $("#card_num").val(temp);
		             if (key !== 8 && key !== 9) {
		                 if ($text.val().length === 4) {
		                     $text.val($text.val() + '-');
		                 }
		                 if ($text.val().length === 9) {
		                     $text.val($text.val() + '-');
		                 }
		                 if ($text.val().length === 14) {
		                     $text.val($text.val() + '-');
		                 }
		             }
		             return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
		         })
		   });
		});
	 </script>
<%@ include file="/assets/include/menu_member.jsp" %>
<%@ include file="/assets/include/member_top.jsp" %>

		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
						<form method="post" action="db_card.jsp" name="card">
							<header class="align-center">
								<h2>카드 등록</h2>
							</header>
							<center><p>포인트와 실제 금액은 같습니다</p></center><br>
			<div class="row uniform">
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">은행</div>
				</div>
				<div class="5u 12u$(xsmall)">
				 	<select name="card_bank">
				 		<option value="NH" style="width:100px;height:70px;">NH농협</option>
				 		<option value="KB" style="width:100px;height:70px;">KB국민</option>
				 		<option value="IBK" style="width:100px;height:70px;">IBK기업</option>
				 		<option value="KEB" style="width:100px;height:70px;">KEB하나</option>
				 		<option value="woori" style="width:100px;height:70px;">우리</option>
				 		<option value="shinhan" style="width:100px;height:70px;">신한</option>
				 		<option value="hyundae" style="width:100px;height:70px;">현대</option>
				 		<option value="BC" style="width:100px;height:70px;">BC</option>
				 		<option value="lotte" style="width:100px;height:70px;">롯데</option>
				 	</select>
			 	</div>
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">카드 번호</div>
				</div>
				<div class="5u 12u$(xsmall)">
					<input type="text" name="card_number" id="card_number" value="" placeholder="카드 숫자만 16자리" maxlength="19">
					<input type="hidden" name="card_num" id="card_num" value="">
				</div>
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">카드 만기일</div>
				</div>
				<div class="4u 12u$(xsmall)">
					<input type="text" name="card_date" id="card_date" maxlength="4" value="" placeholder="월, 연도 숫자만" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>
				<div class="3u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			</div>
			<div class="row uniform">
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">카드 CVC</div>
				</div>
				<div class="4u 12u$(xsmall)">
					<input type="text" name="card_cvc" id="card_cvc" value="" placeholder="CVC 3자리" maxlength="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>
				</div>
				<div class="3u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				
				<div class="2u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)" >
					<div style="line-height:27px;text-align:center; vertical-align:middle;height:27px;">비밀번호</div>
				</div>
				<div class="4u 12u$(xsmall)">
					<input type="password" name="card_password" id="card_password" value="" placeholder="카드 비밀번호 앞 2자리" maxlength="2" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>
				</div>
				<div class="3u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
			</div>	
			</div><br><br>
			<div class="row uniform">
				<div class="5u 12u$(xsmall)" style="visibility:hidden;"><a class="button">빈공간</a></div>
				<div class="3u 12u$(xsmall)">
					<button type="button" style="width:150px;height:70px;" onclick="cardCheck()">
						카드 등록하기
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