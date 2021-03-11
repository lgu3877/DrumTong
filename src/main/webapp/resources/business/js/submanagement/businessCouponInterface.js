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
	enrollmentedDiv.innerHTML = null;		
	
	for(i = 0; i < couponlist.length; i++) {
		
		var container = document.createElement('div');
		container.className = 'container';
		var inputFlex = document.createElement('div');
		inputFlex.className = 'inputFlex';
		var inputdivcontainer = document.createElement('div');
		inputdivcontainer.className = 'inputDivContainer';
		var inputdiv = document.createElement('div');
		inputdiv.className = 'inputDiv';
		
		var listsplit = (couponlist[i].period).split('~');			//	필수
		
		// 날짜 div
		var period = document.createElement('h1');
		period.innerHTML = '기간';
		var beforedate = document.createElement('input');
		beforedate.setAttribute('type', 'date');
		beforedate.setAttribute('value', listsplit[0].slice(0,-1));	// 마지막 공백 한글자 제거			//	필수
		beforedate.readOnly = true;
		var tagh1 = document.createElement('h1');
		tagh1.style.width = '20px';
		tagh1.style.display = 'inline-block';
		tagh1.style.textAlign = 'center';
		tagh1.innerHTML = '-';
		var afterdate = document.createElement('input');
		afterdate.setAttribute('type', 'date');
		afterdate.setAttribute('value', listsplit[1].slice(1));	// 첫번째 공백 한글자 제거			//	필수
		afterdate.readOnly = true;
		inputdiv.appendChild(period);
		inputdiv.appendChild(beforedate);
		inputdiv.appendChild(tagh1);
		inputdiv.appendChild(afterdate);
		
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
		if(couponlist[i].maxissuenum == 0) {
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
		if(couponlist[i].maxissuenum !== 0) {			//	필수
			radio2.checked = true;
			var showcouponnum = document.createElement('input');
			showcouponnum.setAttribute('type', 'text');
			showcouponnum.value = couponlist[i].maxissuenum;			//	필수
			showcouponnum.readOnly = true;
			radiodiv2.appendChild(showcouponnum);
		}
		inputdiv.appendChild(radiodiv2);
		
		var bottombg1 = document.createElement('div');
		bottombg1.className = 'bottombg1';
		var topbg1 = document.createElement('div');
		topbg1.className = 'topbg1';
		inputdiv.appendChild(bottombg1);
		inputdiv.appendChild(topbg1);
		
		inputdivcontainer.appendChild(inputdiv);
		inputFlex.appendChild(inputdivcontainer);
		
		var sideinputDiv = document.createElement('div');
		sideinputDiv.className = 'sideinputDiv';
		var sidedivborder = document.createElement('div');
		sidedivborder.className = 'sidedivborder';
		var buttonDiv = document.createElement('div');
		buttonDiv.className = 'buttonDiv';
		var deleteButton = document.createElement('input');
		deleteButton.setAttribute('type', 'button');
		deleteButton.setAttribute('value', '삭제');
		deleteButton.setAttribute('id', couponlist[i].couponid);			//	필수
		deleteButton.setAttribute('onclick', 'deleteCoupon(this)');
		buttonDiv.appendChild(deleteButton);
		sidedivborder.appendChild(buttonDiv);
		
		var black1 = document.createElement('div');
		black1.className = 'sideCircle-black';
		black1.style.top = '-2px';
		sidedivborder.appendChild(black1);
		var black2 = document.createElement('div');
		black2.className = 'sideCircle-black';
		black2.style.top = '78px';
		sidedivborder.appendChild(black2);
		var black3 = document.createElement('div');
		black3.className = 'sideCircle-black';
		black3.style.top = '158px';
		sidedivborder.appendChild(black3);
		var black4 = document.createElement('div');
		black4.className = 'sideCircle-black';
		black4.style.top = '238px';
		sidedivborder.appendChild(black4);
		
		var white1 = document.createElement('div');
		white1.className = 'sideCIrcle-white';
		white1.style.top = '-1px';
		sidedivborder.appendChild(white1);
		var white2 = document.createElement('div');
		white2.className = 'sideCIrcle-white';
		white2.style.top = '79px';
		sidedivborder.appendChild(white2);
		var white3 = document.createElement('div');
		white3.className = 'sideCIrcle-white';
		white3.style.top = '159px';
		sidedivborder.appendChild(white3);
		var white4 = document.createElement('div');
		white4.className = 'sideCIrcle-white';
		white4.style.top = '239px';
		sidedivborder.appendChild(white4);
		
		var sidehr = document.createElement('div');
		sidehr.className = 'side-hr';	
		var bottombg2 = document.createElement('div');
		bottombg2.className = 'bottombg2';
		var topbg2 = document.createElement('div');
		topbg2.className = 'topbg2';
		sidedivborder.appendChild(sidehr);
		sidedivborder.appendChild(bottombg2);
		sidedivborder.appendChild(topbg2);
		
		
		sideinputDiv.appendChild(sidedivborder);
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
	
	