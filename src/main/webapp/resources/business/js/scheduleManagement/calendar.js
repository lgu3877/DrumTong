// 현재 날짜, 년, 월, 일
const today = new Date(); // 날짜
const currentYear = today.getFullYear(); // 년
const currentMonth = today.getMonth() + 1; // 월
const currentDate = today.getDate(); // 일
const currentDay = today.getDay(); // 요일, 0 ~ 6 (일요일 ~ 토요일)

//월
const months = [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ];


// 현재 년도 설정
document.getElementById(
  "current-year"
).innerHTML = `<span id="year-value">${currentYear}</span> <i class="fas fa-angle-down"></i>`;

// 현재 월 설정
document.getElementById(
		"current-month"
).innerHTML = `<span id="month-value">${currentMonth}</span> <i class="fas fa-angle-down"></i>`;



//달력 렌더링
yearMonthSelector();
createYears();
createMonths();
loadDays(currentYear, currentMonth, currentDate);
displayMarker(); // 정기휴무

// 달력 년-월 선택 디자인
function yearMonthSelector() {
	const yearSelector = document.getElementById("current-year");
	const monthSelector = document.getElementById("current-month");
	
	for (let i = 0; i < 2; i++) {
		switch(i) {
		// 년 & 월
		case 0:
			yearSelector.children[i].style.fontSize = "15pt";		
			monthSelector.children[i].style.fontSize = "15pt";	
			break;
			// 아이콘
		case 1:
			yearSelector.children[i].style.fontSize = "15pt";		
			monthSelector.children[i].style.fontSize = "15pt";	
			yearSelector.children[i].style.marginLeft = "5px";	
			monthSelector.children[i].style.marginLeft = "5px";	
			break;
		}
	}
}


// 연도 드랍다운 (dropdown)
function createYears() {
  const startYear = currentYear;
  const endYear = currentYear + 3;

  for (let i = startYear; i < endYear; i++) {
    const yearDiv = document.createElement("div");
    yearDiv.innerHTML = i;
    yearDiv.classList.add("dropdown_item");

    // 옵션에서 '년' 클릭시 달력 재구성
    yearDiv.onclick = () => {
      document.getElementById("calendar-days").innerHTML = "";

      const selectedMonth = document.getElementById("month-value").innerText;
      document.getElementById("year-value").innerText = i;

      showMenu("years");
      loadDays(i, selectedMonth, currentDate);
    };

    document.getElementById("years").appendChild(yearDiv);
  }
}


// 휠 드랍다운 (dropdown)
function createMonths() {
	for (let i = 0; i < months.length; i++) {
		const monthDiv = document.createElement("div");
		monthDiv.innerHTML = months[i];
		monthDiv.classList.add("dropdown_item");
		
		// 옵션에서 '월' 클릭시 달력 재구성
		monthDiv.onclick = () => {
			document.getElementById("calendar-days").innerHTML = "";
			
			const selectedYear = document.getElementById("year-value").innerText;
			document.getElementById("month-value").innerText = i + 1;
			
			showMenu("months");
			loadDays(selectedYear, i + 1, currentDate);
		};
		
		document.getElementById("months").appendChild(monthDiv);
	}
}


// dropdown 이벤트 > open & close
function showMenu(id) {
  //   console.log(document.getElementById("years"));
  const dropdown = document.getElementById(id).style;

  if (dropdown.display === "none") {
    dropdown.display = "block";
  } else {
    dropdown.display = "none";
  }
}


