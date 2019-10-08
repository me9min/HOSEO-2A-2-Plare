<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Shop" %>
<%@ page import = "Bean.ShopBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>
<%@ include file="/assets/include/login_check.jsp" %>
<%!
    int pageSize = 6;
%>
<%
	Shop sh = new Shop();
	int point = sh.getPoint(email);
	
	String admin = "admin@plare.cf";
	
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
    
    Shop shop = Shop.getInstance();
	List<ShopBean> itemList = shop.getItems(category, startRow, pageSize);
	count = shop.getItemCount(category);
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>상점</title>
<%@ include file="/assets/include/menu_member.jsp" %>

<%@ include file="/assets/include/shop_top.jsp" %>

			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<h4>내포인트 : <%=point %></h4>
								<h3>스킨</h3><br>
							</header>
<%
	if(email.equals(admin)) {
%>
		<a href="write.jsp" class="button special pull-right">상품등록</a><br><br>
<% 
	}
%>
							<div class="row">
<%
	for(int i=0; i<itemList.size(); i++) {
		ShopBean item = itemList.get(i);
%>
							  <div class="col-md-4">
								  <img src="/assets/images/test2.jpg" width="220px" height="220px"><br><br>
								  <p align="center"><%=item.getItem_name() %></p>
								  <p align="center" style="line-height:20px; vertical-align:middle;"><img src="/assets/images/PointLogo.png" height="16px;"> 
								  	<%=NumberFormat.getInstance().format(item.getItem_price()) %>
								  </p>
							  </div>
<%
		if(i==2) {
%>
							</div>
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
						</div>
					</div>
				</div>
			</section>


<%@ include file="/assets/include/foot.jsp" %>

</html>