// 입력 줄 전체
let singleList = document.querySelector('.single_item_selector');
let copiedList;

// main toggle
const mainToggle = { }

// 초기 실행
displayMenu();
createAddService();
createCategoryList(); // 메뉴수정 관련 Modal


// 메뉴 생성
function displayMenu() {

	// object 생성
	let list = {};
	for (let item = 0; item < bMenu.length; item++) {
		const menu = bMenu[item];
		
		const isMainIncluded = Object.keys(list).includes(menu.maincategory);
		
		// 메인 카테고리 있음
		if (isMainIncluded) {
			const isSubIncluded = Object.keys(list[menu.maincategory]).includes(menu.subcategory);
			
			// 서브카테고리 있음
			if (isSubIncluded) {
				const detailInfo = {
						name : menu.name,
						price : menu.price,
						quickprice: menu.quickprice || 0,
						ete : menu.ete,
						estid : menu.estid,
					}
				
				list[menu.maincategory][menu.subcategory].push(detailInfo);
			}
			
			// 서브카테고리 없음
			else {
				list[menu.maincategory][menu.subcategory] = [{
					name : menu.name,
					price : menu.price,
					quickprice: menu.quickprice || 0,
					ete : menu.ete,
					estid : menu.estid,
				}]
			}
		}
		
		// 메인 카테고리 없음
		else {
			list[menu.maincategory] = {
				[menu.subcategory] : [{
					name : menu.name,
					price : menu.price,
					quickprice : menu.quickprice || 0,
					ete : menu.ete,
					estid : menu.estid,
				}]
			}			
		}
	}
	
	// toggle switch
	const mainCategories = Object.keys(list);
	for (let i = 0; i < mainCategories.length; i++) {
		mainToggle[mainCategories[i]] = false;
	}
	console.log(mainToggle);
	
	// menu list 생성
	const container = document.getElementById("posted-service-list");
	
	// main category
	for (let main in list) {
		const mainCon = document.createElement("div");
		const containerId = generateRandomString(10);
		mainCon.className = "menu_main_con";
		mainCon.id = containerId;
		
		// wrapper
		const mainWrapper = document.createElement("div");
		mainWrapper.className = "menu_main_wrapper";
		

		// icon
		const mainExIcon = document.createElement("div");
		mainExIcon.className = "menu_main_icon";
		mainExIcon.innerHTML = '<i class="fas fa-plus-square"></i>';
		mainExIcon.onclick = () => {
			const isOpened = mainToggle[main];
			if (!isOpened) {
				toggleMainCategory(containerId, list[main], main);
			}
			else {
				mainToggle[main] = false;
				document.getElementById(containerId).getElementsByClassName("menu_sub_con")[0].remove();
			}
		}
		
		// title
		const mainTitle = document.createElement("div");
		mainTitle.className = "menu_main_title";
		mainTitle.innerHTML = main;
		
		// total number of services
		const mainAmount = document.createElement("div");
		mainAmount.className = "menu_main_amount"
		mainAmount.innerHTML = measureAmount(list[main]);
		
		
		mainWrapper.appendChild(mainExIcon);
		mainWrapper.appendChild(mainTitle);
		mainWrapper.appendChild(mainAmount);
		
		mainCon.appendChild(mainWrapper);
		container.appendChild(mainCon);
	}
}

// 서비스 메뉴 > 리스트 > 클릭 이벤트(메인 > 서브)
function toggleMainCategory(id, list, main) {
	// toggle
	mainToggle[main] = true;
	
	// sub toggle object
	const subToggle = { }
	
	// script
	const mainWrapper = document.getElementById(id);
	const subCon = document.createElement("div");
	const subContainerId = generateRandomString(10);
	subCon.id = subContainerId;
	subCon.className = "menu_sub_con";
	
	for (let sub in list) {
		// sub toggle
		subToggle[sub] = false;
		
		// wrapper
		const subWrapper = document.createElement("div");
		subWrapper.className = "menu_sub_wrapper";
		
		// icon
		const subExIcon = document.createElement("div");
		subExIcon.className = "menu_sub_icon";
		subExIcon.innerHTML = '<i class="fas fa-plus-square"></i>';
		subExIcon.onclick = () => toggleSubCategory(subContainerId, list[sub]);
		
		// title
		const subTitle = document.createElement("div");
		subTitle.className = "menu_sub_title";
		subTitle.innerHTML = sub;
		
		// total number of services
		const subAmount = document.createElement("div");
		subAmount.className = "menu_sub_amount"
		subAmount.innerHTML = list[sub].length;
		
		subWrapper.appendChild(subExIcon);
		subWrapper.appendChild(subTitle);
		subWrapper.appendChild(subAmount);
		
		subCon.appendChild(subWrapper);
	}
	
	mainWrapper.appendChild(subCon)
}

