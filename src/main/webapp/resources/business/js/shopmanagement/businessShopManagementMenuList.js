// main toggle
const mainToggle = { }

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
	console.log(mainToggle);
	
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
				toggleSubCategory(subWrapperId, list[sub], subToggle, sub);
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
function toggleSubCategory(id, list, subToggle, sub) {
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
			serviceName.innerHTML = list[item].name; // name
			
			const servicePrice = document.createElement("div");
			servicePrice.innerHTML = list[item].price + " (원)"; // price
			
			const serviceTime = document.createElement("div");
			serviceTime.innerHTML = list[item].ete + " (일)"; // ete
		
			detailInfo.appendChild(serviceName);
			detailInfo.appendChild(servicePrice);
			detailInfo.appendChild(serviceTime);
		
		// total number of services
		const detailIcon = document.createElement("div");
		detailIcon.className = "menu_detail_option"
		detailIcon.innerHTML = '<i class="far fa-edit"></i>';
		detailIcon.onclick = () => openMenuModifyModal(list[item]); // 메뉴 수정 Modal
		
		detailWrapper.appendChild(detailExIcon);
		detailWrapper.appendChild(detailInfo);
		detailWrapper.appendChild(detailIcon);
		
		detailCon.appendChild(detailWrapper);
		subWrapper.appendChild(detailCon);
	}
}


// 서비스 수정 모달 열기
function openMenuModifyModal(service) {
	const modal = document.getElementById("modify-menu-modal");
	console.log(service);
	
	const isOpened = modal.style.display === "none" ? false : true;
	console.log(isOpened);
	
	
	// 모달 열기
	if (!isOpened) {
		// object 
		const info = { 
			estid : service.estid	
		};
		
		modal.style.display = "block";
		
		// 모달 박스
		const container = document.createElement("div");
		container.className = "modify_menu_modal_content form";
		
			// 닫기 버튼
			const closeBtn = document.createElement("div");
			closeBtn.className = "modify_menu_modal_close";
			closeBtn.innerHTML = '<i class="fas fa-times"></i>';
		
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
				
					const mainSelectorTitle = document.createElement("div"); 
					mainSelectorTitle.className = "modify_menu_modal_input_title";
					mainSelectorTitle.innerHTML = "서비스 분류";
				
					const mainSelector = document.createElement("select");
					mainSelector.className = "modify_menu_modal_selector";
					mainSelector.name = "maincategory";
					
					// 추가
					mainCon.appendChild(mainSelectorTitle);
					mainCon.appendChild(mainSelector);
					
					
				// sub category
				const subCon = document.createElement("div");
				subCon.className = "modify_menu_modal_input_con";
					
					const subSelectorTitle = document.createElement("div"); 
					subSelectorTitle.className = "modify_menu_modal_input_title";
					subSelectorTitle.innerHTML = "서비스 세부 분류";
					
					const subSelector = document.createElement("select");
					subSelector.className = "modify_menu_modal_selector";
					subSelector.name = "subcategory";
					
					// 추가
					subCon.appendChild(subSelectorTitle);
					subCon.appendChild(subSelector);
					
					
					
				// 추가
				form.appendChild(formTitle);
				form.appendChild(mainCon);
				form.appendChild(subCon);
		
			// 변경 버튼
			const confirmBtn = document.createElement("button");
			confirmBtn.className = "modify_menu_modal_btn";
			confirmBtn.innerHTML = "변경하기";
			
			confirmBtn.onclick = () => { // 변경하기 버튼
				console.log("123");
				// updateService(info);
				displayMenu();
			}
			
			container.appendChild(closeBtn);
			container.appendChild(form);
			container.appendChild(confirmBtn);
		
		modal.appendChild(container);
	}
	// 닫기
	else modal.style.display = "none";
}


// 서비스 수정 모달 닫기 (모달 밖 클릭)
window.onclick = function(e) {
    if (e.target ==  document.getElementById('modify-menu-modal')) {
    	 document.getElementById('modify-menu-modal').style.display = "none";
    }
}
	
// 서비스 수 계산
function measureAmount(object) {

	let sum = 0;

	for (let key in object) {
		sum += object[key].length;
	}		
		
	return sum;
}
