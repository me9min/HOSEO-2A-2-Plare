<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "Bean.Rank,Bean.RankBean,java.util.*,java.text.*" %>

<%!
	int pageSize = 10;
%>
<%
	request.setCharacterEncoding("utf-8");
    String pageNum = request.getParameter("pageNum");
    String con = request.getParameter("con");
    String q = request.getParameter("q");
	
    if (pageNum == null) {
        pageNum = "1";
    }
	
    int currentPage = Integer.parseInt(pageNum);
    int startRow = pageSize*(currentPage-1);
    int count = 0;
    
    Calendar currentCalendar = Calendar.getInstance();
    DecimalFormat df = new DecimalFormat("00");
    String year = Integer.toString(currentCalendar.get(Calendar.YEAR));
    String month  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
    
    List<RankBean> articleList = null;
    
    Rank rank = Rank.getInstance();
    count = rank.getRankCount();
    
	articleList = rank.getRank(startRow, pageSize, con, q);
%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>랭크</title>
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
<%@ include file="/assets/include/menu.jsp" %>
<%@ include file="/assets/include/rank_top.jsp" %>

		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h2><%=year %>년 <%=month %>월 실시간 랭킹 <img src="/assets/images/crown.jpg" width="40px" height="40px"></h2>
							</header>
	<div class="table-wrapper">
		<br>
<%
	if(count == 0) { %>
		<table>
			<tr>
				<td><center>랭크를 불러오는데 문제가 발생했습니다.</center></td>
			</tr>
		</table>
<% } else { %>
		<table class="table table-hover">
			<thead>
				<tr>
					<td id="thead">순위</td>
					<td id="thead" width="60%">닉네임</td>
					<td id="thead">캐시</td>
					<td id="thead">스팀고유번호</td>
				</tr>
			</thead>
<%  
		for (int i = 0 ; i < articleList.size() ; i++) {
			RankBean article = articleList.get(i);
%>
			<tbody>
				<tr>
					<td align="center"><%=startRow+=1%></td>
					<td align="left" width="60%"><%=article.getName()%></td>
					<td align="left"><%=article.getCash()%></td>
					<td align="left"><%=article.getSteam_id()%></td>
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
				<tr>
					<td colspan="6" style="text-align:center; border:none;">
					<form method="get" name="search" action="index.jsp">
						<select name="con" id="con">
							<option value="name">닉네임</option>
							<option value="steam_id">스팀 고유번호</option>
							<option value="cash">캐시</option>
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