<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.BoardBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
   	try{
   		Board board = Board.getInstance();
      	BoardBean article = board.getArticle("issue", num);
      	String nickname = board.getNickname(article.getWriter());
      	String edit_date = "";
        if(article.getEdit_date() != null) {
      	  edit_date = sdf.format(article.getEdit_date());
        }
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=article.getTitle() %></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="/assets/daumeditor/css/editor.css" type="text/css" charset="utf-8"/>
	<script src="/assets/daumeditor/js/editor_loader.js?environment=development" type="text/javascript" charset="utf-8"></script>
	<script language="JavaScript" src="write.js"></script>
<%@ include file="/assets/include/menu.jsp" %>

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
debug - 현재접속 아이피 : <%=ip %> , 오늘날짜 : <%=sdf.format(new Timestamp(System.currentTimeMillis())) %> , 작성날짜 : <%=article.getReg_date() %>
								<div class="12u 12u$(xsmall)">
									<form name="tx_editor_form" id="tx_editor_form" action="db_edit.jsp?num=<%=num %>" method="post" accept-charset="utf-8">
										<input type="text" name="title" id="title" value="<%=article.getTitle() %>" placeholder="제목" />
								</div>
							</header>

<%@ include file="/assets/daumeditor/editor_edit.jsp" %>

<div class="12u 12u$(xsmall)">
	<button class="button special" onclick='saveContent()'>수정</button>
	<a class="button alt" href="./">글목록</a>
</div>

					</div>
				</div>
			</div>
		</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>

<%
   	} catch(Exception e) {}
%>