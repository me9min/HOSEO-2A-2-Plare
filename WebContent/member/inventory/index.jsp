<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bean.Member" %>
<%
	Member member = Member.getInstance();
	int count = member.getInventoryCount("admin@plare.cf", "all");
	String idList[] = member.getInventoryId("admin@plare.cf", "all", 1, 6);
	System.out.println(count);
	for(int i=0; i<idList.length; i++) {
		System.out.println(idList[i]);
	}
%>