// 서비스 메뉴 > 리스트 > 클릭 이벤트(서브 > 디테일)
function toggleSubCategory() {
	
}


function displayMenus() {
	const tbody = document.getElementById("item-list-tbody");
	
	// 테이플 행 카운트 > 짝수 번째 하이라이트
	let row = 0;
	for (let index = 0; index < bMenu.length; index++) {
		const randomId = generateRandomString(16);
		const tr = document.createElement("tr");
		tr.id = randomId;
		
		row++;
		
		// 출력 순서를 위한 오브젝트 정렬
		const sortedMenu = {
			"maincategory": undefined,
			"subcategory": undefined,
			"name": undefined,
			"price": undefined,
			"ete": undefined,
			"quickprice": undefined,
		};
		
		const count = Object.keys(bMenu[index]).length;
		let size = 0;
		for (let key in sortedMenu) {
			sortedMenu[key] = bMenu[index][key];
		}
		

		for (let key in sortedMenu) {
		// switch
			switch(key) {
			// 서비스 유형(main-category)
			case "maincategory":
				const mainCategory = document.createElement("th");
				mainCategory.scope = "row";
				mainCategory.innerHTML = sortedMenu[key];
				
				// 짝수 줄 > 하이라이트
				if (row % 2 == 0) mainCategory.className = "even";
				
				// 삽입
				tr.appendChild(mainCategory);
				break;
			
			// 서비스 타입(sub-category)
			case "subcategory":
				const subCategory = document.createElement("td");
				subCategory.innerHTML = sortedMenu[key];
				
				// 짝수 줄 > 하이라이트
				if (row % 2 == 0) subCategory.className = "even";
				
				// 삽입
				tr.appendChild(subCategory);
				break;
				
			// 세부 내용
			case "name":
				const detailInfo = document.createElement("td");
				detailInfo.innerHTML = sortedMenu[key];
				
				// 짝수 줄 > 하이라이트
				if (row % 2 == 0) detailInfo.className = "even";
				
				// 삽입
				tr.appendChild(detailInfo);
				break;
				
			// 가격 & 배달료
			case "price":
				const wrapper = document.createElement("td");
				wrapper.style.display = "block";
				
				// 가격
				const serviceFee = document.createElement("div");
				serviceFee.innerHTML = insertComma(sortedMenu[key].toString()) + " 원";
				
				// 삽입 (가격)
				wrapper.appendChild(serviceFee);
				
				// 배달료
				if (bMenu[index].hasOwnProperty("quickprice")) {
					const deliveryFeeCon = document.createElement("div");
					
					const deliveryFee = sortedMenu["quickprice"].toString();
					deliveryFeeCon.innerHTML = "(" + insertComma(deliveryFee) + " 원)";
					
					// 삽입 (배달료)
					wrapper.appendChild(deliveryFeeCon);
				}
				
				// 짝수 줄 > 하이라이트
				if (row % 2 == 0) wrapper.className = "even";
				
				// 삽입
				tr.appendChild(wrapper);
				break;
				
			// 소요 시간
			case "ete":
				const estimatedTime = document.createElement("td");
				estimatedTime.innerHTML = sortedMenu[key] + " (일)";
				
				// 짝수 줄 > 하이라이트
				if (row % 2 == 0) estimatedTime.className = "even";
				
				// 삽입
				tr.appendChild(estimatedTime);
				break;
			default:
				const modificationBtn = document.createElement("td");
				modificationBtn.style.textAlign = "center";
				
				const icon = document.createElement("i");
				icon.className = "fas fa-pencil-alt";
				icon.style.color = "green";
				icon.style.cursor = "pointer";
				icon.addEventListener("click", () => modifyMenu(randomId));
				
				// 짝수 줄 > 하이라이트
				if (row % 2 == 0) modificationBtn.className = "even";
				
				// 삽입
				modificationBtn.appendChild(icon);
				tr.appendChild(modificationBtn);
				break;
			}			
		}
		tbody.appendChild(tr);
	}
}

