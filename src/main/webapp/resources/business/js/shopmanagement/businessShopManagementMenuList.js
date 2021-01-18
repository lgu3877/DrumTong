// 상품 추가 버튼
const addItemBtn = document.getElementById('add-item-btn');
// 상품 추가 완료 버튼
const updateItemBtn = document.getElementById("update-item-btn");
// 줄을 추가할 컨테이너
const itemlist = document.getElementById('add-item-list')
// 입력 줄 전체
let singleList = document.querySelector('.single_item_selector');
// 메뉴 테이블 수정 버튼
const modifyListBtn = document.getElementById("update-list-btn");
// 테이블 내부 행 삭제 버튼
const deleteBtn = document.getElementsByClassName("delete_item");
// 배달 서비스 버튼
const deliveryBtn = document.getElementById("delivery-btn");
const toggleIcon = document.getElementById("delivery-icon");
let deliveryToggle = false;


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
	
	const selectorRandomId = generateRandomString(11); 
	const directRandomId = generateRandomString(12);
	
		const mainSelector = document.createElement("select");
		mainSelector.id = selectorRandomId;
		mainSelector.className = "service_selector";
		mainSelector.name = "maincategory";
		mainSelector.addEventListener("change", (e) => selectOption(e, directRandomId));
//		mainSelector.onchange = "selectOption(this)";
		
		
		const mainSelectorDirectInput = document.createElement("input");
		mainSelectorDirectInput.id = directRandomId;
		mainSelectorDirectInput.type = "text";
		mainSelectorDirectInput.className = "direct_type_input";
		mainSelectorDirectInput.name = "maincategory";
		mainSelectorDirectInput.placeholder = "서비스 입력";
		mainSelectorDirectInput.style.display = "none";
	
			// 추가
			firstInputCon.appendChild(mainSelector);
			firstInputCon.appendChild(mainSelectorDirectInput);
			
			createOptions(mainSelector); // 하위 선택 항목 생성 
	
			
			
	// sub service category selector (두번째)
	const secondInputCon = document.createElement("div");
	secondInputCon.className = "second_item_prop";
	
	const subSelectorRandomId = generateRandomString(12);
	
		const subSelector = document.createElement("select");
		subSelector.id = subSelectorRandomId;
		subSelector.className = "service_selector";
		subSelector.name = "subcategory"
		subSelector.addEventListener("chnage", (e) => selectOption(e));
	
		const subDirectInput = document.createElement("input");
		subDirectInput.type = "text";
		subDirectInput.name = "subcategory";
		subDirectInput.className = "direct_type_input";
		subDirectInput.placeholder = "서비스 입력";
		subDirectInput.style.display = "none;";
		
		
		// 추가
		secondInputCon.appendChild(subSelector);
		secondInputCon.appendChild(subDirectInput);

	const thirdInputCon = document.createElement("div");
	
	const forthInputCon = document.createElement("div");
	
	const fifthInputCon = document.createElement("div");
	
	const cancleBtnCon = document.createElement("div");
	
	// 추가(appending)
	singleServiceInputCon.appendChild(firstInputCon);
	singleServiceInputCon.appendChild(secondInputCon);
	
	singleServiceInputCon.appendChild(thirdInputCon);
	singleServiceInputCon.appendChild(forthInputCon);
	singleServiceInputCon.appendChild(fifthInputCon);
	singleServiceInputCon.appendChild(cancleBtnCon);
	
	container.appendChild(singleServiceInputCon);
	
	
}


// 메인 옵션 생성
function createOptions(mainSelector) {
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
	option = document.createElement("option");
	option.value = "selectedDirect";
	option.className = "selectedDirect";
	option.innerHTML = "직접입력";
	option.style.fontWeight = "600";
	
	mainSelector.appendChild(option); // 추가
}


