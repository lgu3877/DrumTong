// 회원 로그인 > 뷰

// 쿠폰 
function oneCouponSettings(minimumprice, discount, period, couponid){ // 내 쿠폰을 현재 결제
	myCouponList = document.getElementById('select-coupon');
	newCoupon = document.createElement('option');
	newCoupon.setAttribute('value', couponid);
	
	newCoupon.innerHTML = '<span><span>' + discount + '</span><span>원 할인/</span><span>' + minimumprice + '</span><span>원 이상[</span><span>' + period + '</span><span>]</span></span>';
	
	myCouponList.appendChild(newCoupon);
}


// 내 쿠폰
function myCouponSettings (myCoupons){
	document.getElementById('select-coupon').removeChild(document.getElementById('noLogin'));
	myCoupons.forEach(co => {
		oneCouponSettings(co.minimumprice, co.discount, co.period, co.couponid);
	})
}


// 북마크 표기
function addBookmark(estid) {
	bookMarker = document.getElementById('bookMarker');
	className = bookMarker.className;
	if (className.search(/add/) > 0) {
		bookMarker.className = 'fas fa-star remove';
		iconColor = 'white';
	}
	else if (className.search(/remove/) > 0) {
		bookMarker.className = 'fas fa-star add';
		iconColor = 'yellow';
	}
	
	const axPost = async (estid) => {
		ob = {
			'estid' : estid,
			'result' : iconColor,
		};
		
		await axios.post(getContextPath() + '/customer/laundry/customerDetail/rest/addBookmark/', ob)
		.then ((response) => {
			if(response.data === true){
				console.log("추가함");
			} else {
				console.log("삭제함");
			}
		})
		
	};
	axPost(estid);
}