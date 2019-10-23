<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Daum에디터 - 이미지 첨부</title> 
<script src="../../js/popup.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/scopeVariable.js?v=1571815269237" charset="utf-8"></script><script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/lib/txlib.js?v=1571815269238" charset="utf-8"></script><script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/lib/hyperscript.js?v=1571815269238" charset="utf-8"></script><script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/lib/template.js?v=1571815269238" charset="utf-8"></script><script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/lib/dgetty.js?v=1571815269238" charset="utf-8"></script><script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/lib/xgetty.js?v=1571815269238" charset="utf-8"></script><script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/lib/rubber.js?v=1571815269238" charset="utf-8"></script><script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/trex/trex.js?v=1571815269238" charset="utf-8"></script><script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/trex/config.js?v=1571815269239" charset="utf-8"></script><script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/trex/event.js?v=1571815269239" charset="utf-8"></script><script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/trex/lib/markup.js?v=1571815269239" charset="utf-8"></script><script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/trex/lib/domutil.js?v=1571815269239" charset="utf-8"></script><script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/trex/lib/utils.js?v=1571815269239" charset="utf-8"></script><script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/trex/mixins/ajax.js?v=1571815269239" charset="utf-8"></script><script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/trex/mixins/observable.js?v=1571815269239" charset="utf-8"></script><script type="text/javascript" src="http://www.bgtna.com/DaumEditor-master/daumeditor/js/popuputil.js?v=1571815269239" charset="utf-8"></script>
<link rel="stylesheet" href="../../css/popup.css" type="text/css" charset="utf-8">
<script type="text/javascript">
// <![CDATA[
	
	function done() {
		if (typeof(execAttach) == 'undefined') { //Virtual Function
	        return;
	    }
		for_cut1 = document.regisForm.mempic.value.split('|');
		for_cut2 = document.regisForm.mempictemp.value.split('|');
		for_cut3 = document.regisForm.mempicname.value.split('|');
		for_cut4 = document.regisForm.mempicsize.value.split('|');
        for(i=0;i < for_cut1.length;i++){
        if(for_cut1[i]){
		var _mockdata = {
			'imageurl': for_cut2[i],
			'filename': for_cut3[i],
			'filesize': for_cut4[i],
			'imagealign': 'C',
			'originalurl': for_cut1[i],
			'thumburl': for_cut2[i]
		};
		execAttach(_mockdata);
		}
		}
		closeWindow();
	}

	function initUploader(){
	    var _opener = PopupUtil.getOpener();
	    if (!_opener) {
	        alert('잘못된 경로로 접근하셨습니다.');
	        return;
	    }
	    
	    var _attacher = getAttacher('image', _opener);
	    registerAction(_attacher);
	}
// ]]>
function file_delte(number){ 
        for_cut1 = document.regisForm.mempic.value.split('|');
		for_cut2 = document.regisForm.mempictemp.value.split('|');
		for_cut3 = document.regisForm.mempicname.value.split('|');
		for_cut4 = document.regisForm.mempicsize.value.split('|');
		info1 = '';
		info2 = '';
		info3 = '';
		info4 = '';
		info = '';
        for(i=0;i < (for_cut1.length)-1;i++){
        if(for_cut1[i] && i!=number){
        info1 = info1 + for_cut1[i]+ "|";
        info2 = info2 + for_cut2[i]+ "|";
        info3 = info3 + for_cut3[i]+ "|";
        info4 = info4 + for_cut4[i]+ "|";
        info = info + "<table cellspacing=0 cellpadding=0 height='18'><tr><td><b>" + for_cut3[i] + "</b></td><td width='10'></td><td><img src='/DaumEditor-master/btn_del01.gif' style='cursor:pointer;' onclick='file_delte("+i +");'></td></tr></table>";
        }else{
        info1 = info1 + "|";
        info2 = info2 + "|";
        info3 = info3 + "|";
        info4 = info4 + "|";
		}
		}

        document.regisForm.mempic.value =info1;
        document.regisForm.mempictemp.value =info2;
        document.regisForm.mempicname.value =info3;
        document.regisForm.mempicsize.value =info4;
		var objTbody, objRow, objCell,e_num,c_num;
		objTbody = document.getElementById("Addfilecontet");
		objTbody.innerHTML= info;

}

function _submit(ac){ 
document.regisForm.target = "_write_frame_"; 
document.regisForm.a.value = ac;
document.regisForm.submit(); 
} 
</script>
<style>
#Addfilecontetcon { overflow: auto; padding:0px; border-color:#cecece; background-color:#ffffff; border-style:solid;
border-top-width:1px; border-bottom-width:1px; border-left-width:1px; border-right-width:1px;solid;scrollbar-3dlight-color:#FFFFFF;scrollbar-arrow-color:#FFFFFF;scrollbar-track-color:#FFFFFF;scrollbar-darkshadow-color:#FFFFFF;scrollbar-face-color:#aaaaaa;scrollbar-highlight-color:#FFFFFF;scrollbar-shadow-color:#FFFFFF;color:#aaaaaa;} 
</style>
</head>
<body onload="initUploader();">
<div class="wrapper">
	<div class="header">
		<h1>사진 첨부</h1>
	</div>	
	<div class="body">
		<dl class="alert">
		    <dt>사진 첨부 확인</dt>
		    <dd>
<form name="regisForm" action="../../../uplodeinfo.php" method="post" onsubmit="return regisCheck(this);" enctype="multipart/form-data" target="_write_frame_">
<input type="hidden" name="action" value="regis">
<input type="hidden" name="a" value="upfile_info01">
<input type="file" name="mepic01" id="mepic01" value="" size="15" class="box2" onchange="_submit('upfile_info01');" style="width: 207px; height: 27px; background: rgb(245, 245, 245);" onkeypress="this.style.background='#f5f5f5';" onblur="this.style.background='#f5f5f5';" onkeydown="this.style.background='#f5f5f5';" onkeyup="this.style.background='#f5f5f5';" onfocus="this.style.background='#f5f5f5';">
<input type="hidden" name="mempic" id="mempic" value="/DaumEditor-master/img/1_20191023162112.PNG|">
<input type="hidden" name="mempictemp" id="mempictemp" value="/DaumEditor-master/img/temp/1_20191023162112.PNG|">
<input type="hidden" name="mempicname" id="mempicname" value="thumnail_골목대장 고스트.PNG|">
<input type="hidden" name="mempicsize" id="mempicsize" value="img_width|">
</form>
첨부된사진<font color="fe0501" style="font-size:11px;"><b>* 용량이 클 경우 업로드가 지연될 수 있습니다.</b></font>
<div id="Addfilecontetcon" style="width:100%;height:200px;">
<table width="100%" border="0" cellspacing="10" cellpadding="0">
  <tbody><tr>
    <td id="Addfilecontet" align="left"><table cellspacing="0" cellpadding="0" height="18"><tbody><tr><td><b>thumnail_골목대장 고스트.PNG</b></td><td width="10"></td><td><img src="/DaumEditor-master/btn_del01.gif" style="cursor:pointer;" onclick="file_delte(0);"></td></tr></tbody></table></td>
 </tr>
</tbody></table>
</div>
			</dd>
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
<iframe name="_write_frame_" src="" width="0" height="0" frameborder="0" scrolling="no"></iframe>

</body></html>