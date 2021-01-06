// 사진 업데이트
async function updatePhoto() {
	const formData = new FormData();
	
	const coverImage = document.getElementById("update-cover");
	const photoInputs = document.getElementsByName("storeimg");
	const fileList = [];
	
	for (let i = 0; i < photoInputs.length; i++) {
		if (photoInputs[i].files[0] !== undefined) {
			fileList.push(formData.append("storeimg", photoInputs[i].files[0]));
//			fileList.push(photoInputs[i].files[0]);
		}
	}	

//	const object = {
//		"delegatephotoboolean" : coverImage.files[0],
//		"storeimg" : fileList,
//	};
	
	const object = {
		"mainImage" : formData.append("delegatephotoboolean", coverImage.files[0]),
		"subImage" : fileList,
	};
	
	// result.data (es6 > obejct destructuring)
	const { data } = await axios.post(
		"/drumtong/business/mainmanagement/businessShopManagement/", 
		object, 
		{
			headers: {
				"Content-Type": `multipart/form-data`,
			}, 
		});
	
	console.log(data);
}

//매장 소개글 업데이트
async function updateIntro() {
	const text = document.getElementById("intro-text").innerText;
	
	const { data } = await axios.post("/drumtong/business/mainmanagement/businessShopManagement/", text);
	
	console.log(data);
}


// 서비스 등록 업데이트

function addService() {
	const list = document.getElementsByClassName("single_item_selector");
	const object = [];
	const classPrefix = ["first", "second", "third", "forth", "fifth"]
	
	// 상품 등록
	for (let i = 0; i < list.length; i++) {
		let element = {}; // 상품 등록 객체
		// 상품 등록 속성 5개 > 객체 생성 (대분류, 중분류, 세부내용, 가격, 시간) + 배달
		for (let j = 0; j < classPrefix.length; j++) {
			const eachInput = list[i].getElementsByClassName(classPrefix[j] + '_item_prop')[0];
			// select (2) & input (3) || direct (2)
			console.log(eachInput);
			
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
//		console.log(object);
	}
	
	// 배달 서비스 옵션 설정
	activateDelivery();
	// 
//	const { data } = await axios.post("/drumtong/business/mainmanagement/businessShopManagement/", object);
//	
//	console.log(data);
}

// 배달 서비스 활성화 < 서비스 등록
async function activateDelivery() {
//	activateVisualization(); // MenuList > 스위치 디자인 변경 & input 생성
	
	const result = deliveryToggle  ? "y" : "n"; // js > MenuList

	console.log(result);

//	const { data } = await axios.post("/drumtong/business/mainmanagement/businessShopManagement/", result);
//	
//	console.log(data);
}

// 배달 업데이트
async function updateDelivery() {
	const options = [...document.getElementsByClassName("returnOptions")]
		.filter((input) => input.checked)
		.map((input) => input.name);
	
	console.log(options);
	
	const { data } = await axios.post("/drumtong/business/mainmanagement/businessShopManagement/", options);
	
	console.log(data);
}

function exit() {
	return;
}