<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>파일 첨부</title>
<link rel="stylesheet" href="/assets/daumeditor/css/popup.css" type="text/css"  charset="utf-8"/>
<script type="text/javascript">
	function done() {
		document.file_upload.submit();
	}
</script>
</head>
<body onload="initUploader();">
<div class="wrapper">
	<div class="header">
		<h1>파일 첨부</h1>
	</div>	
	<div class="body">
		<dl class="alert">
			<dt>파일 첨부 확인</dt>
			<form name="file_upload" method="post" enctype="multipart/form-data" action="db_file_upload.jsp" onsubmit="done();">
			<dd><input type="file" name="uploadFile"></dd>
			</form>
		</dl>
	</div>
	<div class="footer">
		<p><a href="#" onclick="closeWindow();" title="닫기" class="close">닫기</a></p>
		<ul>
			<li class="submit"><a href="#" onclick="done();" title="등록" class="btnlink">등록</a> </li>
			<li class="cancel"><a href="#" onclick="closeWindow();" title="취소" class="btnlink">취소</a></li>
		</ul>
	</div>
</div>
</body>
</html>