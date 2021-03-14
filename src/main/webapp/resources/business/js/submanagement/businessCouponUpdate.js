// 쿠폰 등록
function couponEnrollment() {
	var enrollconfirm = confirm('새로운 쿠폰을 등록하시겠습니까?');
	
	if(enrollconfirm == false)
		return false;
	
	else {
		var beforevalue = document.querySelector('#beforeDate').value; 
		var aftervalue = document.querySelector('#afterDate').value; 
		var minimumvalue = document.querySelector('#minimumprice').value;
		var discountvalue = document.querySelector('#discount').value;
		var radioResult = document.querySelector('#enrollDiv input[type="radio"]:checked');
		var maxissuenum = 0;
		if(radioResult.id == 'limitedcoupon') {
			maxissuenum = document.getElementById('limitedcouponNum').value;
		}
		
// 			console.log('기간 : ', beforevalue + ' ~ ' + aftervalue);
		
		let ob={
				'period': beforevalue + ' ~ ' + aftervalue,
				'minimumprice': minimumvalue,
				'discount': discountvalue,
				'maxissuenum': maxissuenum,
		};
		
		
		const axPost = async (ob) => {   // async : 비동기 실행 함수
			await axios.post(getContextPath() + '/business/subManagement/businessCouponManagement/rest/add/' , ob)
			// 정상
			.then( (response) => {
				const data = response.data;
				couponlist = data;
				showCounpons();
			})
		}
		return axPost(ob);			
	}
}
	

// 쿠폰 삭제
function deleteCoupon(obj) {
	var deleteconfirm = confirm('정말로 쿠폰을 삭제하시겠습니까?');
	
	if(deleteconfirm == false)
		return false;
	else {
		console.log('coupon id : ', obj.id);
		let ob={
				'couponid': obj.id,
		};
		
		const axPost = async (ob) => {   // async : 비동기 실행 함수
			await axios.post(getContextPath() + '/business/subManagement/businessCouponManagement/rest/del/' , ob)
			// 정상
			.then( (response) => {
				const data = response.data;
				couponlist = data;
				showCounpons();
			})
		}
		return axPost(ob);		
	}
}