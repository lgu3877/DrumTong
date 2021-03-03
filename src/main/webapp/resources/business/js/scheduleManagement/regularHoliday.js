// week array
const weekObject = {
	"firstweek" : "첫째주", 
	"secondweek" : "둘째주",
	"thirdweek" : "셋째주",
	"forthweek" : "넷째주",
	"fifthweek" : "다섯째주",
	"sixthweek" : "여섯째주",	
};

// 초기실행
toggleHoliday();
displayRegHolidays(); // 정기휴무 리스트 뷰

// 정기휴무 일(day) 선택 인터페이스
function toggleHoliday() {
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
}


// 정기휴무 뷰
function displayRegHolidays() {
	// ul
	const ul = document.getElementById("reg-holiday-schedule");
	
	// li 생성 > 추가
	for (let enWeek in weekObject) {
		const week = weekObject[enWeek];
		const days = bscheduledays[enWeek];
		
		if (days !== undefined) {
			const dayArray = days.split("/");
			dayArray.pop(); // 마지막 배열의 공백 제거
			
			// li
			const li = document.createElement("li");
			const holidayId = generateRandomString(10);
			li.id = holidayId;
			li.className = "h_schedule_list";
			
			// remove button
			const removeBtn = document.createElement("div");
			removeBtn.className = "h_schedule_remove";
			removeBtn.innerHTML = "&times";
			removeBtn.onclick = () => removeRegHoliday(holidayId); // click event (remove item)

			// week(header)
			const weekCon = document.createElement("div");
			weekCon.className = "h_schedule_week";
			weekCon.innerHTML = '<span class="h_week">' + week + '</span>' // 주(week) 출력
				
				// day list
				const dayCon = document.createElement("div");
				dayCon.className = "h_schedule_day_wrapper";
				
				// day(content)
				for (let i = 0; i < dayArray.length; i++) {
					const day = document.createElement("div");
					day.className = "h_schedule_day";
					day.innerHTML = '<span class="h_day">' + dayArray[i] + '요일</span>' // 요일(day) 출력
					
					dayCon.appendChild(day)
				}
				
			// 추가
			li.appendChild(removeBtn);
			li.appendChild(weekCon);
			li.appendChild(dayCon);
			ul.appendChild(li);
		}
	}
}


// 정기휴무 select 이벤트 (초기화 & 데이터 불러오기)
function loadRegHolidays(select) {
	// 정기휴무 선택 초기화 (button & checkbox) 
	const buttons = document.querySelectorAll(".day_selector");
	const checkboxes = document.getElementsByName("restDay");
	
	for (let i = 0; i < buttons.length; i++) {
		// checkbox > not-checked
		checkboxes[i].checked = false;
		// button > default color
		buttons[i].style.backgroundColor = "#95e1d3";	
	}
	
	// 데이터 로드
	if (bscheduledays[select.value] === undefined) return; // 불러올 데이터가 없을 때 > 종료(return)

	const days = bscheduledays[select.value].split("/"); // 불러올 데이터가 있을 때
	days.pop();
	
	// 로드된 데이터 > checkbox에 표기
	for (let i = 0; i < checkboxes.length; i++) {
		for (let j = 0; j < days.length; j++) {
			const checkbox = checkboxes[i];
			const button = buttons[i];
			if (days[j] === checkbox.value) {
				// checkbox > checked
				checkbox.checked = true;
				// button > selected color
				button.style.backgroundColor = "navy";	
			}
		}
	}
}


// 정기휴무 스케쥴 추가
function addRegSchedule() {
	// 주(week)
	const weekSelector = document.getElementsByName("restWeek")[0];
	const weekOptions = weekSelector.getElementsByTagName("option");
	let selectedWeek;
	
	for (let i = 0; i < weekOptions.length; i++) {
		if (weekOptions[i].selected === true && !weekOptions[i].value.includes("주 선택")) {
			selectedWeek = weekOptions[i].value;
		}
	}
	
	// 주 선택 유무 검사
	if (selectedWeek === undefined) {
		alert("주(week)가 선택되지 않았습니다. 다시 한 번 확인해주세요.");
		return;
	}
	
	// 일(day) > 배열
	const dayArray = document.getElementsByName("restDay");
	let selectedDays = "";
	
	for (let i = 0; i < dayArray.length; i++) {
		dayArray[i].checked === true ? selectedDays += dayArray[i].value + "/" : null; 
	}
	
	// 일 선택 유무 검사
	if (selectedDays === "") {
		alert("일(day)이 선택되지 않았습니다. 다시 한 번 확인해주세요.");
		return;
	}
	
	// selected values
	const selected = {
		week : selectedWeek,
		days : selectedDays	
	};
	
	for (let key in bscheduledays) {
		if (key === selected.week) {
			// 기존 값 (GET 방식으로 전달받은 데이터)
//			const dayString = bscheduledays[key];
//			const dayArray = dayString.split("/");
//			dayArray.pop();
			
			// 입력 값 (클라이언트가 선택한 데이터)
			const selectedDay = selected.days;
			const selectedDayArray = selectedDay.split("/");
			selectedDayArray.pop();

			// 배열 병합
//			const concatDayArray = [ ...dayArray, ...selectedDayArray].sort();
			
			// 중복 제거
//			for (let i = 0; i < concatDayArray.length - 1; i++) {
//				concatDayArray[i] === concatDayArray[i + 1] ?
//					concatDayArray.splice(i, 1) : null;
//			}
			
			// 업데이트
//			bscheduledays[key] = concatDayArray.join("/");
			bscheduledays[key] = selected.days;
		}
	}
	
	// Select & Option 초기화
//	loadRegHolidays();
	
	// 뷰 초기화
	document.getElementById("reg-holiday-schedule").innerHTML = "";
	
	// 뷰 출력
	displayRegHolidays();
}


// 정기휴무 스케쥴 삭제
function removeRegSchedule() {
	
}
