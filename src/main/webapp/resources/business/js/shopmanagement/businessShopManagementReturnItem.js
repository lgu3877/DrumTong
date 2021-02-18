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
	
	checkBoth();
	
}

// [건욱] 배달 여부에 따라 필터를 씌웁니다.
// 방문 수령(VISIT)를 제외한 나머지 체크박스 중 하나라도 체크되어 있으면 filter를 none해주고
// 방문 수령(VISIT)만 체크되어있다면 배달지역관리도 필요가없어지기 때문에 filter 효과를 주어서 해당 값에 접근하지 못하게 막아주어야합니다.
function checkBoth() {
	let agencies = document.getElementsByClassName("returnOptions")[0];
	let self = document.getElementsByClassName("returnOptions")[1];
	let deliveryMenu = document.getElementsByClassName("delivery_menu")[0];
	let accessDenined = document.getElementById('accessDenied');
	console.log('실행');
	
	// 배달 지역 관리 활성화
	if(agencies.checked || self.checked ) {
//		deliveryMenu.style = "filter : none";
		for (let i = 0 ; i < deliveryMenu.children.length; i++ ) 
			deliveryMenu.children[i].style.filter = "none";
		
		accessDenined.style.display = "none";
		
	}
	// 배달 지역관리 비활성화
	else if(agencies.checked === false && self.checked === false) {
//		deliveryMenu.style = "filter: blur(5px)";
		
		for (let i = 0 ; i < deliveryMenu.children.length; i++ )
			deliveryMenu.children[i].style.filter = "blur(5px)";	
		
		accessDenined.style.display = "";
		
		
		// 사이즈가 유동적으로 변하기 때문에 그에 맞춰서 높이를 변경시켜주는 코드입니다.
		let parentHeight = document.getElementsByClassName('delivery_menu')[0].offsetHeight;
		let parentWidth = document.getElementsByClassName('delivery_menu')[0].offsetWidth;
		document.getElementById('accessDenied').style.height = (parentHeight/2) +'px';
		document.getElementById('accessDenied').style.width = parentWidth +'px';
		
		parentWidth
		let marginValue = parentHeight / 4;
		document.getElementById('accessDenied').style.paddingTop = marginValue +'px';
		document.getElementById('accessDenied').style.paddingBottom = marginValue +'px';
	
		console.log(parentHeight);
	
		
	}
	accessDenined.style.filter = "none";
}