// 서비스 등록 > 입력 input & select 생성
function createAddService() {
	const container = document.getElementById("add-item-list");
	
	const singleServiceInputCon = document.createElement("div"); // 단일 서비스 입력폼
	const serviceRandomId = generateRandomString(11);
	singleServiceInputCon.id = serviceRandomId; // single container ID
	singleServiceInputCon.className = "single_item_selector";
	
	
	// main service category selector (첫번째)
	const firstInputCon = document.createElement("div");
	firstInputCon.className = "first_item_prop";

	// random IDs
	const selectorRandomId = generateRandomString(11); 
	const directRandomId = generateRandomString(12);
	const subSelectorRandomId = generateRandomString(12);
	const subDirectRandomId = generateRandomString(12);
	
		const mainSelector = document.createElement("select");
		mainSelector.id = selectorRandomId;
		mainSelector.className = "service_selector";
		mainSelector.name = "maincategory";
		mainSelector.addEventListener("change", (e) => selectMainOption(e, directRandomId, subSelectorRandomId, subDirectRandomId));
		
		// 하위 선택 항목 생성
		createOptions(mainSelector, false); 
		
		const mainSelectorDirectInput = document.createElement("input");
		mainSelectorDirectInput.id = directRandomId;
		mainSelectorDirectInput.type = "text";
		mainSelectorDirectInput.className = "direct_type_input";
		mainSelectorDirectInput.name = "maincategory";
		mainSelectorDirectInput.placeholder = "서비스 입력";
	
			// 추가
			firstInputCon.appendChild(mainSelector);
			firstInputCon.appendChild(mainSelectorDirectInput);
			
			
			
	// sub service category selector (두번째)
	const secondInputCon = document.createElement("div");
	secondInputCon.className = "second_item_prop";
	
		// sub selector
		const subSelector = document.createElement("select");
		subSelector.id = subSelectorRandomId;
		subSelector.className = "service_selector";
		subSelector.name = "subcategory"
		subSelector.addEventListener("change", (e) => selectSubOption(e, subDirectRandomId));
		
		const option = document.createElement("option");
		option.hidden = true;
		option.selected = true;
		option.innerHTML = "세부 서비스 선택";
		
		// sub direct input
		const subDirectInput = document.createElement("input");
		subDirectInput.id = subDirectRandomId;
		subDirectInput.type = "text";
		subDirectInput.name = "subcategory";
		subDirectInput.className = "direct_type_input";
		subDirectInput.placeholder = "서비스 입력";
		subDirectInput.style.display = "none";
		subDirectInput.maxlength = "10";
		
		
		// 추가
		subSelector.appendChild(option);
		secondInputCon.appendChild(subSelector);
		secondInputCon.appendChild(subDirectInput);

		
		
	// 세부내용 (세번째)
	const thirdInputCon = document.createElement("div");
	thirdInputCon.className = "third_item_prop";
	
		const detailContextInput = document.createElement("input");
		detailContextInput.type = "text";
		detailContextInput.className = "service_detail_input";
		detailContextInput.name = "name";
		detailContextInput.placeholder = "메뉴 이름 입력";
		detailContextInput.maxlength = "10";
	
		// 추가
		thirdInputCon.appendChild(detailContextInput);
		
		
		
	// 가격 (네번째)
	const forthInputCon = document.createElement("div");
	forthInputCon.className = "forth_item_prop";
	
		const priceInput = document.createElement("input");
		priceInput.type = "text";
		priceInput.className = "service_price_input";
		priceInput.name = "price";
		priceInput.placeholder = "서비스 가격(원)";
		priceInput.pattern = "[0-9]+";
		priceInput.maxlength = "5";
	
		
		// 추가
		forthInputCon.appendChild(priceInput);
		
		
		
	// 시간 (다섯번째)
	const fifthInputCon = document.createElement("div");
	fifthInputCon.className = "fifth_item_prop";
	
		const timeInput = document.createElement("input");
		timeInput.type = "text";
		timeInput.className = "service_time_input";
		timeInput.name = "ete";
		timeInput.placeholder = "서비스 소요시간";


		// 추가
		fifthInputCon.appendChild(timeInput);
		
		
		
	// 입력 취소 버튼
	const cancleBtnCon = document.createElement("div");
	cancleBtnCon.className = "cancle_listing";
	cancleBtnCon.addEventListener("click", () => dismissInput(serviceRandomId));
	cancleBtnCon.innerHTML = `<i class="fas fa-times"></i><span>취소</span>`;
	
	
	
		// 추가(appending)
		singleServiceInputCon.appendChild(firstInputCon);
		singleServiceInputCon.appendChild(secondInputCon);
	
		singleServiceInputCon.appendChild(thirdInputCon);
		singleServiceInputCon.appendChild(forthInputCon);
		singleServiceInputCon.appendChild(fifthInputCon);
		singleServiceInputCon.appendChild(cancleBtnCon);
		
//			copiedList = singleServiceInputCon.cloneNode(true); // 초기 상태 저장 
			container.appendChild(singleServiceInputCon);
}


