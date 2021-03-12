// 카드정보 변경 요청
function cardSubmit(obj) {
	let cardConfirm = confirm('정말로 카드번호를 변경하시겠습니까?');
	if (cardConfirm == false) return // 요청거절 > 실행취소
	
	let exit = true;
	let cardnumsum = '';
	
	// 카드번호
	$('#carddiv1').find('input').each(function(index, item) {	// index : 반복문의 i처럼 생각해라 // item : for in 처럼
		cardnumsum += $(item).val();
		if(index < 3)
			cardnumsum += '-';
		
		if(($(item).val()).length < 4) {
			alert('카드번호를 전부 채워주시길 바랍니다');
			exit = false;
			return false;
		}
	})
	
	// 카드만료일
	$('#carddiv2').find('input').each(function(index, item) {
		if($(item).val().length < $(item).attr('maxLength')) {
			exit = false;
		}
	})	
	
	// CCV
	$('#carddiv3').find('input').each(function(index, item) {
		if($(item).val().length < $(item).attr('maxLength')) {
			exit = false;
		}
	})
	
	
	if(!exit) return;
	
	// object
	let ob={
			'cardbank' : $('#cardbanksel').val(),
			'cardnum' : cardnumsum,
			'cardyear' : $('#cardyear').val(),
			'cardmonth' : $('#cardmonth').val(),
			'cardcvc' : $('#cardcvc').val(),
	};
	
	// axios post request
	const axPost = async (ob) => {  
		await axios.post(getContextPath() + '/business/subManagement/BPayment/rest/updateCard/' , ob)
		// success
		.then( (response) => {
			const data = response.data;
			
			if (data == false) {
				return false;
			}
			else {
				$('#carddiv').find('select').css('border', '');
				$('#carddiv').find('input').css('backgroundColor', '#adb8c0');
				$('#carddiv').find('input').css('border', '');
				obj.setAttribute('onclick', 'cardChange(this)');
				obj.innerHTML = '변경';
				$('#cardbank').css('display', '');
				$('#cardbank').html($('#cardbanksel option:selected').val());
				$('#cardbanksel').css('display', 'none');
			}
		})
	}
	return axPost(ob);			
}


// 계좌정보 변경 요청
function accountSubmit(obj) {
	let acConfirm = confirm('정말로 계좌번호를 변경하시겠습니까?');
	if (acConfirm == false) return; // 요청거절 > 실행취소
	
	let ob={
			'accountbank' : $('#accountbanksel option:selected').val(),
			'accountnum' : $('#accountdiv').find('input').val(),
	};
	
	const axPost = async (ob) => {   // async : 비동기 실행 함수
		await axios.post(getContextPath() + '/business/subManagement/BPayment/rest/updateAccount/' , ob)
		// 정상
		.then( (response) => {
			const data = response.data;
			
			if (data == false) {
				return false;
			}
			else {
				$('#accountdiv').find('select').css('border', '');
				$('#accountdiv').find('input').css('backgroundColor', '#adb8c0');
				$('#accountdiv').find('input').css('border', '');
				obj.setAttribute('onclick', 'accountChange(this)');
				obj.innerHTML = '변경';
				
				$('#accountbank').css('display', '');
				$('#accountbank').html($('#accountbanksel option:selected').val());
				$('#accountbanksel').css('display', 'none');
			}
		})
	}
	return axPost(ob);			
}