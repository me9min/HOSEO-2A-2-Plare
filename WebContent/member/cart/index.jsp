<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.Shop" %>
<%@ page import = "Bean.ShopBean" %>
<%@ page import = "Bean.Cart" %>
<%@ page import = "Bean.CartBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%!
    int pageSize = 6;
%>
<%	
	String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }
	String category = request.getParameter("category");
	if (category == null) {
		category = "all";
	}
	int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;

	Board board = Board.getInstance();
    Shop shop = Shop.getInstance();
    Cart cart = Cart.getInstance();
    
	List<ShopBean> itemList = shop.getItems(category, startRow, pageSize);
	count = cart.getCartCount(email);
	int point = shop.getPoint(email);
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>상점</title>
		<style>
			#info_box {
				position: fixed; top: 30%; right: 5%; background-color: black; color: white;
				text-align: center; vertical-align: middle; padding: 10px; border-radius: 5px;
			}
			#link {color: black; text-decoration: none;}
			#link:visited {color: black; text-decoration: none;}
			#link:hover {color: #ff0000; text-decoration: none;}
		</style>
<%@ include file="/assets/include/menu_member.jsp" %>

<%@ include file="/assets/include/member_top.jsp" %>

			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h3>스킨</h3><br>
							</header>
<% if(count == 0) { %>
		<br><br><br><center>장바구니에 아이템이 존재하지 않습니다.</center><br><br><br>
<% } else { %>
							<div class="row">
<%
	for(int i=0; i<itemList.size(); i++) {
		ShopBean item = itemList.get(i);
%>
							  <div class="col-md-4">
								  <img src="/assets/images/test2.jpg" width="220px" height="220px" onclick="location.href='content.jsp?id=<%=item.getId() %>'"><br><br>
								  <p align="center">
								  	<a href="content.jsp?id=<%=item.getId() %>" id="link">
								  		<%=item.getItem_name() %>
								  	</a>
								  </p>
								  <p align="center" style="line-height:20px; vertical-align:middle;">
								  	<img src="/assets/images/PointLogo.png" height="16px;" onclick="location.href='content.jsp?id=<%=item.getId() %>'"> 
								  	<a href="content.jsp?id=<%=item.getId() %>" id="link">
								  		<%=NumberFormat.getInstance().format(item.getItem_price()) %>
								  	</a>
								  </p>
							  </div>
<%
		if(i==2) {
%>
							</div><br>
							<div class="row">
<%
		}
	}
%>
							</div><br>
							<div class="row">
								<div class="align-center" style="width:100%;">
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
								</div>
							</div>
<%
}
%>
						</div>
					</div>
				</div>
				<div id="info_box">
					<b style="color:white;"><%=board.getNickname(email) %></b> 님<br><br>
					보유 포인트<br>
					<b style="color:white;"><%=NumberFormat.getInstance().format(point) %></b><br><br>
					<button type="button" class="button special">충전하기</button><br><br>
					<button type="button" class="button special" onclick="location.href='../../shop/'">상점으로</button>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>