<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.google.gson.*,com.google.gson.internal.LinkedTreeMap,com.*"%>
<%
String urlFolder = request.getScheme()+"://"+request.getServerName()+"/assets/upload";//웹 어플리케이션상의 절대 경로

//파일이 업로드되는 폴더를 지정한다.
String saveFolder = "/assets/upload";
String encType = "utf-8"; //인코딩타입
int maxSize = 3*1024*1024;  //최대 업로드될 파일크기

ServletContext context = getServletContext();
//현재 jsp페이지의 웹 어플리케이션상의 절대 경로를 구한다
String realFolder = context.getRealPath(saveFolder);
System.out.println("-------------------------------------");
System.out.println("저장된실제폴더 : " + realFolder);

String url = null;
String type = null;
String oname = null;
String size = null;
long lsize = 0;

try{
   MultipartRequest multi = null;

   //전송을 담당할 콤포넌트를 생성하고 파일을 전송한다.
   //전송할 파일명을 가지고 있는 객체, 서버상의 절대경로,최대 업로드될 파일크기, 문자코드, 기본 보안 적용
   multi = new MultipartRequest(request,realFolder,
		   maxSize,encType,new DefaultFileRenamePolicy());

   //Form의 파라미터 목록을 가져온다
   Enumeration<?> params = multi.getParameterNames();

   //파라미터를 출력한다
   while(params.hasMoreElements()){ 
      String name = (String)params.nextElement(); //전송되는 파라미터이름
      String value = multi.getParameter(name);    //전송되는 파라미터값  
      System.out.println(name + " = " + value);
   }

   //전송한 파일 정보를 가져와 출력한다
   Enumeration<?> files = multi.getFileNames();
   
   //파일 정보가 있다면
   while(files.hasMoreElements()){
      //input 태그의 속성이 file인 태그의 name 속성값 :파라미터이름
      String name = (String)files.nextElement();
   
     //서버에 저장된 파일 이름
      url = urlFolder+"/"+multi.getFilesystemName(name);
   
     //전송전 원래의 파일 이름
      oname = multi.getOriginalFileName(name);
   
     //전송된 파일의 내용 타입
      type = multi.getContentType(name);
      
     //전송된 파일 속성이 file인 태그의 name 속성값을 이용해 파일 객체 생성
      File file = multi.getFile(name);
      
      size = Long.toString(file.length());
      lsize = file.length();
   
      System.out.println("파라메터 이름 : " + name);
      System.out.println("원본 파일 이름 : " + oname);
      System.out.println("저장된 파일 이름 : " + url);
      System.out.println("파일 타입 : " + type);
      
	  if(file!=null){
         System.out.println("크기 : " + size);
      }
	  System.out.println("-------------------------------------");
   }
}catch(IOException ioe){
	System.out.println(ioe);
}catch(Exception ex){
	System.out.println(ex);
}finally{}

Gson gson = new Gson();

// ImageVO imageVo = new ImageVO();

// imageVo.setUrl(url);
// imageVo.setName(oname);
// imageVo.setSize(lsize);

// List<ImageVO> list = new ArrayList<ImageVO>();

Map<String,Object> map = new HashMap<String,Object>();

map.put("url", url);
map.put("type", type);
map.put("name", oname);
map.put("size", lsize);

String json = gson.toJson(map);

out.print(json);
%>