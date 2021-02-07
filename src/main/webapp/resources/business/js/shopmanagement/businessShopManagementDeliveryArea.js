// DB에 보낼 배달가능지역 객체
const updateArea = {
	"add" : {},
	"remove" : {}
};

// 초기실행
displayDeliveryArea()
createMajorOptions();


// 폼 업데이트
function updateDeliveryArea() {
	// 수정된 정보 업데이트 > updateArea
	
	// 시-도
	// deep copy
	const copiedInitialAreas = JSON.parse(JSON.stringify(initialAreas));
	const copiedDeliveryAreas = JSON.parse(JSON.stringify(deliveryAreas));
	
	const concatAreas = Object.assign(copiedInitialAreas, copiedDeliveryAreas);
	
	const concatMetroCities = Object.keys(concatAreas); // 병합된 시-도 배열
	const initialMetroCities = Object.keys(initialAreas); // 초기 시-도 배열
	const modifiedMetroCities = Object.keys(deliveryAreas); // 수정된 시-도 배열

	console.log("concatMetroCities", concatMetroCities);
	console.log("initialMetroCities", initialMetroCities);
	console.log("modifiedMetroCities", modifiedMetroCities);
	
	// 변경되지 않은 시-도
	const commonMetroCities = concatMetroCities.filter(name => {
		return initialMetroCities.includes(name) && modifiedMetroCities.includes(name)
	});

	// 추가된 시-도
	const addedMetroCities = concatMetroCities.filter(name => {
		return !initialMetroCities.includes(name) && modifiedMetroCities.includes(name);
	});

	// 삭제된 시-도
	const removedMetroCities = concatMetroCities.filter(name => {
		return initialMetroCities.includes(name) && !modifiedMetroCities.includes(name);
	});
	
	// add > updateArea(add)
	if (addedMetroCities.length !== 0) {
		for (let i = 0; i < addedMetroCities.length; i++) {
			updateArea.add = {
				[addedMetroCities[i]] : deliveryAreas[addedMetroCities[i]]
			}
		}
	}
	
	// remove > updateArea(remove)
	if (removedMetroCities.length !== 0) {
		for (let i = 0; i < removedMetroCities.length; i++) {
			updateArea.remove = {
				[removedMetroCities[i]] : deliveryAreas[removedMetroCities[i]]
			}
		}
	}
	
	console.log(commonMetroCities);
	console.log(addedMetroCities);
	console.log(removedMetroCities);	
	
	// 시-군-구
	
	console.log(updateArea);
	
//	await axios.post("/drumtong/business/mainmanagement/BManagement/rest/selectMMapAddressC/", updateArea);
	
}


// 추가-삭제 관련 객체 & 기,존 배달지역 객체 업데이트
function updatedeliveryAreaObject(id, metroCity, city, town) {
	const checkbox = document.getElementById(id);
	
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
}

// 배달지역 뷰
function displayDeliveryArea() {
	// 정렬
	const sMCities = Object.keys(deliveryAreas).sort(); 
	const sObject = {};
		
	for (let i = 0; i < sMCities.length; i++) {
		sObject[sMCities[i]] = deliveryAreas[sMCities[i]]; // 시도 정렬

		const sCities = Object.keys(deliveryAreas[sMCities[i]]).sort(); // 시군구 정렬
		
		for (let j = 0; j < sCities.length; j++) {
			sObject[sMCities[i]][sCities[j]] = deliveryAreas[sMCities[i]][sCities[j]].sort();
		}
		
	}
	
//	sObject; // 정렬된 객체로 변경
	
	const viewCon = document.getElementById("delivery-area-view"); // 영역 설정
	
	viewCon.innerHTML = ""; // 초기화
	
	// 출력
	for (let district in sObject) {
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
		
		const cities = sObject[district];
		
		for (let cityName in cities) {
			const city = document.createElement("div");
			city.className = "cityName";
			city.innerText = cityName;
			
			// 읍-면-동
			const townCon = document.createElement("div");
			townCon.className = "town";
			
			for (let townName of sObject[district][cityName]) {
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
		sidoname : majorValue,
		signame : minorValue,
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


// 객체 참조 > true || false
const hasProperty = (object, key) => {
	return object.hasOwnProperty(key);
}

// 배열 비교 > true || false
const compareArray = (initialArray, modifiedArray) => {
	if (initialArray.length !== modifiedArray.length) return false;
	else {
		const filteredArray = Array.from(new Set(initialArray.concat(modifiedArray)));
		
		if (filteredArray.length === initialArray.length
				&& filteredArray.length === modifiedArray.length) return true;
		
		return false;
	}
}
