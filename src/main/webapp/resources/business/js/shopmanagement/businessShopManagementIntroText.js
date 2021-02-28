// 초기실행
displayText();

// bManagement > introduction 가져오기 > 소개글 자동완성
function displayText() {
	if (bManagement && bManagement.introduction) {
		document.getElementById("intro-text").innerText = bManagement.introduction === '-' ? "" : bManagement.introduction; 
	}
	
	document.getElementById("intro-modal-textarea").innerText
		= document.getElementById("intro-text").innerText;
}

// 모달 열기	
function openIntroModal() {
	 document.getElementById('intro-modal').style.display = "block";	
}

// 모달 닫기 (X 클릭)
function closeIntroModal() {
	 document.getElementById('intro-modal').style.display = "none";
}

// 모달 닫기 (모달 밖 클릭)
window.onclick = function(e) {
    if (e.target ==  document.getElementById('intro-modal')) {
    	 document.getElementById('intro-modal').style.display = "none";
    }
}

// 소개글 작성 완료
function comfirmIntro() {
	const modalText = document.getElementsByClassName('store_intro_input')[0];
	const mainText = document.getElementsByClassName('shop_text_view')[0];
	const textValue = document.getElementById('intro-modal-textarea');
	
	const answer = confirm("작성한 메세지를 반영하시겠습니까?");
	
	console.log(textValue.value.length);
	if(textValue.value.length !== 0)
		borderNone('introductionArea');
		
	if (!answer) {
		modalText.value = '';
	}
	else {
		mainText.innerHTML = modalText.value;
		 document.getElementById('intro-modal').style.display = '';	
	}
}
