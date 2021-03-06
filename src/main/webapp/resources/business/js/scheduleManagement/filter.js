// 전체보기 > page reload
function pageReload() {
	const lists = document.getElementsByClassName("list_content");
	
	for (let i = 0; i < lists.length; i++) {
		lists[i].style.display = "flex";
	}
//	window.location.reload();
}

// 날짜 순 정렬 (가까운 날짜 순 > recent & 먼 날짜 순 > late)
function sort(option) {
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
	
	// 오름차순 & 내림 차순 스위치
	switch(option) {
	case "recent":
		arr.sort((a, b) => {
			a = a.day.replace("-", "").replace("-", "");
			b = b.day.replace("-", "").replace("-", "");
			return (parseInt(a) - parseInt(b));
		});
		break;
	case "late":
		arr.sort((a, b) => {
			a = a.day.replace("-", "").replace("-", "");
			b = b.day.replace("-", "").replace("-", "");
			return (parseInt(b) - parseInt(a));
		});
		break;
	}

	const container = document.getElementById("schedule-container");
	container.innerHTML = "";
	
	for (let i = 0; i < arr.length; i++) {
		container.appendChild(arr[i].list);
	}
}

// 월검색 캘린더 생성
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
			leftArrowCon.onclick = () => changeYear("before");
			
			yearContainer.appendChild(leftArrowCon);
		}
		
		const year = document.createElement("li");
		year.classList.add("s_years");
		year.innerHTML = calendarObject.years[i];
		
		yearContainer.appendChild(year);
		
		// 클릭 이벤트
		year.addEventListener("click", (e) => checkYear(e));
		
		
		if (i === calendarObject.years.length - 1) {
			const rightArrowCon = document.createElement("li");
			rightArrowCon.innerHTML += `<i class="fas fa-chevron-right"></i>`;
			rightArrowCon.onclick = () => changeYear("after");
			
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
			
			// 월 클릭 이벤트
			month.addEventListener("click", (e) => checkMonth(e));
			
			month.innerHTML = calendarObject.months[index];
			
			row.appendChild(month);

			index += 1;
		}
	}
	
	calendar.appendChild(container);
	
	// 년도 인터페이스
	const yearArray = document.getElementsByClassName("s_years");
	
	// 현재 년도 표시
	for (let i = 0; i < yearArray.length; i++) {
		if (today.getFullYear() === parseInt(yearArray[i].innerHTML)) {			
			yearArray[i].style.textDecoration = "underline";
			yearArray[i].style.color = "#f38181";
			yearArray[i].classList.add("year_checked");
		}
		else {
			yearArray[i].style.textDecoration = "";
			yearArray[i].style.color = "navy";
			yearArray[i].classList.remove("year_checked");
		}
	}
}



// 년도 체크 이벤트 > 체크시 클래스 "year_checked" 부여 & 체크안된 항목 클래스 제거 & 디자인 수정
function checkYear(e) {
	const yearArray = document.getElementsByClassName("s_years");
	
	for (let i = 0; i < yearArray.length; i++) {		
		if (e.target.innerHTML === yearArray[i].innerHTML) {
			e.target.style.textDecoration = "underline";
			e.target.style.color = "#f38181";
			e.target.classList.add("year_checked");
		}
		else {
			yearArray[i].style.textDecoration = "";
			yearArray[i].style.color = "navy";
			yearArray[i].classList.remove("year_checked");
		}
	}
}



// 월 체크 이벤트 > 체크시 선택된 연도 + 선택한 월 > 분류 (따로 정렬 X)
function checkMonth(e) {

	// 선택 가져오기 > 년 & 월
	const selectedYear = document.getElementsByClassName("year_checked")[0].innerHTML;
	const selectedMonth = e.target.innerHTML.split("월")[0] < 10 ? 
		"0" + e.target.innerHTML.split("월")[0] : 
		e.target.innerHTML.split("월")[0]; 
	
	// 필터링	
	const startDates = document.getElementsByClassName("list_start_day");
	const lists = document.getElementsByClassName("list_content");

	
	// 정렬 (내림차순 default)
	for (let i = 0; i < lists.length; i++) {	
		if (startDates[i].innerHTML.split("-")[0] === selectedYear
				&& startDates[i].innerHTML.split("-")[1] === selectedMonth) {

			lists[i].style.display = "flex";
		}
		else {
			lists[i].style.display = "none";
		}
	}
		
	// 초기화
	const calendar = document.getElementById("month-selector");
	calendar.innerHTML = "";
	
	// 가까운 날짜 순 정렬
	sort("recent");
}


// 월 검색 > 연도변경 이벤트
function changeYear(command) {
	// before & after (year)
	const years = document.querySelectorAll(".s_years");
	
	switch(command) {
	case "before":
		for (let i = 0; i < years.length; i++) {
			years[i].innerHTML = parseInt(years[i].innerHTML) - 1; 
		}
		break;
	case "after":
		for (let i = 0; i < years.length; i++) {
			years[i].innerHTML = parseInt(years[i].innerHTML) + 1; 
		}
		break;
	}
}