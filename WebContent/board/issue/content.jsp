<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.Member" %>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.BoardBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
	String email = (String)session.getAttribute("email");
	if(email == null) {
		email = "";
	}
	
	Member member = Member.getInstance();
	boolean admin_check = member.admin_check(email);
	
	Board board = Board.getInstance(); 
	String nickname = board.getNickname(email);
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	try{
		BoardBean article = board.getArticle("issue", num);
		String nickname_writer = board.getNickname(article.getWriter());
		String edit_date = "";
		if(article.getEdit_date() != null) {
			edit_date = sdf.format(article.getEdit_date());
		}
%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<title><%=article.getTitle() %></title>
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
		#scrollBlind {
			width:230px;
			height:100%;
			overflow-y:scroll;
		}
		#scrollBlindView {
			width:200px;
			height:260px;
			position: absolute;
			border:0;
			overflow: hidden;
		}
	</style>
	<script>
		// 영문파일은 그냥 다운로드 클릭시 정상작동하지만 한글파일명을 쿼리문으로 날릴경우 인코딩 문제가 발생할 수 있다. 한글이 깨져 정상작동하지 않을 수 있음
		// 따라서, 쿼리문자열에 한글을 보낼 때는 항상 인코딩을 해서 보내주도록 하자.
		document.getElementById("downA").addEventListener("click", function(event) {
			event.preventDefault();// a 태그의 기본 동작을 막음
			event.stopPropagation();// 이벤트의 전파를 막음
			// 파일명을 utf-8로 인코딩한다.
			var attach_file = encodeURIComponent("<%=article.getAttach_file()%>");
			// 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
			window.location ="/assets/upload/download.jsp?attach_file="+attach_file;
		});
	</script>
	<script language="JavaScript" src="write.js"></script>
<%@ include file="/assets/include/menu_member.jsp" %>

<%@ include file="/assets/include/board_top.jsp" %>
	<div id="main" class="container" >
		<div class="table-wrapper">
		<a href="./" class="button alt pull-right">글목록</a><br><br>
		<table class="table">
			<tr>
				<td align="center" width="20%" style="vertical-align: middle">제목</td>
<%
	int num_rep = article.getNum_rep();
	String reply_tag = "";
	
	if(num_rep != 0) {
		reply_tag = "<span style='color:rgb(255,0,0);'>[답변]</span> ";
	}
%>
				<td><%=reply_tag+article.getTitle() %></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">작성자</td>
				<td><%=nickname_writer %></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">작성일</td>
				<td><%=sdf.format(article.getReg_date()) %></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">마지막 수정일</td>
				<td><%=edit_date %></td>
			</tr>
			<tr>
				<td height="300px" align="center" style="vertical-align: middle">내용</td>
				<td height="300px"><pre style="background:transparent; border:hidden; font-family:'Nanum Gothic', sans-serif;"><%=article.getContent() %></pre></td>
			</tr>
<%
	if(article.getAttach_file_name() != null) {
%>
			<tr>
				<td align="center" style="vertical-align: middle">파일다운로드</td>
				<td><a id="downA" href="#"><%=article.getAttach_file_name() %></a></td>
			</tr>
<%
	}
%>
			<tr style="background-color:#ffffff; border:hidden;">
				<td colspan="2" align="right">
<%
	if(email.equals(article.getWriter()) && admin_check == false) {
%>
					<a href="edit.jsp?num=<%=article.getNum() %>" class="button alt">수정</a>
					<a href="db_delete.jsp?num=<%=article.getNum() %>" class="button alt">삭제</a>
<%
	} else if(email.equals(article.getWriter()) && admin_check == true) {
%>
					<a href="edit.jsp?num=<%=article.getNum() %>" class="button alt">수정</a>
<%
	}
	if(admin_check == true && num_rep == 0) {
%>
					<a href="db_delete.jsp?num=<%=article.getNum() %>" class="button alt">삭제</a>
					<a href="write.jsp?num=<%=request.getParameter("num") %>" class="button special">답변쓰기</a>
<% 
	} else if(admin_check == true && num_rep != 0) {
%>
					<a href="db_delete.jsp?num=<%=article.getNum() %>" class="button alt">삭제</a>
<%
	}
%>
				</td>
			</tr>
			<tr id="border" style="background-color:#ffffff;">
				<td colspan="2" align="center">
					<a href="db_up.jsp?num=<%=num %>" class="button alt" >공감</a>
				</td>
			</tr>
			<tr style="border-bottom:hidden;">
				<td colspan="2" align="right" style="background-color:#ffffff;">
					조회수 <%=article.getRead_count() %> 공감수 <%=article.getUp_count() %>
				</td>
			</tr>
		</table>
<%
	} catch(Exception e) {} finally {}
%>
		</div>
	</div>

<%@ include file="/assets/include/foot.jsp" %>

</html>