// 메인 옵션 생성
function createOptions(mainSelector, modifyBoolean) {
	// placeholder
	let option = document.createElement("option");
	option.className = "main-category-default";
	option.hidden = true;
	option.disabled = true;
	option.selected = true;
	option.innerHTML = "서비스 타입 선택";
	
	mainSelector.appendChild(option); // 추가
	
	// 메뉴
	const sortedKeys = Object.keys(menuCategories).sort(); // key 정렬
	for (let i = 0; i < sortedKeys.length; i++) {
		option = document.createElement("option");
		option.className = "main_option";
		option.value = sortedKeys[i];
		option.innerHTML = sortedKeys[i];
		
		mainSelector.appendChild(option); // 추가
	}
	
	// 직접입력
	if (modifyBoolean === false) {
		option = document.createElement("option");
		option.value = "selectedDirect";
		option.className = "selectedDirect";
		option.innerHTML = "직접입력";
		option.style.fontWeight = "600";
		
		mainSelector.appendChild(option); // 추가		
	}
	
}


//select > option 선택
function selectMainOption(e, directInputId, subCategoryId, subDirectRandomId) {
	// 초기화
	clearSubOptions(subCategoryId);

	// 직접 입력 선택
	if(e.target.value === 'selectedDirect') {
		document.getElementById(directInputId).style.display = "";
		document.getElementById(directInputId).value = "";
		document.getElementById(subDirectRandomId).style.display = "";
		document.getElementById(subDirectRandomId).value = "";
		
		// 직접입력 > 자동선택 > input 활성화
		const option = document.createElement("option");
		option.value = "selectedDirect";
		option.className = "selectedDirect";
		option.selected = true;
		option.innerHTML = "직접입력";
		option.style.fontWeight = "600";
		
		document.getElementById(subCategoryId).appendChild(option);
	}
	
	// 그 외 값 선택
	else {
		document.getElementById(directInputId).style.display = "none";
		document.getElementById(directInputId).value = "";
		document.getElementById(subDirectRandomId).style.display = "none";
		document.getElementById(subDirectRandomId).value = "";
				
		// 하위 항목 생성
		populateSubOptions(e.target.value, subCategoryId, false);
	}
}


// 세부 서비스 선택
function selectSubOption(e, subDirectId) {
	const subDirectInput = document.getElementById(subDirectId); 
	
	if (e.target.value === "selectedDirect") {
		subDirectInput.style.display = "";
		subDirectInput.value = "";
	}
	else {
		subDirectInput.style.display = "none";
		subDirectInput.value = "";
	}
}


// 서브 옵션 변경 > 초기화
function clearSubOptions(subCategoryId) {
	const subOptions = document.getElementById(subCategoryId).children;
	
	const count = subOptions.length;
	for (let i = 0; i < count - 1; i++) {
		subOptions[1].remove();
	}
}

// 서브 옵션 생성
function populateSubOptions(key, subCategoryId, modifyBoolean) {
	const subSelect = document.getElementById(subCategoryId);
	
	// 하부 카테고리
	const sotredMenu = menuCategories[key].sort(); 	// value 정렬	
	for (let i = 0; i < sotredMenu.length; i++) {
		option = document.createElement("option");
		option.className = "sub_option";
		option.innerHTML = menuCategories[key][i];
		option.value = menuCategories[key][i];
		
		subSelect.appendChild(option);
	}
	
	// 서비스 등록 > 직접입력 & 메뉴 수정에서는 미지원
	if (modifyBoolean === false) {
		// 직접입력
		option = document.createElement("option");
		option.value = "selectedDirect";
		option.className = "selectedDirect";
		option.innerHTML = "직접입력";
		option.style.fontWeight = "600";
		
		subSelect.appendChild(option);		
	}
	
	// default option
	document.getElementById(subCategoryId).selected = true;
}

