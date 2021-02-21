// 현재 날짜, 년, 월, 일
const today = new Date(); // 날짜
const currentYear = today.getFullYear(); // 년
const currentMonth = today.getMonth() + 1; // 월
const currentDate = today.getDate(); // 일
// 0 ~ 6 (일요일 ~ 토요일)
const currentDay = today.getDay(); // 요일

// (윤)년, 월, 일
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


// 월 드랍다운 (dropdown)
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

        date.appendChild(dayDiv);
        weekDiv.appendChild(date);
      }

      for (let day = startDay; day < 7; day++) {
        const date = document.createElement("div");
        date.classList.add("currentDays");

        // 날짜 입력 > DB 스케쥴 추가 가능
        date.innerHTML = ++currentCount;

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

          date.appendChild(dayDiv);
          weekDiv.appendChild(date);
        } 
        else {
          const date = document.createElement("div");
          date.classList.add("nextDays");

	          // 날짜 입력
	          const dayDiv = document.createElement("div");
	          dayDiv.className = "day";
	          dayDiv.innerHTML = ++lastCount;

          date.appendChild(dayDiv)
          weekDiv.appendChild(date);
        }
      }
    }

    document.getElementById("calendar-days").appendChild(weekDiv);
  }
  
  markRegHolidays(); // 정기휴무
  markTempHolidays(); // 임시휴무
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




//정기 휴무 일정 달력 출력
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
	
	// 달력 container & 주(week) 
	const calendar = document.getElementById("calendar-days");
	const weeks = calendar.getElementsByClassName("week");
	
	// 디자인 변경 함수
	const markDay = (dayArray, holidayArray) => {
		for (let col = 0; col < holidayArray.length; col++) {
			dayArray[holidayArray[col]].classList.add("reg_holiday");
			dayArray[holidayArray[col]].innerHTML += `<h4>정기휴무</h4>`;
		} 		
	}
	
	// 달력에 표시
	for (let row = 0; row < weeks.length; row++) {
		const dayArray = [...weeks[row].childNodes];
		switch(row) {
		case 0:
			obj.firstweek.length !== 0 ? markDay(dayArray, obj.firstweek) : null;
			break;
		case 1:
			obj.secondweek.length !== 0 ? markDay(dayArray, obj.secondweek) : null;
			break;
		case 2:
			obj.thirdweek.length !== 0 ? markDay(dayArray, obj.thirdweek) : null;
			break;
		case 3:
			obj.forthweek.length !== 0 ? markDay(dayArray, obj.forthweek) : null;
			break;
		case 4:
			obj.fifthweek.length !== 0 ? markDay(dayArray, obj.fifthweek) : null;
			break;
		case 5:
			obj.sixthweek.length !== 0 ? markDay(dayArray, obj.sixthweek) : null;
			break;
		}
	}	
}



// 임시휴무 출력
function markTempHolidays() {
	const calendar = document.getElementById("calendar-days");
	
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
		const month = currentMonth !== 1 ? currentMonth - 1 : 12;
		const day = lastDays.querySelector('.day').innerHTML;
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
		const month = currentMonth !== 12 ? currentMonth + 1 : 1;
		const day = nextDays.querySelector('.day').innerHTML;
		lastDate = `${year}-${month}-${day}`;
	}

	console.log(firstDate);
	console.log(lastDate);
	
	
	const filtered = [];
	
	for (let i = 0; i < btempsuspension.length; i++) {
		const data = btempsuspension[i];
		const startDay = data.beginday;
		const endDay = data.endday;
		
		if (startDay <= lastDate || endDay >= firstDate) {
			filtered.push(data);
		}
	}
	
	console.log(filtered);
}