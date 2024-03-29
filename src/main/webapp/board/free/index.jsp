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
	String category = "free";
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
	List<BoardBean> articleList = null;	    
    Board board = Board.getInstance();
    
    BoardBean motd = board.getLatestMotd();
    List<BoardBean >bestList = board.getBestArticles();
    String nickname_motd = board.getNickname(motd.getWriter());
    
    String condition = request.getParameter("condition");
	String q = request.getParameter("q");
    if (condition != null) {
	    count = board.getSearchCount(category, condition, q);
    	System.out.println(category + condition + q);
	    
	    if (count > 0) {
	        articleList = board.getSearchResults(category, startRow, pageSize, condition, q);
	    }
    } else {
	    count = board.getArticleCount(category);
	    
	    if (count > 0) {
	        articleList = board.getArticles(category, startRow, pageSize);
	    }
    }
%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>자유 게시판</title>
		<style>
			td {color: black; background-color: #ffffff;}
			#thead {text-align: center; background-color: black; color: white;}
			#condition {display: inline; width: 100px;}
			#q {display: inline; width: 300px;}
			#motd {font-weight: bold;}
			#best {font-weight: bold;}
			#link {color: black; text-decoration: none;}
			#link:visited {color: black; text-decoration: none;}
			#link:hover {color: red; text-decoration: none;}
		</style>
<%@ include file="/assets/include/menu.jsp" %>

		<%@ include file="/assets/include/board_top.jsp" %>
			
		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h2>자유 게시판</h2>
							</header>
	<div class="table-wrapper">
		<a href="write.jsp" class="button special pull-right" style="display:inline;">글쓰기</a><br><br>
<% if(count == 0) { %>
		<table>
			<tr>
				<td><center>게시글이 존재하지 않습니다.</center></td>
			</tr>
		</table>
<% } else { %>
		<table class="table table-hover">
			<thead>
				<tr>
					<td width="10%" id="thead">번호</td>
					<td width="50%" id="thead">제목</td>
					<td id="thead">작성자</td>
					<td id="thead">작성일자</td>
					<td id="thead">조회수</td>
					<td id="thead">추천수</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="10%" id="motd" align="center">공지</td>
					<td width="50%" id="motd">
						<a href="../motd/content.jsp?num=<%=motd.getNum()%>" id="link">
							<%=motd.getTitle() %>
						</a>
					</td>
					<td id="motd" align="center"><%=nickname_motd %></td>						
					<td id="motd" align="center"><%=sdf.format(motd.getReg_date()) %></td>
					<td id="motd" align="center"><%=motd.getRead_count() %>	
					</td>
					<td id="motd" align="center">&nbsp;</td>
				</tr>
<%
		for(int i = 0; i < bestList.size(); i++) {
			BoardBean best = bestList.get(i);
		    String nickname_best = board.getNickname(best.getWriter());
%>
				<tr>
					<td width="10%" id="best" align="center">인기</td>
					<td width="50%" id="best">
						<a href="content.jsp?num=<%=best.getNum()%>" id="link">
							<%=best.getTitle() %>
						</a>
						<p style="color:#bfbfbf; display:inline;">[<%=board.getCommentCount(best.getNum()) %>]</p>
					</td>
					<td id="best" align="center"><%=nickname_best %></td>						
					<td id="best" align="center"><%=sdf.format(best.getReg_date()) %></td>
					<td id="best" align="center"><%=best.getRead_count() %></td>
					<td id="best" align="center"><%=best.getUp_count() %></td>
				</tr>
<%  
		}

		for (int i = 0 ; i < articleList.size() ; i++) {
		  BoardBean article = articleList.get(i);
		  String nickname = board.getNickname(article.getWriter());
%>
				<tr id="tbody">
					<td width="10%" align="center"><%=article.getNum() %></td>
					<td width="50%">
						<a href="content.jsp?num=<%=article.getNum()%>" id="link">
							<%=article.getTitle() %>
						</a>
						<p style="color:#bfbfbf; display:inline;">[<%=board.getCommentCount(article.getNum()) %>]</p>
					</td>
					<td align="center"><%=nickname %></td>						
					<td align="center"><%=sdf.format(article.getReg_date()) %></td>
					<td align="center"><%=article.getRead_count() %></td>
					<td align="center"><%=article.getUp_count() %></td>
				</tr>
			</tbody>
<% 		}
	}
%>
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
        
        String href = "index.jsp?pageNum=";
        
    	if(condition != null) {
    		href = "index.jsp?condition=" + condition + "&q=" + q + "&pageNum=";
    	}
        if (startPage > 5) { 
%>
        	<a href="<%=href %><%= startPage - 5 %>" id="link">&lt;</a>
<%      }
        
        for (int i = startPage ; i <= endPage ; i++) {  %>
        	<a href="<%=href %><%= i %>" id="link" <%if (i == currentPage) {%> style="font-weight:bold; color:#ff0000;"<% } %>>[<%= i %>]</a>
<%      }
        
        if (endPage < pageCount) {  %>
   	     	<a href="<%=href %><%= startPage + 5 %>" id="link">&gt;</a>
<%
        }
    }
%>
					</center>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="text-align:center; border:none;">
					<form method="get" name="search" action="index.jsp">
						<select name="condition" id="condition">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
							<option value="all">제목+내용</option>
						</select>
						<input type="text" name="q" id="q"> 
						<input type="submit" value="검색" class="button alt">
					</form>
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