// 배달 서비스 활성화 이벤트
let deliveryToggle = false;
function activateVisualization() {
	const itemInputList = document.getElementById("add-item-list");
	const priceCon = itemInputList.getElementsByClassName("forth_item_prop");		
	deliveryToggle = !deliveryToggle;

	if(deliveryToggle === true) {
		const priceCon = document.getElementsByClassName("forth_item_prop");	
		document.getElementById("delivery-btn").style.backgroundColor = "navy";
		// 아이콘 변경(활성화)
		document.getElementById("delivery-icon").className = "fas fa-toggle-on";
		
		
		// input(quickprice) 추가
		for (let i = 0; i < priceCon.length; i++) {
			// input(quickprice) 생성
			const quickPriceInput = document.createElement("input");
			quickPriceInput.type = "text";
			quickPriceInput.name = "quickprice";
			quickPriceInput.className = "service_quickprice_input";
			quickPriceInput.placeholder = "배달 가격";
			quickPriceInput.style.marginTop = "5px";

			if (priceCon[i].children.length === 1) {
				priceCon[i].appendChild(quickPriceInput);				
			}
		}
	}
	else {
		document.getElementById("delivery-btn").style.backgroundColor = "#bedcfa";
		// 아이콘 변경(비활성화)
		document.getElementById("delivery-icon").className = "fas fa-toggle-off";
		
		// input(quickprice) 삭제
		for (let i = 0; i < priceCon.length; i++) {
			if (priceCon[i].children.length !== 1) {
				priceCon[i].removeChild(priceCon[i].children[1]);
			}
		}	
	}
}

