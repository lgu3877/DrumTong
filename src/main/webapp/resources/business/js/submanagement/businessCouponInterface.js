// 시작 날짜 값 입력시 마지막 날짜 input 활성화 
function activateEndDate() {
	if(this.value !== null) {
		document.getElementById('afterDate').readOnly = false;
	}
}

	
// 시작날짜 - 마지막날짜 검증(validation)
function dateValidation() {
	var beforeDate = new Date(document.getElementById('beforeDate').value);
	var afterDate = new Date(this.value);
			
	if(beforeDate > afterDate) {
		alert('만료기간이 시작기간보다 빠릅니다');
		this.value = '';
	}
}


//쿠폰발급 '선착순' 옵션 change 이벤트
function changeFirstInOutOption(inputSelf) {
	if (inputSelf.checked === true) {
		document.getElementById('limitedcouponNum').style.display = '';
	}
}


// 쿠폰발급 '무제한' 옵션 change 이벤트
function changeUnlimitedOption() {
	document.getElementById('limitedcouponNum').style.display = 'none';
	document.getElementById('limitedcouponNum').value = null;
}

	
// 쿠폰 렌더링(DB > GET > Listing)
function showCounpons() {
	var enrollmentedDiv = document.getElementById('enrollmentedDiv');
		enrollmentedDiv.innerHTML = "";		
	
	// 쿠폰 리스팅
	for(i = 0; i < couponlist.length; i++) {
		
		// values by ~
		const listsplit = (couponlist[i].period).split('~'); //	필수
		
		// main container 
		const container = document.createElement('div');
			container.className = 'container';
			
		// sub-container
		const inputFlex = document.createElement('div');
			inputFlex.className = 'inputFlex form';
		
		// left container
		const inputdivcontainer = document.createElement('div');
			inputdivcontainer.className = 'inputDivContainer';
		
		// date wrapper	
		const dateWrapper = document.createElement('div');
			dateWrapper.className = "mb-20";
		
		// date title
		const dateTitle = document.createElement('div');
			dateTitle.className = 'input_title';
			dateTitle.innerHTML = '기간';
		
		// date input container
		const dateInputCon = document.createElement('div');
			dateInputCon.style.display = "flex";
			
				// input container
//				var inputdiv = document.createElement('div');
//					inputdiv.className = 'inputDiv';
				
		// 시작일
		const beforedate = document.createElement('input');
			beforedate.setAttribute('type', 'date');
			beforedate.setAttribute('value', listsplit[0].slice(0,-1));	// 마지막 공백 한글자 제거			//	필수
			beforedate.readOnly = true;
		
		// date arrow (~)
		const arrow = document.createElement('div');
			arrow.className = "date_arrow";
			arrow.innerHTML = '~';
		
		const afterdate = document.createElement('input');
			afterdate.setAttribute('type', 'date');
			afterdate.setAttribute('value', listsplit[1].slice(1));	// 첫번째 공백 한글자 제거			//	필수
			afterdate.readOnly = true;
		
		// 최소주문금액 div
		const costWrapper = document.createElement('div');
			costWrapper.className = "mb-20";
		
			const costTitle = document.createElement('div');
				costTitle.className = "input_title";
				costTitle.innerText = "최소주문금액";
				
			const costInputCon = document.createElement('div');
				costInputCon.className = 'costDiv';
				
				const costInput = document.createElement('input');
					costInput.setAttribute('type', 'text');
					costInput.setAttribute('value', insertComma("" + couponlist[i].minimumprice) + "원"); // 콤마(,) 추가 & String 파싱
					costInput.readOnly = true;
			
			
		// 할인금액 div
		const discountWrapper = document.createElement('div');
			discountWrapper.className = "mb-20";
			
		const discountTitle = document.createElement('div');
			discountTitle.className = "input_title";
			discountTitle.innerText = "할인금액";
		
		const discountInputCon = document.createElement('div');
			discountInputCon.className = "costDiv";
		
			const discountInput = document.createElement('input');
				discountInput.setAttribute('type', 'text');
				
				discountInput.setAttribute('value', insertComma("" + couponlist[i].discount) + "원"); // 콤마(,) 추가 & String 파싱
				discountInput.readOnly = true;
			
		
		// 쿠폰 발급 옵션
		const optionWrapper = document.createElement('div');
			optionWrapper.className = "mb-20"; 	
				
		const optionTitle = document.createElement('div');
			optionTitle.className = "input_title";
			optionTitle.innerText = "발급옵션";
			
		const optionInputCon = document.createElement('div');
			optionInputCon.className = "d-flex";
		
		// 무제한 옵션
		const limitlessOptionCon = document.createElement('div');
			limitlessOptionCon.className = "radioDiv";
			
		const limitlessLabel = document.createElement('div');
			limitlessLabel.className = "radio_label";
			limitlessLabel.style.cursor = "auto";
			
		const limitlessRadio = document.createElement('input');
			limitlessRadio.setAttribute('type', 'radio');
			limitlessRadio.disabled = true;
		
			if (couponlist[i].maxissuenum == 0) {
				limitlessRadio.checked = true;
			}
		
		const limitlessLabelTag = document.createElement('span');
			limitlessLabelTag.className = 'fs-15';
			limitlessLabelTag.innerText = '무제한';
		
			
		// 선착순 옵션
		const limitOptionCon = document.createElement('div');
			limitOptionCon.className = 'radioDiv';
		
		const limitLabel = document.createElement('div');
			limitLabel.className = "radio_label";
			limitLabel.style.cursor = "auto";
		
		const limitRadio = document.createElement('input');
			limitRadio.setAttribute('type', 'radio');
			limitRadio.disabled = true;
		
//			let doesRemain = false;
			
			if (couponlist[i].maxissuenum !== 0) {
				limitRadio.checked = true;
				
//				doesRemain = true;

				const amountCon = document.createElement('input');
					amountCon.className = "radioDiv";
				
				const amountInput = document.createElement('input');
					amountInput.setAttribute('type', 'text');
					amountInput.value = couponlist[i].maxissuenum;
					amountInput.readOnly = true;
				
				amountCon.appendChild(amountInput);
				optionInputCon.appendChild(amountCon);
			}
		
		const limitLabelTag = document.createElement('span');
		limitLabelTag.className = 'fs-15';
		limitLabelTag.innerText = '선착순';
		
		
	// 삭제 버튼 생성 및 추가
		// container
		const deleteButtonCon = document.createElement('div');
			deleteButtonCon.className = 'sideinputDiv';
		
		// input button
		const deleteButton = document.createElement('input');
			deleteButton.className = "coupon_publish";
			deleteButton.setAttribute('type', 'button');
			deleteButton.setAttribute('value', '쿠폰삭제');
			deleteButton.setAttribute('id', couponlist[i].couponid);			//	필수
			deleteButton.setAttribute('onclick', 'deleteCoupon(this)');
		
		
	// appending
		// date
		dateInputCon.appendChild(beforedate);
		dateInputCon.appendChild(arrow);
		dateInputCon.appendChild(afterdate);
							
		dateWrapper.appendChild(dateTitle);
		dateWrapper.appendChild(dateInputCon);

		// service fee
		costInputCon.appendChild(costInput);

		costWrapper.appendChild(costTitle);
		costWrapper.appendChild(costInputCon);
		
		// discount cost
		discountInputCon.appendChild(discountInput);
		
		discountWrapper.appendChild(discountTitle);
		discountWrapper.appendChild(discountInputCon);
		
		// coupon option
		limitlessLabel.appendChild(limitlessRadio);
		limitlessLabel.appendChild(limitlessLabelTag);
		limitLabel.appendChild(limitRadio);
		limitLabel.appendChild(limitLabelTag);
		
		limitlessOptionCon.appendChild(limitlessLabel); // 무제한 옵션
		limitOptionCon.appendChild(limitLabel); // 선착순 옵션

		optionInputCon.appendChild(limitlessOptionCon);
		optionInputCon.appendChild(limitOptionCon);
		
		optionWrapper.appendChild(optionTitle);
		optionWrapper.appendChild(optionInputCon);
		
		// delete coupon button
		deleteButtonCon.appendChild(deleteButton);

		// formatting
		inputdivcontainer.appendChild(dateWrapper);
		inputdivcontainer.appendChild(discountWrapper);
		inputdivcontainer.appendChild(costWrapper);
		inputdivcontainer.appendChild(optionWrapper);

		inputFlex.appendChild(inputdivcontainer);
		inputFlex.appendChild(deleteButtonCon);
		container.appendChild(inputFlex);		
		enrollmentedDiv.appendChild(container);
	}
}
	

function costSlice(input) {
	const regexp = /^[0-9]*$/;
	
	console.log(input);

	if (!regexp.test(input.value)) {
		input.value = input.value.slice(0, -1); // 마지막 한글자만 잘라내기
	}
}
	
	