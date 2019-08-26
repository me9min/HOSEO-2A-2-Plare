function loginCheck(){
	if(document.login.mem_id.value==""){
		alert("아이디를 입력해주세요");
		document.login.mem_id.focus();
		return;
	}
	if(document.login.mem_passwd.value==""){
		alert("비밀번호를 입력해주세요");
		document.login.mem_passwd.focus();
		return;
	}
	document.login.submit();
}

function inputCheck(){
	if(document.register.mem_id.value==""){
		alert("아이디를 입력해주세요");
		document.register.mem_id.focus();
		return;
	}
	if(document.register.mem_passwd.value==""){
		alert("비밀번호를 입력해주세요");
		document.register.mem_passwd.focus();
		return;
	}
	if(document.register.mem_repasswd.value==""){
		alert("비밀번호 확인을 입력해주세요");
		document.register.mem_repasswd.focus();
		return;
	}
	if(document.register.mem_name.value==""){
		alert("이름을 입력해주세요");
		document.register.mem_name.focus();
		return;
	}
	if(document.register.mem_num1.value==""){
		alert("주민번호 앞자리를 입력해주세요");
		document.register.mem_num1.focus();
		return;
	}
	if(document.register.mem_num2.value==""){
		alert("주민번호 뒷자리를 입력해주세요");
		document.register.mem_num2.focus();
		return;
	}
	if(document.register.mem_email.value==""){
		alert("이메일을 입력해주세요");
		document.register.mem_email.focus();
		return;
	}
	if(document.register.mem_phone.value==""){
		alert("휴대전화 번호를 입력해주세요");
		document.register.mem_phone.focus();
		return;
	}
	if(document.register.mem_passwd.value != document.register.mem_repasswd.value){
		alert("비밀번호가 일치하지않습니다");
		document.register.mem_repasswd.focus();
		return;
	}
	document.register.submit();
}

function findCheck(){
	if(document.register.mem_email.value==""){
		alert("이메일을 입력해주세요");
		document.register.mem_email.focus();
		return;
	}
	if(document.register.mem_phone.value==""){
		alert("휴대전화 번호를 입력해주세요");
		document.register.mem_phone.focus();
		return;
	}
	document.find.submit();
}