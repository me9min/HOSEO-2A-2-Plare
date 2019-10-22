<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<jsp:useBean id="board" class="Bean.Board"/>

<%@ include file="/assets/include/login_check.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>글쓰기</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="/assets/daumeditor/css/editor.css" type="text/css" charset="utf-8"/>
	<script src="/assets/daumeditor/js/editor_loader.js?environment=development" type="text/javascript" charset="utf-8"></script>
	<script language="JavaScript" src="write.js"></script>
	<script>
		var edit_content_val = "";
	</script>
<%@ include file="/assets/include/menu_member.jsp" %>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String nickname = board.getNickname(email);
%>

<%@ include file="/assets/include/board_top.jsp" %>

		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
<%
	String ip = null;
	if (null != request.getRemoteAddr()) {
		ip = request.getRemoteAddr();
		if (null != request.getRemoteHost()) {
			ip = request.getRemoteHost();
			if (null != request.getHeader("x-forwarded-for")) {
				ip = request.getHeader("x-forwarded-for");
			}
		}
	}
%>
debug - 현재접속 아이피 : <%=ip %> , 오늘날짜 : <%=sdf.format(new Timestamp(System.currentTimeMillis())) %>
								<div class="12u 12u$(xsmall)">
									<form name="tx_editor_form" id="tx_editor_form" action="db_write.jsp" method="post" accept-charset="utf-8">
									<input type="hidden" name="reply_num" value="<%=request.getParameter("num") %>">
									<input type="text" name="title" id="title" value="" placeholder="제목" />
								</div>
							</header>

<%@ include file="/assets/daumeditor/editor.jsp" %>

<div class="12u 12u$(xsmall)">
	<button class="button special" onclick='saveContent()'>등록</button>
	<a class="button alt" href="./">글목록</a>
</div>
					</div>
				</div>
			</div>
		</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>