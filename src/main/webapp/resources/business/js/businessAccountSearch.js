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


// radio input selected
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


// Search Option Selectors
function openForm(target) {
	const displayOption = document.getElementById(target).style.display;
	document.getElementById(target).style.display = displayOption === 'none' ? '' : 'none';
	
	if (displayOption === '') {
		document.getElementById(target + '-icon').className = "fas fa-angle-down";
	} else {
		document.getElementById(target + '-icon').className = "fas fa-angle-up";		
	}
}

function afterSendAuth(target, targetDiv, number){	// number : 인증번호
	targetDiv.innerHTML = "<div>"
		+ "<div class='search_input_label'>인증번호"
		+ "<span class='red-mark'>*</span>&nbsp;"
		+ "<span class='search_input_sublabel'>"
		+ "입력하신 전화번호(혹은 이메일)로 인증번호가 발송됩니다."
		+ "</span></div>"
		+ "<input class='single_input' value='' id='"+target+"_yours' type='text' name='authCode' placeholder='인증번호를 적어주세요.' maxlength='6' />"
		+ "</div>";
	// submit 버튼도 활성화 되고 인증번호와 입력한 값을 비교해서 일치하면 페이지 이동, 일치하지 않으면 중지
	confirmButton = document.getElementById(target + '_confirm');
	confirmButton.disabled='';
	confirmButton.onclick = function (){
//		console.log(target + "_yours");
		yours = document.getElementById(target + "_yours");
//		console.log(yours);
		if(yours.value == number){
			((this.parentNode).parentNode).submit();
		}else {
			alert('인증에 실패하였습니다.');
		}
	};
	
}

// Create Auth Input
function authInput(target) {
	const authInfo = document.getElementById(target + '_input').value;
	const targetDiv = document.getElementById(target + '_div');
	const parentName = (target === 'auth_phone' ? 'PwPhone-search' : 'PwEmail-search');
	const object = document.getElementById(parentName).querySelectorAll("input[type='text']");
	console.log(object);
	
	
	
	// + 정보 일치여부 확인(ajax) > result(true or false)
	  var axPost = async (object) => {
		let ob;
		if(parentName === 'PwPhone-search'){
//			console.log(object[0].value);
//			console.log(object[1].value);
//			console.log(object[2].value);
			ob={
					'id':object[0].value,
					'name':object[1].value,
					'phonenum':object[2].value,
			};
		} else{
			console.log(object[0].value);
			console.log(object[1].value);
			ob={
					'id':object[0].value,
					'email':object[1].value,
			};
		}
	    await axios.post(getContextPath() + "/business/membership/businessAccountFind/rest/userCheck/", ob)
	
	    .then( (response) => {
	      if(response.data !== -1){
// 계정이 일치한다면 이 함수를 실행합니당(영경)
//	    	console.log('이 텍스트는 resources/business/js/businessAccountSearch.js 의 authInput 함수 내에 있음');
//	    	console.log('인증번호는 ', response.data);
	    	afterSendAuth(target, targetDiv, response.data);
	      } else{
	        alert("입력하신 내용이 일치하지 않습니다.\n다시 입력해주세요.");
	      }
	    })
	  }
	axPost(object);	
	  
}

// Phone Number syntax
function phoneNumCheck(accountSearchType) {
	const phoneSyntax = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
	const errorMessage = "잘못된 전화번호 형식입니다.";
	const phoneNum = document.getElementById(accountSearchType);

	console.log(phoneNum.value);

	if (!regularSyntaxCheck(phoneSyntax, phoneNum, errorMessage)) {
		return false;
	}
	return true;
}

function regularSyntaxCheck(expression, target, message) {
	if (expression.test(target.value)) {
		return true;
	}
	document.getElementById(target.id + '-error').innerHTML = "<b>" + message + "</b>";
	target.value = "";
	target.focus();
	return false;
}