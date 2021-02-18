displayRegHolidays();

function displayRegHolidays() {
	// week array
	const weekObject = {
		"firstweek" : "첫째주", 
		"secondweek" : "둘째주",
		"thirdweek" : "셋째주",
		"forthweek" : "넷째주",
		"fifthweek" : "다섯째주",
		"sixthweek" : "여섯째주",	
	};

	// ul
	const ul = document.getElementById("reg-holiday-schedule");
	
	// li 생성 > 추가
	for (let enWeek in weekObject) {
		const week = weekObject[enWeek];
		const days = bscheduledays[enWeek];
		
		
		

		if (days !== undefined) {
			const dayArray = days.split("/");
			dayArray.pop(); // 마지막 배열의 공백 제거
			
			console.log(dayArray);
			
			// li
			const li = document.createElement("li");
			li.className = "h_schedule_list";
			
			// close button
			const removeBtn = document.createElement("div");
			removeBtn.className = "h_schedule_remove";
			removeBtn.innerHTML = "&times";
			removeBtn.onclick = () => removeRegHoliday(); // click event (remove item)

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
					day.innerHTML = '<span class="h_day">' + dayArray[i] + '</span>' // 요일(day) 출력
					
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
