// [건욱]


// 매장 사진 빈 값 || 데이터 형식 불일치 체크 함수
function exceptionCheckBImage() {
	let coverImage = document.getElementById('cover-image-con');
	let sideImage = document.getElementsByClassName('shop_picture');
	let addPhoto = document.getElementsByClassName('add_photo_input');
	
	console.log("@@@@@", coverImage);
	
	let idName = 'main-image-con';	
	
	// 대표사진이 등록되어있지 않을 때
	if(coverImage === null) {
		let msg = '대표사진 한 장은 반드시 등록되어 있어야 합니다. 대표 사진을 등록해주세요.!';
		warning(msg, idName, true);
		
		return false
	}
	borderNone(idName);
	
	return true;
}

// 매장 소개글 예외 체크 함수
function exceptionCheckBIntroduction () {
	let introduction = document.getElementById('intro-modal-textarea');
	let msg = "";
	let idName = 'introductionArea';
	
	if(introduction.value === "" ) {
		msg = '빈 값을 허용 하지 않습니다. 해당 매장을 소개시켜줄 수 있는 소개글을 작성해주세요.';
		warning(msg, idName, true);
		return false;
	}
	
	return true;
	
}

function exceptionCheckBMenuList() {
	
	const list = document.getElementsByClassName("single_item_selector");
	const classPrefix = ["first", "second", "third", "forth", "fifth"]
	const addServiceFocus = 'addService';
	let msg = "";
	for (let i = 0; i < list.length; i++) {
		for (let j = 0; j < classPrefix.length; j++) {
			const eachInput = list[i].getElementsByClassName(classPrefix[j] + '_item_prop')[0]; // select (2) & input (3) || direct (2)
			console.log('eachInput', eachInput);
			if (j === 0 || j === 1) {
				const select = eachInput.getElementsByTagName("select")[0];
				const direct = eachInput.getElementsByTagName("input")[0];
				// select 입력 검사
				if (select.value === "서비스 타입 선택" || select.value === "세부 서비스 선택") {
					msg = "서비스 등록 과정에서 유형 및 타입을 선택하지 않으셨습니다.";
					console.log('test');
					warning(msg, addServiceFocus, false);
					return false;
				}
				
				// 직접 입력 검사
				if (select.value === "selectedDirect" && direct.value === "") {
					msg = "직접입력을 선택하셨지만 값이 입력되지 않았습니다.";
					warning(msg, addServiceFocus, false);
					console.log('test');
					
					return false;
				}
			}
			else {
				const input = eachInput.querySelectorAll('input');
				
				for(let x = 0; x < input.length; x++){
					let thisInput = input[x];
					var regex= /^[0-9]/g;
					console.log('invalid display :', thisInput);
					if (!thisInput.value) {
						alert("입력되지 않은 값이 있습니다.");
						thisInput.focus();
						return false;
					} else if((j === 3 || j === 4) && !regex.test(thisInput.value)){
						alert("해당 입력칸은 숫자만 입력가능합니다. 다시 변경 해주세요.");
						thisInput.focus();
						return false;
					}
					
						
				}
			}
		}
	}

}

// 배달지역 예외 체크
function exceptionCheckBDelieryAreas() {
	let checkedAreas = document.getElementById('delivery-area-view');
	let idName = 'delivery_area_set_wrapping';
	let accessDenined = document.getElementById('accessDenied');
	
	
	if(accessDenined.style.display === "none" && checkedAreas.children.length === 0){
		let msg = "배달 지역관리가 하나도 체크되어 있지 않습니다. 현재 매장에서 배달이 가능한 지역을 체크해주세요.";
		warning(msg,idName, true);
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
		warning(msg, idName, true);
		return false;
	}
	
	return true;
		
}





// 유저에게 잘못된 데이터 형식 혹은 빈 값을 넣었을 때 인지할 수 있게 해주는 함수입니다.
function warning(msg, idName, wantBorder) {
	document.getElementById(idName).style.border = wantBorder ? '4px solid red'  : "";
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
		else if (exceptionCheckBMenuList() === false) {
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
		alert("비정상적인 오류가 작동했습니다. 다시 시도해주세요!");
		window.location.reload();
		return false;
	}
	
	document.getElementById('theForm').submit();
	return true;
	
	
	
}

document.getElementById('detail-address').onkeypress = function() {
	if(document.getElementById('detail-address').value.length !== 0)
		borderNone('locationArea');
}
