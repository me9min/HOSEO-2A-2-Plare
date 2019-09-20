function boardCheck() {
	// 반드시 채워져야하는 항목이 채워져있는지 확인 후 submit하는 함수
	
	if(document.board.title.value == "") {
		alert("제목을 입력해주세요");
		document.write.title.focus();
		return;
	}
	if(document.board.content.value == "") {
		alert("내용을 입력해주세요");
		document.write.content.focus();
		return;
	}
	document.board.submit();
}

function commentCheck() {
	if(document.comment_board.content.value == "") {
		alert("댓글 내용을 입력해주세요.");
		document.comment_board.content.focus();
		return;
	}
	document.comment_board.submit();
}

function updateShow(i, j) {
	var update1 = "update" + i;
	var update2 = "update" + j;
	var reply1 = "reply" + i;
	var reply2 = "reply" + j;
	
	document.getElementById(reply1).style.display = "none";
	document.getElementById(reply2).style.display = "none";
	
	if(document.getElementById(update1).style.display === "none") {
		document.getElementById(update1).style.display = "table-row";
		document.getElementById(update2).style.display = "table-row";
	} else {
		document.getElementById(update1).style.display = "none";
		document.getElementById(update2).style.display = "none";
	}
}

function replyShow(i, j) {
	var update1 = "update" + i;
	var update2 = "update" + j;
	var reply1 = "reply" + i;
	var reply2 = "reply" + j;
	
	document.getElementById(update1).style.display = "none";
	document.getElementById(update2).style.display = "none";
	
	if(document.getElementById(reply1).style.display === "none") {
		document.getElementById(reply1).style.display = "table-row";
		document.getElementById(reply2).style.display = "table-row";
	} else {
		document.getElementById(reply1).style.display = "none";
		document.getElementById(reply2).style.display = "none";
	}
}