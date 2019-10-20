<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Member" %>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.Shop" %>
<%@ page import = "Bean.ShopBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.util.TimeZone" %>
<%@ page import = "java.text.NumberFormat" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%!
	int pageSize = 15;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
	request.setCharacterEncoding("utf-8");
    String pageNum = request.getParameter("pageNum");

    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    List<ShopBean> historyList = null; 

	Board board = Board.getInstance();
	Shop shop = Shop.getInstance();
	int point = shop.getPoint(email);
	
    Member member = Member.getInstance();
    count = member.getHistoryCount(email);
    historyList = member.getHistoryList(email, startRow, pageSize);
%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>내지갑</title>
		<style>
			td {color: black; background-color: #ffffff;}
			#info_box {
				position: fixed; top: 30%; right: 5%; background-color: black; color: white;
				text-align: center; vertical-align: middle; padding: 10px; border-radius: 5px;
			}
			#thead {text-align: center; background-color: black; color: white;}
			#condition {display: inline; width: 100px;}
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
								<h2>포인트 사용/추가 내역</h2>
								<br><br>
							</header>

	<div class="table-wrapper">
<%
	if(count == 0) { %>
		<table>
			<tr>
				<td><center>포인트를 사용하거나 얻은 내역이 존재하지 않습니다.</center></td>
			</tr>
		</table>
<% } else { %>
		<table class="table table-hover">
			<thead>
				<tr>
					<td width="50%" id="thead">날짜 및 시간</td>
					<td id="thead">설명</td>
					<td id="thead">금액</td>
				</tr>
			</thead>
<%  
		for (int i = 0 ; i < historyList.size() ; i++) {
		  ShopBean history = historyList.get(i);
		  
		  String date_of_purchase = history.getDate_of_purchase();
		  long timestamp = Long.parseLong(date_of_purchase);
	   	  Date date = new Date(timestamp*1000L); 
	      sdf.setTimeZone(TimeZone.getTimeZone("GMT+9")); 
	      String formattedDate = sdf.format(date);
	      
	      int price = Integer.parseInt(history.getPrice_of_purchase());
%>
			<tbody>
				<tr>
					<td width="50%" align="center" style="color:red;"><%=formattedDate %></td>
					<td align="center" style="color:red;"><%=history.getItem_name() %></td>
					<td align="center" style="color:red;">-<%=NumberFormat.getInstance().format(price) %></td>
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