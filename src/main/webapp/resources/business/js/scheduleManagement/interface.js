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

// 임시 휴무 기간 선택 input > min & max default 설정
const startDay = document.getElementById("startDay");
const endDay = document.getElementById("endDay");

const thisYear = new Date().getFullYear();
const thisMonth = new Date().getMonth() + 1;
const thisDate = new Date().getDate();

const minDate = `${thisYear}-${thisMonth}-${thisDate}`;
const maxDate = `${thisYear + 3}-${thisMonth}-${thisDate}`;

startDay.setAttribute("min", minDate);
startDay.setAttribute("max", maxDate);

endDay.setAttribute("min", minDate);
endDay.setAttribute("max", maxDate);


// 임시 휴무 기간 input 유효성 검사
endDay.addEventListener("change", function(e) {
	if (startDay.value !== null) {		
		const inputDate = e.target.value;
		console.log(inputDate);
		console.log(startDay.value);
		
		inputDate < startDay.value ? 
			document.getElementById("date-error-msg").innerHTML = "시작일보다 전의 일자를 입력하셨습니다. 다시 입력해주세요." :
			null;	

		inputDate >= startDay.value ? 
			document.getElementById("date-error-msg").innerHTML = "" : 
			null;
	}
})



// 임시 휴무 일정 인터페이스

// 임시 휴무 수정 취소 버튼 숨기기
const cancleIcons = document.getElementsByClassName("cancle_icon_con");
const completeIcons = document.getElementsByClassName("complete_icon_con");
for (let i = 0; i < cancleIcons.length; i++) {
	cancleIcons[i].style.display = "none";
	cancleIcons[i].style.color = "red";
	completeIcons[i].style.display = "none";
	completeIcons[i].style.color = "lawngreen";
}

// 임시 휴무 리스트 수정 버튼
function updateSchedule(obj) {
	const list = obj.parentElement.parentElement;
	
	const viewCon = list.getElementsByClassName("period_view_default")[0];
	const updateIcon = list.getElementsByClassName("update_icon_con")[0];
	const viewReasonCon = list.getElementsByClassName("reason_view_default")[0];
		
	const timeInputCon = list.getElementsByClassName("period_view_input")[0];
	const inputReasonCon = list.getElementsByClassName("reason_view_input")[0];
	const cancleIcon = list.getElementsByClassName("cancle_icon_con")[0];
	const completeIcon = list.getElementsByClassName("complete_icon_con")[0]
	
	viewCon.style.display = "none";
	viewReasonCon.style.display = "none"; 
	updateIcon.style.display = "none";

	timeInputCon.style.display = "flex";
	inputReasonCon.style.display = "block";
	cancleIcon.style.display = "block";
	completeIcon.style.display = "block";
}

// 임시 휴무 리스트 수정 취소 버튼
function cancleUpdate(obj) {
	const list = obj.parentElement.parentElement.parentElement;
	
	const viewCon = list.getElementsByClassName("period_view_default")[0];
	const updateIcon = list.getElementsByClassName("update_icon_con")[0];
	const viewReasonCon = list.getElementsByClassName("reason_view_default")[0];
		
	const timeInputCon = list.getElementsByClassName("period_view_input")[0];
	const inputReasonCon = list.getElementsByClassName("reason_view_input")[0];
	const cancleIcon = list.getElementsByClassName("cancle_icon_con")[0];
	const completeIcon = list.getElementsByClassName("complete_icon_con")[0]
	
	viewCon.style.display = "flex";
	updateIcon.style.display = "block";
	viewReasonCon.style.display = "block"; 
	
	inputReasonCon.style.display = "none";	
	timeInputCon.style.display = "none";
	cancleIcon.style.display = "none";
	completeIcon.style.display = "none";
	
	
}

