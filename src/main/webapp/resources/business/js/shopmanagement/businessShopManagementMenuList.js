// main toggle
const mainToggle = { }

// quick service toggle
let quickToggle;

// 초기 실행
if(status === "SUCCESS") displayMenu();

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
	
	// menu list 생성
	const container = document.getElementById("posted-service-list");
	
	// main category
	for (let main in list) {
		const mainCon = document.createElement("div");
		const mainContainerId = generateRandomString(10);
		mainCon.className = "menu_main_con";
		mainCon.id = mainContainerId;
		
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
				mainExIcon.innerHTML = '<i class="fas fa-minus-square"></i>'; // 아이콘 변경 > -
				toggleMainCategory(mainContainerId, list[main], main);
			}	
			else {
				mainToggle[main] = false;
				mainExIcon.innerHTML = '<i class="fas fa-plus-square"></i>'; // 아이콘 변경 > +
				document.getElementById(mainContainerId).getElementsByClassName("menu_sub_con")[0].remove();
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
	const subToggle = { };
	
	// script
	const mainWrapper = document.getElementById(id);
	
	// sub container
	const subCon = document.createElement("div");
	const subContainerId = generateRandomString(11);
	subCon.id = subContainerId;
	subCon.className = "menu_sub_con";
	
	// sub contents
	for (let sub in list) {
		// sub toggle
		subToggle[sub] = false;
		
		// wrapper
		const subWrapper = document.createElement("div");
		const subWrapperId = generateRandomString(12);
		subWrapper.className = "menu_sub_wrapper";
		subWrapper.id = subWrapperId;
		
		// sub content container
		const subContentBox = document.createElement("div");
		subContentBox.className = "menu_sub_content";
		
		// icon
		const subExIcon = document.createElement("div");
		subExIcon.className = "menu_sub_icon";
		subExIcon.innerHTML = '<i class="fas fa-plus-square"></i>';
		subExIcon.onclick = () => {
			const isOpened = subToggle[sub];

			if (!isOpened) {
				subExIcon.innerHTML = '<i class="fas fa-minus-square"></i>';
				toggleSubCategory(subWrapperId, list[sub], subToggle, main, sub);
			}
			else {
				subToggle[sub] = false;
				subExIcon.innerHTML = '<i class="fas fa-plus-square"></i>';
				document.getElementById(subContainerId).getElementsByClassName("menu_detail_con")[0].remove();
			}
		}
		
		// title
		const subTitle = document.createElement("div");
		subTitle.className = "menu_sub_title";
		subTitle.innerHTML = sub;
		
		// total number of services
		const subAmount = document.createElement("div");
		subAmount.className = "menu_sub_amount"
		subAmount.innerHTML = list[sub].length;
		
		subContentBox.appendChild(subExIcon);
		subContentBox.appendChild(subTitle);
		subContentBox.appendChild(subAmount);
		subWrapper.appendChild(subContentBox);

		subCon.appendChild(subWrapper);
		mainWrapper.appendChild(subCon)
	}
}

// 서비스 메뉴 > 리스트 > 클릭 이벤트(서브 > 디테일)
function toggleSubCategory(id, list, subToggle, main, sub) {
	// toggle
	subToggle[sub] = true;
	
	// script
	const subWrapper = document.getElementById(id);	
	
	// detail container
	const detailCon = document.createElement("div");
	detailCon.className = "menu_detail_con";
	
	for (let item = 0; item < list.length; item++) {
		// wrapper
		const detailWrapper = document.createElement("div");
		const detailWrapperId = generateRandomString(11);
		detailWrapper.id = document.createElement("div");;
		detailWrapper.className = "menu_detail_wrapper";
		
		// icon
		const detailExIcon = document.createElement("div");
		detailExIcon.className = "menu_detail_icon";
		detailExIcon.innerHTML = '<i class="fas fa-bars"></i>';
		
		// title
		const detailInfo = document.createElement("div");
		detailInfo.className = "menu_detail_info_con";
		detailInfo.id = list[item].estid; // estid
		
			// detail info
			const serviceName = document.createElement("div");
			serviceName.innerHTML = "<span class='highlight'>" + list[item].name + "</span>"; // name
			
			const servicePrice = document.createElement("div");
			servicePrice.innerHTML = "<span class='highlight'>" + insertComma(list[item].price.toString()) + "</span>(원)"; // price
			
			const serviceTime = document.createElement("div");
			serviceTime.innerHTML = "<span class='highlight'>" + list[item].ete + "</span>(일)"; // ete
		
			detailInfo.appendChild(serviceName);
			detailInfo.appendChild(servicePrice);
			detailInfo.appendChild(serviceTime);
		
		// total number of services
		const detailIcon = document.createElement("div");
		detailIcon.className = "menu_detail_option"
		detailIcon.innerHTML = '<i class="far fa-edit"></i>';
		detailIcon.onclick = () => openMenuModifyModal(main, sub, list[item]); // 메뉴 수정 Modal
		
		detailWrapper.appendChild(detailExIcon);
		detailWrapper.appendChild(detailInfo);
		detailWrapper.appendChild(detailIcon);
		
		detailCon.appendChild(detailWrapper);
		subWrapper.appendChild(detailCon);
	}
}


