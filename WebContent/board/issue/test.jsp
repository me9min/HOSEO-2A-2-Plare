<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div class="card-body">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">제목</span>
								</div>
								<input type="text" class="form-control" placeholder="Title" aria-label="Title" aria-describedby="basic-addon1" id="title">
								
							</div>
							<div class="input-group mb-3" id="fileDiv" style="display: none;">
								<div class="input-group-prepend">
									<span class="input-group-text">업로드된 파일명</span>
								</div>
								<input type="text" class="form-control" id="fileName" disabled="">
								<div class="input-group-prepend">
									<span class="input-group-text">업로드된 파일크기</span>
								</div>
								<input type="text" class="form-control" id="fileSize" disabled="">
								<button type="button" class="btn btn-secondary btn-block" onclick="javascript:deleteFile();">파일삭제</button>
							</div>
							 <input type="hidden" id="annoGubun" value="N"> <input type="file" id="file" style="display: none;"> <input type="hidden" id="boardFilePath"> <input type="hidden" id="boardFileName">
							<div>


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Daum 에디터 - 등록화면 예제</title>
    <!--
        다음오픈에디터 사용 튜토리얼은 이 페이지로 대신합니다.
        추가적인 기능 개발 및 플러그인 개발 튜토리얼은 홈페이지를 확인해주세요.
        작업이 완료된 후에는 주석을 삭제하여 사용하십시요.

        다음오픈에디터의 라이선스는 GNU LGPL(Lesser General Public License) 으로
        오픈되어 있는 소스이므로 저작권료 없이 사용이 가능하며, 목적에 맞게 수정하여 사용할 수 있으십니다.
        또한 LGPL에는 수정한 부분의 소스공개를 권장하고 있으나, 강제 사항은 아니므로 공개하지 않으셔도 무방합니다.
        다만 사용하시는 소스 상단 부분에 다음오픈에디터를 사용하셨음을 명시해 주시길 권장 드리며,
        꾸준한 업데이트를 할 예정이니 종종 방문 하셔서 버그가 수정 되고 기능이 추가된 버전들을 다운로드 받아 사용해 주세요.

        라이센스 : GNU LGPL(Lesser General Public License)
        홈페이지 : https://github.com/daumcorp/DaumEditor/
    -->
    <!--
        에디터 리소스들을 로딩하는 부분으로, 경로가 변경되면 이 부분 수정이 필요.
        주의: 서비스에 이용시 loader 에 붙은 environment=development 값을 제거해야 브라우저 캐시를 사용할 수 있습니다.
    -->
    <link rel="stylesheet" href="../daumeditor/css/editor.css" type="text/css" charset="utf-8">
    <script src="../daumeditor/js/editor_loader.js?environment=development" type="text/javascript" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/editor.js?dummy=1568782906522" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/development_environments.js?dummy=1568782906639" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/header.js?dummy=1568782906754" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/scopeVariable.js?dummy=1568782906754" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/lib/json2.js?dummy=1568782906754" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/lib/txlib.js?dummy=1568782906754" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/lib/closure-range.js?dummy=1568782906755" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/lib/hyperscript.js?dummy=1568782906755" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/lib/template.js?dummy=1568782906755" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/lib/dgetty.js?dummy=1568782906755" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/lib/dfindy.js?dummy=1568782906755" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/lib/xgetty.js?dummy=1568782906755" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/lib/font_css_property.js?dummy=1568782906756" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/eval.js?dummy=1568782906756" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/trex.js?dummy=1568782906756" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/event.js?dummy=1568782906756" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/config.js?dummy=1568782906756" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/message.js?dummy=1568782906756" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/configbuilder.js?dummy=1568782906757" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/lib/markup.js?dummy=1568782906757" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/lib/domutil.js?dummy=1568782906757" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/lib/utils.js?dummy=1568782906757" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/lib/imageresizer.js?dummy=1568782906758" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/lib/tableutil.js?dummy=1568782906758" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/mixins/ajax.js?dummy=1568782906758" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/mixins/observable.js?dummy=1568782906758" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/mixins/colorpallete.js?dummy=1568782906758" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/mixins/cookiebaker.js?dummy=1568782906759" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/common/button.js?dummy=1568782906759" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/common/menu.js?dummy=1568782906759" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/common/menuback.js?dummy=1568782906759" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/editor.js?dummy=1568782906759" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/toolbar.js?dummy=1568782906759" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/sidebar.js?dummy=1568782906760" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/docparser.js?dummy=1568782906760" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/entryproxy.js?dummy=1568782906760" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/formproxy.js?dummy=1568782906760" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/saver.js?dummy=1568782906760" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/resizer.js?dummy=1568782906761" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/history.js?dummy=1568782906761" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/canvas.js?dummy=1568782906761" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/panels/panel.js?dummy=1568782906761" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/panels/wysiwyg/iframeloader.js?dummy=1568782906761" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/panels/wysiwyg/webfontloader.js?dummy=1568782906762" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/panels/wysiwyg/wysiwygrelative.js?dummy=1568782906762" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/panels/wysiwyg/eventbinder.js?dummy=1568782906762" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/panels/wysiwygpanel.js?dummy=1568782906762" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/panels/textareapanel.js?dummy=1568782906762" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/panels/htmlpanel.js?dummy=1568782906762" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/panels/textpanel.js?dummy=1568782906763" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/marker.js?dummy=1568782906763" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/selection.js?dummy=1568782906763" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/bookmark.js?dummy=1568782906763" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/processor_textarea.js?dummy=1568782906763" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/processor_standard.js?dummy=1568782906764" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/processor_trident.js?dummy=1568782906764" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/processor_trident_standard.js?dummy=1568782906764" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/processor_gecko.js?dummy=1568782906764" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/processor_webkit.js?dummy=1568782906764" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/processor_presto.js?dummy=1568782906765" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/p/processor_standard_p.js?dummy=1568782906765" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/p/processor_trident_p.js?dummy=1568782906765" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/p/processor_trident_standard_p.js?dummy=1568782906765" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/p/processor_gecko_p.js?dummy=1568782906765" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/p/processor_webkit_p.js?dummy=1568782906766" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/p/processor_presto_p.js?dummy=1568782906766" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/processor/processor.js?dummy=1568782906766" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/filters/converting.js?dummy=1568782906766" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/filters/redundancy.js?dummy=1568782906766" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/attachment.js?dummy=1568782906766" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/attachbox.js?dummy=1568782906767" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/attachbox/attachbox_ui.js?dummy=1568782906767" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/attachbox/filecapacity.js?dummy=1568782906767" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/attacher.js?dummy=1568782906767" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/embeder.js?dummy=1568782906767" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/embedentry.js?dummy=1568782906768" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/buttonFontTool.js?dummy=1568782906768" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/menuFontTool.js?dummy=1568782906768" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/fontTool.js?dummy=1568782906768" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/switcher.js?dummy=1568782906768" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/switchertoggle.js?dummy=1568782906769" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/fontfamily.js?dummy=1568782906769" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/fontsize.js?dummy=1568782906769" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/bold.js?dummy=1568782906769" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/underline.js?dummy=1568782906770" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/italic.js?dummy=1568782906770" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/strike.js?dummy=1568782906770" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/forecolor.js?dummy=1568782906770" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/backcolor.js?dummy=1568782906770" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/indent.js?dummy=1568782906771" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/indentHelper.js?dummy=1568782906771" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/outdent.js?dummy=1568782906771" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/mixins/alignexecution.js?dummy=1568782906771" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/alignleft.js?dummy=1568782906771" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/aligncenter.js?dummy=1568782906771" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/alignright.js?dummy=1568782906772" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/alignfull.js?dummy=1568782906772" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/insertcells.js?dummy=1568782906772" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/deletecells.js?dummy=1568782906772" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/mergecells.js?dummy=1568782906772" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/cellslineheight.js?dummy=1568782906773" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/cellslinecolor.js?dummy=1568782906773" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/cellslinestyle.js?dummy=1568782906773" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/cellsoutline.js?dummy=1568782906773" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/cellslinepreview.js?dummy=1568782906773" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/tablebackcolor.js?dummy=1568782906774" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/tableedittool.js?dummy=1568782906774" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/tabletemplate.js?dummy=1568782906774" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/lineheight.js?dummy=1568782906774" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/styledlist.js?dummy=1568782906774" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/insertlink.js?dummy=1568782906775" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/richtextbox.js?dummy=1568782906775" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/quote.js?dummy=1568782906775" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/table.js?dummy=1568782906775" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/emoticon.js?dummy=1568782906776" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/redo.js?dummy=1568782906776" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/undo.js?dummy=1568782906776" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/removeformat.js?dummy=1568782906776" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/horizontalrule.js?dummy=1568782906776" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/specialchar.js?dummy=1568782906777" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/dictionary.js?dummy=1568782906777" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/background.js?dummy=1568782906777" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/advanced.js?dummy=1568782906777" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/extraButtonDropdown.js?dummy=1568782906777" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/tool/fullscreen.js?dummy=1568782906777" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/attacher/image.js?dummy=1568782906778" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/attacher/file.js?dummy=1568782906778" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/embeder/media.js?dummy=1568782906778" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/blockingunload.js?dummy=1568782906778" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/alignbuttons.js?dummy=1568782906779" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/canvassize.js?dummy=1568782906779" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/blockingedit.js?dummy=1568782906779" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/saveimagehistory.js?dummy=1568782906779" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/noticepanel.js?dummy=1568782906779" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/table.js?dummy=1568782906780" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/table/selector.js?dummy=1568782906780" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/table/merge.js?dummy=1568782906780" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/table/insert.js?dummy=1568782906780" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/table/delete.js?dummy=1568782906780" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/table/border.js?dummy=1568782906780" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/table/template.js?dummy=1568782906781" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/pageupdown.js?dummy=1568782906781" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/tabledragger.js?dummy=1568782906781" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/modules/exiteditor.js?dummy=1568782906781" charset="utf-8"></script><script type="text/javascript" src="https://onesports.ga/daumeditor/js/trex/footer.js?dummy=1568782906781" charset="utf-8"></script>



