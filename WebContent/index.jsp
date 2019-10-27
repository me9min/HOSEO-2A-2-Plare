<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.BoardBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "com.*" %>
<%! SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); %>
<%
	RemoveTag rt = new RemoveTag();
	Board board = Board.getInstance();
	List<BoardBean> issueList = board.getBestIssues();
	List<BoardBean> motdList = board.getLatestMotds();
	List<BoardBean> eventList = board.getLatestEvents();
	BoardBean free = board.getBestArticle();
	String nickname_free = board.getNickname(free.getWriter());
%>
<!DOCTYPE HTML>
<html>
	<head>
		<style>
			#tb {table-layout:fixed; width:100%; height:100%;}
			#title {font-weight:bold; font-size:16px; color:black; text-align:center; overflow:hidden; text-overflow:ellipsis;}
			#content {color:black; background-color:white; overflow:hidden; text-overflow:ellipsis; height:165px; width:230px; display: block;}
			#content p{margin:0;}
			#main_text {overflow:hidden; text-overflow:ellipsis; height:10px;}
			#link {color: black; text-decoration: none;}
			#link:visited {color: black; text-decoration: none;}
			#link:hover {color: red; text-decoration: none;}
		</style>
		<title>plare.cf</title>
		<meta charset="utf-8" />
<%@ include file="/assets/include/menu.jsp" %>

		<!-- Banner -->
			<section class="banner full">
			<!--  -->
				<article>
					<img src="assets/images/main.jpg" alt="" />
					<div class="inner">
						<header>
						</header>
					</div>
				</article>
				<article>
					<img src="assets/images/gasstation.jpg" alt="" />
					<div class="inner">
						<header>
							<h2></h2>
						</header>
					</div>
				</article>
				<article>
					<img src="assets/images/m4.jpg"  alt="" />
					<div class="inner">
						<header>
							<h2></h2>
						</header>
					</div>
				</article>
			</section>

<section id="one" class="wrapper style2">
	<div class="inner">

			<div class="row">
					<b style="font-size:20px;">최근 공지사항</b><br><br>
<%
	for(int i=0; i<motdList.size(); i++) {
		BoardBean motd = motdList.get(i);
%>
			  <div class="col-md-4">
			  <div style="background-color:#ffffff; width:250px;height:250px;border:1px solid black;margin:15px;">
				<div style="margin:10px;">
					<table id="tb">
					<thead>
						<tr>
							<td id="title" >
								<a href="./board/motd/content.jsp?num=<%=motd.getNum()%>" id="link"><%=motd.getTitle() %></a>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr style="border-bottom:none;">
							<td id="content">
								<a href="./board/motd/content.jsp?num=<%=motd.getNum()%>" id="link"><%=rt.removeHtmlTag(motd.getContent()) %></a>
							</td>
						</tr>
					</tbody>
					</table>
				</div>
			  </div></div>
<%
	}
%>
			</div><br><br>
			
			<div class="row">
				<b style="font-size:20px;">이벤트</b><br><br>
<%
	for(int i=0; i<eventList.size(); i++) {
		BoardBean event = eventList.get(i);
%>
			  <div class="col-md-4">
			  <div style="background-color:#ffffff; width:250px;height:250px;border:1px solid black;margin:15px;">
				<div style="margin:10px;">
					<table id="tb">
					<thead>
						<tr>
							<td id="title" >
								<a href="./board/event/content.jsp?num=<%=event.getNum()%>" id="link"><%=event.getTitle() %></a>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr style="border-bottom:none;">
							<td id="content">
								<a href="./board/event/content.jsp?num=<%=event.getNum()%>" id="link"><%=rt.removeHtmlTag(event.getContent()) %></a>
							</td>
						</tr>
					</tbody>
					</table>
				</div>
			  </div></div>
<%
	}
%>
			  </div><br><br>

			<div class="row">
				<b style="font-size:20px;">인기글</b><br><br>
			  <div class="col-md-4">
			  <div style="background-color:#ffffff; width:250px;height:250px;border:1px solid black;margin:15px;">
				<div style="margin:10px;">
					<table id="tb">
					<thead>
						<tr>
							<td id="title">
								<a href="./board/free/content.jsp?num=<%=free.getNum()%>" id="link"><%=free.getTitle() %></a>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr style="border-bottom:none;">
							<td id="content">
									<a href="./board/free/content.jsp?num=<%=free.getNum()%>" id="link"><%=rt.removeHtmlTag(free.getContent()) %></a>
							</td>
						</tr>
					</tbody>
					</table>
				</div>
			  </div>
			  </div>
			    <%
	for(int i=0; i<issueList.size(); i++) {
		BoardBean issue = issueList.get(i);
%>
			  <div class="col-md-4">
			  <div style="background-color:#ffffff; width:250px;height:250px;border:1px solid black;margin:15px;">
				<div style="margin:10px;">
					<table id="tb">
					<thead>
						<tr>
							<td id="title">
								<a href="./board/issue/content.jsp?num=<%=issue.getNum()%>" id="link"><%=issue.getTitle() %></a>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr style="border-bottom:none;">
							<td id="content">
								<a href="./board/issue/content.jsp?num=<%=issue.getNum()%>" id="link"><%=rt.removeHtmlTag(issue.getContent()) %></a>
							</td>
						</tr>
					</tbody>
					</table>
				</div>
			  </div>
			  </div>
<%
	}
%> 
	</div>
			  
</section>
		

<%@ include file="/assets/include/foot.jsp" %>

</html>