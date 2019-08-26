function inputCheck(){
	if(document.register.email.value==""){
		alert("아이디를 입력해주세요");
		document.register.email.focus();
		return;
	}
	if(document.register.password.value==""){
		alert("비밀번호를 입력해주세요");
		document.register.password.focus();
		return;
	}
	if(document.register.passwordc.value==""){
		alert("비밀번호 확인을 입력해주세요");
		document.register.passwordc.focus();
		return;
	}
	if(document.register.nickname.value==""){
		alert("이름을 입력해주세요");
		document.register.nickname.focus();
		return;
	}
	if(document.register.password.value != document.register.passwordc.value){
		alert("비밀번호가 일치하지않습니다");
		document.register.passwordc.focus();
		return;
	}
	document.register.submit();
}