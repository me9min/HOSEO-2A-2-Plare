<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
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
    
	Board board = Board.getInstance();
	Shop shop = Shop.getInstance();
    
	List<ShopBean> itemList = shop.getItems(category, startRow, pageSize);
	count = shop.getItemCount(category);
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>상점</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
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
<%@ include file="/assets/include/shop_top.jsp" %>

			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
		<nav class="tabbable" style="align:center;">
		        <div>&nbsp;&nbsp;
		          <ul class="nav navbar-nav nav-tabs" id="tab">
		              <li<% if(category.equals("all")) {%> class="active"<%} %>>
		              	<a href="index.jsp" >&nbsp;모두 보기&nbsp;</a>
		              </li>
		              <li<% if(category.equals("skin")) {%> class="active"<%} %>>
		              	<a href="index.jsp?category=skin" >플레이어 스킨</a>
		              </li>
		              <li<% if(category.equals("hat")) {%> class="active"<%} %>>
		              	<a href="index.jsp?category=hat" data-togge="tab" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		              </li>
		              <li<% if(category.equals("pet")) {%> class="active"<%} %>>
		              	<a href="index.jsp?category=pet" data-togge="tab">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;펫&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		              </li>
		              <li<% if(category.equals("grenade")) {%> class="active"<%} %>>
		              	<a href="index.jsp?category=grenade" data-togge="tab"> &nbsp;&nbsp;&nbsp;수류탄 스킨&nbsp;&nbsp;&nbsp; </a>
		              </li>
		              <li<% if(category.equals("lasersight")) {%> class="active"<%} %>>
		              	<a href="index.jsp?category=lasersight" data-togge="tab">&nbsp;레이저 사이트&nbsp;</a>
		              </li>
		          </ul>
		        </div>
		        <br><br><br>
		</nav>	

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
	    String img = "/assets/images/test2.jpg";
		if(item.getItem_img() != null) {
			img = "/assets/upload/static/" + item.getItem_type() + "/" + item.getItem_img();
		}
%>
							  <div class="col-md-4">
								  <img src="<%=img %>" width="220px" height="220px" onclick="location.href='content.jsp?id=<%=item.getId() %>'"><br><br>
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
        	<a href="<%=href %><%= i %>&category=<%=category %>" id="link" <%if (i == currentPage) {%> style="font-weight:bold; color:#ff0000;"<% } %>>[<%= i %>]</a>
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

<%@ include file="/assets/include/info_box.jsp" %>

			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>