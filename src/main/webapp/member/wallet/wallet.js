function cardCheck() {
	var card_number = document.card.card_number;
	var card_date = document.card.card_date;
	var card_cvc = document.card.card_cvc;
	var card_password = document.card.card_password;
	if(card_number.value == "" || card_number.value.length < 19) {
		alert("카드 번호를 입력해주세요.");
		card_num.focus();
		return;
	}
	if(card_date.value == "" || card_date.value.length < 4) {
		alert("카드 유효 기간을 입력해주세요.");
		card_date.focus();
		return;
	}
	if(card_cvc == "" || card_cvc.value.length < 3) {
		alert("카드 CVC를 입력해주세요.");
		card_cvc.focus();
		return;
	}
	if(card_password.value == "" || card_password.value.length < 2) {
		alert("카드 비밀번호 앞 두 자리를 입력해주세요.");
		card_password.focus();
		return;
	}
	document.card.submit();
}

function bankCheck() {
	var bank_name = document.bank.bank_name;
	var bank_account = document.bank.bank_account;
	if(bank_name.value == "") {
		alert("입금자명을 입력해주세요.");
		bank_name.focus();
		return;
	}
	if(bank_account.value == "") {
		alert("입금 계좌를 선택해주세요.");
		return;
	}
	document.bank.submit();
}

function passwordCheck() {
	var password = document.pay.pay_password;
	var repassword = document.pay.pay_repassword;
	if(password.value == "") {
		alert("결제 비밀번호를 입력해주세요.");
		password.focus();
		return;
	}
	if(repassword.value == "") {
		alert("결제 비밀번호를 다시 한 번 입력해주세요.");
		repassword.focus();
		return;
	}
	if(password.value != repassword.value) {
		alert("결제 비밀번호가 다릅니다. 비밀번호와 비밀번호 확인을 똑같이 입력해주세요.");
		password.value = "";
		repassword.value = "";
		password.focus();
		return;
	}
	document.pay.submit();
}

function payPasswordCheck() {
	var password = document.check.password;
	if(password.value == "") {
		alert("결제 비밀번호를 입력해주세요.");
		password.focus();
		return false;
	}
	return true;
}