// 메뉴 수정 버튼(th & td > input + 삭제 버튼)
function modifyMenuService() {
	// 삭제 활성화가 되어 있을 시(폼 변경 후), 작동안함
	if(document.getElementById("delete_title")) {
		return;
	}
	
	const tableHead = document.getElementsByClassName("current_menu_table")[1].getElementsByTagName("thead")[0];
	const tableBody = document.getElementsByClassName("current_menu_table")[1].getElementsByTagName("tbody")[0];
	
	// 상품 리스트 수(= 행 개수)
	const tr = tableBody.getElementsByTagName("tr");
	const trLength = tr.length;
	
	// 열 길이
	const columnLength = tableHead.children[0].children.length;
	
	// 수정 폼 타입(X > index를 사용한 switch로 대체)
	// const types = [ "first_select", "second_select", "detail", "price", "time"];
	
	// 테이블(thead) 삭제 열 추가
	const deleteList = document.createElement("th");
	deleteList.setAttribute("id", "delete_title");
	deleteList.scope = "cols";
	deleteList.innerHTML = "삭제";
	deleteList.style.width = "5%";
	
	tableHead.children[0].appendChild(deleteList);
	
	// 테이블(tbody) 삭제 버튼 추가 & 폼(input) 변경
	for(let i = 0; i < tr.length; i++) {
		const td = document.createElement("td");
		td.style.padding = "5px";
		
		// 내부 폼 변경	
		for (let j = 0; j < columnLength; j++) {
			const select = document.createElement("select");
			const defaultOption = document.createElement("option");
			const testOption = document.createElement("option");
			const typeOption = document.createElement("option");
			const directInput = document.createElement("input");
			
			const detailInput = document.createElement("input");
			const priceInput = document.createElement("input");
			const timeInput = document.createElement("input");

		// 홀수 행(흰색 배경)
			if(i % 2 !== 0) {
				td.setAttribute("class", "even delete_item");
				td.innerHTML = "<div onclick='deleteList(this.parentElement.parentElement)'>" + "<i class='fas fa-times'></i>" + "<span>삭제</span>" + "</div>";
			}
		// 짝수 행(하늘색 배경)
			else {
				td.setAttribute("class", "delete_item");
				td.innerHTML = "<div onclick='deleteList(this.parentElement.parentElement)'>" + "<i class='fas fa-times'></i>" + "<span>삭제</span>" + "</div>";			
			}
			
		// switch
			switch(j) {
		// 첫번째 select
			case 0:	
				// 초기화(default 값 지정 가능)
				tr[i].children[j].innerHTML = "";
				tr[i].children[j].style.width = "15%";
				tr[i].children[j].style.padding = "5px";

				select.className = "service_selector";
				select.name = ""
				select.setAttribute("onchange", "directType(this)");
				
				// (DB) 옵션 추가(types ~ 직접입력)
				// placeholder
				defaultOption.hidden = "true";
				defaultOption.disabled = "true";
				defaultOption.selected = "true";
				defaultOption.innerHTML = "초기값(DB)";			
				defaultOption.value = "초기값(DB)";			
				
				// 기타 옵션들(사용자에 따라 설정된 옵션)
				testOption.innerHTML = "Service 1";
				
				// 직접입력
				typeOption.value = "selectedDirect";
				typeOption.className = "selectedDirect"; 
				typeOption.innerHTML = "직접입력";
				
				// 옵션 주입
				select.appendChild(defaultOption);
				select.appendChild(testOption);
				select.appendChild(typeOption);
				
				// 직접입력 input 생성
				directInput.type="text";
				directInput.className = "direct_type_input";
				directInput.name = "";
				directInput.placeholder = "서비스 입력";
				directInput.style.display = "none";
				
				// select & input 주입
				tr[i].children[j].appendChild(select);
				tr[i].children[j].appendChild(directInput);
				
				break;
				
		// 두번째 select
			case 1:
				// 초기화(default 값 지정 가능)
				tr[i].children[j].innerHTML = "";
				tr[i].children[j].style.width = "15%";
				tr[i].children[j].style.padding = "5px";
				
				select.className = "service_selector";
				select.name = ""
				select.setAttribute("onchange", "directType(this)");
				
				// (DB) 옵션 추가(types ~ 직접입력)
				// placeholder
				defaultOption.hidden = "true";
				defaultOption.disabled = "true";
				defaultOption.selected = "true";
				defaultOption.innerHTML = "초기값(DB)";			
				defaultOption.value = "초기값(DB)";			
				
				// 기타 옵션들(사용자에 따라 설정된 옵션)
				testOption.innerHTML = "Type 1";
				
				// 직접입력
				typeOption.value = "selectedDirect";
				typeOption.className = "selectedDirect"; 
				typeOption.innerHTML = "직접입력";
				
				// 옵션 주입
				select.appendChild(defaultOption);
				select.appendChild(testOption);
				select.appendChild(typeOption);
				
				// 직접입력 input 생성
				directInput.type="text";
				directInput.className = "direct_type_input";
				directInput.name = "";
				directInput.placeholder = "서비스 입력";
				directInput.style.display = "none";
				
				// select & input 주입
				tr[i].children[j].appendChild(select);
				tr[i].children[j].appendChild(directInput);
				
				break;
		// 세부내용
			case 2:	
				// 초기화(default 값 지정 가능)
				tr[i].children[j].innerHTML = "";
				tr[i].children[j].className += " third_item_prop";
				tr[i].children[j].style.width = "20%";
				tr[i].children[j].style.padding = "5px";
				
				detailInput.type = "text";
				detailInput.className = "service_detail_input";
				detailInput.placeholder = 
					tr[i].children[j].innerHTML ? "초기값(DB)" : "세부 서비스 내용을 입력해주세요.";
				
				tr[i].children[j].appendChild(detailInput);
				
				break;
		// 가격
			case 3:	
				// 초기화(default 값 지정 가능)
				tr[i].children[j].innerHTML = "";
				tr[i].children[j].className += " forth_item_prop";
				tr[i].children[j].style.width = "15%";
				tr[i].children[j].style.padding = "5px";
				
				priceInput.type = "text";
				priceInput.className = "service_detail_input";
				priceInput.placeholder = 
					tr[i].children[j].innerHTML ? "초기값(DB)" : "가격(원)";
				
				tr[i].children[j].appendChild(priceInput);
				
				break;
		// 시간
			case 4:	
				// 초기화(default 값 지정 가능)
				tr[i].children[j].innerHTML = "";
				tr[i].children[j].className += " fifth_item_prop";
				tr[i].children[j].style.width = "15%";
				tr[i].children[j].style.padding = "5px";
				
				timeInput.type = "text";
				timeInput.className = "service_detail_input";
				timeInput.placeholder = 
					tr[i].children[j].innerHTML ? "초기값(DB)" : "소요시간(시간)";
				
				tr[i].children[j].appendChild(timeInput);
				
				break;
			}
			
			let value = tr[i].children[j].innerHTML;
//			console.log(value);
		
		}
		tr[i].appendChild(td);						
	}
};