// 날짜 구성 > 출력
function loadDays(year, month, day) {
  const lastDate = new Date(year, month, 0).getDate();
  const prevLastDate = new Date(year, month - 1, 0).getDate();
  const startDay = new Date(year, month - 1, 1).getDay();

  let currentCount = 0;
  let lastCount = 0;

  // 캘릭터 생성 ( 6주 > 7일 )
  for (let week = 0; week < 6; week++) {
    const weekDiv = document.createElement("div");
    weekDiv.className = "week";

    // 첫 주(지난 달 마지막까지)
    if (week === 0) {
      for (let day = startDay - 1; day >= 0; day--) {
        const date = document.createElement("div");
        date.classList.add("lastDays");
        
	        // 날짜 입력
	        const dayDiv = document.createElement("div");
	        dayDiv.className = "day";
	        dayDiv.innerHTML = prevLastDate - day;

	        // 휴무 마커
	        const markerCon = document.createElement("div");
	        markerCon.className = "marker_con";
	        
	        	// 정기 휴일 마커 
	        	const regMarker = document.createElement("div");
	        	regMarker.className = "reg_marker";

	        	// 임시 휴일 마커
	        	const tempMarker = document.createElement("div");
	        	tempMarker.className = "temp_marker";
	        
	        markerCon.appendChild(regMarker);	
	        markerCon.appendChild(tempMarker);	
	        	
        date.appendChild(dayDiv);
        date.appendChild(markerCon);
        weekDiv.appendChild(date);
      }

      for (let day = startDay; day < 7; day++) {
        const date = document.createElement("div");
        date.classList.add("currentDays");

	        // 날짜 입력
	        const dayDiv = document.createElement("div");
	        dayDiv.className = "day";
	        dayDiv.innerHTML = ++currentCount;

	        // 휴무 마커
	        const markerCon = document.createElement("div");
	        markerCon.className = "marker_con";
	        
	        	// 정기 휴일 마커 
	        	const regMarker = document.createElement("div");
	        	regMarker.className = "reg_marker";

	        	// 임시 휴일 마커
	        	const tempMarker = document.createElement("div");
	        	tempMarker.className = "temp_marker";
	        
	        markerCon.appendChild(regMarker);	
	        markerCon.appendChild(tempMarker);	
	        
        date.appendChild(dayDiv);
        date.appendChild(markerCon);
        weekDiv.appendChild(date);
      }
    }

    // 둘째 주 ~ 마지막
    else {
      for (let day = 0; day < 7; day++) {
        if (currentCount < lastDate) {
          const date = document.createElement("div");
          date.classList.add("currentDays");

	          // 날짜 입력
	          const dayDiv = document.createElement("div");
	          dayDiv.className = "day";
	          dayDiv.innerHTML = ++currentCount;

	          // 휴무 마커
		      const markerCon = document.createElement("div");
		      markerCon.className = "marker_con";
		        
		      	// 정기 휴일 마커 
		        const regMarker = document.createElement("div");
		        regMarker.className = "reg_marker";

		        // 임시 휴일 마커
		        const tempMarker = document.createElement("div");
		        tempMarker.className = "temp_marker";
		        
		        markerCon.appendChild(regMarker);	
		        markerCon.appendChild(tempMarker);	

          date.appendChild(dayDiv);
          date.appendChild(markerCon);
          weekDiv.appendChild(date);
        } 
        else {
          const date = document.createElement("div");
          date.classList.add("nextDays");

	          // 날짜 입력
	          const dayDiv = document.createElement("div");
	          dayDiv.className = "day";
	          dayDiv.innerHTML = ++lastCount;
	          
	          // 휴무 마커
		      const markerCon = document.createElement("div");
		      markerCon.className = "marker_con";
		        
		      	// 정기 휴일 마커 
		        const regMarker = document.createElement("div");
		        regMarker.className = "reg_marker";

		        // 임시 휴일 마커
		        const tempMarker = document.createElement("div");
		        tempMarker.className = "temp_marker";
		        
		        markerCon.appendChild(regMarker);	
		        markerCon.appendChild(tempMarker);	

          date.appendChild(dayDiv);
          date.appendChild(markerCon);
          weekDiv.appendChild(date);
        }
      }
    }

    document.getElementById("calendar-days").appendChild(weekDiv);
  }

  markToday(); // 오늘
  markRegHolidays(); // 정기휴무
  markTempHolidays(); // 임시휴무
}