<div class="body">
	<!-- 에디터 시작 -->
	<!--
		@decsription
		등록하기 위한 Form으로 상황에 맞게 수정하여 사용한다. Form 이름은 에디터를 생성할 때 설정값으로 설정한다.
	-->
	<form name="tx_editor_form" id="tx_editor_form" action="/registerBoard/insert" method="post" accept-charset="utf-8">
		<!-- 에디터 컨테이너 시작 -->
		<div id="tx_trex_container" class="tx-editor-container">
			<!-- 사이드바 -->
			<div id="tx_sidebar" class="tx-sidebar">
				<div class="tx-sidebar-boundary">
					<!-- 사이드바 / 첨부 -->
					<ul class="tx-bar tx-bar-left tx-nav-attach">
						<!-- 이미지 첨부 버튼 시작 -->
						<!--
							@decsription
							<li></li> 단위로 위치를 이동할 수 있다.
						-->
						<li class="tx-list" style="z-index: 4;">
							<div unselectable="on" id="tx_image" class="tx-image tx-btn-trans">
								<a href="javascript:;" title="사진" class="tx-text">사진</a>
							</div>
						</li>
						<!-- 이미지 첨부 버튼 끝 -->
						<li class="tx-list" style="z-index: 4;">
							<div unselectable="on" id="tx_file" class="tx-file tx-btn-trans">
								<a href="javascript:;" title="파일" class="tx-text">파일</a>
							</div>
						</li>
						<li class="tx-list" style="z-index: 4;">
							<div unselectable="on" id="tx_media" class="tx-media tx-btn-trans">
								<a href="javascript:;" title="외부컨텐츠" class="tx-text">외부컨텐츠</a>
							</div>
						</li>
						<li class="tx-list tx-list-extra" style="z-index: 4;">
							<div unselectable="on" class="tx-btn-nlrbg tx-extra">
								<a href="javascript:;" class="tx-icon" title="버튼 더보기">버튼 더보기</a>
							</div>
							<ul class="tx-extra-menu tx-menu" style="left:-48px;" unselectable="on">
								<!--
									@decsription
									일부 버튼들을 빼서 레이어로 숨기는 기능을 원할 경우 이 곳으로 이동시킬 수 있다.
								-->
							</ul>
						</li>
					</ul>
					<!-- 사이드바 / 우측영역 -->
					<ul class="tx-bar tx-bar-right">
						<li class="tx-list" style="z-index: 4;">
							<div unselectable="on" class="tx-btn-lrbg tx-fullscreen" id="tx_fullscreen">
								<a href="javascript:;" class="tx-icon" title="넓게쓰기 (Ctrl+M)">넓게쓰기</a>
							</div>
						</li>
					</ul>
					<ul class="tx-bar tx-bar-right tx-nav-opt">
						<li class="tx-list" style="z-index: 4;">
							<div unselectable="on" class="tx-switchtoggle" id="tx_switchertoggle">
								<a href="javascript:;" title="에디터 타입">에디터</a>
							</div>
						</li>
					</ul>
				</div>
			</div>

			<!-- 툴바 - 기본 시작 -->
			<!--
				@decsription
				툴바 버튼의 그룹핑의 변경이 필요할 때는 위치(왼쪽, 가운데, 오른쪽) 에 따라 <li> 아래의 <div>의 클래스명을 변경하면 된다.
				tx-btn-lbg: 왼쪽, tx-btn-bg: 가운데, tx-btn-rbg: 오른쪽, tx-btn-lrbg: 독립적인 그룹

				드롭다운 버튼의 크기를 변경하고자 할 경우에는 넓이에 따라 <li> 아래의 <div>의 클래스명을 변경하면 된다.
				tx-slt-70bg, tx-slt-59bg, tx-slt-42bg, tx-btn-43lrbg, tx-btn-52lrbg, tx-btn-57lrbg, tx-btn-71lrbg
				tx-btn-48lbg, tx-btn-48rbg, tx-btn-30lrbg, tx-btn-46lrbg, tx-btn-67lrbg, tx-btn-49lbg, tx-btn-58bg, tx-btn-46bg, tx-btn-49rbg
			-->
			<div id="tx_toolbar_basic" class="tx-toolbar tx-toolbar-basic"><div class="tx-toolbar-boundary">
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list" style="z-index: 4;">
						<div id="tx_fontfamily" unselectable="on" class="tx-slt-70bg tx-fontfamily">
							<a href="javascript:;" title="글꼴"><span>굴림</span></a>
						</div>
						<div id="tx_fontfamily_menu" class="tx-fontfamily-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="tx-slt-42bg tx-fontsize" id="tx_fontsize">
							<a href="javascript:;" title="글자크기"><span>10pt</span></a>
						</div>
						<div id="tx_fontsize_menu" class="tx-fontsize-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-font">

					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-lbg 	tx-bold" id="tx_bold">
							<a href="javascript:;" class="tx-icon" title="굵게 (Ctrl+B)">굵게</a>
						</div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-bg 	tx-underline" id="tx_underline">
							<a href="javascript:;" class="tx-icon" title="밑줄 (Ctrl+U)">밑줄</a>
						</div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-bg 	tx-italic" id="tx_italic">
							<a href="javascript:;" class="tx-icon" title="기울임 (Ctrl+I)">기울임</a>
						</div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-bg 	tx-strike" id="tx_strike">
							<a href="javascript:;" class="tx-icon" title="취소선 (Ctrl+D)">취소선</a>
						</div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="tx-forecolor tx-slt-tbg" id="tx_forecolor" style="background-color: rgb(18, 52, 86);">
							<a href="javascript:;" class="tx-icon" title="글자색">글자색</a>
							<a href="javascript:;" class="tx-arrow" title="글자색 선택">글자색 선택</a>
						</div>
						<div id="tx_forecolor_menu" class="tx-menu tx-forecolor-menu tx-colorpallete" unselectable="on"></div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-slt-brbg 	tx-backcolor" id="tx_backcolor" style="background-color: rgb(154, 165, 234);">
							<a href="javascript:;" class="tx-icon" title="글자 배경색">글자 배경색</a>
							<a href="javascript:;" class="tx-arrow" title="글자 배경색 선택">글자 배경색 선택</a>
						</div>
						<div id="tx_backcolor_menu" class="tx-menu tx-backcolor-menu tx-colorpallete" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-align">
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="tx-alignleft tx-btn-lbg-pushed" id="tx_alignleft">
							<a href="javascript:;" class="tx-icon" title="왼쪽정렬 (Ctrl+,)">왼쪽정렬</a>
						</div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-bg 	tx-aligncenter" id="tx_aligncenter">
							<a href="javascript:;" class="tx-icon" title="가운데정렬 (Ctrl+.)">가운데정렬</a>
						</div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-bg 	tx-alignright" id="tx_alignright">
							<a href="javascript:;" class="tx-icon" title="오른쪽정렬 (Ctrl+/)">오른쪽정렬</a>
						</div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-rbg 	tx-alignfull" id="tx_alignfull">
							<a href="javascript:;" class="tx-icon" title="양쪽정렬">양쪽정렬</a>
						</div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-tab">
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-lbg 	tx-indent" id="tx_indent">
							<a href="javascript:;" title="들여쓰기 (Tab)" class="tx-icon">들여쓰기</a>
						</div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-rbg 	tx-outdent" id="tx_outdent">
							<a href="javascript:;" title="내어쓰기 (Shift+Tab)" class="tx-icon">내어쓰기</a>
						</div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-list">
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="tx-slt-31lbg tx-lineheight" id="tx_lineheight">
							<a href="javascript:;" class="tx-icon" title="줄간격"><span>줄간격</span></a>
							<a href="javascript:;" class="tx-arrow" title="줄간격">줄간격 선택</a>
						</div>
						<div id="tx_lineheight_menu" class="tx-lineheight-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="tx-slt-31rbg tx-styledlist" id="tx_styledlist">
							<a href="javascript:;" class="tx-icon" title="리스트"><span>리스트</span></a>
							<a href="javascript:;" class="tx-arrow" title="리스트">리스트 선택</a>
						</div>
						<div id="tx_styledlist_menu" class="tx-styledlist-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-etc">
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-lbg 	tx-emoticon" id="tx_emoticon">
							<a href="javascript:;" class="tx-icon" title="이모티콘">이모티콘</a>
						</div>
						<div id="tx_emoticon_menu" class="tx-emoticon-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-bg 	tx-link" id="tx_link">
							<a href="javascript:;" class="tx-icon" title="링크 (Ctrl+K)">링크</a>
						</div>
						<div id="tx_link_menu" class="tx-link-menu tx-menu"></div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-bg 	tx-specialchar" id="tx_specialchar">
							<a href="javascript:;" class="tx-icon" title="특수문자">특수문자</a>
						</div>
						<div id="tx_specialchar_menu" class="tx-specialchar-menu tx-menu"></div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-bg 	tx-table" id="tx_table">
							<a href="javascript:;" class="tx-icon" title="표만들기">표만들기</a>
						</div>
						<div id="tx_table_menu" class="tx-table-menu tx-menu" unselectable="on">
							<div class="tx-menu-inner">
								<div class="tx-menu-preview"></div>
								<div class="tx-menu-rowcol"></div>
								<div class="tx-menu-deco"></div>
								<div class="tx-menu-enter"></div>
							</div>
						</div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-rbg 	tx-horizontalrule" id="tx_horizontalrule">
							<a href="javascript:;" class="tx-icon" title="구분선">구분선</a>
						</div>
						<div id="tx_horizontalrule_menu" class="tx-horizontalrule-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-lbg 	tx-richtextbox" id="tx_richtextbox">
							<a href="javascript:;" class="tx-icon" title="글상자">글상자</a>
						</div>
						<div id="tx_richtextbox_menu" class="tx-richtextbox-menu tx-menu">
							<div class="tx-menu-header">
								<div class="tx-menu-preview-area">
									<div class="tx-menu-preview"></div>
								</div>
								<div class="tx-menu-switch">
									<div class="tx-menu-simple tx-selected"><a><span>간단 선택</span></a></div>
									<div class="tx-menu-advanced"><a><span>직접 선택</span></a></div>
								</div>
							</div>
							<div class="tx-menu-inner">
							</div>
							<div class="tx-menu-footer">
								<img class="tx-menu-confirm" src="/daumeditor/images/icon/editor/btn_confirm.gif?rv=1.0.1" alt="">
								<img class="tx-menu-cancel" hspace="3" src="/daumeditor/images/icon/editor/btn_cancel.gif?rv=1.0.1" alt="">
							</div>
						</div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-bg 	tx-quote" id="tx_quote">
							<a href="javascript:;" class="tx-icon" title="인용구 (Ctrl+Q)">인용구</a>
						</div>
						<div id="tx_quote_menu" class="tx-quote-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-bg 	tx-background" id="tx_background">
							<a href="javascript:;" class="tx-icon" title="배경색">배경색</a>
						</div>
						<div id="tx_background_menu" class="tx-menu tx-background-menu tx-colorpallete" unselectable="on"></div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-rbg 	tx-dictionary" id="tx_dictionary">
							<a href="javascript:;" class="tx-icon" title="사전">사전</a>
						</div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-undo">
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-lbg 	tx-undo" id="tx_undo">
							<a href="javascript:;" class="tx-icon" title="실행취소 (Ctrl+Z)">실행취소</a>
						</div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="		 tx-btn-rbg 	tx-redo" id="tx_redo">
							<a href="javascript:;" class="tx-icon" title="다시실행 (Ctrl+Y)">다시실행</a>
						</div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-right">
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="tx-btn-nlrbg tx-advanced" id="tx_advanced">
							<a href="javascript:;" class="tx-icon" title="툴바 더보기">툴바 더보기</a>
						</div>
					</li>
				</ul>
			</div></div>
			<!-- 툴바 - 기본 끝 -->
			<!-- 툴바 - 더보기 시작 -->
			<div id="tx_toolbar_advanced" class="tx-toolbar tx-toolbar-advanced"><div class="tx-toolbar-boundary">
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list">
						<div class="tx-tableedit-title"></div>
					</li>
				</ul>

				<ul class="tx-bar tx-bar-left tx-group-align">
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="tx-btn-lbg tx-mergecells" id="tx_mergecells">
							<a href="javascript:;" class="tx-icon2" title="병합"><span>병합</span></a>
						</div>
						<div id="tx_mergecells_menu" class="tx-mergecells-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="tx-btn-bg tx-insertcells" id="tx_insertcells">
							<a href="javascript:;" class="tx-icon2" title="삽입"><span>삽입</span></a>
						</div>
						<div id="tx_insertcells_menu" class="tx-insertcells-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div unselectable="on" class="tx-btn-rbg tx-deletecells" id="tx_deletecells">
							<a href="javascript:;" class="tx-icon2" title="삭제"><span>삭제</span></a>
						</div>
						<div id="tx_deletecells_menu" class="tx-deletecells-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>

				<ul class="tx-bar tx-bar-left tx-group-align">
					<li class="tx-list" style="z-index: 4;">
						<div id="tx_cellslinepreview" unselectable="on" class="tx-slt-70lbg tx-cellslinepreview">
							<a href="javascript:;" title="선 미리보기"><span><table width="43" cellpadding="0" style="line-height:0"><tbody><tr><td valign="center" height="14"><div style="border-bottom:1pt solid #7c84ef;width:43px;height:2px;overflow:hidden;"></div></td></tr></tbody></table></span></a>
						</div>
						<div id="tx_cellslinepreview_menu" class="tx-cellslinepreview-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div id="tx_cellslinecolor" unselectable="on" class="tx-slt-tbg tx-cellslinecolor" style="background-color: rgb(124, 132, 239);">
							<a href="javascript:;" class="tx-icon2" title="선색">선색</a>

							<div class="tx-colorpallete" unselectable="on"></div>
						</div>
						<div id="tx_cellslinecolor_menu" class="tx-cellslinecolor-menu tx-menu tx-colorpallete" unselectable="on"></div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div id="tx_cellslineheight" unselectable="on" class="tx-btn-bg tx-cellslineheight">
							<a href="javascript:;" class="tx-icon2" title="두께"><span>두께</span></a>

						</div>
						<div id="tx_cellslineheight_menu" class="tx-cellslineheight-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div id="tx_cellslinestyle" unselectable="on" class="tx-btn-bg tx-cellslinestyle">
							<a href="javascript:;" class="tx-icon2" title="스타일"><span>스타일</span></a>
						</div>
						<div id="tx_cellslinestyle_menu" class="tx-cellslinestyle-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list" style="z-index: 4;">
						<div id="tx_cellsoutline" unselectable="on" class="tx-btn-rbg tx-cellsoutline">
							<a href="javascript:;" class="tx-icon2" title="테두리"><span>테두리</span></a>

						</div>
						<div id="tx_cellsoutline_menu" class="tx-cellsoutline-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list" style="z-index: 4;">
						<div id="tx_tablebackcolor" unselectable="on" class="tx-btn-lrbg tx-tablebackcolor" style="background-color:#9aa5ea;">
							<a href="javascript:;" class="tx-icon2" title="테이블 배경색">테이블 배경색</a>
						</div>
						<div id="tx_tablebackcolor_menu" class="tx-tablebackcolor-menu tx-menu tx-colorpallete" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list" style="z-index: 4;">
						<div id="tx_tabletemplate" unselectable="on" class="tx-btn-lrbg tx-tabletemplate">
							<a href="javascript:;" class="tx-icon2" title="테이블 서식">테이블 서식</a>
						</div>
						<div id="tx_tabletemplate_menu" class="tx-tabletemplate-menu tx-menu tx-colorpallete" unselectable="on"></div>
					</li>
				</ul>

			</div></div>
			<!-- 툴바 - 더보기 끝 -->
			<!-- 편집영역 시작 -->
				<!-- 에디터 Start -->
	<div id="tx_canvas" class="tx-canvas">
		<div id="tx_loading" class="tx-loading" style="display: none;"><div><img src="/daumeditor/images/icon/editor/loading2.png" width="113" height="21" align="absmiddle"></div></div>
		<div id="tx_canvas_wysiwyg_holder" class="tx-holder" style="display:block;"><div class="tx-table-row-resize-dragger" style="position: absolute; overflow: hidden; top: 0px; left: 0px; width: 100%; height: 3px; cursor: row-resize; display: none;"></div><div class="tx-table-col-resize-dragger" style="position: absolute; overflow: hidden; top: 0px; left: 0px; width: 3px; height: 100%; cursor: col-resize; display: none;"></div>
			<iframe id="tx_canvas_wysiwyg" name="tx_canvas_wysiwyg" allowtransparency="true" frameborder="0" style="height: 419px;" title="에디터 영역 : 에디터 영역에서 빠져 나오시려면 Shift+ESC키를 누르세요"></iframe>
		</div>
		<div class="tx-source-deco">
			<div id="tx_canvas_source_holder" class="tx-holder" style="display: none;">
				<textarea id="tx_canvas_source" rows="30" cols="30" style="background-color: rgb(255, 255, 255); color: rgb(18, 52, 86);"></textarea>
			</div>
		</div>
		<div id="tx_canvas_text_holder" class="tx-holder" style="display: none;">
			<textarea id="tx_canvas_text" rows="30" cols="30"></textarea>
		</div>
	<span style="position: absolute; font-size: 13px; color: green; font-family: courier, serif; right: 10px; bottom: 10px;">ONE SPORTS</span></div>
					<!-- 높이조절 Start -->
	<div id="tx_resizer" class="tx-resize-bar">
		<div class="tx-resize-bar-bg"></div>
		<img id="tx_resize_holder" src="/daumeditor/images/icon/editor/skin/01/btn_drag01.gif" width="58" height="12" unselectable="on" alt="">
	</div>
					<div class="tx-side-bi" id="tx_side_bi">
	</div>
				<!-- 편집영역 끝 -->
			<!-- 첨부박스 시작 -->
				<!-- 파일첨부박스 Start -->
	<div id="tx_attach_div" class="tx-attach-div">
		<div id="tx_attach_txt" class="tx-attach-txt">파일 첨부</div>
		<div id="tx_attach_box" class="tx-attach-box">
			<div class="tx-attach-box-inner">
				<div id="tx_attach_preview" class="tx-attach-preview"><p></p><img src="/daumeditor/images/icon/editor/pn_preview.gif" width="147" height="108" unselectable="on"></div>
				<div class="tx-attach-main">
					<div id="tx_upload_progress" class="tx-upload-progress"><div>0%</div><p>파일을 업로드하는 중입니다.</p></div>
					<ul class="tx-attach-top">
						<li id="tx_attach_delete" class="tx-attach-delete"><a>전체삭제</a></li>
						<li id="tx_attach_size" class="tx-attach-size">
							파일: <span id="tx_attach_up_size" class="tx-attach-size-up"></span>/<span id="tx_attach_max_size"></span>
						</li>
						<li id="tx_attach_tools" class="tx-attach-tools">
						</li>
					</ul>
					<ul id="tx_attach_list" class="tx-attach-list"></ul>
				</div>
			</div>
		</div>
	</div>
				<!-- 첨부박스 끝 -->
		</div>
		<!-- 에디터 컨테이너 끝 -->
	</form>