// 단일 메뉴 수정
function modifyMenu(id) {
	const item = document.getElementById(id);
	
	// 입력된 값 추출
	const menu = {};
	for (let i = 0; i < item.children.length - 1; i++) {
		switch(i) {
		// 서비스 유형
		case 0: 
			menu.maincategory = item.children[i].innerText;
			break;
		// 서비스 타입
		case 1: 
			menu.subcategory = item.children[i].innerText;
			break;
		// 메뉴 이름
		case 2: 
			menu.name = item.children[i].innerText;
			break;
		// 가격 & 배달비 > 배달비가 없을 경우 포함
		case 3:
			if (item.children[i].children.length === 2) {
				menu.price = refineValue("price", item.children[i].children[0].innerText);		
				menu.quickprice = refineValue("quickprice", item.children[i].children[1].innerText)
			}
			else if (item.children[i].children.length === 1) {
				menu.price = refineValue("price", item.children[i].children[0].innerText);
			}
			else {
				alert("에러");
			}
			break;
		// 소요 시간
		case 4: 
			menu.ete = refineValue("ete", item.children[i].innerText);
			break;
		}
	}
	
	console.log(menu);
	
	// 폼 변경 > 입력된 값 주입
	for (let i = 0; i < item.children.length; i++) {
		// 초기화
		item.children[i].innerHTML = "";
		
		switch(i) {
		// 서비스 유형
		case 0: 
			const mainSelectorId = generateRandomString(15);
			const mainSelector = document.createElement("select");
			mainSelector.id = mainSelectorId;
			mainSelector.className = "service_selector";
			mainSelector.name = "maincategory";
//			mainSelector.addEventListener("change", (e) => selectMainOption(e, directRandomId, subSelectorRandomId, subDirectRandomId));
			
			// 서브옵션 생성
			createOptions(mainSelector, true);
			
			// 추가
			item.children[i].appendChild(mainSelector);
			
			// 기존값 선택 설정
			const mainCategories = document.getElementById(mainSelectorId).children;
			for (let i = 0; i < mainCategories.length; i++) {
				mainCategories[i].value === menu.maincategory ? 
					mainCategories[i].selected = true :
					mainCategories[i].selected = false;
			}
			
			break;
		// 서비스 타입
		case 1: 
			const subSelectorId = generateRandomString(14);
			const subSelector = document.createElement("select");
			subSelector.id = subSelectorId;
			subSelector.className = "service_selector";
			subSelector.name = "subcategory";
//			subSelector.addEventListener("change", (e) => selectSubOption(e, subDirectRandomId));
			
			// 추가
			item.children[i].appendChild(subSelector);
			
			// 서브 메뉴 생성
			populateSubOptions(menu.maincategory, subSelectorId, true);

			// 기존값 선택 설정
			const subCategories = document.getElementById(subSelectorId).children;
			for (let i = 0; i < subCategories.length; i++) {
				subCategories[i].value === menu.subcategory ? 
					subCategories[i].selected = true :
					subCategories[i].selected = false;
			}
			
			break;
		// 삭제 아이콘
		case 5: 
			const icon = document.createElement("i");
			icon.className = "fas fa-trash-alt";
			
			item.children[i].appendChild(icon);
			break;
		}
	}
}

// 상품 리스트 삭제
function deleteList(tr) {
	const answer = confirm("해당 목록을 삭제하시겠습니까?");
	if (answer === true ) {
		tr.remove();		
	}
}

// 취소 버튼
function dismissInput(id) {
	const itemlist = document.getElementById('add-item-list');
	// 목록이 하나 남았을 때
	if (itemlist.children.length === 1) {
		
		const directInputs = document.querySelectorAll(".direct_type_input");
		const selector = document.querySelectorAll(".service_selector");
		const directInputCheck = document.querySelectorAll(".selectedDirect");
		const quickpriceInput = document.querySelectorAll(".service_quickprice_input");
		
		// 직접입력 체크 O > input 제거 & 값 초기화
		for (let i = 0; i < directInputCheck.length; i++) {
			if (directInputCheck[i].selected === true) {
				directInputs[i].value = '';
				directInputs[i].style.display = 'none';
			}
		}
				
		// 직접입력 체크 X > select 옵선 초기화
		selector[0].children[0].selected = true;
		selector[1].children[0].selected = true;
		
		// 세부내용, 가격, 시간 초기화
		document.querySelector(".service_detail_input").value = '';
		document.querySelector(".service_price_input").value = '';
		document.querySelector(".service_time_input").value = '';
		
		// 퀵서비스 가격 추가
		if (quickpriceInput.length !== 0) {
			quickpriceInput[0].style.display !== "none" ?
				quickpriceInput[0].style.display = "none" : 
				quickpriceInput[0].style.display = "";
		}

		return;
	}
	
	// 목록이 2개 이상 > 해당 줄 삭제
	document.getElementById(id).remove();
}

