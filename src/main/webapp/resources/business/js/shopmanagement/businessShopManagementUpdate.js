// 사진 업데이트
async function updatePhoto() {
	const formData = new FormData();
	
	const coverImage = document.getElementById("update-cover");
	const photoInputs = document.getElementsByName("businessStoreImage");
	const fileList = [];
	
	
	
	// 이미지 저장 타입 
	formData.append("saveType", "businessStoreImage");
	
	// 대표 사진
	formData.append("delegatephotoboolean", coverImage.files[0]);
	
	
	
	// 사이드 이미지 리스트
	for (let i = 0; i < photoInputs.length; i++) {
		if (photoInputs[i].files[0] !== undefined) 
			formData.append("businessStoreImage", photoInputs[i].files[0]);
	}	

	// 삭제 사진
	for (let i = 0; i < deletePhotoList.length; i++) {
		formData.append("deleteUploadImage", deletePhotoList[i]);
	}

	
	const { data } = await axios.post(
		"/drumtong/business/mainmanagement/BImage/rest/updateStoreIMG/",formData
		,
		{
			headers: {
				"Content-Type": `multipart/form-data`,
			}, 
		}
	);
	
	console.log(data);
	
	if (data) {
		alert("사진이 성공정으로 수정되었습니다.");
	}
}


//매장 소개글 업데이트
//const initialText = document.getElementById("intro-text").innerText;
async function updateIntro() {
	
	const text = document.getElementById("intro-text").innerText;
	
	if (bManagement.introduction === text) {
		return alert("변경된 내용이 확인되지 않았습니다.");
	}
	
	const object = {
		"processing" : "updateIntroduction",
		"introduction" : text,
	}
	
	console.log('object', object.processing);
	console.log('introduction' , object.introduction);
	
	const { data } = await axios.post("/drumtong/business/mainmanagement/BManagement/rest/" + object.processing + "/", object);
	
	console.log(data);
}


// 서비스 등록 업데이트
async function addService() {
	const list = document.getElementsByClassName("single_item_selector");
	const object = [];
	const classPrefix = ["first", "second", "third", "forth", "fifth"]
	
	// 상품 등록
	for (let i = 0; i < list.length; i++) {
		let element = {}; // 상품 등록 객체
		// 상품 등록 속성 5개 > 객체 생성 (대분류, 중분류, 세부내용, 가격, 시간) + 배달
		for (let j = 0; j < classPrefix.length; j++) {
			const eachInput = list[i].getElementsByClassName(classPrefix[j] + '_item_prop')[0]; // select (2) & input (3) || direct (2)
			
			// select & direct input
			if (j === 0 || j === 1) {
				const select = eachInput.getElementsByTagName("select")[0];
				const direct = eachInput.getElementsByTagName("input")[0];
				
				// select 입력 검사
				if (select.value === "서비스 타입 선택" || select.value === "세부 서비스 유형 선택") {
					return alert("서비스 등록 과정에서 유형 및 타입을 선택하지 않으셨습니다.");
				}
				
				// 직접 입력 검사
				if (select.value === "selectedDirect" && direct.value === "") {
					alert("직접입력을 선택하셨지만 값이 입력되지 않았습니다.");
					return direct.focus();
				}
				
				// 객체 생성
				select.value !== "selectedDirect" ? 
					element[select.name] = select.value :
					element[select.name] = direct.value;
			}
			
			// text input
			else {
				// 두개 이상의 input이 있을 경우 > Ex) quick
				const input = eachInput.getElementsByTagName("input");
				
				for (let x = 0; x < input.length; x++) {
					if (!input[x].value) {
						alert("입력되지 않은 값이 있습니다.");
						return input[x].focus();
					}
					else {
						element[input[x].name] = input[x].value;
					}					
				}
			}
		}
		object.push(element);
		console.log(object);
	}
	
	// 퀵 서비스 옵션 설정
	activateDelivery();
	
	const processing = "insertBMenu";
	// 서비스 등록
	const { data } = await axios.post("/drumtong/business/mainmanagement/BMenu/rest/" + processing + "/", object);
	console.log(data);
}


// 퀵 서비스 활성화 < 서비스 등록
async function activateDelivery() {
//	activateVisualization(); // MenuList > 스위치 디자인 변경 & input 생성
	
	const result = deliveryToggle  ? "Y" : "N"; // js > MenuList

	console.log(result);

//	const { data } = await axios.post("/drumtong/business/mainmanagement/BManagement/rest/updateQuickBoolean/", result);
//	
//	console.log(data);
}


// 메뉴 수정
async function deleteMenu() {
	
//	const { data } = await axios.post("/drumtong/business/mainmanagement/BMenu/rest/updateBMenu/", result);
//	
//	console.log(data);
}


// 배달 업데이트
async function updateDelivery() {
	const checkOptions = document.getElementsByClassName("returnOptions");
	
	const output = [];
	for (let i = 0; i < checkOptions.length; i++) {
		checkOptions[i].checked ? output.push(checkOptions[i].value) : null;  
	}
	
	const deliveryOption = output.includes("AGENCIES") && output.includes("SELF") ? 
		"BOTH" : 
			output.includes("AGENCIES") && !output.includes("SELF") ? 
			"AGENCIES" : 
				!output.includes("AGENCIES") && output.includes("SELF") ?
				"SELF" : "VISIT";
	
	const result = {
		deliverytype: deliveryOption,
		deliveryboolean: deliveryOption === "VISIT" ? "N" : "Y" 
	}
	
	const { data } = await axios.post("/drumtong/business/mainmanagement/BManagement/rest/updateDeliveryBoolean/", result);
	console.log(data);
}


// 주소 업데이트
async function updateAddress() {
	const mainAddress = document.getElementById("main-address").value;
	const detailAddress = document.getElementById("detail-address").value;
	const emdCode = document.getElementById("town-code").value;
	
	const la = document.getElementById("latitude").value;
	const ma = document.getElementById("longitude").value;
	
	const address = mainAddress + detailAddress;
	
	const object = {
		"mainlocation" : mainAddress ,
		"detaillocation" : detailAddress,
		"latitude" : la,
		"longitude" : ma,
		"emdcode" : emdCode
	}
	await axios.post("/drumtong/business/mainmanagement/BInformation/rest/updateLocation/", object);
}

