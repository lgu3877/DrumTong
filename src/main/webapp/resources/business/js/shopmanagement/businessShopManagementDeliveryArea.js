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
	
	// ■ 시군구 데이터 초기화 [영경, 건욱]
	document.querySelectorAll('#major-area-selector')[0].addEventListener('change', function(){	console.log('test');document.getElementById("minor-area-selector").options.length = 0;});
}

// 시/군/구 생성
async function createMinorOptions() {
	const minorAreaCon = document.getElementById("minor-area-selector");
	const sido = document.getElementById("major-area-selector").value;

	// 옵션 초기화
	document.getElementById("detail-area-selector").innerHTML = "";
	const createdOptions = minorAreaCon.children;
	if (createdOptions.length > 1) {
		for (let i = 0; i < createdOptions.length; i++) {
			console.log('실행');
			createdOptions[1].remove();
		}
	}
	
	// ■ [영경]await 추가	
	const { data:sigungu } = await axios.get("/drumtong/business/mainmanagement/BManagement/rest/selectMMapAddressB/" +sido + "/" );
	// 생성
	console.log(sigungu);
		
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
	
	const object = {
		addressa : majorValue,
		addressb : minorValue,
	}
	
	const { data:towns } = await axios.post("/drumtong/business/mainmanagement/BManagement/rest/selectMMapAddressC/", object);
	
	// 생성
	for (let i = 0; i < towns.length; i++) {
		const checkboxId = generateRandomString(13);
		
		const div = document.createElement("div");
		div.className = "town_selector_con";
		
		const label = document.createElement("label");
		label.htmlFor = checkboxId;
		label.className = "town_selector";
		
		const input = document.createElement("input");
		input.id = checkboxId;
		input.type = "checkbox";
		input.name = "town";
		input.value = towns[i];
//		input.className = "detaile_area_checkbox";
		
		// 삽입
		label.appendChild(input);
		label.innerHTML += towns[i];
		div.appendChild(label)
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