//select > option 선택
function selectOption(e, directInputId, subCategoryId) {
	console.log(e.target.id);
	const obj = e.target;
		
	// 직접 입력 선택
	if(obj.value === 'selectedDirect') {
		obj.parentNode.querySelector('.direct_type_input').style.display = '';
		
		clearSubOptions();
		
		// if > 하위 항목 직접 입력 시
		
		// 직접입력
		const option = document.createElement("option");
		option.value = "selectedDirect";
		option.className = "selectedDirect";
		option.innerHTML = "직접입력";
		option.style.fontWeight = "600";
		
		document.getElementById("sub-category").appendChild(option);
	}
	
	// 그 외 값 선택
	else {
		obj.parentNode.querySelector('.direct_type_input').style.display = 'none';
		obj.parentNode.querySelector('.direct_type_input').value = '';
		
		// main > sub 카테고리 생성
		if (obj.name === "maincategory") {
			clearSubOptions();
			populateSubOptions(obj.value);
			
			document.getElementsByClassName("direct_type_input")[1].style.display = "none";
		} 
	}
}


// 서브 옵션 변경 > 초기화
function clearSubOptions() {
	const subOptions = document.getElementsByClassName("sub_option");
	const directOption = document.getElementsByClassName("selectedDirect")[1];
	directOption !== undefined ? directOption.remove() : null;
	
	const count = subOptions.length;
	if (subOptions !== 0) {
		for (let i = 0; i < count; i++) {
			subOptions[0].remove();
		}		
	}
}

// 서브 옵션 생성
function populateSubOptions(key) {
	const subSelect = document.getElementById("sub-category");
	
	// 하부 카테고리
	const sotredMenu = menuCategories[key].sort(); 	// value 정렬	
	for (let i = 0; i < sotredMenu.length; i++) {
		option = document.createElement("option");
		option.className = "sub_option";
		option.innerHTML = menuCategories[key][i];
		option.value = menuCategories[key][i];
		
		subSelect.appendChild(option);
	}
	
	// 직접입력
	option = document.createElement("option");
	option.value = "selectedDirect";
	option.className = "selectedDirect";
	option.innerHTML = "직접입력";
	option.style.fontWeight = "600";
	
	subSelect.appendChild(option);
	
	// default option
	document.getElementById("sub-category-default").selected = true;
}


// 배달 서비스 활성화 이벤트
function activateVisualization() {
	const itemInputList = document.getElementById("add-item-list");
	const priceCon = itemInputList.getElementsByClassName("forth_item_prop");		
	deliveryToggle = !deliveryToggle;

	if(deliveryToggle === true) {
		const priceCon = document.getElementsByClassName("forth_item_prop");	
		deliveryBtn.style.backgroundColor = "navy";
		// 아이콘 변경(활성화)
		toggleIcon.className = "fas fa-toggle-on";
		
		
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
		deliveryBtn.style.backgroundColor = "#bedcfa";
		// 아이콘 변경(비활성화)
		toggleIcon.className = "fas fa-toggle-off";
		
		// input(quickprice) 삭제
		for (let i = 0; i < priceCon.length; i++) {
			if (priceCon[i].children.length !== 1) {
				priceCon[i].removeChild(priceCon[i].children[1]);
			}
		}	
	}
}

// 추가 - 클릭 이벤트(1줄씩 추가)
addItemBtn.addEventListener('click', function() {
	const copiedList = singleList.cloneNode(true);
	itemlist.appendChild(copiedList);

	console.log(copiedList.getElementsByClassName("main-category-default")[0]);
	
	document.getElementById("main-category").getElessmentsByClassName("main-category-default")[0].setAttribute("selected", true);

});