// 임시 휴무 리스트 삭제 버튼
function deleteSchedule(obj) {
	const list = obj.parentElement.parentElement.parentElement;
	const startDay = list.getElementsByClassName("list_start_day")[0].innerHTML;
	const endDay = list.getElementsByClassName("list_end_day")[0].innerHTML;	
	
	const agree = confirm(`${startDay} ~ ${endDay}의 휴무 일정을 삭제하시겠습니까?`);
	if (agree) {
		// DB에서 리스트 삭제 > redirect
		list.remove();
		window.location.reload();
		return;
	}
}

// 임시 휴무 리스트 확인 버튼
function postSchedule(obj) {
	const agree = confirm("수정하신 내용을 반영하시겠습니까?");
	
	if (agree) {
		// DB에 리스트 추가 > rediect
		window.location.reload();
	}
	
}

// 필터링

// 전체보기 > page reload
function pageReload() {
	window.location.reload();
}

// 가까운 날짜 순
function sortInAcs() {
	const startDays = document.getElementsByClassName("list_start_day");
	const lists = document.getElementsByClassName("list_content");
	
	let arr = [];
	for (let i = 0; i < lists.length; i++) {
		const obj = {
			day: startDays[i].innerHTML,
			list: lists[i],
		}
		arr.push(obj);
	}
	
	arr.sort((a, b) => parseInt(a.day) - parseInt(b.day));
	
	const container = document.getElementById("schedule-container");
	
	for (let i = 0; i < lists.length; i++) {
		container.append(arr[i].list);
	}
}

// 먼 날짜 순
function sortInDesc() {
	const startDays = document.getElementsByClassName("list_start_day");
	const lists = document.getElementsByClassName("list_content");
	
	let arr = [];
	for (let i = 0; i < lists.length; i++) {
		const obj = {
			day: startDays[i].innerHTML,
			list: lists[i],
		}
		arr.push(obj);
	}
	
	arr.sort((a, b) => parseInt(b.day) - parseInt(a.day));
	
	const container = document.getElementById("schedule-container");
	
	for (let i = 0; i < lists.length; i++) {
		container.append(arr[i].list);
	}
}

function openCalendar() {
	const calendar = document.getElementById("month-selector");
	
	if (calendar.innerHTML) {
		calendar.innerHTML = "";
		return;
	}

	// 구조 생성 & 클래스부여 
	const container = document.createElement("div");
	const yearContainer = document.createElement("ul");
	const monthContainer = document.createElement("ul");
	
	container.classList.add("s_calendar_con");
	container.classList.add("form");
	yearContainer.classList.add("s_calendar_year_con");
	monthContainer.classList.add("s_calendar_month_con");	
	
	container.appendChild(yearContainer);
	container.appendChild(monthContainer);
	
	// 달력 오브젝트	
	const today = new Date();
	const months = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
	
	const calendarObject = {
		years: [today.getFullYear(), today.getFullYear() + 1, today.getFullYear() + 2],
		months: [...months]
	}
	
	// 년 생성
	for (let i = 0; i < calendarObject.years.length; i++) {
		if (i === 0) {
			const leftArrowCon = document.createElement("li");
			leftArrowCon.innerHTML += `<i class="fas fa-chevron-left"></i>`;
			yearContainer.appendChild(leftArrowCon)
		}
		
		const year = document.createElement("li");
		year.innerHTML = calendarObject.years[i];
		yearContainer.appendChild(year);
		
		if (i === calendarObject.years.length - 1) {
			const rightArrowCon = document.createElement("li");
			rightArrowCon.innerHTML += `<i class="fas fa-chevron-right"></i>`;
			yearContainer.appendChild(rightArrowCon);
		}
	}

	// 월 생성
	let index = 0;
	
	for (let i = 0; i < 3; i++) {
		const row = document.createElement("li");
		row.classList.add("s_calendar_month_row");
		monthContainer.appendChild(row);
		
		for (let j = 0; j < 4; j++) {
			const month = document.createElement("div");
			month.innerHTML = calendarObject.months[index];
			
			row.appendChild(month);

			index += 1;
		}
	}
	
	calendar.appendChild(container);
}
























