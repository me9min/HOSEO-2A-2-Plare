<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.BoardBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%!
    int pageSize = 10;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<%
    String pageNum = request.getParameter("pageNum");

    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    List<BoardBean> articleList = null; 
    List<BoardBean> bestList = null;
    BoardBean reply = null;
    
    Board board = Board.getInstance();
    count = board.getArticleCount("free");
    
    if (count > 0) {
    	bestList = board.getBestIssues();
        articleList = board.getArticles("free", startRow, pageSize);
    }
%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>랭크</title>
		<style>
			td {color: black; background-color: #ffffff;}
			#thead {text-align: center; background-color: black; color: white;}
			#best {font-weight: bold;}
			#blank {text-align: right; width: 5%;}
			#link {color: black; text-decoration: none;}
			#link:visited {color: black; text-decoration: none;}
			#link:hover {color: red; text-decoration: none;}
		</style>
		<script language="JavaScript" src="login.js"></script>
<%@ include file="/assets/include/menu.jsp" %>

<%@ include file="/assets/include/rank_top.jsp" %>
			
		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h2>랭크</h2>
							</header>

	<div class="table-wrapper">
<% if(count == 0) { %>
		<table>
			<tr>
				<td><center>랭크가 존재하지 않습니다.</center></td>
			</tr>
		</table>
<% } else { %>
		<table class="table table-hover">
			<thead>
				<tr>
					<td id="thead">순위</td>
					<td id="thead">닉네임</td>
					<td id="thead">점수</td>
					<td id="thead">스팀고유번호</td>
				</tr>
			</thead>
			<tbody>
<%
		for (int i = 0 ; i < articleList.size() ; i++) {
			BoardBean article = articleList.get(i);
			String nickname = board.getNickname(article.getWriter());
			
			reply = board.getIssueReply(article.getNum());
%>
				<tr id="tbody">
					<td align="center"><%=i+1 %></td>						
					<td align="center"><%="1" %></td>
					<td align="center"><%="2" %></td>
					<td align="center"><%="3" %></td>
				</tr>
<%
		}
	}
%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
					<center>
<%
    if (count > 0) {
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		
		if(currentPage % 5 != 0)
           startPage = (int)(currentPage/5)*5 + 1;
		else
           startPage = ((int)(currentPage/5)-1)*5 + 1;

		int pageBlock = 5;
        int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 5) { %>
        	<a href="index.jsp?pageNum=<%= startPage - 5 %>" id="link">&lt;</a>
<%      }
        
        for (int i = startPage ; i <= endPage ; i++) {  %>
        	<a href="index.jsp?pageNum=<%= i %>" id="link" <%if (i == currentPage) {%> style="font-weight:bold; color:#ff0000;"<% } %>>[<%= i %>]</a>
<%      }
        
        if (endPage < pageCount) {  %>
   	     	<a href="index.jsp?pageNum=<%= startPage + 5 %>" id="link">&gt;</a>
<%
        }
    }
%>
					</center>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>

						</div>
					</div>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>