//가격 & 배달비 & 소요일자 > 문자열 제거 & 숫자 추출
function refineValue(type, value) {
	switch(type) {
	case "price":
		const price = value.substr(0, value.indexOf("원")).replace(",", "").trim();
		return price;
		break;
	case "quickprice":
		const quickprice = value.substr(1, value.indexOf("원") - 1).replace(",", "").trim();
		return quickprice;
		break;
	case "ete":
		const ete = value.substr(0, value.indexOf("(")).trim();
		return ete;
		break;
	}
}



/* 메뉴 카테고리 모달  */ 
function openCategoryModal() {
	// 모달 visibility
	const display = document.getElementById("category_modal").style.display;
	display === "none" ? 
		document.getElementById("category_modal").style.display = "block" : 
		document.getElementById("category_modal").style.display = "none";
	
}

// checkbox list 생성
function createCategoryList() {
	// 닫기 버튼
	document.getElementById("category-close").addEventListener("click", function(e) {
		document.getElementById("category_modal").style.display = "none";
	})
	
	const allMainCategories = Object.keys(menuCategories).concat(defaultCategory).sort();
	const filtered = allMainCategories.filter((element, index) => allMainCategories.indexOf(element) === index);
	
	// checkbox & label 생성 > Node 추가
	for (let i = 0; i < filtered.length; i++) {
		// random string id
		const randomId = generateRandomString(10);

		// key array
		const userMenu = Object.keys(menuCategories);
		
		// checkbox
		const checkbox = document.createElement("input");		
		checkbox.id = randomId;
		checkbox.name = "mainCategory";
		checkbox.type = "checkbox";
		checkbox.value = filtered[i];
		checkbox.style.display = "none";
		checkbox.checked = userMenu.includes(filtered[i]);

		// label
		const label = document.createElement("label");
		label.htmlFor = randomId;
		label.innerHTML = 
			`<i class="${checkbox.checked ? "fas fa-check-square" : "fas fa-window-close"}"></i>
			${filtered[i]}`; 
		label.className = "category_checkbox_label"; 
		label.onclick = () => checkboxVisibility(randomId);
		
		// 등록된 메뉴 & 등록하지 않은 메뉴 비교 > 체크 
		checkbox.checked ? label.classList.add("category_checked") : label.classList.remove("category_checked");
		
		// label(checkbox) wrapper
		const div = document.createElement("div");
		div.classList.add("category_label_wrapper");
		
		// Node 추가
		label.appendChild(checkbox);
		div.appendChild(label);
		document.getElementById("category-list").appendChild(div);

		// 서브카테고리 삽입
		const subMenus = attachSubCategories(filtered[i]);
		div.appendChild(subMenus);
	}
}


function checkboxVisibility(id) {
	const checkbox = document.getElementById(id);
	
	if (checkbox.checked) {
		checkbox.parentElement.classList.add("category_checked");
		checkbox.parentElement.getElementsByTagName("i")[0].className = "fas fa-check-square";
	}
	else {
		checkbox.parentElement.classList.remove("category_checked");		
		checkbox.parentElement.getElementsByTagName("i")[0].className = "fas fa-window-close";
	}
}

// 서브 메뉴 추가

function attachSubCategories(subCategory) {

	const subMenus = [...menuCategories[subCategory]];
	
	const subMenuContainer = document.createElement("div");
	subMenuContainer.style.display = "flex";
	subMenuContainer.style.margin = "auto";

	if (subMenus.length === 0) {
		const h = document.createElement("h3");
		h.innerHTML = "등록된 메뉴가 없습니다.";
		h.style.color = "red";
		
		subMenuContainer.appendChild(h);
	}
	else {
		for (let i = 0; i < subMenus.length; i++) {
			const randomId = generateRandomString(10);
			
			const checkbox = document.createElement("input");
			checkbox.id = randomId;
			checkbox.name = menuCategories[subCategory];
			checkbox.type = "checkbox";
			checkbox.checked = "checked";
//			checkbox.style.display = "none";
			checkbox.style.marginRight = "5px";
			
			const label = document.createElement("label");
			label.htmlFor = randomId;
			label.classList.add("sub_category_label");
			label.innerHTML = "&nbsp;" + subMenus[i];
			
			const wrapper = document.createElement("div");
			
			label.prepend(checkbox);
			wrapper.appendChild(label);
			subMenuContainer.appendChild(wrapper);
		}
	}
	
	return subMenuContainer;
}



function measureAmount(object) {
	let sum = 0;

	for (let key in object) {
		sum += object[key].length;
	}		
		
	return sum;
}
