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
		const dateTitle = document.createElement('div');
			dateTitle.style.display = "flex";
			
				// input container
				var inputdiv = document.createElement('div');
					inputdiv.className = 'inputDiv';
				
				// split values by ~
				var listsplit = (couponlist[i].period).split('~'); //	필수
				
		// 시작일
		const beforedate = document.createElement('input');
			beforedate.setAttribute('type', 'date');
			beforedate.setAttribute('value', listsplit[0].slice(0,-1));	// 마지막 공백 한글자 제거			//	필수
			beforedate.readOnly = true;
		
		// date arrow (~)
		const arrow = document.createElement('div');
			arrow.className = "date_arrow";
			arrow.innerHTML = '~';
		
		var afterdate = document.createElement('input');
			afterdate.setAttribute('type', 'date');
			afterdate.setAttribute('value', listsplit[1].slice(1));	// 첫번째 공백 한글자 제거			//	필수
			afterdate.readOnly = true;
		
		// appending
		
		
		
		// 최소주문금액 div
		var costdiv1 = document.createElement('div');
		costdiv1.className = 'costDiv';
		var minh1 = document.createElement('h1');
		minh1.innerHTML = '최소주문금액';
		var mininput = document.createElement('input');
		mininput.setAttribute('type', 'text');
		mininput.setAttribute('value', couponlist[i].minimumprice);			//	필수
		mininput.readOnly = true;
		costdiv1.appendChild(minh1);
		costdiv1.appendChild(mininput);
		inputdiv.appendChild(costdiv1);
		
		
		
		// 할인금액 div
		var costdiv2 = document.createElement('div');
		costdiv2.className = 'costDiv';
		var minh2 = document.createElement('h1');
		minh2.innerHTML = '할인금액';
		var saleinput = document.createElement('input');
		saleinput.setAttribute('type', 'text');
		saleinput.setAttribute('value', couponlist[i].discount);			//	필수
		saleinput.readOnly = true;
			costdiv2.appendChild(minh2);
			costdiv2.appendChild(saleinput);
			inputdiv.appendChild(costdiv2);
		
		
		
		// 무제한 버튼
		var radiodiv1 = document.createElement('div');
		radiodiv1.className = 'radioDiv';
		var radio1 = document.createElement('input');
		radio1.setAttribute('type', 'radio');
		radio1.disabled = true;
		if (couponlist[i].maxissuenum == 0) {
			radio1.checked = true;
		}
		var radioname1 = document.createElement('h1');
		radioname1.innerHTML = '무제한';
		
			radiodiv1.appendChild(radio1);
			radiodiv1.appendChild(radioname1);
			inputdiv.appendChild(radiodiv1);
			
		
		
		// 선착순 버튼
		var radiodiv2 = document.createElement('div');
		radiodiv2.className = 'radioDiv';
		var radio2 = document.createElement('input');
		radio2.setAttribute('type', 'radio');
		radio2.disabled = true;
		
		var radioname2 = document.createElement('h1');
		radioname2.innerHTML = '선착순';
		radiodiv2.appendChild(radio2);
		radiodiv2.appendChild(radioname2);
		if (couponlist[i].maxissuenum !== 0) { // 필수
			radio2.checked = true;
			var showcouponnum = document.createElement('input');
			showcouponnum.setAttribute('type', 'text');
			showcouponnum.value = couponlist[i].maxissuenum; // 필수
			showcouponnum.readOnly = true;
			radiodiv2.appendChild(showcouponnum);
		}
		
		
			inputdiv.appendChild(radiodiv2);
			inputdivcontainer.appendChild(inputdiv);
			inputFlex.appendChild(inputdivcontainer);
		
		
	// 삭제 버튼 생성 및 추가
		// container
		var sideinputDiv = document.createElement('div');
			sideinputDiv.className = 'sideinputDiv';
		
		// input button
		var deleteButton = document.createElement('input');
			deleteButton.className = "coupon_publish";
			deleteButton.setAttribute('type', 'button');
			deleteButton.setAttribute('value', '쿠폰삭제');
			deleteButton.setAttribute('id', couponlist[i].couponid);			//	필수
			deleteButton.setAttribute('onclick', 'deleteCoupon(this)');
		
		// appending
		sideinputDiv.appendChild(deleteButton);
		inputFlex.appendChild(sideinputDiv);
		container.appendChild(inputFlex);
		enrollmentedDiv.appendChild(container);
	}
}
	

// 
function costSlice() {
	var regexp = /^[0-9]*$/
		if(!regexp.test(this.value)) {
			this.value = this.value.slice(0,-1);		// 마지막 한글자만 잘라내기
		}
}
	
	