// 마커 정보
function displayMarker() {
	const calendar = document.getElementById("calander");
	
		// 마커 Wrapper
		const markerWrapper = document.createElement("div");
		markerWrapper.className = "marker_wrapper";
		
			// 정기휴무 마커
			const regMarkerCon = document.createElement("div");
			regMarkerCon.className = "marker_info_con";
			
				const regMarker = document.createElement("div");
				regMarker.className = "marker_bar";
				regMarker.classList.add("bg_red");
				
				const regMarkerInfo = document.createElement("div");
				regMarkerInfo.className = "marker_info";
				regMarkerInfo.innerHTML = "정기휴무";
			
			// 임시휴무 마커
			const tempMarkerCon = document.createElement("div");
			tempMarkerCon.className = "marker_info_con";
				
				const tempMarker = document.createElement("div");
				tempMarker.className = "marker_bar";
				tempMarker.classList.add("bg_mint");
					
				const tempMarkerInfo = document.createElement("div");
				tempMarkerInfo.className = "marker_info";
				tempMarkerInfo.innerHTML = "임시휴무";
	
			// 추가
			regMarkerCon.appendChild(regMarker);	
			regMarkerCon.appendChild(regMarkerInfo);	

			tempMarkerCon.appendChild(tempMarker);	
			tempMarkerCon.appendChild(tempMarkerInfo);	
	
		markerWrapper.appendChild(regMarkerCon);
		markerWrapper.appendChild(tempMarkerCon);
			
	calendar.appendChild(markerWrapper);
}


//주(week) 변환 > object key
function weekConvert(value) {
	switch(value) {
	case "첫째 주":
		return "firstWeek";
	case "둘째 주":
		return "secondWeek";
	case "셋째 주":
		return "thirdWeek";
	case "넷째 주":
		return "forthWeek";
	case "다섯째 주":
		return "fifthWeek";
	case "여섯째 주":
		return "sixthWeek";
	}
}


// 일(변환) > index
function dayConvert(value) {
	switch(value) {
	case "일":
		return 0;
	case "월":
		return 1;
	case "화":
		return 2;
	case "수":
		return 3;
	case "목":
		return 4;
	case "금":
		return 5;
	case "토":
		return 6;
	}
}


// 오늘 날짜(today) 출력
function markToday() {
	const calendarMonth = document.getElementById("month-value").innerHTML;
	
	const isThisMonth = currentMonth === parseInt(calendarMonth);
	
	if (isThisMonth) {
		const days = document.getElementsByClassName("currentDays");
		
		for (let i = 0; i < days.length; i++) {
			const dayString = days[i].querySelector(".day").innerText;
			
			
			if (currentDate === parseInt(dayString)) {
				days[i].classList.add("marker_today");
				
				const todayText = document.createElement("div");
				todayText.innerText = "Today";
				
				days[i].appendChild(todayText);
			}
		}
	}
}


// 정기 휴무 일정 달력 출력
function markRegHolidays() {
	// 정기 휴무 일정 object
	const obj = {
		firstweek: [],
		secondweek: [],
		thirdweek: [],
		forthweek: [],
		fifthweek: [],
		sixthweek: [],
	};
	
	// object 형성 (bscheduledays > obj)
	for (let week in bscheduledays) {
		const dayArray = bscheduledays[week].split("/");
		dayArray.pop();
		
		for (let i = 0; i < dayArray.length; i++) {
			obj[week].push(dayConvert(dayArray[i]));
		}
	}
	
	//디자인 변경 함수
	const markDay = (dayArray, holidayArray, className) => {
		
		for (let col = 0; col < holidayArray.length; col++) {
			const dayCon = dayArray[holidayArray[col]];

			if (!dayCon.className.includes("lastDays") 
					&& !dayCon.className.includes("nextDays")
					&& !dayCon.className.includes(className)) {
				dayCon.querySelector(".reg_marker").classList.add(className);
			}
		} 		
	}
	
	// 달력 container & 주(week) 
	const calendar = document.getElementById("calendar-days");
	const weeks = calendar.getElementsByClassName("week");
	
	// 달력에 표시
	for (let row = 0; row < weeks.length; row++) {
		const dayArray = [...weeks[row].childNodes];
		switch(row) {
		case 0:
			obj.firstweek.length !== 0 ? markDay(dayArray, obj.firstweek, "reg_holiday") : null;
			break;
		case 1:
			obj.secondweek.length !== 0 ? markDay(dayArray, obj.secondweek, "reg_holiday") : null;
			break;
		case 2:
			obj.thirdweek.length !== 0 ? markDay(dayArray, obj.thirdweek, "reg_holiday") : null;
			break;
		case 3:
			obj.forthweek.length !== 0 ? markDay(dayArray, obj.forthweek, "reg_holiday") : null;
			break;
		case 4:
			obj.fifthweek.length !== 0 ? markDay(dayArray, obj.fifthweek, "reg_holiday") : null;
			break;
		case 5:
			obj.sixthweek.length !== 0 ? markDay(dayArray, obj.sixthweek, "reg_holiday") : null;
			break;
		}
	}	
}



