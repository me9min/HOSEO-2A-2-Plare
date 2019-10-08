<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.Shop" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">	
	<style>
		#shop_button{
		width:150px;
		height:50px;
		}
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
	
<%@ include file="/assets/include/menu.jsp" %>

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
							  <div style="border: 1px solid #ff0000; padding:15px;text-align:center;">
							  	<h4>마마마마마마마마마마마마마마</h4>
							  	<hr>
							  	<div style="ling-height:23px;">
							  	   <h4><img src="/assets/images/PointLogo.png" height="23px;"> 3,000</h4>
							  	</div>
							  	
							  	<br>
							  	<input type="button" value="장바구니 담기" id="shop_button">
							  	<br><br>
							  	<input type="button" value="바로구매"  id="shop_button">
							  	
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