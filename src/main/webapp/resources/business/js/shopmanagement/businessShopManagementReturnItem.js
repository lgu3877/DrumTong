// 초기 실행
displayDeliveryOptions()

// 체크 옵션
function displayDeliveryOptions() {	
	switch(bManagement.deliverytype) {
	case "BOTH": 
		checkContent(document.getElementById("agencies"));
		checkContent(document.getElementById("self"));
		checkContent(document.getElementById("visit"));
		break;
	case "AGENCIES": 
		checkContent(document.getElementById("agencies"));
		checkContent(document.getElementById("visit"));
		break;
	case "SELF": 
		checkContent(document.getElementById("self"));
		checkContent(document.getElementById("visit"));
		break;
	case "VISIT": 
		checkContent(document.getElementById("visit"));
		break;
	}
}

// 체크 박스 클릭이벤트 > 체크 옵션 & 아이콘 & 색상 변경
function checkContent(obj) {
	let checkbox = obj.getElementsByClassName("returnOptions")[0];
	let icon = obj.getElementsByTagName("i")[0];
	let flag = checkbox.checked;
		
	// 체크
	if (flag === false) {
		checkbox.setAttribute("checked", "checked");

		checkbox.parentElement.style.backgroundColor = "navy";
		checkbox.parentElement.style.color = "white";
		icon.className = "fas fa-check-square";
	}
	
	// 체크 해제
	else {
		checkbox.removeAttribute("checked");
	
		checkbox.parentElement.style.backgroundColor = "";
		checkbox.parentElement.style.color = "navy";
		icon.className = "fas fa-window-close";
	}
}
