// Payment Submit
async function submit() {
	// 동의 (true & false)
	const checkAgree = () => {
		let radio = document.getElementById('agree');
		
		if( !radio.checked ) return alert('약관에 동의를 체크해주세요');
		else return true;
	}
	
	// 
	let request = {};

	const resultList = orderListSettings(); // 주문 내역
	request.detailSales = resultList[0];
	
	const couponBox = selectedCouponCheck();
	const couponID = couponBox[0];
	const couponPrice = couponBox[1];
	
	request['couponID'] = couponID;
	request['estid'] = estid;
	request['sales'] = salesSettings(resultList[1], resultList[2], couponPrice);	// total 가격에 배송, 수거 요금도 추가해야함!!

	
//	request.detailSales = orderListSettings()[0];
//	request.couponID = selectedCouponCheck()[0];
//	request.estid = estid;
//	request.sales = salesSettings(resultList[1], resultList[2], selectedCouponCheck()[1]);	// total 가격에 배송, 수거 요금도 추가해야함!!

	
	// 수거, 배송 체크, 쿠폰 사용, 희망날짜
	
	const {data} = await axios.post(getContextPath() + '/customer/laundry/customerDetail/rest/submit/', request);
	
	alert(data ? '정상 처리 되었습니다.' : '정상 처리 되지 않았습니다.');
	location.href = getContextPath()  + '/customer/account/customerOrderList/';
} 






function orderListSettings() {
	selecteds = document.querySelectorAll('.selected-row');
	orderMap = new Array();
	let totalprice = 0;
	let totalamount = 0;
	
	for (i = 0; i < selecteds.length; i++) {
		let oneSelect = selecteds[i];
		optionKey_1 = oneSelect.firstChild.children[0].innerText.split('/');
		optionKey_2 = oneSelect.firstChild.children[1].innerText.split('/');
		optionKey_3 = parseInt(oneSelect.children[1].value);
		optionKey_4 = parseInt(oneSelect.children[2].innerText.split('원')[0]);
		quickCheck = oneSelect.children[3].children[0];
		optionKey_5 = parseInt(quickCheck.checked ? quickCheck.value : '0');
		sumprice = (optionKey_4 + optionKey_5) * optionKey_3;
		
		totalprice += sumprice;
		totalamount += optionKey_3;
		
		order = {
				estid : estid,
				maincategory : optionKey_1[0],
				subcategory : optionKey_1[1],
				name : optionKey_2[0],
				amount : optionKey_3,
				menuprice : optionKey_4,
				sumprice : sumprice,
				quickprice : optionKey_5,
		};
		orderMap.push(order);
		
	}
	resultArray = new Array();
	resultArray.push(orderMap);
	resultArray.push(totalprice);
	resultArray.push(totalamount);
	return resultArray;
}




function salesSettings(originalpriceParam, totalamountParam, couponParam){
	checkList = checkfunc();
	let originalprice = originalpriceParam + checkList[2];
	let collectionboolean = checkList[0];
	let deliveryboolean = checkList[1];
	let collectionrequests = document.getElementById('collectionRequests').value;
	let laundryrequests = document.getElementById('laundryRequests').value;
	let deliveryrequests = document.getElementById('deliveryRequests').value;
	let dateInputBox = document.getElementById('select-date-area');
	let deliverydate = dateInputBox.children[0].children[1].value;
	let collectiondate = dateInputBox.children[1].children[1].value;
	
	deliverydate = deliverydate==='' ? '-' : deliverydate;
	collectiondate = collectiondate==='' ? '-' : collectiondate;
	
	sales = {
			estid : estid,
			totalamount : totalamountParam,
			originalprice : originalprice, 
			discountprice : couponParam,
			totalprice : originalprice - couponParam,
			deliverydate : deliverydate,
			collectiondate : collectiondate,
			collectionboolean : collectionboolean,
			deliveryboolean : deliveryboolean,
			collectionrequests : collectionrequests,
			laundryrequests : laundryrequests,
			deliveryrequests : deliveryrequests,
	}
	return sales;
}





function checkfunc(){
	let resultArray = new Array();
	collectionboolean = document.querySelectorAll('.select-pickup input[name="pickup-check"]')[0].checked;
	deliveryboolean = document.querySelectorAll('.select-deli input[name="deli-check"]')[0].checked;
	price = (collectionboolean ? 0 : 1000) + (deliveryboolean ? 0 : 1000);
	resultArray.push(collectionboolean ? 'VISIT' : 'COLLECTION');
	resultArray.push(deliveryboolean ? 'VISIT' : 'DELIVERY');
	resultArray.push(price);
	return resultArray;
}





function selectedCouponCheck(){
	let resultCouponList = new Array();
	let couponBox = document.querySelectorAll('#select-coupon option');
	let couponId = document.getElementById('select-coupon').value;
	let couponPrice = 0;
	if(couponId !== 'noCoupon')
		couponBox.forEach((co) => {if(co.value === couponId) couponPrice = parseInt(co.children[0].children[0].innerHTML);});
	resultCouponList.push(couponId);
	resultCouponList.push(couponPrice);
	return resultCouponList;
}