// 임시휴무 출력
function markTempHolidays() {
	const calendar = document.getElementById("calendar-days");
	const week = calendar.getElementsByClassName("week");
	
	let firstDate;
	let lastDate;

	// 필터링(전월, 당월, 익월)
	let currentMonth = document.getElementById("month-value").innerHTML;
	currentMonth = parseInt(currentMonth);
	let currentYear = document.getElementById("year-value").innerHTML;
	currentYear = parseInt(currentYear); 
	
	const lastDays = calendar.querySelector(".lastDays"); // 현재 달력에서 지날달 표기
	const nextDays = [ ...calendar.querySelectorAll(".nextDays") ].pop(); // 현재 달력에서 다음달 표기

	// 달력 첫날이 1 일 경우 & 지난달이 표기되지 않을 경우
	if (lastDays === null) {
		firstDate = `${currentYear}-${currentMonth}-1`;
	}
	else {
		const year = currentMonth !== 1 ? currentYear : currentYear - 1;
		
		let month = currentMonth !== 1 ? currentMonth - 1 : 12;
		month = month < 10 ? "0" + month : month;
		
		let day = lastDays.querySelector('.day').innerHTML;
		day = day < 10  ? "0" + day : day;
		
		firstDate = `${year}-${month}-${day}`;
	}
	
	
	// 달력 마지막 날이 다음달이 아닐 경우
	if (nextDays === null) {
		const lastDay = [ ...calendar.querySelectorAll(".nextDays") ].pop();
		const day = currentDay.innerHTML;
		
		lastDate = `${currentYear}-${currentMonth}-${day}`;
	}
	
	else {
		const year = currentMonth !== 12 ? currentYear : currentYear + 1;
		
		let month = currentMonth !== 12 ? currentMonth + 1 : 1;
		month = month < 10 ? "0" + month : month;
		
		let day = nextDays.querySelector('.day').innerHTML;
		day = day < 10 ? "0" + day : day;
		
		lastDate = `${year}-${month}-${day}`;
	}

	
		
	
	// 필터링 1
	const filtered = [];
	
	for (let i = 0; i < btempsuspension.length; i++) {
		const data = btempsuspension[i];
		
		if (data.beginday >= firstDate && data.beginday <= lastDate) {
			filtered.push(data);
		}
		
		else if (data.endday >= firstDate && data.endday <= lastDate) {
			filtered.push(data);
		}
	}
	
	// 필터링 2
	let beforeRange = [];
	let currentRange = [];
	let afterRange = [];
	
	for (let i = 0; i < filtered.length; i++) {
		const data = filtered[i];
		
		// 전월-당월
		if (data.beginday < firstDate && data.endday <= lastDate) beforeRange.push(data);
		// 당월-익월
		else if (data.beginday <= lastDate && data.endday > lastDate) afterRange.push(data);
		// 당월
		else currentRange.push(data);
	}
	
	
	// 전월-당월
	if (beforeRange.length !== 0) {
		
		FirstLoop:
		for (let i = 0; i < beforeRange.length; i++) {
			const data = beforeRange[i];
			
			const lastDay = parseInt(data.endday.split("-")[2]);
			
			const endMonth = parseInt(data.endday.split("-")[1]);
			
			// ~ 당월
			if (endMonth === currentMonth) {
				for (let row = 0; row < week.length; row++) {
					for (let col = 0; col < 7; col++) {
						const dayCon = week[row].children[col];
						const day = parseInt(dayCon.querySelector(".day").innerText);
						
						if (dayCon.className.includes("currentDays") 
								&& !dayCon.className.includes("temp_holiday")
								&& day <= lastDay) {
							
							// 임시휴무 표기
							dayCon.querySelector(".temp_marker").classList.add("temp_holiday");
						}
					}
				}
			}
			
			// ~ 익월
			else if (endMonth > currentMonth) {
				console.log("2");
				for (let row = 0; row < week.length; row++) {
					for (let col = 0; col < 7; col++) {
						const dayCon = week[row].children[col];
						
						if (dayCon.className.includes("currentDays") 
								&& !dayCon.className.includes("temp_holiday")) {
							
							// 임시휴무 표기
							dayCon.querySelector(".temp_marker").classList.add("temp_holiday");
						}
					}
				}
			}
		}
	}

	// 당월 
	if (currentRange.length !== 0) {
		for (let i = 0; i < currentRange.length; i++) {
			const data = currentRange[i];
			
			const firstDay = parseInt(data.beginday.split("-")[2]);
			const lastDay = parseInt(data.endday.split("-")[2]);
			
			const startMonth = parseInt(data.beginday.split("-")[1]);
			const endMonth = parseInt(data.endday.split("-")[1]);
		
			
			// 당월 내
			if (endMonth === currentMonth && startMonth === currentMonth) {
				for (let row = 0; row < week.length; row++) {
					for (let col = 0; col < 7; col++) {
						const dayCon = week[row].children[col];
						const day = parseInt(dayCon.querySelector(".day").innerText);
						
						if (dayCon.className.includes("currentDays")
								&& !dayCon.className.includes("temp_holiday")
								&& day >= firstDay && day <= lastDay) {
							
							// 임시휴무 표기
							dayCon.querySelector(".temp_marker").classList.add("temp_holiday");
						}
					}
				}
			}
			
			// 당월 ~ 익월
			else if (endMonth > currentMonth && startMonth === currentMonth) {
				for (let row = 0; row < week.length; row++) {
					for (let col = 0; col < 7; col++) {
						const dayCon = week[row].children[col];
						const day = parseInt(dayCon.querySelector(".day").innerText);
				
						if (dayCon.className.includes("currentDays")
								&& !dayCon.className.includes("temp_holiday")
								&& day >= firstDay) {
							// 임시휴무 표기
							dayCon.querySelector(".temp_marker").classList.add("temp_holiday");
						}
					}
				}
			}
			
			// 전월 ~ 당월
			else if (endMonth === currentMonth && startMonth < currentMonth) {
				for (let row = 0; row < week.length; row++) {
					for (let col = 0; col < 7; col++) {
						const dayCon = week[row].children[col];
						const day = parseInt(dayCon.querySelector(".day").innerText);
				
						if (dayCon.className.includes("currentDays") 
								&& !dayCon.className.includes("temp_holiday")
								&& day <= lastDay) {
							
							// 임시휴무 표기
							dayCon.querySelector(".temp_marker").classList.add("temp_holiday");
						}
					}
				}
			}
			
			// 전월 ~ 익월
			else if (endMonth > currentMonth && startMonth < currentMonth) {
				for (let row = 0; row < week.length; row++) {
					for (let col = 0; col < 7; col++) {
						const dayCon = week[row].children[col];
				
						if (dayCon.className.includes("currentDays")
								&& !dayCon.className.includes("temp_holiday")) {
							
							// 임시휴무 표기
							dayCon.querySelector(".temp_marker").classList.add("temp_holiday");
						}
					}
				}
			}
		}
	}
	
	// 당월-익월
	if (afterRange.length !== 0) {
		for (let i = 0; i < afterRange.length; i++) {
			const data = afterRange[i];

			const firstDay = parseInt(data.beginday.split("-")[2]);
			const lastDay = parseInt(data.endday.split("-")[2]);
			
			const startMonth = parseInt(data.beginday.split("-")[1]);
			const endMonth = parseInt(data.endday.split("-")[1]);

			// 당월 ~
			if (startMonth === currentMonth) {
				for (let row = week.length - 1; row >= 0; row--) {
					for (let col = 6; col >= 0; col--) {
						const dayCon = week[row].children[col];
						const day = dayCon.querySelector(".day").innerText;
						
						if (dayCon.className.includes("currentDays") 
								&& !dayCon.className.includes("temp_holiday")
								&& day >= firstDay) {
							// 날짜 표기
							dayCon.querySelector(".temp_marker").classList.add("temp_holiday"); // 임시휴무 표기
						}
					}
				}
			}

			// 전월 ~
			if (startMonth < currentMonth) {
				for (let row = week.length - 1; row >= 0; row--) {
					for (let col = 6; col >= 0; col--) {
						const dayCon = week[row].children[col];
						const day = dayCon.querySelector(".day").innerText;
						
						if (dayCon.className.includes("currentDays") 
								&& !dayCon.className.includes("temp_holiday")) {
							// 날짜 표기
							dayCon.querySelector(".temp_marker").classList.add("temp_holiday"); // 임시휴무 표기
						}
					}
				}
			}
		}
	}
}