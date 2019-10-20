<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.*,java.util.*,java.text.*" %>

<%@ include file="/assets/include/login_check.jsp" %>
<%!
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
	request.setCharacterEncoding("utf-8");
    String pageNum = request.getParameter("pageNum");
	String admin = "admin@plare.cf";
	
    if (pageNum == null) {
        pageNum = "1";
    }
	
    int currentPage = Integer.parseInt(pageNum);
    int startRow = pageSize*(currentPage-1);
    int count = 0;
    List<HistoryBean> articleList = null;
    
    History history = History.getInstance();
    Shop sh = new Shop();
    int point = sh.getPoint(email);
    count = history.getHistoryCount(email);
    
    String con = request.getParameter("con");
	String q = request.getParameter("q");
	articleList = history.getHistory(email, startRow, pageSize, con, q);
%>

<!DOCTYPE HTML>
<html>
	<head>
		<title><%=email %>님의 지갑</title>
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
<%@ include file="/assets/include/menu_member.jsp" %>
<%@ include file="/assets/include/member_top.jsp" %>

		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h2>구매기록</h2>
							</header>
	<div class="table-wrapper">
<%
	if(email.equals(admin)) {
%>
		<a href="write.jsp" class="button special pull-right">글쓰기</a><br><br>
<% 
	} else {
%>
		<br><br>
<%
	}
	if(count == 0) { %>
		<table>
			<tr>
				<td><center>구매기록이 존재하지 않습니다.</center></td>
			</tr>
		</table>
<% } else { %>
		<table class="table table-hover">
			<thead>
				<tr>
					<td width="50%" id="thead">상품이름</td>
					<td id="thead">품목</td>
					<td id="thead">수량</td>
					<td id="thead">구매일자</td>
					<td id="thead">구매가격</td>
				</tr>
			</thead>
<%  
		for (int i = 0 ; i < articleList.size() ; i++) {
			HistoryBean article = articleList.get(i);
			
			String date_of_purchase = Integer.toString(article.getDate_of_purchase());
			long timestamp = Long.parseLong(date_of_purchase);
			Date date = new Date(timestamp*1000L); 
			sdf.setTimeZone(TimeZone.getTimeZone("GMT+9")); 
			String formattedDate = sdf.format(date);
			
			String hprice = (String) NumberFormat.getInstance().format(article.getPrice_of_purchase());
%>
			<tbody>
				<tr>
<%
				if(article.getItem_type().equals("point")) {
%>
					<td width="50%" align="center"><%=hprice+"포인트 구매"%></td>
					<td align="center">포인트</td>
					<td align="center"></td>
<%
				} else {
%>

					<td width="50%" align="center"><%=article.getItem_name()%></td>
					<td align="center"><%=article.getItem_type()%></td>
					<td align="center">1</td>
<%
				}
%>
					<td align="center"><%=formattedDate%></td>
					<td align="center"><%="₩"+hprice%></td>
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
							<option value="title">이름</option>
							<option value="content">설명</option>
							<option value="all">이름+설명</option>
							<option value="amount">수량</option>
							<option value="price">가격</option>
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

<%@ include file="/assets/include/info_box.jsp" %>

			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>