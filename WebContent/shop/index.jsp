<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Shop.Shop" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%
	Shop sh = new Shop();
	int point = sh.getPoint(email);
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>상점</title>
<%@ include file="/assets/include/menu_member.jsp" %>

<%@ include file="/assets/include/shop_top.jsp" %>

			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h4>내포인트 : <%=point %></h4>
								<h3>스킨</h3><br>
							</header>
							<div class="row">
							  <div class="col-md-4">
							  <a href="#">
							  <img src="/assets/images/test2.jpg" width="220px" height="220px">
							  <p align="center">이름</p>
							  <p align="center">가격</p>
							  </a></div>
							  <div class="col-md-4">
								<a href="#">
								<img src="/assets/images/test2.jpg" width="220px" height="220px">
								<p align="center">이름</p>
								<p align="center">가격</p>
							  </a></div>
							  <div class="col-md-4">
								<a href="#">
								<img src="/assets/images/test2.jpg" width="220px" height="220px">
								<p align="center">이름</p>
								<p align="center">가격</p>
							  </a></div>
							</div>
							<div class="row">
							  <div class="col-md-4">
							  <a href="#">
							  <img src="/assets/images/test2.jpg" width="220px" height="220px">
							  <p align="center">이름</p>
							  <p align="center">가격</p>
							  </a></div>
							  <div class="col-md-4">
								<a href="#">
								<img src="/assets/images/test2.jpg" width="220px" height="220px">
								<p align="center">이름</p>
								<p align="center">가격</p>
							  </a></div>
							  <div class="col-md-4">
								<a href="#">
								<img src="/assets/images/test2.jpg" width="220px" height="220px">
								<p align="center">이름</p>
								<p align="center">가격</p>
							  </a></div>
							</div>
						</div>
					</div>
				</div>
			</section>


<%@ include file="/assets/include/foot.jsp" %>

</html>