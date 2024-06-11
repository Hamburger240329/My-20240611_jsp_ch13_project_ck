/**
 * 
 */

function joinCheck(){
	if(document.joinForm.userID.value.length < 2 || document.joinForm.userID.value.length > 16) {
		alert("아이디는 2~16자 이내로 입력해야 합니다.");
		document.joinForm.userID.focus();
		return false;	
	}
	
	if(document.joinForm.userPW.value.length < 6){
	alert("비밀번호는 6자 이상으로 입력해야 합니다.");
	document.joinForm.userPW.focus();
	return false;	
	}
	
	if(document.joinForm.userEmail.value.length == 0){
	alert("이메일 주소는 반드시 입력해야 합니다.");
	document.joinForm.userEmail.focus();
	return false;	
	}
	
	return True;
 } 	
