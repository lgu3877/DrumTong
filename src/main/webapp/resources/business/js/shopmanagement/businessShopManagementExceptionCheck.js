// [건욱]


// 매장 사진 빈 값 || 데이터 형식 불일치 체크 함수
function exceptionCheckBImage() {
//	let coverImage = document.getElementById('cover-image-con');
//	let sideImage = document.getElementsByClassName('shop_picture');
//	let addPhoto = document.getElementsByClassName('add_photo_input');
//	
//	
//	let msg = "";
//	let idName = 'main-image-con';	
//	
//	console.log(addPhoto.length);
//	// 사진이 아예 등록되어 있지 않을 때
//	if(addPhoto.length < 3 ) {
//		msg = '사진이 등록되어 있지 않습니다. 고객들에게 보여줄 세탁소 사진들을 등록해주세요.';
//		
//		warning(msg, idName);
//		return false;
//	}
//	// 대표사진이 등록되어있지 않을 때
//	else if(coverImage === null) {
//		msg = '대표사진이 등록되어 있지 않습니다. 대표 사진을 등록해주세요.!';
//		warning(msg, idName);
//		
//		return false
//	}
//	// 사이드 이미지가 등록되어 있지 않을 때
//	else if(coverImage !== null && sideImage.length < 2 ) {
//		
//		msg = '대표사진 외에 사이드 사진들도 다양한 사진을 원하는 고객들을 위해 등록해주세요!';
//		warning(msg, idName);
//		
//		return false;
//	}
//	borderNone(idName);
//	
//	return true;
}

// 매장 소개글 예외 체크 함수
function exceptionCheckBIntroduction () {
	let introduction = document.getElementById('intro-modal-textarea');
	let msg = "";
	let idName = 'introductionArea';
	
	if(introduction.value === "" ) {
		msg = '빈 값을 허용 하지 않습니다. 해당 매장을 소개시켜줄 수 있는 소개글을 작성해주세요.';
		warning(msg, idName);
		return false;
	}
	
	return true;
	
}

// 주소 빈값 체크
function exceptionCheckBLocation() {
	let mainAddress = document.getElementById('main-address');
	let detailAddress = document.getElementById('detail-address');
	let idName = 'locationArea';
	
	if(mainAddress.value === "" || detailAddress.value === "") {
		let msg = '주소에 빈 값이 존재합니다. 매장의 주소를 정확하게 입력해주세요.';
		warning(msg, idName);
		return false;
	}
	
	return true;
		
}

// 배달지역 예외 체크
function exceptionCheckBDelieryAreas() {
	let checkedAreas = document.getElementById('delivery-area-view');
	let idName = 'delivery_area_set_wrapping';
	let accessDenined = document.getElementById('accessDenied');
	
	
	if(accessDenined.style.display === "none" && checkedAreas.children.length === 0){
		let msg = "배달 지역관리가 하나도 체크되어 있지 않습니다. 현재 매장에서 배달이 가능한 지역을 체크해주세요.";
		warning(msg,idName);
		
		const label = document.querySelectorAll("label");
		label.addEventListener("change", () => {
			borderNone(idName);
		});
		return false;
	}
	return true;
}


// 유저에게 잘못된 데이터 형식 혹은 빈 값을 넣었을 때 인지할 수 있게 해주는 함수입니다.
function warning(msg, idName) {
	document.getElementById(idName).style.border ='4px solid red';
	alert(msg);
	document.getElementById(idName).scrollIntoView();
}

// 경고 효과를 없애줍니다.
function borderNone(idName) {
	document.getElementById(idName).style.border = '0 none';
}


// POST 일 때 예외체크
function checkExceptionBeforeSubmit() {
	
	try {
		
		// 매장 사진 체크
		if(exceptionCheckBImage() === false) {
			return false;
		}
		// 매장 소개글 체크
		else if (exceptionCheckBIntroduction() === false) {
			return false;
		}
		// 매장 주소 체크
		else if (exceptionCheckBLocation() === false) {
			return false;
		}
		else if (exceptionCheckBDelieryAreas() === false) {
			return false;
		}
			
	} catch (e) {
		
	}
	
//	document.getElementById('theForm').submit();
	return true;
	
	
	
}

document.getElementById('detail-address').onkeypress = function() {
	if(document.getElementById('detail-address').value.length !== 0)
		borderNone('locationArea');
}
