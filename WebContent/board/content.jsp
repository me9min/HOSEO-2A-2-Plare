<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>�Խ���</title>	
	<style>
		#inputtext{
		height:300px;
		}
		#border{
		border-top:none;
		}
		#button{
		align:center;
		}
		table { border-collapse:collapse }
	</style>
<%@ include file="/assets/include/menu.jsp" %>

</head>
<body>

	<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>�Խñ��� �ø��� Ŀ�´�Ƽ�Դϴ�</p>
						<h2>�Խ���</h2>
					</header>
				</div>
			</section>
	<div id="main" class="container" >
	<form  method="post" name="writeform" 
      action="writePro.jsp" onsubmit="return writeSave()">
		<center><h3>�����Խ���</h3></center><br>
		<div class="table-wrapper">
		<table class="table">
			<tr>
				<td align="center" style="vertical-align: middle">����</td>
				<td>����</td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">�ۼ���</td>
				<td>�ۼ���</td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle">�ۼ���</td>
				<td>2019-09-16</td>
			</tr>
			<tr>
				<td height="300px" align="center" style="vertical-align: middle">����</td>
				<td height="300px">����</td>
			</tr>
			<tr id="border" style="background-color:#ffffff;">
				<td></td>
				<td align="center"><button id="button">��õ�ϱ�</button></td>
			</tr>
			<tr>
				<td></td>
				<td align="right">��ȸ�� ��õ�� ��ۼ�</td>
			</tr>
		</table>
		</div>
		</form>
		<table bgcolor="#eeeeee">
			<tr>
				<td align="center" style="vertical-align: middle">�����г���</td>
				<td style="vertical-align: middle"><input type="text" style="width:300px; hiehgt:50px"></td>
				<td> <button>��۵��</button></td>
			</tr>
		</table>
	</div>

<%@ include file="/assets/include/foot.jsp" %>

</body>
</html>