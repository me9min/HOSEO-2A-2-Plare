<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% response.setStatus(HttpServletResponse.SC_OK); %>
<!DOCTYPE html>
	<head>
		<title>500</title>
<%@ include file="/assets/include/menu.jsp" %>

		<!-- Two -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h2 style="font-size:100px;">Oops!</h2>
							</header>
							<h2>500 error! 페이지오류</h2>
						</div>
					</div>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>