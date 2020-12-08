// confirm writing intro
function comfirmIntro() {
	const modalText = document.getElementsByClassName('store_intro_input')[0];
	const mainText = document.getElementsByClassName('shop_text_view')[0];
	const answer = confirm("작성한 메세지를 반영하시겠습니까?");
	if (!answer) {
		modalText.value = '';
	}
	else {
		mainText.innerHTML = modalText.value;
		introModal.style.display = '';	
	}
}
