// 초기실행
createMajorOptions();

//const dummyObject = {
//	"부산광역시" : {
//		"남구": ["대연1동", "대연2동"],
//		"수영구" : ["망미1동", "망미2동"]
//	},
//	"서울특별시" : {
//		"강남구": ["강남1동", "강남2동"],
//		"강북구": ["강북1동", "강북2동"]
//	}
//}

// 시/도 생성
function createMajorOptions() {
	const majorAreaCon = document.getElementById("major-area-selector");
	
	for (let value of sido) {
		const option = document.createElement("option");
		option.value = value;
		option.innerHTML = value;
		option.className = "major_area_selector";
		
		majorAreaCon.appendChild(option);
	}
}

// 시/군/구 생성
async function createMinorOptions() {
	const minorAreaCon = document.getElementById("minor-area-selector");
	const majorValue = document.getElementById("major-area-selector").value;
	
	// 옵션 초기화
	document.getElementById("detail-area-selector").innerHTML = "";
	const createdOptions = minorAreaCon.children;
	if (createdOptions.length > 1) {
		for (let i = 0; i < createdOptions.length; i++) {
			createdOptions[1].remove();
		}
	}
	
	const { data:sigungu } = axios.get("/drumtong/business/mainmanagement/BManagement/rest/", majorValue);
	
	// 생성
	for (let value of sigungu) {
		const option = document.createElement("option");
		option.value = value;
		option.innerHTML = value;
		option.className = "minor_area_selector";
		
		minorAreaCon.appendChild(option);
	}
}

// 읍/면/동 생성
async function createDetailOptions() {
	const detailAreaCon = document.getElementById("detail-area-selector");
	const majorValue = document.getElementById("major-area-selector").value;
	const minorValue = document.getElementById("minor-area-selector").value;
	
	// 초기화
	detailAreaCon.innerHTML = "";
	
	const { data:towns } = = axios.get("/drumtong/business/mainmanagement/BManagement/rest/", minorValue);
	
	// 생성
	for (let i = 0; i < towns.length; i++) {
		const checkboxId = generateRandomString(13);
		
		const label = document.createElement("label");
		label.htmlFor = checkboxId;
		
		const input = document.createElement("input");
		input.id = checkboxId;
		input.type = "checkbox";
		input.name = "town";
		input.value = towns[i];
		input.className = "detaile_area_checkbox";
		
		label.appendChild(input);
		label.innerHTML = towns[i];
		detailAreaCon.appendChild(label);
	}
}

// 폼 업데이트
async function updateDeliveryArea() {
	const areaCheckboxes = document.getElementsByName("town");
	
	
	const majorValue = document.getElementById("major-area-selector").value;
	const minorValue = document.getElementById("minor-area-selector").value;
	
	console.log("test");
}

