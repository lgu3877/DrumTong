// 정기 휴무 등록
async function updateRegHoliday() {
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
	
	// request object
	const object = {
		week : selectedWeek,
		days : selectedDays	
	};
	
	// axios
	const { data } = await axios.post("/drumtong/business/mainmanagement/BScheduleDays/rest/insertBScheduleDays/", object);
	console.log(data);

	if (data) {
		bscheduledays = data; // 데이터 덮어씌우기
		document.getElementById("reg-holiday-schedule").innerHTML = ""; // 정기휴무 리스트 초기화
		displayRegHolidays(); // 정기휴무 리스트 다시 출력
	}
	
	else {
		alert("잘못된 입력입니다.");
	}
}



// 정기 휴무 삭제
async function removeRegHoliday(id) {
	const list = document.getElementById(id);
	
	// 주 (week)
	let removeWeek = list.getElementsByClassName("h_week")[0].innerText;
	
	// 주 (kor > en) 변환
	for (let key in weekObject) {
		if (weekObject[key] === removeWeek) {
			removeWeek = key;
		}
	}
	
	// 일 (day)
	let removeDays = "";
	const dayCon = list.getElementsByClassName("h_day");
	
	for (let i = 0; i < dayCon.length; i++) {
		removeDays += dayCon[i].innerText.replace("요일", "") + "/";
	}
	
	// request object
	const object = {
		week : removeWeek,
		days : removeDays	
	};
		
	// axios
	const { data } = await axios.delete("/drumtong/business/mainmanagement/BScheduleDays/rest/deleteBScheduleDays/", object);
	
	if (data) {
		bscheduledays = data; // 데이터 덮어씌우기
		document.getElementById("reg-holiday-schedule").innerHTML = ""; // 정기휴무 리스트 초기화
		displayRegHolidays(); // 정기휴무 리스트 다시 출력
	}
	
	else {
		alert("잘못된 입력입니다.");
	}
}


function updateTmpHoliday() {
	const startDate = document.getElementById("startDay").value;
	const endDate = document.getElementById("endDay").value;
	const reason = document.getElementById("tmp-holiday-text").value;
	
	// validation (시작일 > 종료일 & null 체크)
	if (startDate > endDate || startDate === "" || endDate === "" || reason.value === "")
		return alert("잘못된 날짜입력 입니다.");
	
	// request object 생성
	const object = {
		start : startDate, 
		end : endDate,
		reason : reason
	}
	
	console.log(object);
	const { data } = axios.post("/drumtong/business/mainmanagement/BTempHoliday/rest/deleteBTempHoliday/", object);

	
	// form 초기화
	document.getElementById("startDay").value = "";
	document.getElementById("endDay").value = "";
	document.getElementById("tmp-holiday-text").value = "";
}