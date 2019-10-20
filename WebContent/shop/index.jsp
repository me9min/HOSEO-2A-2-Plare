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
    	<script type="text/javascript">
    		$('#Tab li:eq(0) a').click(function (e) {
    		  e.preventDefault();
    		  $(this).tab('show');
    		})
    		$('#Tab li:eq(1) a').click(function (e) {
    		  e.preventDefault();
    		  $(this).tab('show');
    		})
    		$('#Tab li:eq(2) a').click(function (e) {
    		  e.preventDefault();
    		  $(this).tab('show');
    		})
    		$('#Tab li:eq(3) a').click(function (e) {
    		  e.preventDefault();
    		  $(this).tab('show');
    		})
    		$('#Tab li:eq(4) a').click(function (e) {
    		  e.preventDefault();
    		  $(this).tab('show');
    		})
    	</script>
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
		              <li class="active"><a href="#player_skin" > &nbsp;플레이어 스킨&nbsp; </a></li>
		              <li><a href="#hat" data-togge="tab" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a></li>
		              <li><a href="#pat" data-togge="tab"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;펫&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a></li>
		              <li><a href="#grenade_skin" data-togge="tab"> &nbsp;&nbsp;&nbsp;&nbsp;수류탄 스킨&nbsp;&nbsp;&nbsp;&nbsp; </a></li>
		              <li><a href="laser_site" data-togge="tab"> &nbsp;레이저 사이트&nbsp; </a></li>
		          </ul>
		        </div>
		</nav>
		
		<div class="tab-content" style="margin-top: 80px;">
		  <div class="tab-pane fade active in" id="player_skin">
		    <p>
		        첫번째 탭포커스가 위치할 내용입니다.<br/>
		        id="first인대 상단 네비게이션의 href속성값인 #아이디"명과 일치하는 패널이랑 맵핑을 시켜줍니다.
		    </p>
		  </div>
		  <div class="tab-pane fade" id="hat">
		    <p>
		        두번째 탭포커스 위치할 내용입니다.<br/>
		        data-togge="tab"을 지정해주셔야 탭버튼으로 인식을 합니다.
		    </p>
		  </div>
		  <div class="tab-pane fade" id="pat">
		    <p>
		        마지막 세번째 탭클릭시 보여지는 컨텐츠 내용입니다.
		    </p>
		  </div>
		  <div class="tab-pane fade" id="grenade_skin">
		    <p>
		        마지막 세번째 탭클릭시 보여지는 컨텐츠 내용입니다.
		    </p>
		  </div>
		  <div class="tab-pane fade" id="laser_site">
		    <p>
		        마지막 세번째 탭클릭시 보여지는 컨텐츠 내용입니다.
		    </p>
		  </div>
		</div>
		

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

<%@ include file="/assets/include/info_box.jsp" %>

			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>