// 서비스 수정 모달 열기
function openMenuModifyModal(main, sub, info) {
	const modal = document.getElementById("modify-menu-modal");
	
	const isOpened = modal.style.display === "none" ? false : true;
	
	// 모달 열기
	if (!isOpened) {
		// object 
		const service = {
			maincategory : main,
			subcategory : sub,
			estid : info.estid,
			name : info.name,
			ete : info.ete,
			price: info.price,
			quickprice: info.quickprice || 0
		};
		
		modal.style.display = "block";
		
		// 모달 박스
		const container = document.createElement("div");
		container.className = "modify_menu_modal_content form";
		
			// 닫기 버튼
			const closeBtn = document.createElement("div");
			closeBtn.className = "modify_menu_modal_close";
			closeBtn.innerHTML = '<i class="fas fa-times"></i>';
		
			// 닫기 버튼 이벤트
			closeBtn.onclick = () => {
				document.getElementById('modify-menu-modal').style.display = "none";
		    	document.getElementById('modify-menu-modal').innerHTML = "";
			}
			
			// form
			const form = document.createElement("div");
			form.className = "modify_menu_modal_form";
			
				// title
				const formTitle = document.createElement("div");
				formTitle.className = "modify_menu_modal_title";
				formTitle.innerHTML = "서비스를 수정할 수 있습니다.";
				
				// main category
				const mainCon = document.createElement("div");
				mainCon.className = "modify_menu_modal_input_con";
				
					// selector id (main & sub)
					const mainSelectorId = generateRandomString(7);
					const subSelectorId = generateRandomString(8);
					
					// main selector title
					const mainSelectorTitle = document.createElement("div"); 
					mainSelectorTitle.className = "modify_menu_modal_input_title";
					mainSelectorTitle.innerHTML = "서비스 분류*";
				
					// main selector
					const mainSelector = document.createElement("select");
					mainSelector.id = mainSelectorId;
					mainSelector.className = "modify_menu_modal_selector";
					mainSelector.name = "maincategory";
					
					// selector 이벤트 > change 
					mainSelector.addEventListener("change", (e) => {
						clearSubOption(subSelectorId);
						populateSubOptions(e.target.value, subSelectorId, true);
						service.maincategory = e.target.value;
					});
											
					// 추가
					mainCon.appendChild(mainSelectorTitle);
					mainCon.appendChild(mainSelector);
					
					
				// sub category
				const subCon = document.createElement("div");
				subCon.className = "modify_menu_modal_input_con";
					
					const subSelectorTitle = document.createElement("div"); 
					subSelectorTitle.className = "modify_menu_modal_input_title";
					subSelectorTitle.innerHTML = "서비스 세부 분류*";
					
					const subSelector = document.createElement("select");
					subSelector.className = "modify_menu_modal_selector";
					subSelector.name = "subcategory";
					subSelector.id = subSelectorId;
					
					// selector 이벤트 > change
					subSelector.onchange = (e) => {
						selectOption(subSelector, e.target.value);
						service.subcategory = e.target.value;
					} 
					
					// 추가
					subCon.appendChild(subSelectorTitle);
					subCon.appendChild(subSelector);
					
					
				// service name 
				const nameCon = document.createElement("div");
				nameCon.className = "modify_menu_modal_input_con";
				
					const nameInputTitle = document.createElement("div"); 
					nameInputTitle.className = "modify_menu_modal_input_title";
					nameInputTitle.innerHTML = "서비스 이름*";
					
					const nameInput = document.createElement("input");
					nameInput.className = "modify_menu_modal_input";
					nameInput.name = "name";
					nameInput.value = service.name;
					
					nameInput.onchange = (e) => {
						// 정규식 > service > name
						const regex = /^[가-힣]*$/;
						
						if (regex.test(e.target.value)) {
							nameInput.classList.remove("invalid");
							service.name = e.target.value;
						}
					
						else {
							nameInput.classList.add("invalid");							
							service.name = "";
						}
					}
					
					// 추가
					nameCon.appendChild(nameInputTitle);
					nameCon.appendChild(nameInput);
				
					
				// service price
				const priceCon = document.createElement("div");
				priceCon.className = "modify_menu_modal_input_con";
					
					const priceInputTitle = document.createElement("div"); 
					priceInputTitle.className = "modify_menu_modal_input_title";
					priceInputTitle.innerHTML = "가격(원)*";
					
					const priceInput = document.createElement("input");
					priceInput.className = "modify_menu_modal_input";
					priceInput.name = "price";
					priceInput.value = insertComma(service.price.toString());
					
					// 콤마 자동 삽입
					priceInput.onchange = (e) => {
						
						// 정규식 > service > price
						const regex = /^[0-9]*$/;
						
						if (regex.test(e.target.value)) {
							priceInput.classList.remove("invalid");
							e.target.value = insertComma(e.target.value.replace(",", ""));
							service.price = e.target.value; 
						} 
						
						else {
							priceInput.classList.add("invalid");
							e.target.value = insertComma(e.target.value.replace(",", ""));
							service.price = "";
						}
					}
					
					// 추가
					priceCon.appendChild(priceInputTitle);
					priceCon.appendChild(priceInput);

					
				// service price
				const quickpriceCon = document.createElement("div");
				quickpriceCon.className = "modify_menu_modal_input_con";
					
					const quickpriceInputTitle = document.createElement("div"); 
					quickpriceInputTitle.className = "modify_menu_modal_input_title";
					quickpriceInputTitle.classList.add("toggle");					
					quickpriceInputTitle.innerHTML = '<div class="font_large">퀵 서비스 요금(원)</div>';
					
						// quick price 활성화 버튼
						const quickToggleIcon = document.createElement("div");
						quickToggleIcon.style.margin = "auto 0px";
						
						quickToggle = !service.quickprice || service.quickprice === "" || service.quickprice === 0 ?
							true : false;
						
						if (quickToggle) {
							quickToggleIcon.innerHTML = '<i class="fas fa-toggle-off" onclick="activateQuick(this)"></i>'; // off
						}
						else {
							quickToggleIcon.innerHTML = '<i class="fas fa-toggle-on" onclick="activateQuick(this)"></i>'; // on						
						}
					
					
					const quickpriceInput = document.createElement("input");
					quickpriceInput.className = "modify_menu_modal_input";
					quickpriceInput.id = "quickprice-modal";
					quickpriceInput.name = "quickprice";
					quickpriceInput.placeholder = "퀵 서비스 요금 입력";
					quickpriceInput.disabled = quickToggle ? "disabled" : ""; // input 활성화 & 비활성화
					quickpriceInput.value = insertComma(service.quickprice.toString());
					
					// 콤마 자동 삽입
					quickpriceInput.onchange = (e) => {
						
						// 정규식 > service > quickprice
						const regex = /^[0-9]*$/;
						
						if (regex.test(e.target.value)) {
							e.target.value === "" ? 
									e.target.value = 0 :
									e.target.value = insertComma(e.target.value.replace(",", ""));
							
							quickpriceInput.classList.remove("invalid");
							service.quickprice = e.target.value;
						} 
						
						else {
							e.target.value === "" ? 
									e.target.value = 0 :
									e.target.value = insertComma(e.target.value.replace(",", ""));
							
							quickpriceInput.classList.add("invalid");
							service.quickprice = "";
						}
					}
					
					// 추가
					quickpriceInputTitle.appendChild(quickToggleIcon);
					quickpriceCon.appendChild(quickpriceInputTitle);
					quickpriceCon.appendChild(quickpriceInput);
					
					
				// service name 
				const timeCon = document.createElement("div");
				timeCon.className = "modify_menu_modal_input_con";
					
					const timeInputTitle = document.createElement("div"); 
					timeInputTitle.className = "modify_menu_modal_input_title";
					timeInputTitle.innerHTML = "소요시간(일)*";
					
					const timeInput = document.createElement("input");
					timeInput.className = "modify_menu_modal_input";
					timeInput.name = "ete";
					timeInput.value = service.ete;
					
					timeInput.onchange = (e) => {
						// 정규식 > service > ete
						const regex = /^[0-9]*$/;
						
						if (regex.test(e.target.value)) {
							timeInput.classList.remove("invalid");
							service.ete = e.target.value;
						} 
						
						else {
							timeInput.classList.add("invalid");
							service.ete = "";
						}
					}
					
					// 추가
					timeCon.appendChild(timeInputTitle);
					timeCon.appendChild(timeInput);
					
					
				// 추가
				form.appendChild(formTitle);
				form.appendChild(mainCon);
				form.appendChild(subCon);
				form.appendChild(nameCon);
				form.appendChild(priceCon);
				form.appendChild(quickpriceCon);
				form.appendChild(timeCon);
		
			// Button Container
			const btnContainer = document.createElement("div");
			btnContainer.className = "modify_menu_modal_btn_container";
				
				// 삭제 버튼
				const removeBtn = document.createElement("button");
				removeBtn.className = "modify_menu_modal_btn";
				removeBtn.classList.add("remove");
				removeBtn.innerHTML = "메뉴삭제";
				
				// 삭제 버튼 이벤트
				removeBtn.onclick = () => { 
					console.log(service.estid);
					if (removeMenu(service.estid)) {
						document.getElementById("posted-service-list").innerHTML = ""; // 초기화
						displayMenu(); // 메뉴 재생성
					}
					else {
						alert("존재하지 않는 서비스입니다. 새로고침이 필요합니다.");
					}
				}
	
				// 변경 버튼
				const confirmBtn = document.createElement("button");
				confirmBtn.className = "modify_menu_modal_btn";
				confirmBtn.classList.add("confirm");
				confirmBtn.innerHTML = "변경하기";
				
				// 변경 버튼 이벤트
				confirmBtn.onclick = () => {
					if (updateMenu(service)) {
						document.getElementById("posted-service-list").innerHTML = ""; // 초기화
						displayMenu(); // 메뉴 재생성				
					}
				}

				
				btnContainer.appendChild(removeBtn);
				btnContainer.appendChild(confirmBtn);
				
			
			container.appendChild(closeBtn);
			container.appendChild(form);
			container.appendChild(btnContainer);
		
		modal.appendChild(container);
		
		
		// main options 생성 > 선택 > sub options 생성
		createOptions(mainSelector, true);
		
		if (selectOption(mainSelector, service.maincategory)) {
			populateSubOptions(service.maincategory, subSelectorId, true);
			selectOption(subSelector, service.subcategory);
		} 
		
	}
	// 닫기
	else modal.style.display = "none";
}