</div>
<!-- 에디터 끝 -->
<script type="text/javascript">
	var config = {
		txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
		txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
		txService: 'sample', /* 수정필요없음. */
		txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
		initializedId: "", /* 대부분의 경우에 빈문자열 */
		wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
		form: 'tx_editor_form'+"", /* 등록하기 위한 Form 이름 */
		txIconPath: "images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
		txDecoPath: "images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
		canvas: {
            exitEditor:{
                /*
                desc:'빠져 나오시려면 shift+b를 누르세요.',
                hotKey: {
                    shiftKey:true,
                    keyCode:66
                },
                nextElement: document.getElementsByTagName('button')[0]
                */
            },
			styles: {
				color: "#123456", /* 기본 글자색 */
				fontFamily: "굴림", /* 기본 글자체 */
				fontSize: "10pt", /* 기본 글자크기 */
				backgroundColor: "#fff", /*기본 배경색 */
				lineHeight: "1.5", /*기본 줄간격 */
				padding: "8px" /* 위지윅 영역의 여백 */
			},
			showGuideArea: false
		},
		events: {
			preventUnload: false
		},
		 toolbar:{
	            table : {
	                tableWidth : '100%'
	            }
	        },
		sidebar: {
			 capacity: {
				 maximum: 1024*1024*3 
			 },
			attachbox: {
				show: true,
				confirmForDeleteAll: true
			}
		}
	};

	EditorJSLoader.ready(function(Editor) {
		var editor = new Editor(config);
	});
	
