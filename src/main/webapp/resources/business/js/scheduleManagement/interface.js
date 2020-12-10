// checkbox 체크 옵션
function checkOption(id) {
	const checkbox = document.getElementById(id);
	checkbox.checked === false ? 
		document.getElementById(id).checked = true : 
		document.getElementById(id).checked = false;
	
	const button = document.getElementById(id + "-btn");
	if(checkbox.checked === true){
		button.style.backgroundColor = "navy";		
//		button.innerHTML = "<i class=\"fas fa-check-square\"></i>" + button.innerHTML;
	} 
	else {
		button.style.backgroundColor = "#f38181";	
//		button.innerHTML = "<i class=\"fas fa-times\"></i>" + button.innerHTML;
	}
}


// radio 체크 옵션
function radioSelect(id) {
	document.getElementById(id).checked = true;

	switch(id) {
	case "week-only":
		document.getElementById(id + "-btn").style.backgroundColor = "navy";
		document.getElementById("weekend-also-btn").style.backgroundColor = "#f38181";	
		break;
	case "weekend-also":
		document.getElementById(id + "-btn").style.backgroundColor = "navy";
		document.getElementById("week-only-btn").style.backgroundColor = "#f38181";
		break;
	}
}


// radio 버튼 이벤트 생성	>	checkbox disabled 속성 변경
const radioBtns = document.getElementsByClassName("radioBtn");

for (let i = 0; i < radioBtns.length; i++) {
	radioBtns[i].addEventListener('click', () => {
	
		const filter = document.getElementById('weekend-also').checked;
		const checkboxs = document.getElementsByClassName("checkBtn");
		const checkboxInput = document.getElementsByClassName("checkbox_con")[0].getElementsByTagName("input");
		
		if (filter === true) {
			for (let i = 0; i < checkboxs.length; i++) {
				checkboxs[i].removeAttribute("disabled");
				checkboxs[i].style.backgroundColor = "#f38181";
			}
		} 
		else {
			for (let i = 0; i < checkboxs.length; i++) {
				checkboxs[i].setAttribute("disabled", "disabled");
				checkboxInput[i].checked = false;
				checkboxs[i].style.backgroundColor = "inherit";
			}		
		}
	});
}

// 시간 입력 input > 클래스 속성 부여
const timeInput = document.getElementsByClassName("time_range")[0].getElementsByTagName("input");
console.log(timeInput);
console.log(timeInput.length);


for (let i = 0; i < timeInput.length; i ++) {
	if(timeInput[i].type === "number") timeInput[i].classList.add("shadow");
	console.log(timeInput[i].type);
}