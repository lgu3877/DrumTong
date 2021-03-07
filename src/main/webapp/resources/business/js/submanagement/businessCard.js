function inputcardnum() {	// 카드번호를 input에 넣는 함수
	let carddiv1 = $('#carddiv1');
	let carddiv2 = $('#carddiv2').children('input');
	let cardnum = (paymentList.cardnum).split('-');
	for (i = 0; i < carddiv1.children().length; i++) {
		carddiv1.children().eq(i).val(cardnum[i]);
	}
	carddiv2.eq(0).val(paymentList.cardyear);
	carddiv2.eq(1).val(paymentList.cardmonth);
	carddiv2.eq(2).val(paymentList.cardcvc);
}
	
	
	
function cardChange(obj) {		// 카드번호 변경 폼 활성화
	cardclone = $('#carddiv').find('input').clone();
	
	$('#carddiv').find('select').css('border', '3px solid #3088F9');
	$('#carddiv').find('input').removeAttr('readonly');
	$('#carddiv').find('input').css('backgroundColor', 'white');
	$('#carddiv').find('input').css('border', '3px solid #3088F9');
	obj.setAttribute('onclick', 'cardSubmit(this)');
	obj.innerHTML = '전송';
	$('#carddiv').find('input').val('');
	
	$('#cardbank').css('display', 'none');
	$('#cardbanksel').css('display', '');
}
	
	
	
function inputnumck(obj) {	// 카드번호 숫자만 입력될 수 있도록 'onkeyup'
	numck(obj);
	if(obj.value.length > 3) {
		obj.nextElementSibling.focus();
	}
}