// 서비스 수정 모달 닫기 (모달 밖 클릭)
window.onclick = function(e) {
    if (e.target == document.getElementById('modify-menu-modal')) {
    	 document.getElementById('modify-menu-modal').style.display = "none";
    	 document.getElementById('modify-menu-modal').innerHTML = "";
    }
}

// main selector 선택 (default)
function selectOption(selector, value) {
	const options = selector.getElementsByTagName("option");
	
	for (let i = 0; i < options.length; i++) {
		if (options[i].value === value) {
			options[i].selected = true;
			return true;
		}
	}
	return false;
}


// 메인 옵션 변경 > 초기화
function clearSubOption(subCategoryId) {
	const subOptions = document.getElementById(subCategoryId).children;

	for (let i = 0; i < subOptions.length; i++) {
		subOptions[0].remove();
	}
}


// quick 활성화
function activateQuick(icon) {
	// activate
	if (quickToggle) {
		icon.className = "fas fa-toggle-on";
		document.getElementById("quickprice-modal").disabled = "";
		document.getElementById("quickprice-modal").value = "";
		document.getElementById("quickprice-modal").focus();
	}
	
	// inactivate
	else {
		icon.className = "fas fa-toggle-off";
		document.getElementById("quickprice-modal").value = "0";
		document.getElementById("quickprice-modal").disabled = "disabled";
	}

	quickToggle = !quickToggle;
}


// 서비스 수 계산
function measureAmount(object) {
	let sum = 0;
	for (let key in object) {
		sum += object[key].length;
	}		
	return sum;
}
