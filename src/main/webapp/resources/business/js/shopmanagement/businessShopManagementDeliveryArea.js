// DB에 보낼 배달가능지역 객체
const updateArea = {
	"add" : {},
	"remove" : {}
};

let displayArea = {
	
};

const cloneObj = obj => JSON.parse(JSON.stringify(obj));


displayArea = cloneObj(deliveryAreas);


// 초기실행
displayDeliveryArea();
createMajorOptions();


// 폼 업데이트
function updateDeliveryArea() {
	// data
	const copiedDeliveryAreas = JSON.parse(JSON.stringify(deliveryAreas));
	console.log(copiedDeliveryAreas);
	
	// axios > post > update
//	await axios.post("/drumtong/business/mainmanagement/BManagement/rest/selectMMapAddressC/", copiedDeliveryAreas);
	
	// 뷰 업데이트
	displayDeliveryArea();	
}

// 시도 데이터의 존재 여부에 따라서 데이터를 넣어주는 형식을 다르게 해줍니다. [건욱]
function addEnterValue(type, hasMetroCity, metroCity, city, town) {
	
	console.log('displayArea0' , displayArea);
	if(hasMetroCity) {
		
		
		let hasCity =  updateArea[type][metroCity].hasOwnProperty(city);
		console.log(hasCity);
		
		if(hasCity) {
			if(!updateArea[type][metroCity][city].includes(town))
				updateArea[type][metroCity][city].push(town);
			if(type !== "remove" &&  !displayArea[metroCity][city].includes(town))
				displayArea[metroCity][city].push(town);
		}
		else {
			updateArea[type][metroCity][city] = [ town ];
			if(type !== "remove" &&  !displayArea[metroCity][city].includes(town))
				displayArea[metroCity][city] = [town];
			
		}
		
		
		
	}
		
	else {
		updateArea[type][metroCity] = {
			[city] : [ town ]
		};
		if(type !== "remove")
			displayArea[metroCity] = {
				[city] : [ town ]
			};
	}
		
	console.log('displayArea1' , displayArea);
	
}


// 지역 데이터를 삭제해주는 역할을 담당하는 함수입니다. [건욱]
function removeEnterValue(metroCity, city, town) {
			
			// 체크 해제했을 때 기존 DB 데이터에 시,도 데이터가 있다면 
			// remove 필드에 데이터를 넣어준다.
			
			// 체크 해제했을 때 기존 DB에 시,도 데이터가 없으면
			// updateArea add에서 데이터를 삭제해준다.
			let hasMetroCity =  deliveryAreas.hasOwnProperty(metroCity);
			
			let getBoolean = false;
			
			if(hasMetroCity) {
				if(deliveryAreas[metroCity].hasOwnProperty(city))
					if(deliveryAreas[metroCity][city].includes(town))
						getBoolean = true;
			}
			let ownHasMetroCity = updateArea["remove"].hasOwnProperty(metroCity);
			
			
			
			// DB 데이터에 시,도 데이터가 있으면 addEnterValue함수를 호출해서 remove필드에 삭제데이터를 추가해줍니다.
			if(hasMetroCity) {	
				
				if(getBoolean){
					addEnterValue("remove", ownHasMetroCity, metroCity, city, town);
				}
				else if (!getBoolean) {
					const idx = updateArea["add"][metroCity][city].indexOf(town);	
					console.log(idx);
					delete updateArea["add"][metroCity][city].splice(idx,1);
				}
				
				
				
				
				
			}
			// DB 데이터에 시,도 데이터가 존재하지 않으면  add에 추가된 데이터 값만 삭제해줍니다.
			else {
				const idx = updateArea["add"][metroCity][city].indexOf(town);	
				console.log(idx);
				delete updateArea["add"][metroCity][city].splice(idx,1);
			}
			
			
			
			const disidx = displayArea[metroCity][city].indexOf(town);
			delete displayArea[metroCity][city].splice(disidx,1);
			
			
			
			
				
}



// 시,도 데이터가 존재하는지 안하는지 구분해주는 hasMetroCity에 대한 값을 정의해주고
// check한 type에 따라서 다른 함수를 불러와주는 역할을 담당하는 함수입니다. [건욱]
function configurationObject(checkBoolean,metroCity,city,town) {
	let type = checkBoolean ? "add" : "remove";
	
	
	console.log("type", type);
	
	// DB에 전달할 객체에 클릭한 시,도 데이터가 존재하는지 확인해주는 값입니다.
	let hasMetroCity = updateArea[type].hasOwnProperty(metroCity);
	
	
	// type이 add이면 addEnterValue함수를 호출합니다.
	if(type === "add") 
		addEnterValue(type, hasMetroCity, metroCity, city, town);
		
	// type이 remove이면 removeEnterValue함수를 호출합니다.	
	else 
		removeEnterValue( metroCity, city, town);
			
}

// 추가-삭제 관련 객체 & 기,존 배달지역 객체 업데이트 [건욱]
function updatedeliveryAreaObject(id, metroCity, city, town) {
	const checkbox = document.getElementById(id);

	// [건욱] 코드 수정합니다. 배달지역 추가 삭제시에 삭제데이터와 신규데이터가 구분해서 들어가야되기 때문에 기존의 객체를 활용하면 안되고 새로 선언해주어야합니다.
	configurationObject(checkbox.checked,metroCity,city,town);
	
	console.log(updateArea);	
	console.log('display', displayArea);
}



// 배달지역 뷰
function displayDeliveryArea() {
	
	
	// 정렬
	const sMCities = Object.keys(displayArea).sort(); 
	const sObject = {};
		
	for (let i = 0; i < sMCities.length; i++) {
		sObject[sMCities[i]] = displayArea[sMCities[i]]; // 시도 정렬

		const sCities = Object.keys(displayArea[sMCities[i]]).sort(); // 시군구 정렬
		
		for (let j = 0; j < sCities.length; j++) {
			sObject[sMCities[i]][sCities[j]] = displayArea[sMCities[i]][sCities[j]].sort();
		}
		
	}
	
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
				
				// [건욱] 코드 추가 매장 상태가 SUCCESS가 아닐떄
				if(status !== "SUCCESS"){
					// 삽입
					const townInput = document.createElement("input");
					townInput.type = "hidden";
					townInput.name = "deliveryArea";
					townInput.value = `${district}/${cityName}/${townName}`;
					townCon.appendChild(townInput);
				}
				
				townCon.appendChild(town);
				
			}
			
			// 삽입
			city.appendChild(townCon);
			cityCon.appendChild(city);
			metroCityCon.appendChild(cityCon);
			
			// 읍면동 데이터가 없으면 시군구 뷰를 삭제해줍니다.
			if(townCon.childElementCount === 0)
				city.remove();
			
		}
		// 삽입
		container.appendChild(metroCityCon);
		viewCon.appendChild(container);
		
		
		console.log(metroCityCon.childElementCount);
		
		// [건욱] display 생성도중 도시가 없으면 시,도 뷰를 삭제해줍니다.
		if(cityCon.childElementCount === 0 )
			container.remove();
		
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
	const isMetroCity = displayArea[metroCity];
	
	if (isMetroCity) {
		const isCity = displayArea[metroCity][city];
		
		if (isCity) {
			const isTown = displayArea[metroCity][city].includes(town);
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
