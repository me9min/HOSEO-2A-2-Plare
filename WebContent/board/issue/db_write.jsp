<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Bean.Board" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.io.File"%>
<%@ page import = "java.util.Enumeration"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>

<% 
	request.setCharacterEncoding("utf-8");
	String email = (String)session.getAttribute("email");
	
	//파일업로드부분
	String uploadPath = request.getRealPath("/upload");
	
	int maxSize = 1024*1024*100;// 한번에 올릴 수 있는 파일 용량 : 100MB로 제한
	
	String fileName1 ="";// 중복처리된 이름
	String originalName1 ="";// 중복 처리전 실제 원본 이름
	long fileSize =0;// 파일 사이즈
	String fileType ="";// 파일 타입
	
	MultipartRequest multi =null;
	
	try{
	    // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
	    multi =new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
	    
	    // 전송한 전체 파일이름들을 가져옴
	    Enumeration files = multi.getFileNames();
	    
	    while(files.hasMoreElements()){
	        // form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
	        String file1 = (String)files.nextElement();// 파일 input에 지정한 이름을 가져옴
	        // 그에 해당하는 실재 파일 이름을 가져옴
	        originalName1 = multi.getOriginalFileName(file1);
	        // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
	        // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
	        fileName1 = multi.getFilesystemName(file1);
	        // 파일 타입 정보를 가져옴
	        fileType = multi.getContentType(file1);
	        // input file name에 해당하는 실재 파일을 가져옴
	        File file = multi.getFile(file1);
	        // 그 파일 객체의 크기를 알아냄
	        fileSize = file.length();
	    }
	}catch(Exception e){
	    e.printStackTrace();
	}
%>

<jsp:useBean id="article" scope="page" class="Bean.BoardBean">
	<jsp:setProperty name="article" property="*"/>
	<jsp:setProperty name="article" property="writer" value="<%=email %>"/>
	<jsp:setProperty name="article" property="file_url" value="<%=fileName1%>"/>
	<jsp:setProperty name="article" property="file_name" value="<%=originalName1%>"/>
</jsp:useBean>

<%
	String ip = null;
	if (null != request.getRemoteAddr()) {
		ip = request.getRemoteAddr();
		if (null != request.getRemoteHost()) {
			ip = request.getRemoteHost();
			if (null != request.getHeader("x-forwarded-for")) {
				ip = request.getHeader("x-forwarded-for");
			}
		}
	}
	article.setIp(ip);

	Board board = Board.getInstance();
	board.insertArticle(article, "issue");

	response.sendRedirect("./");
%>