</script>

<!-- Sample: Saving Contents -->
<script type="text/javascript">
	function insertLoad() {
		if($("#updateGubun").val() == undefined) {
			if($("#annoGubun").val() == "Y") {
				$("#tx_editor_form").attr("action", "/registerBoard/anno/insert"); 
			} else {
				$("#tx_editor_form").attr("action", "/registerBoard/insert");
			}
		} else {
			if($("#annoGubun").val() == "Y") {
				$("#tx_editor_form").attr("action", "/registerBoard/anno/update"); 
			} else {
				$("#tx_editor_form").attr("action", "/registerBoard/update");
			}
		}
	}

	// 업데이트 함수
	function updateContent(boardNo) {
		var formData = new FormData();
		var title = $("#title");
		var contents = Editor.getContent();
		var notUseFile = "";
		
		// 파일지운거 체크 Y면 파일지운거
		if($("#originFile").val() == undefined) {
			notUseFile = "Y"
		}
		
		var boardFilePath = $("#boardFilePath").val();
		var boardFileName = $("#boardFileName").val();
			
		if(title.val().trim() == "") {
			alert("제목를 입력해주세요.");
			title.focus();
			return;
		}
		
		if(contents.trim() == "") {
			alert("내용을 입력해주세요.");
			contents.focus();
			return;
		}
		
		formData.append("boardTitle", title.val());
		formData.append("boardContents", contents);
		formData.append("notUseFile", notUseFile);
		
		if($("#boardFilePath").val() != "") {
			formData.append("boardFilePath", $("#boardFilePath").val());
		} else {
			formData.append("boardFilePath", "");
		}
		
		if($("#boardFileName").val() != "") {
			formData.append("boardFileName", $("#boardFileName").val());
		}
		
		$.ajax({
			url : "/updateBoard/" + boardNo + "/update",
			enctype: 'multipart/form-data',
			processData: false,
            contentType: false,
			type : "POST",
			cache : false,
			dataType : "json",
			data : formData,
			success : function(data) {
				if(data == 1) {
					location.replace("/showBoard/" + boardNo);
				} else {
					
				}
			},
			error : function(request, status, error) {
				alert("알수 없는 오류가 발생하였습니다.\n새로고침 후 다시 시도해주세요.")
			}
		});
	}
	
	function saveContent() {
		Editor.save(); // 이 함수를 호출하여 글을 등록하면 된다.
	}

	/**
	 * Editor.save()를 호출한 경우 데이터가 유효한지 검사하기 위해 부르는 콜백함수로
	 * 상황에 맞게 수정하여 사용한다.
	 * 모든 데이터가 유효할 경우에 true를 리턴한다.
	 * @function
	 * @param {Object} editor - 에디터에서 넘겨주는 editor 객체
	 * @returns {Boolean} 모든 데이터가 유효할 경우에 true
	 */
	 
	 // 업로드
	function validForm(editor) {
		// Place your validation logic here

		// sample : validate that content exists
		var validator = new Trex.Validator();
		var content = editor.getContent();
		
		
		if ($("#annoGubun").val() == "Y") {
			if ($("#annoId").val().trim() == "") {
				alert('아이디를 입력하세요');
				$("#annoId").focus();
				return false;
			}

			var regexp = /^[0-9ㄱ-힣a-zA-Z]*$/
			v = $("#annoId").val()

			if (!regexp.test(v) || $("#annoId").val().length < 4
					|| $("#annoId").val().length > 8) {
				alert("아이디는 4~8자리, 영어, 숫자, 한글만 입력이 가능합니다.");
				$("#annoId").focus();
				return;
			}

			if ($("#annoPw").val().trim() == "") {
				alert('비밀번호를 입력하세요');
				$("#annoPw").focus();
				return false;
			}
			
			if($("#annoPw").val().length < 8 || $("#annoPw").val().length > 20) {
				alert("비밀번호는 8~20글자로 입력해주세요.");
				$("#annoPw").focus();
				return ;
			}
		}

		if ($("#title").val().trim() == "") {
			alert('제목을 입력하세요');
			$("#title").focus();
			return false;
		}

		if ($("#title").val().trim().length > 120) {
			alert("제목은 120글자 까지만 입력가능합니다.");
			return;
		}

		if (!validator.exists(content)) {
			alert('내용을 입력하세요');
			return false;
		}

		return true;
	}

	/**
	 * Editor.save()를 호출한 경우 validForm callback 이 수행된 이후
	 * 실제 form submit을 위해 form 필드를 생성, 변경하기 위해 부르는 콜백함수로
	 * 각자 상황에 맞게 적절히 응용하여 사용한다.
	 * @function
	 * @param {Object} editor - 에디터에서 넘겨주는 editor 객체
	 * @returns {Boolean} 정상적인 경우에 true
	 */
	function setForm(editor) {
		var i, input;
		var form = editor.getForm();
		var content = editor.getContent();
		
		// 본문 내용을 필드를 생성하여 값을 할당하는 부분
		var textarea = document.createElement('textarea');
		textarea.name = 'boardContents';
		textarea.value = content;
		textarea.type = 'hidden';

		var title = document.createElement('input');
		title.type = 'hidden';
		title.name = 'boardTitle';
		title.value = $("#title").val();

		// 익명 구분
		if ($("#annoGubun").val() == "Y") {
			var annoId = document.createElement('input');
			annoId.type = 'hidden';
			annoId.name = 'boardAnnoId';
			annoId.value = $("#annoId").val();

			var annoPw = document.createElement('input');
			annoPw.type = 'hidden';
			annoPw.name = 'boardAnnoPw';
			annoPw.value = $("#annoPw").val();

			form.createField(annoId);
			form.createField(annoPw);
		}

		// 답장 구분
		if ($("#reply").val() != undefined) {
			var boardGrpNo = document.createElement('input');
			boardGrpNo.type = 'hidden';
			boardGrpNo.name = 'boardGrpNo';
			boardGrpNo.value = $("#boardGrpNo").val();
			form.createField(boardGrpNo);
			
			var boardGrpOrd = document.createElement('input');
			boardGrpOrd.type = 'hidden';
			boardGrpOrd.name = 'boardGrpOrd';
			boardGrpOrd.value = $("#boardGrpOrd").val();
			form.createField(boardGrpOrd);
			
			var boardGrpDepth = document.createElement('input');
			boardGrpDepth.type = 'hidden';
			boardGrpDepth.name = 'boardGrpDepth';
			boardGrpDepth.value = $("#boardGrpDepth").val();
			form.createField(boardGrpDepth);
		}
		
		// 파일업로드 구분
		if ($("#fileName").val() != undefined && $("#fileName").val().trim() != "") {
			
			// 업데이트할때 필요
			var filegubun = document.createElement('input');
			filegubun.type = 'hidden';
			filegubun.name = 'fileGubun';
			filegubun.value = "Y"
			form.createField(filegubun);
			    
			var boardFilePath = document.createElement('input');
			boardFilePath.type = 'hidden';
			boardFilePath.name = 'boardFilePath';
			boardFilePath.value = $("#boardFilePath").val()
			form.createField(boardFilePath);
			
			var boardFileName = document.createElement('input');
			boardFileName.type = 'hidden';
			boardFileName.name = 'boardFileName';
			boardFileName.value = $("#boardFileName").val()
			form.createField(boardFileName);
		}
		
		if($("input:checkbox[id='notice']").is(":checked") == true) {
			var notice = document.createElement('input');
			notice.type = 'hidden';
			notice.name = 'boardNotice';
			notice.value = 'Y'
			form.createField(notice);
		}
		
		form.createField(textarea);
		form.createField(title);

		/* 아래의 코드는 첨부된 데이터를 필드를 생성하여 값을 할당하는 부분으로 상황에 맞게 수정하여 사용한다.
		 첨부된 데이터 중에 주어진 종류(image,file..)에 해당하는 것만 배열로 넘겨준다. */
		var images = editor.getAttachments('image');
		for (i = 0; i < images.length; i++) {
			// existStage는 현재 본문에 존재하는지 여부
			if (images[i].existStage) {
				// data는 팝업에서 execAttach 등을 통해 넘긴 데이터
				input = document.createElement('input');
				input.type = 'hidden';
				input.name = 'attach_image';
				input.value = images[i].data.imageurl; // 예에서는 이미지경로만 받아서 사용
				form.createField(input);
			}
		}

		var files = editor.getAttachments('file');
		for (i = 0; i < files.length; i++) {
			input = document.createElement('input');
			input.type = 'hidden';
			input.name = 'attach_file';
			input.value = files[i].data.attachurl;
			form.createField(input);
		}
		return true;
	}
