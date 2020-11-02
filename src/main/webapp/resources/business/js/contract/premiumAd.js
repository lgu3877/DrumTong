// onkeypress(number only)
function checkNumber(e) {
	if(e.key >= 0 && e.key <= 9) return true;
	return false;
}

// onSubmit(regular expression & length check)
function checkForm() {
	const regularExpression = /[^0-9]/g;
	const errorMsgDiv = document.getElementById('auth-error-msg');
	
	// Card Company Check
	const cardCom = document.getElementById('card-company-select');
	if (cardCom.value === '등록하실 카드회사를 선택해주세요.') {
		errorMsgDiv.innerHTML = '<i class="fas fa-exclamation-circle"></i>카드사가 선택되지 않았습니다.';
		return false;
	}	
	
	// Card Number Check
	const cardNumCon = document.getElementById('cardNum-con');
	for (var i = 0; i < cardNumCon.children.length; i++) {
		if (regularExpression.test(cardNumCon.children[i].value)
				|| cardNumCon.children[i].value.length < 4) {
			
			errorMsgDiv.innerHTML = '<i class="fas fa-exclamation-circle"></i>잘못된 형식의 카드번호입니다.';
			cardNumCon.children[0].focus();
			cardNumCon.children[0].value = '';
			cardNumCon.children[1].value = '';
			cardNumCon.children[2].value = '';
			cardNumCon.children[3].value = '';
			return false;
		}
	}


	// Ex-date Check
	const cardYear = document.getElementById('cardDate-con').children[0];
	// Year
	if (regularExpression.test(cardYear.value)
			|| cardYear.value.length < 2) { 
		
		errorMsgDiv.innerHTML = '<i class="fas fa-exclamation-circle"></i>잘못된 형식의 연도입니다.';
		cardYear.value = '';
		cardYear.focus();
		return false;
	}
	// Month
	const cardMonth = document.getElementById('cardDate-con').children[1];
	if (parseInt(cardMonth.value) > 12
			|| cardMonth.value.length < 2
			|| regularExpression.test(cardMonth.value)) { 
		
		errorMsgDiv.innerHTML = '<i class="fas fa-exclamation-circle"></i>잘못된 형식의 월입니다.';
		cardMonth.value = '';
		cardMonth.focus();
		return false;
	}
	
	
	// CCV Check
	const CcvNum = document.getElementById('cardCcv-con').children[0];
	if (CcvNum.value.length < 3
			|| regularExpression.test(CcvNum.value)) {
		
		errorMsgDiv.innerHTML = '<i class="fas fa-exclamation-circle"></i>잘못된 형식의 CCV번호 입니다.';
		CcvNum.value = '';
		CcvNum.focus();
		return false;
	}

	return true;
}
