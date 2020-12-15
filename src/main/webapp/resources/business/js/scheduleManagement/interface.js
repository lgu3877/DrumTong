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
		const container = document.getElementsByClassName("checkbox_con")[0];
		
		if (filter === true) {
			container.style.height = "30px";
			for (let i = 0; i < checkboxs.length; i++) {
				checkboxs[i].removeAttribute("disabled");
				checkboxs[i].style.backgroundColor = "#f38181";
			}
		} 
		else {
			container.style.height = "";
			for (let i = 0; i < checkboxs.length; i++) {
				checkboxs[i].setAttribute("disabled", "disabled");
				checkboxInput[i].checked = false;
				checkboxs[i].style.backgroundColor = "inherit";
			}		
		}
	});
}

// 시간 입력 input > 그림자 & 에니메이션 클래스 속성 부여
const timeInput = document.getElementsByClassName("input_time_con")[0].getElementsByTagName("input");

for (let i = 0; i < timeInput.length; i ++) {
	if(timeInput[i].type === "number") timeInput[i].classList.add("shadow");
}

// 시간(1~12) & 분(0~59)
const hourInput = document.getElementsByName("hour");
const minuteInput = document.getElementsByName("minute");

for (let i = 0; i < hourInput.length; i ++) {
	hourInput[i].addEventListener("keyup", function(e) {
		e.preventDefault();
		if (e.target.value <= 0 || e.target.value > 12) e.target.value = ""; 
	})
	minuteInput[i].addEventListener("keyup", function(e) {
		e.preventDefault();
		if (e.target.value < 0 || e.target.value > 59) e.target.value = ""; 
	})
	
}

// 오전 & 오후 선택 옵션
const allRadio = document.getElementsByClassName("time_zone_input");
const allRadioBtn = document.getElementsByClassName("time_zone_btn");

for (let i = 0; i < allRadioBtn.length; i++) {
	allRadioBtn[i].addEventListener("click", function(e) {
		// button > radio 체크 연결
		const radio = e.target.parentElement.getElementsByTagName("input")[0];
		radio.checked = true;
		
		// 버튼 색 기본값으로 변경
		const buttons = e.target.parentElement.parentElement.getElementsByClassName("time_zone_btn");
		for (let i = 0; i < buttons.length; i++) {
			buttons[i].style.backgroundColor = "#95e1d3";
		}
		e.target.style.backgroundColor = "navy";
	})
}

// 입력 초기화
function clearInputs(obj) {
	const form = obj.parentNode.parentNode;	
	const inputs = form.getElementsByClassName("time_input");
	const radios = form.getElementsByClassName("time_zone_input");
	const buttons = form.getElementsByClassName("time_zone_btn");
	
	// input 초기화
	for (let i = 0; i < inputs.length; i++) {
		inputs[i].value = "";
	}

	// radio 초기화
	for (let i = 0; i < radios.length; i++) {
		if (radios[i].checked === true) {
			radios[i].checked = false;
		}
	}
	
	// 버튼 색 초기화
	for (let i = 0; i < buttons.length; i++) {
		buttons[i].style.backgroundColor = "#95e1d3";
	}	
}

// 정기 휴무 일(day) 선택
const selectors = document.getElementsByClassName("day_selector");

for (let i = 0; i < selectors.length; i++) {
	// 체크박스 체크 옵션
	selectors[i].addEventListener("click", function(e) {
		const checkbox = e.target.children[0];
		const button = e.target;
		
		checkbox.checked === false ? 
			checkbox.checked = true : 
			checkbox.checked = false;
		
		checkbox.checked === true ? 
			button.style.backgroundColor = "navy" :	
			button.style.backgroundColor = "#95e1d3";	
	})
}

// 정기 휴일 스타일
const holidayText = document.getElementsByClassName("scheduled_days");

for (let i = 0; i < holidayText.length; i++) {
	// week
	let week = holidayText[i].getElementsByClassName("h_week")[0].innerHTML;
	
	holidayText[i].getElementsByClassName("h_week")[0].innerHTML
		= `[<span class="text_red text_thick">
				${subString(week)}
			</span>]`;
	
	
	// day
	const days = holidayText[i].getElementsByClassName("h_day");
	
	for (let j = 0; j < days.length; j++) {
		let day = days[j].innerHTML;
	
		holidayText[i].getElementsByClassName("h_day")[j].innerHTML
			= `[<span class="text_skyblue text_thick">
					${subString(day)}
				</span>]`;
	
	}
	
	//	const reg = \[(.*?)\];
}

// 문자열 [ ] 내부 text 가져오기
function subString(text) {
	return text.substring(1, text.length - 1);
}


// 정기 휴무 삭제 버튼 이벤트
const deleteBtns = document.getElementsByClassName("h_schedule_delete");

for (let i = 0; i < deleteBtns.length; i++) {
	deleteBtns[i].addEventListener("click", function() {
		const agree = confirm("삭제하시겠습니까?");
	
		// 삭제 > 페이지 reload
		if (agree === true) {
			deleteBtns[i].parentElement.remove();
			
			// DB 작업
			// ...
			
			window.location.reload();
		}
	})
}


