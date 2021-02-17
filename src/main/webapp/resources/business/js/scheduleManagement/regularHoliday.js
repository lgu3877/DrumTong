displayRegHolidays();

function displayRegHolidays() {
	// ul
	const ul = document.getElementById("reg-holiday-schedule");
	
	// li 생성 > 추가
	for (let week in b) {
		// li
		const li = document.createElement("li");
		li.className = "h_schedule_list";
			
			// week(header)
			const week = document.createElement("div");
			week.className = "h_schedule_list";
			week.innerHTML = '<span class="h_week">' +  + '</span>'
			
			// close button
			const removeBtn = document.createElement("div");
			removeBtn.className = "h_schedule_remove"
			removeBtn.onclick = () => removeRegHoliday();
				
			// day list
			const dayCon = document.createElement("div");
			dayCon.className = "h_schedule_day_wrapper";
			
			// day(content)
			for () {
				const day = document.createElement("div");
				day.innerHTML = '<span class="h_day">' +  + '</span>'
				
				dayCon.appendChild(day)
			}
		 
		// 추가
		li.appendChild(week);
		li.appendChild(removeBtn);
		li.appendChild(dayCon);
		ul.appendChild(li);
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
