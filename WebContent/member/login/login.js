function loginCheck()
{
	if(document.login.email.value==""){
		alert("아이디를 입력해주세요");
		document.login.email.focus();
		return;
	}
	if(document.login.password.value==""){
		alert("비밀번호를 입력해주세요");
		document.login.password.focus();
		return;
	}
	document.login.submit();
}