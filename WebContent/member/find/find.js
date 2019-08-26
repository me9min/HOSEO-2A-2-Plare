function emailFindCheck() {
	if(document.email_find.phone.value == "") {
		alert("전화번호를 입력하세요.");
		document.email_find.phone.focus();
		return
	}
	if(document.email_find.code.value == "") {
		alert("인증번호를 입력하세요.");
		document.email_find.code.focus();
		return
	}
	document.email_find.submit();
}

function passwordFindCheck() {
	if(document.password_find.email.value == "") {
		alert("이메일을 입력하세요.");
		document.password_find.email.focus();
		return
	}
	if(document.password_find.phone.value == "") {
		alert("전화번호를 입력하세요.");
		document.password_find.phone.focus();
		return
	}
	if(document.password_find.code.value == "") {
		alert("인증번호를 입력하세요.");
		document.password_find.code.focus();
		return
	}
	document.password_find.submit();
}

