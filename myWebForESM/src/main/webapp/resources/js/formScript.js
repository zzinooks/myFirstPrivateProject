
/*로그인 폼 확인*/
function checkLogin() {

	if( document.memberLoginForm.loginId.value == ""){
		alert("아이디를 입력해주세요");
		document.memberLoginForm.loginId.focus();
	}
	else if ( doucment.memberLoginForm.loginPassword.vlaue == ""){
		alert("비밀번호를 입력해주세요");
		document.membeLoginForm.loginPassword.focus();
	}
	else {
		document.memberLoginForm.submit();
	}

}