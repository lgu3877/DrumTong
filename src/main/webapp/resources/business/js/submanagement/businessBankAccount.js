// 계좌번호 주입 (Get Method > Data Load)
function inputAccountNumber() {
	let accountinput = $('#accountdiv').find('input');
	accountinput.val(paymentList.accountnum);
}
	
// 계좌번호 번호 폼 활성화 ( disable > activate )
function accountChange(obj) {
	accountclone = $('#accountdiv').find('input').clone();
	
//	$('#accountdiv').find('select').css('border', '3px solid #3088F9');
	$('#accountdiv').find('input').removeAttr('readonly');
	$('#accountdiv').find('input').css('backgroundColor', 'white');
	$('#accountdiv').find('input').css('border', '3px solid #3088F9');
	obj.setAttribute('onclick', 'accountSubmit(this)');
	obj.innerHTML = '전송';
	$('#accountdiv').find('input').val('');
	
	$('#accountbank').css('display', 'none');
	$('#accountbanksel').css('display', '');
}