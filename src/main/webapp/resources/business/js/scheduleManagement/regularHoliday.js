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

