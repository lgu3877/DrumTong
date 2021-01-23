const dummyObject = {
	"부산광역시" : {
		"남구": ["대연1동", "대연2동"],
		"수영구" : ["망미1동", "망미2동"]
	},
	"서울특별시" : {
		"강남구": ["강남1동", "강남2동"],
		"강북구": ["강북1동", "강북2동"]
	}
}

// 시/도 생성
function createMajorOptions() {
	const majorAreaCon = document.getElementById("major-area-selector");
	
	for (let key in dummyObject) {
		const option = document.createElement("option");
		option.value = key;
		option.innerHTML = key;
		option.className = "major_area_selector";
		
		majorAreaCon.appendChild(option);
	}
	
}

// 시/군/구 생성
function createMinorOptions() {
	const minorAreaCon = document.getElementById("minor-area-selector");
	const majorValue = document.getElementById("major-area-selector").value;
	
	// 옵션 초기화
	
	// 생성
	for (let key in dummyObject[majorValue]) {
		const option = document.createElement("option");
		option.value = key;
		option.innerHTML = key;
		option.className = "minor_area_selector";
		
		minorAreaCon.appendChild(option);
	}
}

// 읍/면/동 생성
function createDetailOptions() {
	const detailAreaCon = document.getElementById("detail-area-selector");
	const majorValue = document.getElementById("major-area-selector").value;
	const minorValue = document.getElementById("minor-area-selector").value;
	
	const areaArray = dummyObject[majorValue][minorValue];
	
	for (let i = 0; i < areaArray.length; i++) {
		console.log(areaArray[i]);
		
		const checkboxId = generateRandomString(13);
		
		
		const label = document.createElement("label");
		label.htmlFor = checkboxId;
		
		
		const input = document.createElement("input");
		input.id = checkboxId;
		input.type = "checkbox";
		input.name = "detailArea";
		input.value = areaArray[i];
		input.className = "detaile_area_checkbox";
		
		label.appendChild(input);
		label.innerHTML = areaArray[i];
		detailAreaCon.appendChild(label);
	}
	
}

// 폼 업데이트
function updateDeliveryArea() {
	console.log("test");
}

createMajorOptions();