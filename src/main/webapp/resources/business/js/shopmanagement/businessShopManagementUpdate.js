// 사진 업데이트
async function updatePhoto() {
	
	// 예외가 발생하면 false를 해준다.
	if(exceptionCheckBImage() === false)
		return false;
	
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
		getContextPath() + "/business/mainmanagement/BImage/rest/updateStoreIMG/",formData
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
	
	return data;
}


//매장 소개글 업데이트
//const initialText = document.getElementById("intro-text").innerText;
async function updateIntro() {
	
	if(exceptionCheckBIntroduction() === false )
		return false;
	
	
	
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
	
	const { data } = await axios.post(getContextPath() + "/business/mainmanagement/BManagement/rest/" + object.processing + "/", object);
	
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
				console.log(select);
				
				// select 입력 검사
				if (select.value === "서비스 타입 선택" || select.value === "세부 서비스 선택") {
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
//	activateDelivery();
//	activateQuick();
	
	
	const processing = "insertBMenu";
	// 서비스 등록 [건욱]
	
	try{
		const { data } = await axios.post(getContextPath() + "/business/mainmanagement/BMenu/rest/" + processing + "/", object);
		
		// 메뉴 등록을 초기화시켜주고
		cleanAddService();
		
		// 기본 인풋을 추가시켜줍니다.
		createAddService();
		
		// 수정된 데이터를 bMenu에 반영시켜주니다.
		bMenu = data;
		
		// 화면을 재구성 시켜줍니다.
		displayMenu();
		
		// 데이터 성공여부에 따라서 Alert를 날려줍니다.
		alertShow(data);
	} catch (e) {
		console.log(e);
		alert('비정상적인 오류가 발생되었습니다. 다시 시도해주세요..!');
		return false;
	}
}


// 퀵 서비스 활성화 < 서비스 등록 [건욱]
async function updateMenu(service) {
	console.log(service);
	for (let key in service) {
		if (service[key] === "") {
			alert("잘못된 입력입니다.\n입력하신 내용을 다시 한 번 확인해주세요.")
			return false;
		}
	}
	
	try {
		const { data } = await axios.post(getContextPath() + "/business/mainmanagement/BMenu/rest/updateMenu/", service);
		
		
		// 수정된 데이터를 bMenu에 반영시켜주니다.
		bMenu = data;
		
		// 화면을 재구성 시켜줍니다.
		displayMenu();
		
		// 데이터 성공여부에 따라서 Alert를 날려줍니다.
		alertShow(data);
		
		// 모달을 닫아줍니다.
		document.getElementById('modify-menu-modal').style.display = "none";
    	document.getElementById('modify-menu-modal').innerHTML = "";
		
	} catch (e) {
		console.log(e);
		return false;
	}
}


// 메뉴 수정 [건욱]
async function deleteMenu(rmObject) {
	
	try {
		// Rest 로 삭제를 성공시에 data에 List<BMenuVO> 리스트를 받아옵니다.
		const {data} = await axios.post(getContextPath() + "/business/mainmanagement/BMenu/rest/deleteMenu/", rmObject);
		
		
		// 수정된 데이터 List<BMenuVO>를 수정되기 전 데이터 bMenu에 다시 반영해줍니다.
		bMenu = data;
		
		// display를 다시 재구성해줍니다.
		displayMenu();
		
		
		// 모달을 닫아줍니다.
		modalClose();
		
		// 데이터 성공여부에 따라서 Alert를 날려줍니다.
		alertShow(data);
		
	} catch (e) {
		console.log(e);
		alert('비정상적인 오류가 발생되었습니다. 다시 시도해주세요..!');
		return false;
	}
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
	try{
		const { data } = await axios.post(getContextPath() + "/business/mainmanagement/BManagement/rest/updateDeliveryBoolean/", result);
		alertShow(data);
	} catch(e) {
		alert('비정상적인 오류가 발생되었습니다. 다시 시도해주세요..!');
		return false;
	}
	
	
}

// 배달 지역 업데이트 [건욱]
async function updateDeliveryArea() {
	// data
	
	// axios > post > update
	try{
		const { data } = await axios.post(getContextPath() + "/business/mainmanagement/BDeliveryArea/rest/updateBDeliveryArea/", updateArea);
		alertShow(data);
	} catch(e) {
		alert('비정상적인 오류가 발생되었습니다. 다시 시도해주세요..!');
		return false;	
	}
	// 뷰 업데이트
}


// 주소 업데이트
async function updateAddress() {
	if(exceptionCheckBLocation() === false)
		return false;
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
	const { data } =  await axios.post(getContextPath() + "/business/mainmanagement/BInformation/rest/updateLocation/", object);
	alertShow(data);	 
	borderNone('locationArea');
}

function alertShow(data) {
	if(data) 
		alert("정상 수행되었습니다.");
	else 
		alert("비정상적인 오류가 발생했습니다. 다시 시도 해주세요..")
}
