// 정기 휴무 등록
function updateRegHoliday() {
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
		estid : "123",
		week : selectedWeek,
		days : selectedDays	
	};
	
	console.log(object);
	
//	const { data } = await axios.post("/drumtong/business/mainmanagement/BScheduleDays/rest/insertBScheduleDays/", object);
//	console.log(data);
//
//	if (data) {
//		bscheduledays = data; // 데이터 덮어씌우기
//		document.getElementById("reg-holiday-schedule").innerHTML = ""; // 정기휴무 리스트 초기화
//		displayRegHolidays(); // 정기휴무 리스트 다시 출력
//	}
//	
//	else {
//		alert("잘못된 입력입니다.");
//	}
}

// 정기 휴무 삭제
function removeRegHoliday(id) {
	const list = document.getElementById(id);
	
	// 주 (week)
	const removeWeek = list.getElementsByClassName("h_week")[0].innerText;
	
	// 일 (day)
	let removeDays = "";
	const dayCon = list.getElementsByClassName("h_day");
	
	for (let i = 0; i < dayCon.length; i++) {
		removeDays += dayCon[i].innerText.replace("요일", "") + "/";
	}
	
	// request object
	const object = {
		estid : "123",
		week : removeWeek,
		days : removeDays	
	};
	console.log(object);
	
//	const { data } = await axios.delete("/drumtong/business/mainmanagement/BScheduleDays/rest/deleteBScheduleDays/", object);
//	
//	if (data) {
//		bscheduledays = data; // 데이터 덮어씌우기
//		document.getElementById("reg-holiday-schedule").innerHTML = ""; // 정기휴무 리스트 초기화
//		displayRegHolidays(); // 정기휴무 리스트 다시 출력
//	}
//	
//	else {
//		alert("잘못된 입력입니다.");
//	}
}