</script>

<!-- End: Saving Contents -->

<!-- Sample: Loading Contents -->
<textarea id="sample_contents_source" style="display:none;">	&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;
	&lt;p style="text-align: center;"&gt;
		&lt;img src="http://cfile273.uf.daum.net/image/2064CD374EE1ACCB0F15C8" class="tx-daum-image" style="clear: none; float: none;"/&gt;
	&lt;/p&gt;
	&lt;p&gt;
		&lt;a href="http://cfile297.uf.daum.net/attach/207C8C1B4AA4F5DC01A644"&gt;&lt;img src="snapshot/images/icon/p_gif_s.gif"/&gt; editor_bi.gif&lt;/a&gt;
	&lt;/p&gt;
</textarea>
<script type="text/javascript">
	// 글불러오기	
	function loadContent() {
		/*var attachments = {};
		attachments['image'] = [];
		attachments['image'].push({
			'attacher': 'image',
			'data': {
				'imageurl': 'http://cfile273.uf.daum.net/image/2064CD374EE1ACCB0F15C8',
				'filename': 'github.gif',
				'filesize': 59501,
				'originalurl': 'http://cfile273.uf.daum.net/original/2064CD374EE1ACCB0F15C8',
				'thumburl': 'http://cfile273.uf.daum.net/P150x100/2064CD374EE1ACCB0F15C8'
			}
		});
		attachments['file'] = [];
		attachments['file'].push({
			'attacher': 'file',
			'data': {
				'attachurl': 'http://cfile297.uf.daum.net/attach/207C8C1B4AA4F5DC01A644',
				'filemime': 'image/gif',
				'filename': 'editor_bi.gif',
				'filesize': 640
			}
		});*/
		/* 저장된 컨텐츠를 불러오기 위한 함수 호출 */
		Editor.modify({
			//"attachments": function () { /* 저장된 첨부가 있을 경우 배열로 넘김, 위의 부분을 수정하고 아래 부분은 수정없이 사용 */
			/*	var allattachments = [];
				for (var i in attachments) {
					allattachments = allattachments.concat(attachments[i]);
				}
				return allattachments;
			}(),*/
			"boardTitle": $("#title").val(), // 그냥 예시용 
			"boardContetns": document.getElementById("sample_contents_source"), /* 내용 문자열, 주어진 필드(textarea) 엘리먼트 */
			"content" :	document.getElementById("getContents").value
		});
	}
</script>
<!-- End: Loading Contents -->
<script src="/vendor/jquery/jquery.min.js"></script>




</div>

							<div class="row">
								<div class="col-xl-6 col-md-6 mb-6">
									<div class="input-group mb-3">
										<button type="button" class="btn btn-secondary btn-block" onclick="location.href='/boardList'">취소</button>
									</div>
								</div>
								<div class="col-xl-6 col-md-6 mb-6">
									<div class="input-group mb-3">
										<button type="button" class="btn btn-secondary btn-block" onclick="javascript:saveContent();">글쓰기</button>
									</div>
								</div>
							</div>
						</div>

</body>
</html>