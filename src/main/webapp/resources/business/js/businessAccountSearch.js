//birth year options loading
const targetSelect = document.getElementById('birthyear-option');
appendYear(targetSelect);

function appendYear(targetSelect){  
    const date = new Date();
    const year = date.getFullYear();
    for(let i = year-19; i >= year-80; i--){
    	let newOption = new Option();
    	newOption.value = i;
    	newOption.text = i + '년';
    	targetSelect.append(newOption);
    }
}


//radio input selected
function radioCheck(gender) {
	switch (gender) {
	case 'male':
		document.getElementById(gender + '_label').style.border = '1px solid black';
		document.getElementById('female' + '_label').style.border = 'none';
		return;
	case 'female':
		document.getElementById(gender + '_label').style.border = '1px solid black';
		document.getElementById('male' + '_label').style.border = 'none';		
		return;
	default:
		return;
	}
}	


//Search Option Selectors
function openForm(target) {
	const displayOption = document.getElementById(target).style.display;
	document.getElementById(target).style.display = displayOption === 'none' ? '' : 'none';
	
	if (displayOption === '') {
		document.getElementById(target + '-icon').className = "fas fa-angle-down";
	} else {
		document.getElementById(target + '-icon').className = "fas fa-angle-up";		
	}
}


//Create Auth Input
function authInput(target) {
	const authInfo = document.getElementById(target + '_input').value;
	const targetDiv = document.getElementById(target + '_div');
	
	// + 정보 일치여부 확인(ajax) > result(true or false)

	if(authInfo) {
		targetDiv.innerHTML = "<div>"
			+ "<div class='search_input_label'>인증번호"
			+ "<span class='red-mark'>*</span>&nbsp;"
			+ "<span class='search_input_sublabel'>"
			+ "입력하신 전화번호(혹은 이메일)로 인증번호가 발송됩니다."
			+ "</span></div>"
			+ "<input class='single_input' type='text' name='authCode' placeholder='인증번호를 적어주세요.' maxlength='6' />"
			+ "</div>";
		console.log('123');
	}
	else {
		alert("입력하신 내용이 일치하지 않습니다.\n다시 입력해주세요.")
	}
}