// 메뉴 수정 버튼(th & td > input + 삭제 버튼)
modifyListBtn.addEventListener('click', function() {
	
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
				tr[i].children[j].style.width = "13%";
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
				tr[i].children[j].style.width = "13%";
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
				tr[i].children[j].style.width = "43%";
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
				tr[i].children[j].style.width = "10%";
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
				tr[i].children[j].style.width = "10%";
				tr[i].children[j].style.padding = "5px";
				
				timeInput.type = "text";
				timeInput.className = "service_detail_input";
				timeInput.placeholder = 
					tr[i].children[j].innerHTML ? "초기값(DB)" : "소요시간";
				
				tr[i].children[j].appendChild(timeInput);
				
				break;
			}
			
			let value = tr[i].children[j].innerHTML;
//			console.log(value);
			
		}
		
		
		tr[i].appendChild(td);						
		
	}
});

// 상품 리스트 삭제
function deleteList(tr) {
	const answer = confirm("해당 목록을 삭제하시겠습니까?");
	if (answer === true ) {
		tr.remove();		
	}
}

// 취소 버튼
function dismissInput(entireNode) {
	// 목록이 하나 남았을 때
	if (itemlist.children.length === 1) {
		
		const directInputs = document.querySelectorAll(".direct_type_input");
		const selector = document.querySelectorAll(".service_selector");
		const directInputCheck = document.querySelectorAll(".selectedDirect");
		
		// 직접입력 체크 O > input 제거 & 값 초기화
		if(directInputCheck[0].selected === true || directInputCheck[1].selected === true) {
			directInputs[0].value = '';
			directInputs[1].value = '';
			directInputs[0].style.display = 'none';
			directInputs[1].style.display = 'none';
		    
		}
		
		// 직접입력 체크 X > select 옵선 초기화
		selector[0].children[0].selected = true;
		selector[1].children[0].selected = true;
		
		// 세부내용, 가격, 시간 초기화
		document.querySelector(".service_detail_input").value = '';
		document.querySelector(".service_price_input").value = '';
		document.querySelector(".service_time_input").value = '';

		return;
	}
	
	// 목록이 2개 이상 > 해당 줄 삭제
	entireNode.remove();
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
	
	// checkbox & label 생성 > Node 추가
	for (let i = 0; i < defaultCategory.length; i++) {
		// random string id
		const randomId = generateRandomString(10);

		// key array
		const userMenu = Object.keys(menuCategories);
		
		// checkbox
		const checkbox = document.createElement("input");		
		checkbox.id = randomId;
		checkbox.name = "mainCategory";
		checkbox.type = "checkbox";
		checkbox.value = defaultCategory[i];
		checkbox.style.display = "none";
		checkbox.checked = userMenu.includes(defaultCategory[i]);

		// label
		const label = document.createElement("label");
		label.htmlFor = randomId;
		label.innerHTML = 
			`<i class="${checkbox.checked ? "fas fa-check-square" : "fas fa-window-close"}"></i>
			${defaultCategory[i]}`; 
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
		const subMenus = attachSubCategories(defaultCategory[i]);
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

function attachSubCategories(subCategory) {
	
//	const subMenus = [...menuCategories[subCategory]];
	const subMenus = ["service1", "service2", "service3", "service4"];
//	console.log(subMenus);
	
	
	const subMenuContainer = document.createElement("div");
	subMenuContainer.style.display = "flex";
	
	for (let i = 0; i < subMenus.length; i++) {
		const randomId = generateRandomString(10);
		
		const checkbox = document.createElement("input");
		checkbox.id = randomId;
		checkbox.name = menuCategories[subCategory];
		checkbox.type = "checkbox";
		checkbox.selected = true;
		
		const label = document.createElement("label");
		label.htmlFor = randomId;
		label.classList.add("sub_category_label");
		label.innerHTML = subMenus[i];
		
		const wrapper = document.createElement("div");
		
		label.prepend(checkbox);
		wrapper.appendChild(label);
		subMenuContainer.appendChild(wrapper);
	}
	
	return subMenuContainer;
}


// 서비스 등록 관련 초기 실행
createAddService();
//createOptions(menuCategories); // select > option 드랍다운 동적 구현
createCategoryList(); // 메뉴수정 관련 Modal
