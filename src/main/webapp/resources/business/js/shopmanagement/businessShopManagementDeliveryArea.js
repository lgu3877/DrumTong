//const deliveryAreas = {
//		"충청남도" : {
//			"금산군": ["남이면", "진산면"],
//			"태안군" : ["태안읍", "안면읍"]
//		}
//}

// DB에 보낼 배달가능지역 객체
const updateArea = {
	"add" : {},
	"remove" : {}
};

// 초기실행
displayDeliveryArea()
createMajorOptions();


// 추가-삭제 관련 객체 & 기,존 배달지역 객체 업데이트
function updatedeliveryAreaObject(id, metroCity, city, town) {
	const checkbox = document.getElementById(id);
	
	console.log(deliveryAreas);
	
	// deliveryAreas 수정 > view 업데이트
	// 체크
	if (checkbox.checked === true) {
		const hasMetroCity = deliveryAreas.hasOwnProperty(metroCity);
		if (!hasMetroCity) {
			deliveryAreas[metroCity] = {
					[city] : [ town ]
			};
		} 
		else {
			const hasCity = deliveryAreas[metroCity].hasOwnProperty(city);
			if (!hasCity) {
				deliveryAreas[metroCity][city] = [ town ];
			}
			else {
				const hasTown = deliveryAreas[metroCity][city].includes(town);
				if (!hasTown) {
					deliveryAreas[metroCity][city].push(town);
				}
			}
		}
	} 
	// 체크 해제
	else {
		// 읍면동이 2개 이상
		if (deliveryAreas[metroCity][city].length !== 1) {
			const index = deliveryAreas[metroCity][city].indexOf(town);
			deliveryAreas[metroCity][city].splice(index, 1);
		}
		// 읍면동이 1개
		else {
			
			const numberOfCities = Object.keys(deliveryAreas[metroCity]).length; // 시군구 개수
			// 시군구가 2개 이상
			if (numberOfCities !== 1) {
				delete deliveryAreas[metroCity][city]; // 읍면동이 없는 시군구를 객체에서 제거
			}
			// 시군구 1개
			else {
				delete deliveryAreas[metroCity];
			}
		}
	}
	console.log(deliveryAreas);
}


// 배달지역 뷰
function displayDeliveryArea() {
	const viewCon = document.getElementById("delivery-area-view");
	
	// 초기화
	viewCon.innerHTML = "";
	
	// 출력
	for (let district in deliveryAreas) {
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
		
		const cities = deliveryAreas[district];
		
		for (let cityName in cities) {
			const city = document.createElement("div");
			city.className = "cityName";
			city.innerText = cityName;
			
			// 읍-면-동
			const townCon = document.createElement("div");
			townCon.className = "town";
			
			for (let townName of deliveryAreas[district][cityName]) {
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
		// change 이벤트
		label.addEventListener("change", () => {
			updatedeliveryAreaObject(checkboxId, majorValue, minorValue, towns[i]); // 추가&삭제 관련 객체 업데이트
			displayDeliveryArea(); // 화면 업데이트
		})
		
		const input = document.createElement("input");
		input.id = checkboxId;
		input.type = "checkbox";
		input.name = "town";
		input.value = towns[i];
//		input.className = "detaile_area_checkbox";
		inquireResource(majorValue, minorValue, towns[i]) ? 
			input.setAttribute("checked", "checked") :
			input.removeAttribute("checked");
		
		// 삽입	
		label.appendChild(input);
		label.innerHTML += towns[i];
		detailAreaCon.appendChild(label);
	}
}

//체크박스 설정
function inquireResource(metroCity, city, town) {
	const isMetroCity = deliveryAreas[metroCity];
	
	if (isMetroCity) {
		const isCity = deliveryAreas[metroCity][city];
		
		if (isCity) {
			const isTown = deliveryAreas[metroCity][city].includes(town);
			return isTown ? true : false;
		}
	}
	return;
}

// 폼 업데이트
async function updateDeliveryArea() {
	const areaCheckboxes = document.getElementsByName("town");
	
	
	const majorValue = document.getElementById("major-area-selector").value;
	const minorValue = document.getElementById("minor-area-selector").value;
	
	console.log("test");
}

