const dummyObject = {
		"충청남도" : {
			"금산군": ["남이면", "진산면"],
			"태안군" : ["태안읍", "안면읍"]
		}
}

// 초기실행
displayDeliveryArea()
createMajorOptions();


// 배달지역 뷰
function displayDeliveryArea() {
	const viewCon = document.getElementById("delivery-area-view");
	
	for (let district in dummyObject) {
		// container
		const container = document.createElement("div");
		container.className = "delivery_view_metro_con";
		
		// 시-도 
		const metroCityCon = document.createElement("div");
		metroCityCon.className = "metroCity";
		metroCityCon.innerHTML = `<div class="metroName">${district}</div>`;
		
		// 시-군-구
		const cityCon = document.createElement("div");
		cityCon.className = "city";
		
		const cities = dummyObject[district];
		
		for (let cityName in cities) {
			const city = document.createElement("div");
			city.className = "cityName";
			city.innerText = cityName;
			
			// 읍-면-동
			const townCon = document.createElement("div");
			townCon.className = "town";
			
			for (let townName of dummyObject[district][cityName]) {
				const town = document.createElement("div");
				town.className = "townName";
				town.innerHTML = townName;
				
				// 삽입
				townCon.appendChild(town);
			}
			
			// 삽입
			city.appendChild(townCon);
			cityCon.appendChild(city);
			metroCityCon.appendChild(cityCon);
		}
		
		
		// 삽입
		container.appendChild(metroCityCon);
		viewCon.appendChild(container);
	}

	
}

// 배달지역 뷰 업데이트
function updateDeliveryArea(id) {
	
}

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
	const sido = document.getElementById("major-area-selector").value;

	// 옵션 초기화
	document.getElementById("detail-area-selector").innerHTML = "";
	// ■ 시군구 데이터 초기화 [영경, 건욱]
	document.querySelectorAll('#major-area-selector')[0].addEventListener('change', () => {
		document.getElementById("minor-area-selector").options.length = 0;
	});
	
	// ■ [영경]await 추가	
	const { data:sigungu } = await axios.get("/drumtong/business/mainmanagement/BManagement/rest/selectMMapAddressB/" +sido + "/" );

	if (sigungu) {
		const defaultOption = document.createElement("option");
		defaultOption.hidden = true;
		defaultOption.selected = true;
		defaultOption.innerText = "시/군/구 선택";
		
		minorAreaCon.appendChild(defaultOption);
		
		for (let value of sigungu) {
			const option = document.createElement("option");
			option.value = value;
			option.innerHTML = value;
			option.className = "minor_area_selector";
			
			minorAreaCon.appendChild(option);
		}
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

